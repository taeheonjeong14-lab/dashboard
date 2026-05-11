import type { NextRequest } from 'next/server';
import { NextResponse } from 'next/server';

/**
 * 브라우저에서 vet-solution-hospital-ui 등 다른 오리진이 호출할 때 CORS.
 * 추가 도메인은 Vercel 환경변수 `DASHBOARD_API_ALLOWED_ORIGINS`(쉼표 구분)로 확장.
 */
export function dashboardApiAllowedOrigins(): string[] {
  const raw = process.env.DASHBOARD_API_ALLOWED_ORIGINS?.trim();
  if (raw) {
    return raw.split(',').map((s) => s.trim()).filter(Boolean);
  }
  return [
    'http://localhost:3010',
    'http://localhost:3011',
    'http://localhost:5173',
    'https://vet-solution-hospital-ui.vercel.app',
    'https://vet-solution-admin-ui.vercel.app',
    'https://dashboard-ui-nu-weld.vercel.app',
    'https://ddx-livid.vercel.app',
  ];
}

export function pickAllowOrigin(request: NextRequest): string | undefined {
  const origin = request.headers.get('origin');
  const allowed = dashboardApiAllowedOrigins();
  if (!origin) return undefined;
  return allowed.includes(origin) ? origin : undefined;
}

export function applyCors(request: NextRequest, response: NextResponse): NextResponse {
  const allowOrigin = pickAllowOrigin(request);
  const requestedHeaders =
    request.headers.get('access-control-request-headers') || 'Content-Type, Authorization';

  if (allowOrigin) {
    response.headers.set('Access-Control-Allow-Origin', allowOrigin);
    response.headers.append('Vary', 'Origin');
  }
  response.headers.set('Access-Control-Allow-Methods', 'GET, OPTIONS');
  response.headers.set('Access-Control-Allow-Headers', requestedHeaders);
  response.headers.set('Access-Control-Max-Age', '86400');
  return response;
}

export function corsPreflightResponse(request: NextRequest): NextResponse {
  const response = new NextResponse(null, { status: 204 });
  return applyCors(request, response);
}
