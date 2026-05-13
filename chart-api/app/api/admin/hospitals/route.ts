import { NextRequest, NextResponse } from 'next/server';
import { chartAppAuthMiddleware } from '@/lib/chart-app/auth';
import { insertHospital, listHospitals } from '@/lib/chart-app/hospitals-admin';
import { getChartPgPool } from '@/lib/db';

// GET /api/admin/hospitals
export async function GET(request: NextRequest) {
  const authErr = chartAppAuthMiddleware(request);
  if (authErr) return authErr;

  try {
    const pool = getChartPgPool();
    const client = await pool.connect();
    try {
      const rows = await listHospitals(client);
      return NextResponse.json(rows);
    } finally {
      client.release();
    }
  } catch (e) {
    console.error('GET /api/admin/hospitals:', e);
    return NextResponse.json(
      { error: e instanceof Error ? e.message : 'Unknown error' },
      { status: 500 },
    );
  }
}

// POST /api/admin/hospitals
export async function POST(request: NextRequest) {
  const authErr = chartAppAuthMiddleware(request);
  if (authErr) return authErr;

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
      const { id } = await insertHospital(client, body);
      return NextResponse.json({ id }, { status: 201 });
    } finally {
      client.release();
    }
  } catch (e) {
    console.error('POST /api/admin/hospitals:', e);
    return NextResponse.json(
      { error: e instanceof Error ? e.message : 'Unknown error' },
      { status: 400 },
    );
  }
}
