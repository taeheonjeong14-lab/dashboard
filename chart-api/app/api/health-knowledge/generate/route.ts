import { NextRequest, NextResponse } from 'next/server';
import { chartAppAuthMiddleware } from '@/lib/chart-app/auth';
import { geminiGenerateText } from '@/lib/chart-app/gemini';

// POST /api/health-knowledge/generate
export async function POST(request: NextRequest) {
  const authErr = chartAppAuthMiddleware(request);
  if (authErr) return authErr;

  let body: Record<string, unknown>;
  try {
    body = (await request.json()) as Record<string, unknown>;
  } catch {
    return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
  }

  const inputText = String(body.inputText ?? '').trim();
  const hospitalName = String(body.hospitalName ?? '').trim();
  if (!inputText || !hospitalName) {
    return NextResponse.json({ error: 'inputText and hospitalName required' }, { status: 400 });
  }

  try {
    const tone = String(body.toneMode ?? 'friendly');
    const inputMode = String(body.inputMode ?? 'text');
    const region = body.regionKeyword ? String(body.regionKeyword) : '';
    const intro = body.introText ? String(body.introText) : '';
    const outro = body.outroText ? String(body.outroText) : '';
    const color = body.hospitalBrandColorHex ? String(body.hospitalBrandColorHex) : '';

    const prompt = `Write Korean vet education HTML fragment only (no <html>/<body>), semantic tags.
Hospital display name: ${hospitalName}
BrandColor hex hint (CSS optional): ${color}
Tone: ${tone}
Input mode (html vs text): ${inputMode}
Region keyword: ${region}
Fixed intro paragraph before article (may be empty): ${intro}
Fixed outro after article (may be empty): ${outro}

Source material:\n${inputText.slice(0, 80_000)}`;

    const html = await geminiGenerateText(prompt);
    return NextResponse.json({ ok: true, html });
  } catch (e) {
    const msg = e instanceof Error ? e.message : String(e);
    if (msg.includes('GEMINI_API_KEY')) {
      return NextResponse.json({ error: 'LLM not configured (GEMINI_API_KEY)' }, { status: 503 });
    }
    console.error('health-knowledge generate:', e);
    return NextResponse.json({ ok: false, error: msg }, { status: 500 });
  }
}
