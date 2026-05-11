import { NextRequest, NextResponse } from 'next/server';
import { fetchBlogPreview } from '@/lib/blog-preview';
import { parseSafeHttpUrl, UnsafeUrlError } from '@/lib/ssrf';
import { applyCors, corsPreflightResponse } from '@/lib/cors';

export const runtime = 'nodejs';

export async function OPTIONS(request: NextRequest) {
  return corsPreflightResponse(request);
}

/**
 * GET /api/blog/preview?url=
 * 네이버 블로그 등 HTML을 받아 메타(제목·canonical·설명·og:image) JSON 반환.
 */
export async function GET(request: NextRequest) {
  try {
    const raw = new URL(request.url).searchParams.get('url');
    const safeUrl = parseSafeHttpUrl(raw);
    const data = await fetchBlogPreview(safeUrl.href);
    return applyCors(request, NextResponse.json(data));
  } catch (e) {
    if (e instanceof UnsafeUrlError) {
      return applyCors(request, NextResponse.json({ success: false, error: e.message }, { status: 400 }));
    }
    const message = e instanceof Error ? e.message : '미리보기 처리 중 오류가 발생했습니다.';
    return applyCors(request, NextResponse.json({ success: false, error: message }, { status: 502 }));
  }
}
