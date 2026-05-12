import { NextRequest, NextResponse } from 'next/server';
import { requireAdminApi } from '@/lib/assert-admin-api';
import { countParseRunsInChartPdf, listRecentParseRuns } from '@/lib/chart-parse-runs-list';

const MAX_LIMIT = 200;

export async function GET(request: NextRequest) {
  const gate = await requireAdminApi();
  if (!gate.ok) return gate.response;

  const raw = request.nextUrl.searchParams.get('limit');
  const n = raw ? Number.parseInt(raw, 10) : 80;
  const limit = Number.isFinite(n) ? Math.min(Math.max(1, n), MAX_LIMIT) : 80;

  try {
    const [totalParseRuns, items] = await Promise.all([
      countParseRunsInChartPdf(),
      listRecentParseRuns(limit),
    ]);
    return NextResponse.json({
      items,
      meta: { totalParseRuns, limit },
    });
  } catch (e) {
    console.error('GET /api/admin/data/parse-runs:', e);
    const message = e instanceof Error ? e.message : String(e);
    return NextResponse.json(
      {
        error: `history list load failed: ${message}`,
        items: [] as unknown[],
      },
      { status: 500 },
    );
  }
}
