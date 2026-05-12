import { NextRequest, NextResponse } from 'next/server';
import { requireAdminApi } from '@/lib/assert-admin-api';
import { loadHealthCheckupReportList } from '@/lib/health-report-admin/list-runs';

export const dynamic = 'force-dynamic';

export async function GET() {
  const gate = await requireAdminApi();
  if (!gate.ok) return gate.response;
  try {
    const items = await loadHealthCheckupReportList();
    return NextResponse.json({ items });
  } catch (e) {
    console.error('GET /api/admin/health-report/runs:', e);
    return NextResponse.json(
      { error: e instanceof Error ? e.message : 'list failed', items: [] },
      { status: 500 },
    );
  }
}
