import { NextRequest, NextResponse } from 'next/server';

export function jsonError(message: string, status: number) {
  return NextResponse.json({ error: message }, { status });
}

/** Missing env → 503 so ops sets CHART_APP_API_KEY before exposing routes. */
export function chartAppAuthMiddleware(request: NextRequest): NextResponse | null {
  const secret = process.env.CHART_APP_API_KEY?.trim();
  if (!secret) {
    return jsonError('Chart app API is not configured (CHART_APP_API_KEY)', 503);
  }
  const auth = request.headers.get('authorization') || '';
  if (!auth.startsWith('Bearer ')) {
    return jsonError('Unauthorized', 401);
  }
  const token = auth.slice(7).trim();
  if (token !== secret) {
    return jsonError('Unauthorized', 401);
  }
  return null;
}
