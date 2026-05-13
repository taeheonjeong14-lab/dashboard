import { NextRequest, NextResponse } from 'next/server';
import { chartAppAuthMiddleware } from '@/lib/chart-app/auth';

// POST /api/ocr — 범용 OCR (Google Vision 등 미연동 시)
export async function POST(request: NextRequest) {
  const authErr = chartAppAuthMiddleware(request);
  if (authErr) return authErr;

  void request;
  return NextResponse.json(
    {
      error:
        'Universal OCR is not wired yet. Configure Google Cloud Vision + JSON credentials / GEMINI multimodal and retry.',
    },
    { status: 503 },
  );
}
