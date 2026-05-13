import { getChartPgPool } from '@/lib/db';

export const PARSE_RUN_UUID_RE =
  /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i;

export async function parseRunExists(runId: string): Promise<boolean> {
  const pool = getChartPgPool();
  const { rows } = await pool.query<{ ok: boolean }>(
    `SELECT true as ok FROM chart_pdf.parse_runs WHERE id = $1::uuid LIMIT 1`,
    [runId],
  );
  return rows.length > 0;
}

