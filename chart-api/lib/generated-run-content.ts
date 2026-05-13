import type { HealthCheckupGeneratedContent } from '@/lib/chart-app/health-checkup-content-llm';
import { parseHealthCheckupPayloadFromStorage } from '@/lib/chart-app/health-checkup-content-llm';
import { getChartPgPool } from '@/lib/db';

type DbRow = {
  id: string;
  payload: unknown;
  created_at: Date;
  updated_at: Date;
};

export async function getHealthCheckupGeneratedContentForRun(
  _unused: unknown,
  parseRunId: string,
): Promise<{
  id: string;
  payload: HealthCheckupGeneratedContent;
  createdAt: string;
  updatedAt: string;
} | null> {
  const pool = getChartPgPool();
  const { rows } = await pool.query<DbRow>(
    `
    SELECT id, payload, created_at, updated_at
    FROM health_report.generated_run_content
    WHERE parse_run_id = $1::uuid AND content_type = 'health_checkup'
    LIMIT 1
    `,
    [parseRunId],
  );
  const row = rows[0];
  if (!row) return null;
  return {
    id: row.id,
    payload: parseHealthCheckupPayloadFromStorage(row.payload) as HealthCheckupGeneratedContent,
    createdAt: row.created_at.toISOString(),
    updatedAt: row.updated_at.toISOString(),
  };
}

