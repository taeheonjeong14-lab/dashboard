import { NextResponse } from 'next/server';
import { requireAdminApi } from '@/lib/assert-admin-api';
import { deleteParseRunCascade } from '@/lib/chart-parse-run-delete';
import { isParseRunUuid } from '@/lib/chart-extraction/uuid';

export async function DELETE(
  _request: Request,
  context: { params: Promise<{ runId: string }> },
) {
  const gate = await requireAdminApi();
  if (!gate.ok) return gate.response;

  const { runId } = await context.params;
  const id = runId?.trim() ?? '';
  if (!isParseRunUuid(id)) {
    return NextResponse.json({ error: 'Invalid runId' }, { status: 400 });
  }

  try {
    const ok = await deleteParseRunCascade(id);
    if (!ok) {
      return NextResponse.json({ error: 'Not found' }, { status: 404 });
    }
    return NextResponse.json({ ok: true });
  } catch (e) {
    console.error('DELETE /api/admin/data/parse-runs/[runId]:', e);
    return NextResponse.json(
      { error: e instanceof Error ? e.message : '삭제에 실패했습니다.' },
      { status: 500 },
    );
  }
}
