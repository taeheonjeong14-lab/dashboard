import { geminiGenerateFromParts, geminiGenerateText, tryParseJsonObject } from '@/lib/chart-app/gemini';

const ROWS_PROMPT = `다음 텍스트에서 참고문헌·인용 정보를 표 형태로 추출하세요.
JSON 한 개만 출력: {"rows":[{ "author": "", "year": "", "title": "", "journal": "", "doi": "", "url": "", "snippet": "" }] }
행이 없으면 rows 는 빈 배열. 미확인 필드는 빈 문자열.

텍스트:
`;

/** Gemini 로 참고 행 배열 생성 (vet-report 가 파싱하는 rows 필드용). */
export async function extractReferenceRowsFromText(fullText: string): Promise<unknown[]> {
  const slice = fullText.length > 90_000 ? fullText.slice(0, 90_000) : fullText;
  const raw = await geminiGenerateText(`${ROWS_PROMPT}${slice}`);
  const parsed = tryParseJsonObject(raw) as { rows?: unknown[] };
  const rows = parsed.rows;
  return Array.isArray(rows) ? rows : [];
}

const IMAGE_REF_PROMPT = `이 이미지에서 참고문헌·인용·문헌 정보를 읽고, JSON 한 개만 출력:
{"rows":[{ "author": "", "year": "", "title": "", "journal": "", "doi": "", "url": "", "snippet": "" }]}
없으면 "rows":[].
`;

export async function extractReferenceRowsFromImage(params: {
  mimeType: string;
  base64: string;
}): Promise<unknown[]> {
  const raw = await geminiGenerateFromParts([
    { text: IMAGE_REF_PROMPT },
    { inlineData: { mimeType: params.mimeType, data: params.base64 } },
  ]);
  const parsed = tryParseJsonObject(raw) as { rows?: unknown[] };
  const rows = parsed.rows;
  return Array.isArray(rows) ? rows : [];
}
