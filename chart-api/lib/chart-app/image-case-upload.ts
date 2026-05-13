import { randomUUID } from 'crypto';
import sharp from 'sharp';
import { ChartApiError } from '@/lib/chart-app/extraction-patch';
import { getCaseImageBucket, getImageCaseMaxEdge, getImageCaseWebpQuality } from '@/lib/chart-app/storage-config';
import { getChartAppSupabaseService } from '@/lib/chart-app/supabase-service';
import { getChartPgPool } from '@/lib/db';

const MAX_BYTES = 8 * 1024 * 1024;
const ALLOWED = new Set(['image/jpeg', 'image/png', 'image/webp']);
const EXAM_TYPE = ['radiology', 'ultrasound', 'microscopy', 'endoscopy', 'slit_lamp', 'other'] as const;
const RADIOLOGY_SUB = ['thorax', 'abdomen', 'joint', 'dental'] as const;

export type SavedCaseImage = { id: string; fileName: string };
export type ImageAnalysisItem = {
  index: number;
  fileName: string;
  examType: (typeof EXAM_TYPE)[number];
  radiologySub: (typeof RADIOLOGY_SUB)[number] | null;
  hasNotableFinding: boolean;
  briefComment: string;
  isClearFinding: boolean;
  findingSpotsStr: string;
  relatedConditionName: string;
};
type RawAiImageRow = Partial<ImageAnalysisItem> & Record<string, unknown>;

function normalizeExamType(v: unknown): (typeof EXAM_TYPE)[number] {
  const s = String(v ?? '').trim().toLowerCase();
  if ((EXAM_TYPE as readonly string[]).includes(s)) return s as (typeof EXAM_TYPE)[number];
  return 'other';
}

function normalizeRadiologySub(v: unknown, examType: string): (typeof RADIOLOGY_SUB)[number] | null {
  if (examType !== 'radiology') return null;
  const s = String(v ?? '').trim().toLowerCase();
  if ((RADIOLOGY_SUB as readonly string[]).includes(s)) return s as (typeof RADIOLOGY_SUB)[number];
  if (s.includes('chest') || s.includes('thorax') || s.includes('흉')) return 'thorax';
  if (s.includes('abd') || s.includes('복')) return 'abdomen';
  if (s.includes('joint') || s.includes('관절')) return 'joint';
  if (s.includes('dental') || s.includes('치')) return 'dental';
  return null;
}

function oneLineKoComment(v: unknown): string {
  return String(v ?? '')
    .replace(/\r?\n+/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
    .slice(0, 300);
}

function parseFindingSpotsStr(raw: string): { cx: number; cy: number; r: number }[] {
  const t = raw.trim();
  if (!t) return [];
  const out: { cx: number; cy: number; r: number }[] = [];
  for (const token of t.split(';').map((x) => x.trim()).filter(Boolean)) {
    const parts = token.split(',').map((x) => Number(x.trim()));
    if (parts.length !== 3 || parts.some((n) => Number.isNaN(n))) continue;
    const [cx, cy, r] = parts;
    if (cx < 0 || cx > 100 || cy < 0 || cy > 100) continue;
    const clampedR = Math.min(15, Math.max(2, r));
    out.push({ cx, cy, r: clampedR });
    if (out.length >= 2) break;
  }
  return out;
}

function parseConditionNames(aiAssessment: unknown): string[] {
  if (!aiAssessment || typeof aiAssessment !== 'object') return [];
  const root = aiAssessment as Record<string, unknown>;
  const out = new Set<string>();
  const scan = (v: unknown) => {
    if (!v) return;
    if (Array.isArray(v)) {
      for (const item of v) scan(item);
      return;
    }
    if (typeof v !== 'object') return;
    const o = v as Record<string, unknown>;
    for (const key of ['conditionName', 'name', 'title']) {
      const s = typeof o[key] === 'string' ? o[key].trim() : '';
      if (s) out.add(s);
    }
  };
  scan(root.conditions);
  scan(root.conditionCandidates);
  scan(root.relatedConditions);
  // assessment가 conditions를 비워도 findings 배열 문구를 폴백 후보로 사용
  const findings = root.findings;
  if (Array.isArray(findings)) {
    for (const f of findings) {
      if (typeof f !== 'string') continue;
      const s = f.trim();
      if (!s) continue;
      // 너무 긴 문장/설명은 제외, 짧은 라벨성 문구만 후보로
      if (s.length <= 40) out.add(s);
    }
  }
  return [...out];
}

function normalizeCondLabel(s: string): string {
  return s
    .trim()
    .toLowerCase()
    .replace(/[()\[\]{}.,:;!?'"`~\-_/\\|]/g, ' ')
    .replace(/\s+/g, ' ');
}

function resolveRelatedConditionName(
  rawValue: unknown,
  allowedConditions: Set<string>,
): string {
  const raw = String(rawValue ?? '').trim();
  if (!raw) return '';
  if (allowedConditions.size === 0) return '';
  if (allowedConditions.has(raw)) return raw;

  const rawNorm = normalizeCondLabel(raw);
  let best = '';
  for (const c of allowedConditions) {
    const cn = normalizeCondLabel(c);
    if (!cn) continue;
    if (cn === rawNorm || cn.includes(rawNorm) || rawNorm.includes(cn)) {
      if (c.length > best.length) best = c;
    }
  }
  return best || '';
}

function buildManifest(files: File[]): string {
  return files.map((file, index) => `${index}:${file.name || `image-${index}`}`).join('\n');
}

function buildPrompt(examDate: string, manifest: string, conditionNames: string[]): string {
  const relatedConditionRule =
    conditionNames.length > 0
      ? `relatedConditionName은 아래 제공된 질환명 리스트에서만 고르고, 없으면 빈 문자열 "".\n허용 질환명:\n- ${conditionNames.join('\n- ')}`
      : 'relatedConditionName은 빈 문자열 "" 로 고정한다.';

  return `역할: 수의 임상에서 영상·검사 사진을 1차로 나누어 보는 보조만 한다. 출력은 스키마에 맞는 JSON만.
사용자가 한 번에 여러 이미지를 올렸다. 이미지마다 서로 다른 검사 유형일 수 있으니 각각 독립적으로 분류한다.
확정 진단을 내리지 말 것. 관찰·가능성으로 표현하고, 최종 판단은 수의사가 한다.
검사일(사용자가 지정함, 추론·변경 금지): {examDate}

아래 각 이미지에 대해 examType을 정확히 하나만 고른다:
- radiology: X-ray, CT 출력, 방사선 사진. radiology면 radiologySub는 thorax·abdomen·joint 중 가장 맞는 하나.
- ultrasound: 초음파.
- microscopy: 세포검사, 혈액도말, 현미경.
- endoscopy: 내시경.
- slit_lamp: 슬릿램프·안과 램프 검사 사진.
- other: 위에 해당하지 않으면.
examType이 radiology가 아니면 radiologySub는 null.

hasNotableFinding: 눈에 띄는 이상·의심 소견이 있을 때만 true. 불확실하거나 특이 없으면 false.
briefComment: 한국어, 이미지당 짧은 문장 정확히 한 줄(관찰 요약 또는 '뚜렷한 이상 소견 없음' 수준). 사용자에게 보이는 해당 이미지 설명은 이 필드만.
isClearFinding: 명확한 경우에만 true.
findingSpotsStr: 형식 'cx,cy,r;...' (0~1 정규화 좌표). 모르면 빈 문자열.
${relatedConditionRule}

dateSummary: 한국어로 짧은 문장 최대 3문장. 해당 검사일에 촬영된 모든 종류의 이미지를 종합적으로 분석하여 내릴 수 있는 결론만 적을 것.
dateSummary는 각 이미지에 달아둔 briefComment와 같은 문장을 반복하거나 나열하지 말고, 종합적으로 내릴 수 있는 결론만 적을 것.

images 배열은 아래 목록과 동일하게 이미지마다 한 행, index는 0부터 n-1:
{index:fileName manifest}

[실제 값 대입]
- examDate: ${examDate}
- index:fileName manifest:
${manifest}`;
}

function geminiKey(): string {
  const key = process.env.GEMINI_API_KEY?.trim() || process.env.NEXT_PUBLIC_GEMINI_API_KEY?.trim();
  if (!key) throw new ChartApiError('이미지 분석 LLM 키가 설정되지 않았습니다. (GEMINI_API_KEY)', 503);
  return key;
}

function buildGeminiSchema() {
  return {
    type: 'object',
    required: ['dateSummary', 'images'],
    properties: {
      dateSummary: { type: 'string' },
      images: {
        type: 'array',
        items: {
          type: 'object',
          required: [
            'index',
            'fileName',
            'examType',
            'radiologySub',
            'hasNotableFinding',
            'briefComment',
          ],
          properties: {
            index: { type: 'integer' },
            fileName: { type: 'string' },
            examType: { type: 'string', enum: [...EXAM_TYPE] },
            radiologySub: { type: 'string', enum: [...RADIOLOGY_SUB], nullable: true },
            hasNotableFinding: { type: 'boolean' },
            briefComment: { type: 'string' },
            // 선택 필드(있으면 사용)
            isClearFinding: { type: 'boolean' },
            findingSpotsStr: { type: 'string' },
            relatedConditionName: { type: 'string' },
          },
        },
      },
    },
  } as const;
}

async function callGeminiStructured(prompt: string): Promise<{ dateSummary: string; images: RawAiImageRow[] }> {
  const key = geminiKey();
  const model = process.env.GEMINI_MODEL?.trim() || 'gemini-2.0-flash';
  const url = `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent?key=${encodeURIComponent(key)}`;
  const res = await fetch(url, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      contents: [{ parts: [{ text: prompt }] }],
      generationConfig: {
        temperature: 0.2,
        maxOutputTokens: 8192,
        responseMimeType: 'application/json',
        responseSchema: buildGeminiSchema(),
      },
    }),
  });

  if (!res.ok) {
    const t = await res.text();
    throw new Error(`Gemini HTTP ${res.status}: ${t.slice(0, 500)}`);
  }

  const data = (await res.json()) as {
    promptFeedback?: { blockReason?: string };
    candidates?: Array<{
      finishReason?: string;
      content?: { parts?: Array<{ text?: string }> };
    }>;
  };

  if (data.promptFeedback?.blockReason) {
    throw new ChartApiError(`이미지 분석이 정책 필터로 차단되었습니다. (${data.promptFeedback.blockReason})`, 422);
  }
  const cand = data.candidates?.[0];
  const finishReason = cand?.finishReason || '';
  if (!cand) {
    throw new ChartApiError('이미지 분석 응답이 비어 있습니다. 잠시 후 다시 시도해 주세요.', 502);
  }
  if (finishReason && !['STOP', 'MAX_TOKENS'].includes(finishReason)) {
    throw new ChartApiError(`이미지 분석이 완료되지 않았습니다. (${finishReason})`, 422);
  }
  const text = cand.content?.parts?.map((p) => p.text ?? '').join('').trim() ?? '';
  if (!text) {
    throw new ChartApiError('이미지 분석 결과가 비어 있습니다. 잠시 후 다시 시도해 주세요.', 502);
  }
  let parsed: { dateSummary?: unknown; images?: unknown };
  try {
    parsed = JSON.parse(text) as { dateSummary?: unknown; images?: unknown };
  } catch {
    throw new ChartApiError('이미지 분석 JSON 파싱에 실패했습니다. 다시 시도해 주세요.', 422);
  }

  return {
    dateSummary: typeof parsed.dateSummary === 'string' ? parsed.dateSummary.trim() : '',
    images: Array.isArray(parsed.images) ? (parsed.images as RawAiImageRow[]) : [],
  };
}

async function callGeminiStructuredWithImages(
  prompt: string,
  files: File[],
): Promise<{ dateSummary: string; images: RawAiImageRow[] }> {
  const key = geminiKey();
  const model = process.env.GEMINI_MODEL?.trim() || 'gemini-2.0-flash';
  const url = `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent?key=${encodeURIComponent(key)}`;

  const parts: Array<Record<string, unknown>> = [{ text: prompt }];
  for (const file of files) {
    // 원본 고해상도를 그대로 보내면 토큰/크기 제한으로 실패하기 쉬워 분석용 썸네일로 축소
    const ab = await file.arrayBuffer();
    const resized = await sharp(Buffer.from(ab))
      .rotate()
      .resize({ width: 1280, height: 1280, fit: 'inside', withoutEnlargement: true })
      .jpeg({ quality: 75 })
      .toBuffer();
    const mime = 'image/jpeg';
    const b64 = resized.toString('base64');
    parts.push({
      inline_data: {
        mime_type: mime,
        data: b64,
      },
    });
  }

  const res = await fetch(url, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      contents: [{ parts }],
      generationConfig: {
        temperature: 0.2,
        maxOutputTokens: 8192,
        responseMimeType: 'application/json',
        responseSchema: buildGeminiSchema(),
      },
    }),
  });

  if (!res.ok) {
    const t = await res.text();
    throw new Error(`Gemini HTTP ${res.status}: ${t.slice(0, 500)}`);
  }

  const data = (await res.json()) as {
    promptFeedback?: { blockReason?: string };
    candidates?: Array<{
      finishReason?: string;
      content?: { parts?: Array<{ text?: string }> };
    }>;
  };

  if (data.promptFeedback?.blockReason) {
    throw new ChartApiError(`이미지 분석이 정책 필터로 차단되었습니다. (${data.promptFeedback.blockReason})`, 422);
  }
  const cand = data.candidates?.[0];
  const finishReason = cand?.finishReason || '';
  if (!cand) {
    throw new ChartApiError('이미지 분석 응답이 비어 있습니다. 잠시 후 다시 시도해 주세요.', 502);
  }
  if (finishReason && !['STOP', 'MAX_TOKENS'].includes(finishReason)) {
    throw new ChartApiError(`이미지 분석이 완료되지 않았습니다. (${finishReason})`, 422);
  }
  const text = cand.content?.parts?.map((p) => p.text ?? '').join('').trim() ?? '';
  if (!text) {
    throw new ChartApiError('이미지 분석 결과가 비어 있습니다. 잠시 후 다시 시도해 주세요.', 502);
  }
  let parsed: { dateSummary?: unknown; images?: unknown };
  try {
    parsed = JSON.parse(text) as { dateSummary?: unknown; images?: unknown };
  } catch {
    throw new ChartApiError('이미지 분석 JSON 파싱에 실패했습니다. 다시 시도해 주세요.', 422);
  }

  return {
    dateSummary: typeof parsed.dateSummary === 'string' ? parsed.dateSummary.trim() : '',
    images: Array.isArray(parsed.images) ? (parsed.images as RawAiImageRow[]) : [],
  };
}

function normalizeOneImage(
  idx: number,
  fileName: string,
  raw: RawAiImageRow | undefined,
  allowedConditions: Set<string>,
): ImageAnalysisItem {
  const examType = normalizeExamType(raw?.examType);
  const radiologySub = normalizeRadiologySub(raw?.radiologySub, examType);
  const relatedConditionName = resolveRelatedConditionName(raw?.relatedConditionName, allowedConditions);
  return {
    index: idx,
    fileName,
    examType,
    radiologySub,
    hasNotableFinding: Boolean(raw?.hasNotableFinding),
    briefComment: oneLineKoComment(raw?.briefComment),
    isClearFinding: Boolean(raw?.isClearFinding),
    findingSpotsStr: String(raw?.findingSpotsStr ?? '').trim(),
    relatedConditionName,
  };
}

async function analyzeImageBatch(
  examDate: string,
  files: File[],
  conditionNames: string[],
): Promise<{ dateSummary: string; images: ImageAnalysisItem[] }> {
  const allowedConditions = new Set(conditionNames);
  const defaults = files.map((file, idx) =>
    normalizeOneImage(idx, file.name || `image-${idx}`, undefined, allowedConditions),
  );
  const prompt = buildPrompt(examDate, buildManifest(files), conditionNames);
  // 파일명 기반 분류 쏠림 방지: 실제 이미지 바이트를 함께 보내는 멀티모달 호출
  const parsed = await callGeminiStructuredWithImages(prompt, files);
  const byIndex = new Map<number, RawAiImageRow>();
  for (const row of parsed.images) {
    const idx = Number(row.index);
    if (!Number.isInteger(idx) || idx < 0 || idx >= files.length) continue;
    byIndex.set(idx, row);
  }
  const normalized = files.map((file, idx) =>
    normalizeOneImage(idx, file.name || `image-${idx}`, byIndex.get(idx), allowedConditions),
  );

  // UI 오버레이 조건: hasNotableFinding=true && 좌표 존재
  for (const row of normalized) {
    if (parseFindingSpotsStr(row.findingSpotsStr).length > 0 && !row.hasNotableFinding) {
      row.hasNotableFinding = true;
    }
  }

  // 결과가 전부 기본값(other/empty)이면 분석 실패로 간주해 에러를 올린다.
  const hasAnyClassified = normalized.some(
    (r) => r.examType !== 'other' || r.briefComment.length > 0 || r.hasNotableFinding,
  );
  if (!hasAnyClassified && defaults.length > 0) {
    throw new ChartApiError(
      '이미지 분석 결과가 모두 기본값으로 반환되었습니다. 모델 응답을 확인해 주세요.',
      422,
    );
  }

  return { dateSummary: parsed.dateSummary, images: normalized };
}

export async function uploadCaseImages(params: {
  runId: string;
  examDate: string;
  files: File[];
}): Promise<{
  runId: string;
  examDate: string;
  analysis: Record<string, unknown> & { images: ImageAnalysisItem[] };
  savedImages: SavedCaseImage[];
  images: SavedCaseImage[];
}> {
  const { runId, examDate, files } = params;
  if (files.length === 0) throw new Error('images required');

  const pool = getChartPgPool();
  const exists = await pool.query<{ ai_assessment: unknown }>(
    `SELECT ai_assessment FROM chart_pdf.parse_runs WHERE id = $1::uuid`,
    [runId],
  );
  if (exists.rows.length === 0) throw new ChartApiError('run not found', 404);
  const conditionNames = parseConditionNames(exists.rows[0].ai_assessment);

  const supabase = getChartAppSupabaseService();
  const savedImages: SavedCaseImage[] = [];
  const batch = await analyzeImageBatch(examDate, files, conditionNames);
  const analyzedImages = batch.images;
  const linkageDebug = {
    allowedConditions: conditionNames,
    imageToCondition: analyzedImages.map((row) => ({
      index: row.index,
      fileName: row.fileName,
      relatedConditionName: row.relatedConditionName,
      linked: row.relatedConditionName.length > 0,
      reason:
        row.relatedConditionName.length > 0
          ? 'matched'
          : conditionNames.length === 0
            ? 'no_allowed_conditions'
            : 'no_match_or_empty_output',
    })),
  };
  const warnings: string[] = [];
  if (conditionNames.length === 0) {
    warnings.push('ai_assessment.conditions 가 비어 있어 related_assessment_condition 매칭을 건너뜁니다.');
  }

  for (const [idx, file] of files.entries()) {
    if (!ALLOWED.has(file.type)) {
      throw new Error(`unsupported image type: ${file.type}`);
    }
    const ab = await file.arrayBuffer();
    if (ab.byteLength > MAX_BYTES) throw new Error(`file too large: ${file.name}`);
    const buf = Buffer.from(ab);
    const edge = getImageCaseMaxEdge();
    const q = getImageCaseWebpQuality();
    const webp = await sharp(buf)
      .rotate()
      .webp({ quality: q })
      .resize({ width: edge, height: edge, fit: 'inside' })
      .toBuffer();

    const storagePath = `${runId}/${randomUUID()}.webp`;
    const bucket = getCaseImageBucket();
    const up = await supabase.storage.from(bucket).upload(storagePath, webp, {
      contentType: 'image/webp',
      upsert: false,
    });
    if (up.error) throw new Error(up.error.message);

    const analysis = analyzedImages[idx];
    const findingSpots = parseFindingSpotsStr(analysis.findingSpotsStr);
    const finding_spots = findingSpots.length > 0 ? { spots: findingSpots, raw: analysis.findingSpotsStr } : null;

    let ins;
    try {
      ins = await pool.query<{ id: string }>(
        `
        INSERT INTO chart_pdf.report_case_images (
          parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
          has_notable_finding, storage_path, mime_type, byte_size,
          finding_spots, finding_confidence, related_assessment_condition
        ) VALUES (
          $1::uuid, $2::date, $3, $4, $5, $6,
          $7, $8, $9, $10,
          $11::jsonb, $12, $13
        )
        RETURNING id
        `,
        [
          runId,
          examDate,
          file.name || 'image.bin',
          analysis.examType,
          analysis.radiologySub,
          analysis.briefComment || ' ',
          analysis.hasNotableFinding,
          storagePath,
          'image/webp',
          webp.length,
          finding_spots == null ? null : JSON.stringify(finding_spots),
          analysis.isClearFinding ? 'clear' : analysis.hasNotableFinding ? 'suspected' : null,
          analysis.relatedConditionName || null,
        ],
      );
    } catch (e) {
      const msg = e instanceof Error ? e.message : String(e);
      // legacy/부분 이관 환경: related_assessment_condition 컬럼 없을 수 있음
      if (!/related_assessment_condition/i.test(msg)) throw e;
      warnings.push('report_case_images.related_assessment_condition 컬럼이 없어 관련 질환 연결 저장을 생략했습니다.');
      ins = await pool.query<{ id: string }>(
        `
        INSERT INTO chart_pdf.report_case_images (
          parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
          has_notable_finding, storage_path, mime_type, byte_size,
          finding_spots, finding_confidence
        ) VALUES (
          $1::uuid, $2::date, $3, $4, $5, $6,
          $7, $8, $9, $10,
          $11::jsonb, $12
        )
        RETURNING id
        `,
        [
          runId,
          examDate,
          file.name || 'image.bin',
          analysis.examType,
          analysis.radiologySub,
          analysis.briefComment || ' ',
          analysis.hasNotableFinding,
          storagePath,
          'image/webp',
          webp.length,
          finding_spots == null ? null : JSON.stringify(finding_spots),
          analysis.isClearFinding ? 'clear' : analysis.hasNotableFinding ? 'suspected' : null,
        ],
      );
    }

    savedImages.push({ id: ins.rows[0].id, fileName: file.name || 'image.webp' });
  }

  const combinedAnalysis: Record<string, unknown> & { images: ImageAnalysisItem[] } = {
    dateSummary: batch.dateSummary,
    images: analyzedImages,
    linkageDebug,
    ...(warnings.length ? { warnings } : {}),
  };

  return {
    runId,
    examDate,
    analysis: combinedAnalysis,
    savedImages,
    images: savedImages,
  };
}
