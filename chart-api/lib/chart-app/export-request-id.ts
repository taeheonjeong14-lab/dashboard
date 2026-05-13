import { randomUUID } from 'node:crypto';

const HEADER = 'x-chart-export-request-id';

const ID_RE = /^[\w.-]{8,128}$/i;

/** 헤더 → body/form 폴백 → 서버 생성 (Vercel 로그 상관) */
export function resolveChartExportRequestId(request: Request, bodyFallback?: string | null): string {
  const fromHeader = request.headers.get(HEADER)?.trim();
  if (fromHeader && ID_RE.test(fromHeader)) return fromHeader;
  const fromBody = bodyFallback?.trim();
  if (fromBody && ID_RE.test(fromBody)) return fromBody;
  return randomUUID();
}

export function chartExportRequestIdHeaders(requestId: string): Record<string, string> {
  return { 'X-Chart-Export-Request-Id': requestId };
}
