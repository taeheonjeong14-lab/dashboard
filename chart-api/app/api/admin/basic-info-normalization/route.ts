import { NextRequest, NextResponse } from 'next/server';
import { chartAppAuthMiddleware } from '@/lib/chart-app/auth';
import { getChartPgPool } from '@/lib/db';

// GET /api/admin/basic-info-normalization — 최근 행 기준 종·품종 빈도 (관리용)
export async function GET(request: NextRequest) {
  const authErr = chartAppAuthMiddleware(request);
  if (authErr) return authErr;

  const n = Math.min(5000, Math.max(50, Number(new URL(request.url).searchParams.get('limit')) || 500));

  try {
    const pool = getChartPgPool();
    const species = await pool.query(
      `
      SELECT species AS value, count(*)::int AS cnt
      FROM chart_pdf.result_basic_info
      WHERE species IS NOT NULL AND btrim(species) <> ''
      GROUP BY species
      ORDER BY cnt DESC
      LIMIT $1
      `,
      [n],
    );
    const breeds = await pool.query(
      `
      SELECT breed AS value, count(*)::int AS cnt
      FROM chart_pdf.result_basic_info
      WHERE breed IS NOT NULL AND btrim(breed) <> ''
      GROUP BY breed
      ORDER BY cnt DESC
      LIMIT $1
      `,
      [n],
    );

    return NextResponse.json({
      limit: n,
      species: species.rows,
      breeds: breeds.rows,
    });
  } catch (e) {
    console.error('GET basic-info-normalization:', e);
    return NextResponse.json(
      { error: e instanceof Error ? e.message : 'Unknown error' },
      { status: 500 },
    );
  }
}
