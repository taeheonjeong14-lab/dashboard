import type pg from 'pg';

export type ParseRunRow = {
  id: string;
  document_id: string;
  hospital_id: string | null;
  friendly_id: string | null;
  status: string;
  raw_payload: unknown;
  ai_assessment: unknown;
  created_at: Date;
};

export async function getParseRun(client: pg.PoolClient, runId: string): Promise<ParseRunRow | null> {
  const { rows } = await client.query<ParseRunRow>(
    `
    SELECT id, document_id, hospital_id, friendly_id, status, raw_payload, ai_assessment, created_at
    FROM chart_pdf.parse_runs
    WHERE id = $1::uuid
    LIMIT 1
    `,
    [runId],
  );
  return rows[0] ?? null;
}

export async function chartByDateIdForDateTime(
  client: pg.PoolClient,
  parseRunId: string,
  dateTime: string,
): Promise<string | null> {
  const { rows } = await client.query<{ id: string }>(
    `SELECT id FROM chart_pdf.result_chart_by_date WHERE parse_run_id = $1::uuid AND date_time = $2 LIMIT 1`,
    [parseRunId, dateTime],
  );
  return rows[0]?.id ?? null;
}

