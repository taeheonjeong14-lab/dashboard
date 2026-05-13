import { NextRequest, NextResponse } from 'next/server';
import { chartAppAuthMiddleware } from '@/lib/chart-app/auth';
import { deleteRunCascade } from '@/lib/chart-app/history-service';
import { isParseRunUuid } from '@/lib/chart-app/uuid';

// DELETE /api/history/{runId}
export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ runId: string }> },
) {
  const authErr = chartAppAuthMiddleware(request);
  if (authErr) return authErr;

  const { runId } = await params;
  const id = runId?.trim();
  if (!isParseRunUuid(id)) {
    return NextResponse.json({ error: 'Invalid runId' }, { status: 400 });
  }

  try {
    const ok = await deleteRunCascade(id!);
    if (!ok) {
      return NextResponse.json({ error: 'Not found' }, { status: 404 });
    }
    return NextResponse.json({ ok: true });
  } catch (e) {
    console.error('DELETE /api/history/[runId]:', e);
    return NextResponse.json(
      { error: e instanceof Error ? e.message : 'Unknown error' },
      { status: 500 },
    );
  }
}
