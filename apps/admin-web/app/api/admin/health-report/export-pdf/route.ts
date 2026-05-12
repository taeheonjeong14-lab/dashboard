import { NextRequest, NextResponse } from 'next/server';
import { requireAdminApi } from '@/lib/assert-admin-api';
import { isParseRunUuid } from '@/lib/chart-extraction/uuid';
import { getChartApiProxyConfig } from '@/lib/chart-api-proxy-env';

export const dynamic = 'force-dynamic';
export const maxDuration = 120;
export const runtime = 'nodejs';

function forwardPdfHeaders(from: Headers): Record<string, string> {
  const out: Record<string, string> = {};
  const ct = from.get('Content-Type');
  const cd = from.get('Content-Disposition');
  if (ct) out['Content-Type'] = ct;
  if (cd) out['Content-Disposition'] = cd;
  const rid = from.get('X-Chart-Export-Request-Id');
  if (rid) out['X-Chart-Export-Request-Id'] = rid;
  return out;
}

/** chart-api `GET|POST /api/report/health-checkup/export` — PDF 바이너리를 그대로 전달합니다. */
export async function GET(request: NextRequest) {
  const gate = await requireAdminApi();
  if (!gate.ok) return gate.response;

  const cfg = getChartApiProxyConfig();
  if (!cfg) {
    return NextResponse.json(
      { error: 'CHART_API_BASE_URL 과 CHART_APP_API_KEY 가 필요합니다.' },
      { status: 503 },
    );
  }

  const runId = request.nextUrl.searchParams.get('runId')?.trim() ?? '';
  if (!isParseRunUuid(runId)) {
    return NextResponse.json({ error: 'runId invalid' }, { status: 400 });
  }

  const exportRequestId =
    request.nextUrl.searchParams.get('exportRequestId')?.trim() ||
    request.nextUrl.searchParams.get('export_request_id')?.trim() ||
    '';
  const q = new URLSearchParams({ runId });
  if (exportRequestId) q.set('exportRequestId', exportRequestId);

  const url = `${cfg.outboundBase}/api/report/health-checkup/export?${q.toString()}`;
  try {
    const res = await fetch(url, {
      method: 'GET',
      headers: { Authorization: `Bearer ${cfg.key}` },
    });
    if (!res.ok) {
      const text = await res.text();
      let err = text.slice(0, 800);
      try {
        const j = JSON.parse(text) as { error?: string };
        if (j.error) err = j.error;
      } catch {
        /* raw */
      }
      return NextResponse.json({ error: err || `chart-api ${res.status}` }, { status: res.status });
    }
    const buf = await res.arrayBuffer();
    return new NextResponse(buf, { status: 200, headers: forwardPdfHeaders(res.headers) });
  } catch (e) {
    console.error('GET /api/admin/health-report/export-pdf:', e);
    return NextResponse.json(
      { error: e instanceof Error ? e.message : 'chart-api PDF 호출 실패' },
      { status: 502 },
    );
  }
}

export async function POST(request: NextRequest) {
  const gate = await requireAdminApi();
  if (!gate.ok) return gate.response;

  const cfg = getChartApiProxyConfig();
  if (!cfg) {
    return NextResponse.json(
      { error: 'CHART_API_BASE_URL 과 CHART_APP_API_KEY 가 필요합니다.' },
      { status: 503 },
    );
  }

  let body: unknown = {};
  try {
    body = await request.json();
  } catch {
    /* allow empty */
  }
  const o = body as Record<string, unknown>;
  const runId = String(o.runId ?? '').trim();
  if (!isParseRunUuid(runId)) {
    return NextResponse.json({ error: 'runId invalid' }, { status: 400 });
  }

  const url = `${cfg.outboundBase}/api/report/health-checkup/export`;
  try {
    const res = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${cfg.key}`,
      },
      body: JSON.stringify(body),
    });
    if (!res.ok) {
      const text = await res.text();
      let err = text.slice(0, 800);
      try {
        const j = JSON.parse(text) as { error?: string };
        if (j.error) err = j.error;
      } catch {
        /* raw */
      }
      return NextResponse.json({ error: err || `chart-api ${res.status}` }, { status: res.status });
    }
    const buf = await res.arrayBuffer();
    return new NextResponse(buf, { status: 200, headers: forwardPdfHeaders(res.headers) });
  } catch (e) {
    console.error('POST /api/admin/health-report/export-pdf:', e);
    return NextResponse.json(
      { error: e instanceof Error ? e.message : 'chart-api PDF 호출 실패' },
      { status: 502 },
    );
  }
}
