import { NextRequest, NextResponse } from 'next/server';
import { chartAppAuthMiddleware } from '@/lib/chart-app/auth';
import { deleteHospital, updateHospital } from '@/lib/chart-app/hospitals-admin';
import { getChartPgPool } from '@/lib/db';

// PATCH /api/admin/hospitals/[id]
export async function PATCH(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  const authErr = chartAppAuthMiddleware(request);
  if (authErr) return authErr;

  const { id } = await params;
  const hid = id?.trim();
  if (!hid) return NextResponse.json({ error: 'id required' }, { status: 400 });

  let body: Record<string, unknown>;
  try {
    body = (await request.json()) as Record<string, unknown>;
  } catch {
    return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
  }

  try {
    const pool = getChartPgPool();
    const client = await pool.connect();
    try {
      const ok = await updateHospital(client, hid, body);
      if (!ok) return NextResponse.json({ error: 'Not found' }, { status: 404 });
      return NextResponse.json({ ok: true });
    } finally {
      client.release();
    }
  } catch (e) {
    console.error('PATCH /api/admin/hospitals/[id]:', e);
    return NextResponse.json(
      { error: e instanceof Error ? e.message : 'Unknown error' },
      { status: 400 },
    );
  }
}

// DELETE /api/admin/hospitals/[id]
export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  const authErr = chartAppAuthMiddleware(request);
  if (authErr) return authErr;

  const { id } = await params;
  const hid = id?.trim();
  if (!hid) return NextResponse.json({ error: 'id required' }, { status: 400 });

  try {
    const pool = getChartPgPool();
    const client = await pool.connect();
    try {
      const ok = await deleteHospital(client, hid);
      if (!ok) return NextResponse.json({ error: 'Not found' }, { status: 404 });
      return NextResponse.json({ ok: true });
    } catch (e: unknown) {
      const err = e as { code?: string };
      if (err.code === '23503') {
        return NextResponse.json({ error: 'FK constraint — 병원을 참조하는 데이터가 있습니다' }, { status: 409 });
      }
      throw e;
    } finally {
      client.release();
    }
  } catch (e) {
    console.error('DELETE /api/admin/hospitals/[id]:', e);
    return NextResponse.json(
      { error: e instanceof Error ? e.message : 'Unknown error' },
      { status: 500 },
    );
  }
}
