import type pg from 'pg';

export type SavedContent = { id: string; createdAt: string; updatedAt: string };

export async function upsertGeneratedRunContent(
  client: pg.Pool | pg.PoolClient,
  parseRunId: string,
  contentType: string,
  payload: unknown,
): Promise<SavedContent> {
  const payloadJson = JSON.stringify(payload ?? {});
  const { rows } = await client.query<{ id: string; created_at: Date; updated_at: Date }>(
    `
    INSERT INTO health_report.generated_run_content (parse_run_id, content_type, payload, updated_at)
    VALUES ($1::uuid, $2, $3::jsonb, now())
    ON CONFLICT (parse_run_id, content_type) DO UPDATE SET
      payload = EXCLUDED.payload,
      updated_at = now()
    RETURNING id, created_at, updated_at
    `,
    [parseRunId, contentType, payloadJson],
  );
  const row = rows[0];
  return {
    id: row.id,
    createdAt: row.created_at.toISOString(),
    updatedAt: row.updated_at.toISOString(),
  };
}

export async function getGeneratedByType(
  client: pg.Pool | pg.PoolClient,
  parseRunId: string,
  contentType: string,
): Promise<{ id: string; payload: unknown; createdAt: string; updatedAt: string } | null> {
  const { rows } = await client.query<{ id: string; payload: unknown; created_at: Date; updated_at: Date }>(
    `
    SELECT id, payload, created_at, updated_at
    FROM health_report.generated_run_content
    WHERE parse_run_id = $1::uuid AND content_type = $2
    LIMIT 1
    `,
    [parseRunId, contentType],
  );
  const r = rows[0];
  if (!r) return null;
  return {
    id: r.id,
    payload: r.payload,
    createdAt: r.created_at.toISOString(),
    updatedAt: r.updated_at.toISOString(),
  };
}

export async function getHealthCheckupGeneratedContentForRun(
  client: pg.Pool | pg.PoolClient,
  parseRunId: string,
): Promise<{ id: string; payload: unknown; createdAt: string; updatedAt: string } | null> {
  return getGeneratedByType(client, parseRunId, 'health_checkup');
}
