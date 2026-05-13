import type { NextRequest, NextResponse } from 'next/server';

/**
 * vet-report 등 교차 출처 브라우저 호출용 CORS.
 * `credentials: 'include'` / Axios `withCredentials` 일 때는 반드시 Allow-Credentials 가 필요함 (없으면 Failed to fetch).
 */
export function applySharePublicCorsHeaders(headers: Headers, request: NextRequest): void {
  const origin = request.headers.get('origin');
  const requestedHeaders = request.headers.get('access-control-request-headers');
  headers.set('Access-Control-Allow-Methods', 'GET, POST, PATCH, OPTIONS');
  headers.set(
    'Access-Control-Allow-Headers',
      requestedHeaders ||
      'Content-Type, Authorization, Accept, X-Requested-With, X-Chart-Export-Request-Id, RSC, Next-Router-State-Tree, Next-Router-Prefetch',
  );
  headers.set('Access-Control-Max-Age', '86400');
  if (origin) {
    headers.set('Access-Control-Allow-Origin', origin);
    headers.set('Access-Control-Allow-Credentials', 'true');
    headers.append('Vary', 'Origin');
  } else {
    headers.set('Access-Control-Allow-Origin', '*');
  }
}

export function sharePublicCorsHeadersSnapshot(request: NextRequest): Headers {
  const h = new Headers();
  applySharePublicCorsHeaders(h, request);
  return h;
}

export type SharePublicCorsOptions = {
  exposeHeaders?: string;
};

export function applyPublicShareReviewCors(
  response: NextResponse,
  request: NextRequest,
  options?: SharePublicCorsOptions,
): NextResponse {
  applySharePublicCorsHeaders(response.headers, request);
  if (options?.exposeHeaders) {
    response.headers.set('Access-Control-Expose-Headers', options.exposeHeaders);
  }
  return response;
}
