import { NextRequest, NextResponse } from 'next/server';
import { chartAppAuthMiddleware } from '@/lib/chart-app/auth';
import { ChartApiError, handleExtractionPatch } from '@/lib/chart-app/extraction-patch';
import { isParseRunUuid } from '@/lib/chart-app/uuid';
import { withPgTransaction } from '@/lib/db';

// PATCH /api/runs/{runId}/extraction
export async function PATCH(
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

  let body: Record<string, unknown>;
  try {
    body = (await request.json()) as Record<string, unknown>;
  } catch {
    return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
  }

  try {
    await withPgTransaction((client) => handleExtractionPatch(client, id!, body));
    return NextResponse.json({ ok: true });
  } catch (e) {
    if (e instanceof ChartApiError) {
      return NextResponse.json({ error: e.message }, { status: e.statusCode });
    }
    console.error('PATCH /api/runs/[runId]/extraction:', e);
    return NextResponse.json(
      { error: e instanceof Error ? e.message : 'Unknown error' },
      { status: 400 },
    );
  }
}
