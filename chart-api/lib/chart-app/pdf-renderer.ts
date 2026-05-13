/**
 * PDF 바이너리 생성.
 * 1) PLAYWRIGHT_PDF_SERVICE_URL 이 있으면 원격 워커(레거시·폴백)
 * 2) 없으면 vet-report 와 같이 인프로세스 Playwright (@sparticuz/chromium)
 */
import { renderPdfFromPageUrl } from '@/lib/chart-app/playwright-browser';

export type PdfServiceErrorCode = 'MISSING_PDF_SERVICE' | 'PDF_SERVICE_ERROR';

async function renderViaRemoteService(printUrl: string, endpoint: string): Promise<Buffer> {
  const secret = process.env.PLAYWRIGHT_PDF_SERVICE_SECRET?.trim();
  const res = await fetch(endpoint, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(secret ? { Authorization: `Bearer ${secret}` } : {}),
    },
    body: JSON.stringify({ url: printUrl }),
  });

  if (!res.ok) {
    const t = await res.text();
    const err = new Error(`PDF service HTTP ${res.status}: ${t.slice(0, 400)}`) as Error & {
      code?: PdfServiceErrorCode;
    };
    err.code = 'PDF_SERVICE_ERROR';
    throw err;
  }

  return Buffer.from(await res.arrayBuffer());
}

/** 원격 HTTP PDF 서비스만 쓸 때 true (있으면 원격 우선) */
export function isRemotePdfServiceConfigured(): boolean {
  return Boolean(process.env.PLAYWRIGHT_PDF_SERVICE_URL?.trim());
}

export async function renderUrlToPdfBuffer(printUrl: string): Promise<Buffer> {
  const endpoint = process.env.PLAYWRIGHT_PDF_SERVICE_URL?.trim();
  if (endpoint) {
    return renderViaRemoteService(printUrl, endpoint);
  }
  return renderPdfFromPageUrl(printUrl);
}
