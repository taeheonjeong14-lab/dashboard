import type pg from 'pg';

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

