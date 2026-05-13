import { NextRequest, NextResponse } from 'next/server';
import { chartAppAuthMiddleware } from '@/lib/chart-app/auth';
import { parseChartKind, type ChartKind } from '@/lib/chart-app/chart-kind';
import { createParseRunAfterBucketing, sha256Hex } from '@/lib/chart-app/bucketing-run';
import { geminiGenerateText, tryParseJsonObject } from '@/lib/chart-app/gemini';
import { extractPdfText } from '@/lib/chart-app/extract-pdf-text';
import { downloadStorageObject } from '@/lib/chart-app/storage-object';
import { getChartPgPool } from '@/lib/db';
import { getPdfUploadsBucket } from '@/lib/chart-app/storage-config';
import { isAllowedPdfExtractPath } from '@/lib/chart-app/upload-path';
import { hospitalExistsForParseRun } from '@/lib/chart-app/hospital-gate';

const MAX_TEXT_FOR_MODEL = 120_000;
/** vet-report text-bucketing-pipeline-spec.md §2 */
const MAX_FILE_SIZE_BYTES = 30 * 1024 * 1024;

const HOSPITAL_UUID_RE =
  /^[0-9a-f]{8}-[0-9a-f]{4}-[1-8][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i;

// POST /api/text-bucketing — multipart/form-data 우선 · 스펙 §2 정렬
export const maxDuration = 120;

type JsonBody = {
  chartType?: string;
  hospitalId?: string;
  hospital_id?: string;
  storagePath?: string;
  bucket?: string;
  storageBucket?: string;
  fileName?: string;
  fileType?: string;
  chartPasteText?: string;
  efriendsChartBlocksJson?: unknown;
};

export type BucketingParsedInput = {
  chartType: ChartKind;
  hospitalId: string;
  buffer: Buffer;
  fileName: string;
  fileType: string;
  storageBucket: string | null;
  storagePath: string | null;
  chartPasteText: string;
  efriendsChartBlocks: unknown | null;
};

function basenameFromPath(p: string): string {
  const seg = p.replace(/\\/g, '/').split('/').pop()?.trim();
  return seg || 'upload.pdf';
}

/** 병원 UUID: `hospitalId` 우선, 없으면 `hospital_id` (vet-report·파트너 호환). */
function resolveHospitalInputId(camel: unknown, snake: unknown): string {
  const a = typeof camel === 'string' ? camel.trim() : '';
  if (a) return a;
  return typeof snake === 'string' ? snake.trim() : '';
}

function formDataStringField(form: FormData, key: string): string {
  const v = form.get(key);
  return typeof v === 'string' ? v : '';
}

function hasGeminiConfigured(): boolean {
  return Boolean(
    process.env.GEMINI_API_KEY?.trim() || process.env.NEXT_PUBLIC_GEMINI_API_KEY?.trim(),
  );
}

const BUCKET_KEYS = [
  'patient_profile',
  'visit_context',
  'vitals',
  'physical_exam',
  'lab_results',
  'imaging',
  'diagnosis',
  'plan',
  'medications',
  'vaccines',
  'notes',
  'uncategorized',
] as const;

function bucketingPrompt(extracted: string): string {
  return `아래는 수의 진료차트 PDF에서 추출한 원문 텍스트입니다. 의미 단위로 나누어 JSON 한 개만 출력하세요.

키는 영어 snake_case: ${BUCKET_KEYS.join(', ')}.
값은 모두 JSON 문자열(큰따옴표)이며, 해당 섹션에 내용이 없으면 빈 문자열 "".
본문에 큰따옴표(")나 줄바꿈이 있으면 반드시 JSON 이스케이프하세요 (\\" 와 \\n). 따옴표 없는 원시 텍스트를 출력하면 안 됩니다.
설명·마크다운·코드펜스 없이 오직 JSON만 출력하세요.

반드시 이 형식: {"buckets": { "patient_profile": "...", "visit_context": "...", ... }}

PDF 텍스트:
${extracted}`;
}

function bucketingRepairPrompt(brokenOutput: string): string {
  return `아래 텍스트는 문법 오류가 있는 JSON 또는 거의 JSON인 출력입니다. **유효한 JSON 객체 하나만** 출력하세요. 다른 글자는 금지.

형식은 반드시 {"buckets":{ ... }} 이고, 키는 정확히 이 순서를 포함해야 합니다: ${BUCKET_KEYS.join(', ')}.
각 값은 문자열이어야 하며 큰따옴표/줄바꿈은 이스케이프되어야 합니다.

잘못된 출력:
${brokenOutput.slice(0, 16_000)}`;
}

function bucketMaxOutputTokens(): number {
  const raw = parseInt(process.env.GEMINI_TEXT_BUCKETING_MAX_TOKENS || '24576', 10);
  const n = Number.isFinite(raw) ? raw : 24576;
  return Math.min(Math.max(n, 4096), 65536);
}

/** Gemini 버킷 파싱 결과를 문자열 맵으로 정규화 (결측 키는 빈 문자열). */
function normalizeBucketsFromParsed(parsed: Record<string, unknown>): Record<string, string> {
  const inner = parsed.buckets;
  const src =
    inner && typeof inner === 'object' && inner !== null && !Array.isArray(inner)
      ? (inner as Record<string, unknown>)
      : parsed;
  const out: Record<string, string> = {};
  for (const k of BUCKET_KEYS) {
    const v = src[k];
    if (typeof v === 'string') out[k] = v;
    else if (v == null) out[k] = '';
    else out[k] = JSON.stringify(v);
  }
  for (const [k, v] of Object.entries(src)) {
    if (k in out) continue;
    out[k] = typeof v === 'string' ? v : v == null ? '' : JSON.stringify(v);
  }
  return out;
}

async function runGeminiBucketing(slice: string): Promise<Record<string, string>> {
  const maxTok = bucketMaxOutputTokens();
  let raw = await geminiGenerateText(bucketingPrompt(slice), { maxOutputTokens: maxTok });
  try {
    return normalizeBucketsFromParsed(tryParseJsonObject(raw) as Record<string, unknown>);
  } catch (firstErr) {
    console.warn('text-bucketing JSON parse failed (1):', firstErr);
    raw = await geminiGenerateText(bucketingRepairPrompt(raw), { maxOutputTokens: maxTok });
    try {
      return normalizeBucketsFromParsed(tryParseJsonObject(raw) as Record<string, unknown>);
    } catch (secondErr) {
      const m =
        secondErr instanceof Error ? secondErr.message : String(secondErr);
      throw new Error(`BUCKET_JSON_PARSE_FAILED:${m}`);
    }
  }
}

function parseEfriendsBlocksRaw(raw: unknown): unknown | null {
  if (raw === undefined || raw === null || raw === '') return null;
  if (typeof raw === 'object') return raw;
  if (typeof raw !== 'string') return null;
  try {
    return JSON.parse(raw) as unknown;
  } catch {
    return null;
  }
}

async function parseMultipart(request: NextRequest): Promise<BucketingParsedInput> {
  const form = await request.formData();
  const chartKind = parseChartKind(form.get('chartType'));
  if (!chartKind) {
    throw new Error('INVALID_CHART_TYPE');
  }

  const hospitalId = resolveHospitalInputId(
    formDataStringField(form, 'hospitalId'),
    formDataStringField(form, 'hospital_id'),
  );
  if (!hospitalId || !HOSPITAL_UUID_RE.test(hospitalId)) {
    throw new Error('INVALID_HOSPITAL_ID');
  }

  const chartPasteRaw = form.get('chartPasteText');
  const chartPasteText = typeof chartPasteRaw === 'string' ? chartPasteRaw.trim() : '';

  const efriendsChartBlocks = parseEfriendsBlocksRaw(form.get('efriendsChartBlocksJson'));

  const file = form.get('file');
  const storageBucketRaw = form.get('storageBucket');
  const storagePathRaw = form.get('storagePath');
  const storageFileNameRaw = form.get('fileName');
  const storageFileTypeRaw = form.get('fileType');

  const pdfBucket = getPdfUploadsBucket();

  if (file instanceof File) {
    if (file.type !== 'application/pdf') {
      throw new Error('FILE_NOT_PDF');
    }
    if (file.size > MAX_FILE_SIZE_BYTES) {
      throw new Error('FILE_TOO_LARGE');
    }
    const buf = Buffer.from(await file.arrayBuffer());
    const name = file.name?.trim() || 'report.pdf';
    return {
      chartType: chartKind,
      hospitalId,
      buffer: buf,
      fileName: name,
      fileType: file.type || 'application/pdf',
      storageBucket: null,
      storagePath: null,
      chartPasteText,
      efriendsChartBlocks,
    };
  }

  const storageBucket =
    typeof storageBucketRaw === 'string' ? storageBucketRaw.trim() : '';
  const storagePath = typeof storagePathRaw === 'string' ? storagePathRaw.trim() : '';
  const storageFileName =
    typeof storageFileNameRaw === 'string' ? storageFileNameRaw.trim() : '';
  const storageFileType =
    typeof storageFileTypeRaw === 'string' ? storageFileTypeRaw.trim().toLowerCase() : '';

  if (!storageBucket || !storagePath) {
    throw new Error('MISSING_FILE_OR_STORAGE');
  }
  if (storageBucket !== pdfBucket) {
    throw new Error('STORAGE_BUCKET_NOT_ALLOWED');
  }
  if (!isAllowedPdfExtractPath(storagePath)) {
    throw new Error('STORAGE_PATH_NOT_ALLOWED');
  }
  if (storageFileType && storageFileType !== 'application/pdf') {
    throw new Error('FILE_NOT_PDF');
  }

  const buffer = await downloadStorageObject({ bucket: storageBucket, path: storagePath });
  if (buffer.length > MAX_FILE_SIZE_BYTES) {
    throw new Error('FILE_TOO_LARGE');
  }

  return {
    chartType: chartKind,
    hospitalId,
    buffer,
    fileName: storageFileName || basenameFromPath(storagePath),
    fileType: storageFileType || 'application/pdf',
    storageBucket,
    storagePath,
    chartPasteText,
    efriendsChartBlocks,
  };
}

async function parseJson(request: NextRequest): Promise<BucketingParsedInput> {
  let body: JsonBody;
  try {
    body = (await request.json()) as JsonBody;
  } catch {
    throw new Error('INVALID_JSON');
  }

  const chartKind = parseChartKind(body.chartType);
  if (!chartKind) {
    throw new Error('INVALID_CHART_TYPE');
  }

  const hospitalId = resolveHospitalInputId(body.hospitalId, body.hospital_id);
  if (!hospitalId || !HOSPITAL_UUID_RE.test(hospitalId)) {
    throw new Error('INVALID_HOSPITAL_ID');
  }

  const chartPasteText =
    typeof body.chartPasteText === 'string' ? body.chartPasteText.trim() : '';
  const efriendsChartBlocks = parseEfriendsBlocksRaw(body.efriendsChartBlocksJson);

  const storagePath = typeof body.storagePath === 'string' ? body.storagePath.trim() : '';
  const defaultPdfBucket = getPdfUploadsBucket();
  const storageBucket =
    typeof body.bucket === 'string' && body.bucket.trim()
      ? body.bucket.trim()
      : typeof body.storageBucket === 'string' && body.storageBucket.trim()
        ? body.storageBucket.trim()
        : defaultPdfBucket;

  if (!storagePath) {
    throw new Error('MISSING_STORAGE_PATH_JSON');
  }
  if (storageBucket !== defaultPdfBucket) {
    throw new Error('STORAGE_BUCKET_NOT_ALLOWED');
  }
  if (!isAllowedPdfExtractPath(storagePath)) {
    throw new Error('STORAGE_PATH_NOT_ALLOWED');
  }

  const fileType =
    typeof body.fileType === 'string' && body.fileType.trim()
      ? body.fileType.trim().toLowerCase()
      : 'application/pdf';
  if (fileType !== 'application/pdf') {
    throw new Error('FILE_NOT_PDF');
  }

  const buffer = await downloadStorageObject({ bucket: storageBucket, path: storagePath });
  if (buffer.length > MAX_FILE_SIZE_BYTES) {
    throw new Error('FILE_TOO_LARGE');
  }

  const fileName =
    typeof body.fileName === 'string' && body.fileName.trim()
      ? body.fileName.trim()
      : basenameFromPath(storagePath);

  return {
    chartType: chartKind,
    hospitalId,
    buffer,
    fileName,
    fileType,
    storageBucket,
    storagePath,
    chartPasteText,
    efriendsChartBlocks,
  };
}

async function parseRequest(request: NextRequest): Promise<BucketingParsedInput> {
  const ct = request.headers.get('content-type') || '';
  if (ct.includes('multipart/form-data')) {
    return parseMultipart(request);
  }
  return parseJson(request);
}

function mergeEfriendsPasteIntoExtract(chartType: ChartKind, paste: string, pdfText: string): string {
  if (chartType !== 'efriends' || !paste.trim()) return pdfText;
  return `${paste.trim()}\n\n--- PDF 추출 ---\n\n${pdfText}`;
}

export async function POST(request: NextRequest) {
  const authErr = chartAppAuthMiddleware(request);
  if (authErr) return authErr;

  if (!hasGeminiConfigured()) {
    return NextResponse.json(
      { error: 'LLM provider API key가 설정되지 않았습니다. (GEMINI_API_KEY)' },
      { status: 400 },
    );
  }

  let input: BucketingParsedInput;
  try {
    input = await parseRequest(request);
  } catch (e) {
    const code = (e as Error).message;
    const map: Record<string, { status: number; error: string }> = {
      INVALID_JSON: { status: 400, error: 'Invalid JSON body' },
      INVALID_CHART_TYPE: {
        status: 400,
        error: 'chartType은 intovet | plusvet | other | efriends 중 하나여야 합니다.',
      },
      INVALID_HOSPITAL_ID: {
        status: 400,
        error: '병원을 선택해 주세요. (hospitalId 또는 hospital_id, UUID)',
      },
      FILE_NOT_PDF: { status: 400, error: 'PDF만 지원합니다. (application/pdf)' },
      FILE_TOO_LARGE: { status: 400, error: '파일 크기는 30MB 이하여야 합니다.' },
      MISSING_FILE_OR_STORAGE: {
        status: 400,
        error: '업로드 파일 또는 storage 경로가 필요합니다. (field: file | storageBucket+storagePath)',
      },
      MISSING_STORAGE_PATH_JSON: {
        status: 400,
        error: 'JSON 요청에는 storagePath가 필요합니다. 직접 파일 업로드는 multipart/form-data 의 file 필드를 사용하세요.',
      },
      STORAGE_BUCKET_NOT_ALLOWED: {
        status: 400,
        error: `허용되지 않은 storage bucket입니다. (${getPdfUploadsBucket()} 만 허용)`,
      },
      STORAGE_PATH_NOT_ALLOWED: {
        status: 400,
        error: '허용되지 않은 storage path입니다. (extract-uploads/ 접두사 필요)',
      },
    };
    const m = map[code];
    if (m) return NextResponse.json({ error: m.error }, { status: m.status });
    throw e;
  }

  const pool = getChartPgPool();

  const hospitalOk = await hospitalExistsForParseRun(pool, input.hospitalId);
  if (!hospitalOk) {
    return NextResponse.json(
      { error: '등록되지 않은 병원입니다. hospitalId / hospital_id 를 확인해 주세요.' },
      { status: 400 },
    );
  }

  try {
    const buffer = input.buffer;
    const fileHash = sha256Hex(buffer);
    let { text, numPages } = await extractPdfText(buffer);
    if (!text) {
      return NextResponse.json(
        { error: 'No extractable text in PDF (may be scan-only). Use OCR flow or a text-based PDF.' },
        { status: 422 },
      );
    }

    text = mergeEfriendsPasteIntoExtract(input.chartType, input.chartPasteText, text);

    const slice = text.length > MAX_TEXT_FOR_MODEL ? text.slice(0, MAX_TEXT_FOR_MODEL) : text;
    let buckets: Record<string, string>;
    try {
      buckets = await runGeminiBucketing(slice);
    } catch (e) {
      const msg = e instanceof Error ? e.message : String(e);
      if (msg.startsWith('BUCKET_JSON_PARSE_FAILED')) {
        const detail = msg.slice('BUCKET_JSON_PARSE_FAILED'.length).replace(/^:/, '').trim();
        console.error('POST /api/text-bucketing: bucket JSON:', detail);
        return NextResponse.json(
          {
            error:
              '버킷팅 결과 JSON을 파싱하지 못했습니다. PDF 분량이 크거나 모델 출력이 잘린 경우일 수 있습니다.',
            detail,
          },
          { status: 422 },
        );
      }
      throw e;
    }

    const client = await pool.connect();
    try {
      await client.query('BEGIN');
      const { runId, friendlyId, documentId } = await createParseRunAfterBucketing(client, {
        fileName: input.fileName,
        fileHash,
        chartType: input.chartType,
        hospitalId: input.hospitalId,
        storageBucket: input.storageBucket,
        storagePath: input.storagePath,
        buckets,
        numPages,
        textLength: text.length,
        truncated: text.length > MAX_TEXT_FOR_MODEL,
        chartPasteText: input.chartPasteText || undefined,
        efriendsChartBlocks: input.efriendsChartBlocks ?? undefined,
      });
      await client.query('COMMIT');

      return NextResponse.json({
        runId,
        friendlyId,
        documentId,
        chartType: input.chartType,
        hospitalId: input.hospitalId,
        bucket: input.storageBucket,
        storagePath: input.storagePath,
        numPages,
        textLength: text.length,
        truncated: text.length > MAX_TEXT_FOR_MODEL,
        buckets,
      });
    } catch (e) {
      await client.query('ROLLBACK');
      throw e;
    } finally {
      client.release();
    }
  } catch (e) {
    const msg = e instanceof Error ? e.message : String(e);
    if (msg.includes('GEMINI_API_KEY') || msg.includes('not configured')) {
      return NextResponse.json(
        { error: 'LLM provider API key가 설정되지 않았습니다. (GEMINI_API_KEY)' },
        { status: 400 },
      );
    }
    if (msg.includes('not found') || msg.includes('Object not found')) {
      return NextResponse.json({ error: 'Object not found in storage' }, { status: 404 });
    }
    console.error('POST /api/text-bucketing:', e);
    return NextResponse.json({ error: msg }, { status: 500 });
  }
}
