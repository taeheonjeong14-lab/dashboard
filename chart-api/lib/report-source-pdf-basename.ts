import { getChartPgPool } from '@/lib/db';

/** PDF 저장 파일명용 — 최소 조회 */
export type RunBasicsForPdfBasename = {
  runCreatedAtIso: string;
  hospitalNameFromBasic: string | null;
  patientNameFromBasic: string | null;
};

export async function loadRunBasicsForPdfBasename(runId: string): Promise<RunBasicsForPdfBasename> {
  const pool = getChartPgPool();
  const { rows } = await pool.query<{
    created_at: Date;
    hospital_name: string | null;
    patient_name: string | null;
  }>(
    `
    SELECT
      pr.created_at,
      bi.hospital_name,
      bi.patient_name
    FROM chart_pdf.parse_runs pr
    LEFT JOIN chart_pdf.result_basic_info bi ON bi.parse_run_id = pr.id
    WHERE pr.id = $1::uuid
    LIMIT 1
    `,
    [runId],
  );
  const row = rows[0];
  if (!row) throw new Error('run basics load failed: not found');
  return {
    runCreatedAtIso: row.created_at.toISOString(),
    hospitalNameFromBasic: row.hospital_name?.trim() || null,
    patientNameFromBasic: row.patient_name?.trim() || null,
  };
}

