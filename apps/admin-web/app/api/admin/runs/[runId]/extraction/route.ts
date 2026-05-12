import { NextRequest, NextResponse } from 'next/server';
import { requireAdminApi } from '@/lib/assert-admin-api';
import { ChartApiError, handleExtractionPatch } from '@/lib/chart-extraction/extraction-patch';
import { isParseRunUuid } from '@/lib/chart-extraction/uuid';
import { withPgTransaction } from '@/lib/db';

export async function PATCH(
  request: NextRequest,
  { params }: { params: Promise<{ runId: string }> },
) {
  const gate = await requireAdminApi();
  if (!gate.ok) return gate.response;

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
    return NextResponse.json(
      { error: e instanceof Error ? e.message : 'Unknown error' },
      { status: 400 },
    );
  }
}

