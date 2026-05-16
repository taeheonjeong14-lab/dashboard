import { NextResponse } from 'next/server';
import { requireAdminApi } from '@/lib/assert-admin-api';

export async function GET() {
  const gate = await requireAdminApi();
  if (!gate.ok) return gate.response;

  const chartApiUrl = process.env.CHART_API_BASE_URL?.replace(/\/$/, '');
  const chartApiKey = process.env.CHART_APP_API_KEY;

  if (!chartApiUrl || !chartApiKey) {
    return NextResponse.json(
      { ok: false, results: { error: { ok: false, detail: 'CHART_API_BASE_URL 또는 CHART_APP_API_KEY 미설정' } } },
      { status: 200 },
    );
  }

  try {
    const controller = new AbortController();
    const timeout = setTimeout(() => controller.abort(), 15000);
    const res = await fetch(`${chartApiUrl}/api/health`, {
      headers: { Authorization: `Bearer ${chartApiKey}` },
      signal: controller.signal,
    }).finally(() => clearTimeout(timeout));

    if (!res.ok && res.status === 404) {
      return NextResponse.json(
        { ok: false, results: { error: { ok: false, detail: `chart-api /api/health 없음 (HTTP 404). chart-api를 업데이트하세요.` } } },
        { status: 200 },
      );
    }

    const data = await res.json() as { ok?: boolean; results?: Record<string, unknown> };
    return NextResponse.json(data);
  } catch (e) {
    const msg = e instanceof Error ? e.message : String(e);
    return NextResponse.json(
      { ok: false, results: { error: { ok: false, detail: `chart-api 연결 실패: ${msg}` } } },
      { status: 200 },
    );
  }
}
