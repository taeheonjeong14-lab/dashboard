import { NextRequest, NextResponse } from 'next/server';
import { requireAdminApi } from '@/lib/assert-admin-api';
import { loadAdminRunDetail } from '@/lib/load-admin-run-detail';
import { isParseRunUuid } from '@/lib/chart-extraction/uuid';

export const dynamic = 'force-dynamic';

export async function GET(
  _request: NextRequest,
  { params }: { params: Promise<{ runId: string }> },
) {
  const gate = await requireAdminApi();
  if (!gate.ok) return gate.response;

  const { runId } = await params;
  const id = runId?.trim();
  if (!isParseRunUuid(id)) {
    return NextResponse.json({ error: 'Invalid runId' }, { status: 400 });
  }

  try {
    const detail = await loadAdminRunDetail(id!);
    if (!detail) {
      return NextResponse.json({ error: 'Not found' }, { status: 404 });
    }
    return NextResponse.json(detail);
  } catch (e) {
    console.error('GET /api/admin/runs/[runId]/detail:', e);
    return NextResponse.json(
      { error: e instanceof Error ? e.message : 'run detail load failed' },
      { status: 500 },
    );
  }
}
