import type pg from 'pg';
import { createHash, randomBytes } from 'crypto';

import type { ChartKind } from '@/lib/chart-app/chart-kind';

export type BucketingRunResult = {
  runId: string;
  friendlyId: string;
  documentId: string;
};

const RAW_PAYLOAD_MAX_EXTRA_CHARS = 80_000;

/**
 * documents + parse_runs(+ friendly_id) + 빈 result_basic_info 행.
 * vet-report 텍스트 버킷팅 후 히스토리·추출 PATCH 에 필요한 runId 를 반환합니다.
 */
export async function createParseRunAfterBucketing(
  client: pg.PoolClient,
  params: {
    fileName: string;
    fileHash: string;
    chartType: ChartKind;
    hospitalId: string;
    storageBucket: string | null;
    storagePath: string | null;
    buckets: Record<string, string>;
    numPages: number;
    textLength: number;
    truncated: boolean;
    chartPasteText?: string;
    efriendsChartBlocks?: unknown;
  },
): Promise<BucketingRunResult> {
  const docIns = await client.query<{ id: string }>(
    `INSERT INTO chart_pdf.documents (file_name, file_hash, chart_type) VALUES ($1, $2, $3) RETURNING id`,
    [params.fileName, params.fileHash, params.chartType],
  );
  const documentId = docIns.rows[0].id;

  const paste =
    params.chartPasteText && params.chartPasteText.length > RAW_PAYLOAD_MAX_EXTRA_CHARS
      ? params.chartPasteText.slice(0, RAW_PAYLOAD_MAX_EXTRA_CHARS)
      : params.chartPasteText;

  const rawPayload = {
    source: 'text-bucketing',
    chartType: params.chartType,
    hospitalId: params.hospitalId,
    storageBucket: params.storageBucket,
    storagePath: params.storagePath,
    chartPasteText: paste ?? null,
    efriendsChartBlocks: params.efriendsChartBlocks ?? null,
    buckets: params.buckets,
    numPages: params.numPages,
    textLength: params.textLength,
    truncated: params.truncated,
  };

  const modelLabel = process.env.GEMINI_MODEL?.trim() || 'gemini-2.0-flash';

  for (let attempt = 0; attempt < 8; attempt++) {
    const friendlyId = `tb_${randomBytes(8).toString('hex')}`;
    try {
      const runIns = await client.query<{ id: string }>(
        `
        INSERT INTO chart_pdf.parse_runs (
          document_id, status, provider, model, raw_payload, friendly_id, hospital_id
        ) VALUES (
          $1::uuid, 'success', 'chart-api', $2, $3::jsonb, $4, $5::uuid
        )
        RETURNING id
        `,
        [documentId, modelLabel, JSON.stringify(rawPayload), friendlyId, params.hospitalId],
      );
      const runId = runIns.rows[0].id;

      await client.query(`INSERT INTO chart_pdf.result_basic_info (parse_run_id) VALUES ($1::uuid)`, [runId]);

      return { runId, friendlyId, documentId };
    } catch (e: unknown) {
      const err = e as { code?: string };
      if (err.code === '23505') continue;
      throw e;
    }
  }

  throw new Error('Could not allocate unique friendly_id');
}

export function sha256Hex(buffer: Buffer): string {
  return createHash('sha256').update(buffer).digest('hex');
}
