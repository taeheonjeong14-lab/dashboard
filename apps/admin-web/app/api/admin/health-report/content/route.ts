import { NextRequest, NextResponse } from 'next/server';
import { requireAdminApi } from '@/lib/assert-admin-api';
import { createServiceRoleClient } from '@/lib/supabase/service-role';
import { isParseRunUuid } from '@/lib/chart-extraction/uuid';

export const dynamic = 'force-dynamic';

function iso(d: unknown): string {
  if (d instanceof Date) return d.toISOString();
  if (typeof d === 'string') return d;
  return new Date(String(d)).toISOString();
}

/** GET ?runId= — vet-report `GET /api/content?runId=` 과 유사 `{ runId, items }` */
export async function GET(request: NextRequest) {
  const gate = await requireAdminApi();
  if (!gate.ok) return gate.response;

  const runId = request.nextUrl.searchParams.get('runId')?.trim();
  if (!isParseRunUuid(runId)) {
    return NextResponse.json({ error: 'runId query parameter must be a valid UUID' }, { status: 400 });
  }

  try {
    const sb = createServiceRoleClient();
    const { data: rows, error } = await sb
      .schema('health_report')
      .from('generated_run_content')
      .select('id, content_type, payload, created_at, updated_at')
      .eq('parse_run_id', runId!)
      .order('created_at', { ascending: false });

    if (error) throw new Error(error.message);

    const items = (rows ?? []).map((r) => {
      const row = r as Record<string, unknown>;
      return {
        id: String(row.id ?? ''),
        contentType: String(row.content_type ?? ''),
        payload: row.payload ?? {},
        createdAt: iso(row.created_at),
        updatedAt: iso(row.updated_at),
      };
    });

    return NextResponse.json({ runId, items });
  } catch (e) {
    console.error('GET /api/admin/health-report/content:', e);
    return NextResponse.json(
      { error: e instanceof Error ? e.message : 'Unknown error' },
      { status: 500 },
    );
  }
}

type PatchBody = {
  runId?: string;
  contentType?: string;
  payload?: unknown;
};

/** PATCH — `health_checkup` payload upsert (PostgREST, `(parse_run_id, content_type)` 유니크). */
export async function PATCH(request: NextRequest) {
  const gate = await requireAdminApi();
  if (!gate.ok) return gate.response;

  let body: PatchBody;
  try {
    body = (await request.json()) as PatchBody;
  } catch {
    return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
  }

  const runId = String(body.runId ?? '').trim();
  const contentType = String(body.contentType ?? '').trim();
  if (!isParseRunUuid(runId)) return NextResponse.json({ error: 'runId invalid' }, { status: 400 });
  if (contentType !== 'health_checkup') {
    return NextResponse.json({ error: 'only health_checkup supported in admin-web' }, { status: 400 });
  }
  if (body.payload == null || typeof body.payload !== 'object' || Array.isArray(body.payload)) {
    return NextResponse.json({ error: 'payload must be a JSON object' }, { status: 400 });
  }

  try {
    const sb = createServiceRoleClient();
    const { data: pr, error: prErr } = await sb
      .schema('chart_pdf')
      .from('parse_runs')
      .select('id')
      .eq('id', runId)
      .maybeSingle();
    if (prErr) throw new Error(prErr.message);
    if (!pr) return NextResponse.json({ error: 'run not found' }, { status: 404 });

    const { data: saved, error } = await sb
      .schema('health_report')
      .from('generated_run_content')
      .upsert(
        {
          parse_run_id: runId,
          content_type: contentType,
          payload: body.payload as Record<string, unknown>,
          updated_at: new Date().toISOString(),
        },
        { onConflict: 'parse_run_id,content_type' },
      )
      .select('id, created_at, updated_at')
      .maybeSingle();

    if (error) throw new Error(error.message);
    if (!saved) throw new Error('upsert returned no row');

    const s = saved as Record<string, unknown>;
    return NextResponse.json({
      ok: true,
      saved: {
        id: String(s.id ?? ''),
        createdAt: iso(s.created_at),
        updatedAt: iso(s.updated_at),
      },
    });
  } catch (e) {
    console.error('PATCH /api/admin/health-report/content:', e);
    return NextResponse.json(
      { error: e instanceof Error ? e.message : 'Unknown error' },
      { status: 500 },
    );
  }
}
