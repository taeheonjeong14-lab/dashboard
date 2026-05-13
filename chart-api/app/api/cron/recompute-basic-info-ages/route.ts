import { NextRequest, NextResponse } from 'next/server';
import { calculatePetAgeCeilFromBirthday, tryParseBirthDate } from '@/lib/chart-app/pet-age';
import { getChartPgPool } from '@/lib/db';

function authorizeCron(request: NextRequest): boolean {
  const cronSecret = process.env.CRON_SECRET?.trim();
  if (!cronSecret) return true;
  const auth = request.headers.get('authorization') || '';
  return auth === `Bearer ${cronSecret}`;
}

// GET/POST /api/cron/recompute-basic-info-ages
export async function GET(request: NextRequest) {
  return handle(request);
}

export async function POST(request: NextRequest) {
  return handle(request);
}

async function handle(request: NextRequest) {
  if (!authorizeCron(request)) {
    return NextResponse.json({ error: 'unauthorized' }, { status: 401 });
  }

  try {
    const pool = getChartPgPool();
    const { rows } = await pool.query<{ id: string; birth: string | null }>(
      `SELECT id, birth FROM chart_pdf.result_basic_info WHERE birth IS NOT NULL AND btrim(birth) <> ''`,
    );

    let updated = 0;
    for (const row of rows) {
      if (!row.birth) continue;
      const bd = tryParseBirthDate(row.birth);
      if (!bd) continue;
      const age = calculatePetAgeCeilFromBirthday(bd);
      if (age == null) continue;
      const res = await pool.query(
        `UPDATE chart_pdf.result_basic_info SET age = $2 WHERE id = $1::uuid AND (age IS DISTINCT FROM $2)`,
        [row.id, age],
      );
      updated += res.rowCount ?? 0;
    }

    return NextResponse.json({ ok: true, scanned: rows.length, updated });
  } catch (e) {
    console.error('cron recompute-basic-info-ages:', e);
    return NextResponse.json(
      { ok: false, error: e instanceof Error ? e.message : 'Unknown error' },
      { status: 500 },
    );
  }
}
