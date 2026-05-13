import { NextRequest, NextResponse } from 'next/server';
import { chartAppAuthMiddleware } from '@/lib/chart-app/auth';
import { extractPdfText } from '@/lib/chart-app/extract-pdf-text';
import { downloadStorageObject } from '@/lib/chart-app/storage-object';
import { extractReferenceRowsFromImage, extractReferenceRowsFromText } from '@/lib/chart-app/reference-rows';
import { geminiGenerateFromParts, geminiGenerateText, tryParseJsonObject } from '@/lib/chart-app/gemini';
import { getPdfUploadsBucket } from '@/lib/chart-app/storage-config';
import { isAllowedPdfExtractPath } from '@/lib/chart-app/upload-path';
const MAX_TEXT = 100_000;

// POST /api/content/reference-extract — multipart file 또는 JSON(storagePath / imageBase64)
export const maxDuration = 120;

const REFINE_PROMPT = (text: string) => `다음은 참고문헌/자료에서 추출한 텍스트입니다. 저자, 연도, 제목, 저널, DOI/URL 이 있으면 JSON 으로 정리하세요.
형식: {"references": ["..."], "summary": "한 줄 요약", "entities": { "journals": [], "years": [] } }

텍스트:
${text}`;

type JsonBody = {
  storagePath?: string;
  bucket?: string;
  imageBase64?: string;
  mimeType?: string;
  rawOnly?: boolean;
};

function isPdfMime(m: string): boolean {
  const x = m.toLowerCase();
  return x === 'application/pdf' || x === 'application/x-pdf';
}

function isImageMime(m: string): boolean {
  return m.toLowerCase().startsWith('image/');
}

async function jsonBodyExtract(body: JsonBody): Promise<Response | null> {
  const hasPath = typeof body.storagePath === 'string' && body.storagePath.trim();
  const b64 = typeof body.imageBase64 === 'string' ? body.imageBase64.trim() : '';
  if (!hasPath && !b64) return null;

  if (b64) {
    if (!body.mimeType) {
      return NextResponse.json({ error: 'mimeType is required with imageBase64', fileName: '', mimeType: '', fullText: '', rows: [] }, { status: 400 });
    }
    const mimeType = String(body.mimeType).trim().toLowerCase();
    if (!isImageMime(mimeType)) {
      return NextResponse.json({ error: 'mimeType must be an image/* type', fileName: '', mimeType: '', fullText: '', rows: [] }, { status: 400 });
    }
    try {
      const rows = await extractReferenceRowsFromImage({ mimeType, base64: b64 });
      const raw = await geminiGenerateFromParts([
        { text: '이미지에서 보이는 모든 인용·문헌 텍스트를 한국어/원문 그대로 추출해 한 덩어리 문자열로만 답하세요. 없으면 빈 문자열.' },
        { inlineData: { mimeType, data: b64 } },
      ]);
      return NextResponse.json({
        fileName: 'inline-image',
        mimeType,
        fullText: raw.trim(),
        rows,
      });
    } catch (e) {
      const msg = e instanceof Error ? e.message : String(e);
      if (msg.includes('GEMINI_API_KEY')) {
        return NextResponse.json({ error: 'LLM not configured (GEMINI_API_KEY)', fileName: '', mimeType: '', fullText: '', rows: [] }, { status: 503 });
      }
      throw e;
    }
  }

  const storagePath = String(body.storagePath).trim();
  if (!isAllowedPdfExtractPath(storagePath)) {
    return NextResponse.json({ error: 'storagePath must use extract-uploads/ prefix', fileName: '', mimeType: '', fullText: '', rows: [] }, { status: 400 });
  }
  const bucket =
      typeof body.bucket === 'string' && body.bucket.trim() ? body.bucket.trim() : getPdfUploadsBucket();

  const buffer = await downloadStorageObject({ bucket, path: storagePath });
  const { text, numPages } = await extractPdfText(buffer);
  const slice = text.length > MAX_TEXT ? text.slice(0, MAX_TEXT) : text;
  const baseName = storagePath.split('/').pop() || 'document.pdf';

  if (body.rawOnly) {
    return NextResponse.json({
      fileName: baseName,
      mimeType: 'application/pdf',
      fullText: text,
      rows: [],
      numPages,
      truncated: text.length > MAX_TEXT,
    });
  }

  if (!slice) {
    return NextResponse.json(
      {
        error: 'No extractable text — scanned PDF needs image upload via multipart file=',
        fileName: baseName,
        mimeType: 'application/pdf',
        fullText: '',
        rows: [],
      },
      { status: 422 },
    );
  }

  try {
    const [structuredRaw, rows] = await Promise.all([
      geminiGenerateText(REFINE_PROMPT(slice)),
      extractReferenceRowsFromText(slice),
    ]);
    const structured = tryParseJsonObject(structuredRaw);
    return NextResponse.json({
      fileName: baseName,
      mimeType: 'application/pdf',
      fullText: text,
      rows,
      structured,
      numPages,
      rawTextLength: text.length,
      truncated: text.length > MAX_TEXT,
    });
  } catch (e) {
    const msg = e instanceof Error ? e.message : String(e);
    if (msg.includes('GEMINI_API_KEY')) {
      return NextResponse.json({ error: 'LLM not configured (GEMINI_API_KEY)', fileName: '', mimeType: '', fullText: '', rows: [] }, { status: 503 });
    }
    throw e;
  }
}

export async function POST(request: NextRequest) {
  const authErr = chartAppAuthMiddleware(request);
  if (authErr) return authErr;

  const ct = request.headers.get('content-type') || '';

  if (ct.includes('multipart/form-data')) {
    try {
      const form = await request.formData();
      const file = form.get('file');
      if (!file || typeof file === 'string') {
        return NextResponse.json(
          { error: 'multipart field "file" is required', fileName: '', mimeType: '', fullText: '', rows: [] },
          { status: 400 },
        );
      }

      const fileName = typeof file.name === 'string' && file.name ? file.name : 'upload';
      const mimeType = (file.type || 'application/octet-stream').toLowerCase();
      const buf = Buffer.from(await file.arrayBuffer());

      if (isPdfMime(mimeType)) {
        const { text } = await extractPdfText(buf);
        const slice = text.length > MAX_TEXT ? text.slice(0, MAX_TEXT) : text;
        if (!slice) {
          return NextResponse.json(
            {
              error: 'No extractable text in PDF',
              fileName,
              mimeType,
              fullText: '',
              rows: [],
            },
            { status: 422 },
          );
        }
        const [structuredRaw, rows] = await Promise.all([
          geminiGenerateText(REFINE_PROMPT(slice)),
          extractReferenceRowsFromText(slice),
        ]);
        const structured = tryParseJsonObject(structuredRaw);
        return NextResponse.json({
          fileName,
          mimeType: mimeType || 'application/pdf',
          fullText: text,
          rows,
          structured,
          truncated: text.length > MAX_TEXT,
        });
      }

      if (isImageMime(mimeType)) {
        const b64 = buf.toString('base64');
        const rows = await extractReferenceRowsFromImage({ mimeType, base64: b64 });
        const raw = await geminiGenerateFromParts([
          { text: '이미지에서 보이는 모든 인용·문헌 텍스트를 한 덩어리 문자열로만 답하세요. 없으면 빈 문자열.' },
          { inlineData: { mimeType, data: b64 } },
        ]);
        return NextResponse.json({
          fileName,
          mimeType,
          fullText: raw.trim(),
          rows,
        });
      }

      return NextResponse.json(
        { error: 'file must be application/pdf or image/*', fileName, mimeType, fullText: '', rows: [] },
        { status: 400 },
      );
    } catch (e) {
      const msg = e instanceof Error ? e.message : String(e);
      if (msg.includes('GEMINI_API_KEY')) {
        return NextResponse.json({ error: 'LLM not configured (GEMINI_API_KEY)', fileName: '', mimeType: '', fullText: '', rows: [] }, { status: 503 });
      }
      console.error('POST /api/content/reference-extract (multipart):', e);
      return NextResponse.json({ error: msg, fileName: '', mimeType: '', fullText: '', rows: [] }, { status: 500 });
    }
  }

  let body: JsonBody;
  try {
    body = (await request.json()) as JsonBody;
  } catch {
    return NextResponse.json({ error: 'Invalid JSON', fileName: '', mimeType: '', fullText: '', rows: [] }, { status: 400 });
  }

  try {
    const jsonRes = await jsonBodyExtract(body);
    if (jsonRes) return jsonRes;
    return NextResponse.json(
      { error: 'Provide multipart file or JSON storagePath / imageBase64', fileName: '', mimeType: '', fullText: '', rows: [] },
      { status: 400 },
    );
  } catch (e) {
    const msg = e instanceof Error ? e.message : String(e);
    if (msg.includes('GEMINI_API_KEY')) {
      return NextResponse.json({ error: 'LLM not configured (GEMINI_API_KEY)', fileName: '', mimeType: '', fullText: '', rows: [] }, { status: 503 });
    }
    if (msg.includes('not found') || msg.includes('Object not found')) {
      return NextResponse.json({ error: 'Object not found in storage', fileName: '', mimeType: '', fullText: '', rows: [] }, { status: 404 });
    }
    console.error('POST /api/content/reference-extract:', e);
    return NextResponse.json({ error: msg, fileName: '', mimeType: '', fullText: '', rows: [] }, { status: 500 });
  }
}
