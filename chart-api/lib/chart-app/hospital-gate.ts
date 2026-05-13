import type pg from 'pg';

/**
 * parse_runs 에 넣기 전 병원 UUID 검증 — core.hospitals 또는 legacy 매핑 행.
 * history-service 조인과 동일하게 맞춤.
 */
export async function hospitalExistsForParseRun(
  pool: pg.Pool,
  hospitalId: string,
): Promise<boolean> {
  const hid = hospitalId.trim();
  const { rows } = await pool.query<{ ok: boolean }>(
    `
    SELECT (
      EXISTS (SELECT 1 FROM core.hospitals h WHERE h.id::text = $1)
      OR EXISTS (
          SELECT 1 FROM core.hospital_pdf_merge_map m
          WHERE m.source_hospital_id = $1::uuid
      )
    ) AS ok
    `,
    [hid],
  );
  return Boolean(rows[0]?.ok);
}
