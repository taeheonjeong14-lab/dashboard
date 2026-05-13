import { NextRequest, NextResponse } from 'next/server';
import { chartAppAuthMiddleware } from '@/lib/chart-app/auth';
import { renderUrlToPdfBuffer } from '@/lib/chart-app/pdf-renderer';

// POST /api/report/export — 범용: 인쇄 페이지 URL → PDF
export const maxDuration = 120;
export const runtime = 'nodejs';

type Body = { printUrl?: string };

export async function POST(request: NextRequest) {
  const authErr = chartAppAuthMiddleware(request);
  if (authErr) return authErr;

  let body: Body;
  try {
    body = (await request.json()) as Body;
  } catch {
    return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
  }

  const printUrl = typeof body.printUrl === 'string' ? body.printUrl.trim() : '';
  if (!printUrl) {
    return NextResponse.json({ error: 'printUrl is required' }, { status: 400 });
  }

  try {
    const pdf = await renderUrlToPdfBuffer(printUrl);
    return new NextResponse(new Uint8Array(pdf), {
      status: 200,
      headers: {
        'Content-Type': 'application/pdf',
        'Content-Disposition': 'attachment; filename="report.pdf"',
        'Cache-Control': 'no-store',
      },
    });
  } catch (e) {
    const msg = e instanceof Error ? e.message : String(e);
    const code = (e as { code?: string }).code;
    console.error('POST /api/report/export:', e);
    return NextResponse.json({ error: msg, hint: code }, { status: code === 'PDF_SERVICE_ERROR' ? 502 : 500 });
  }
}
