import { NextRequest, NextResponse } from 'next/server';
import { requireAdminApi } from '@/lib/assert-admin-api';
import { isParseRunUuid } from '@/lib/chart-extraction/uuid';
import { getChartApiProxyConfig } from '@/lib/chart-api-proxy-env';

export const dynamic = 'force-dynamic';

/**
 * 외부 검토 링크 발급 — chart-api `POST /api/content/health-checkup/review-share` 프록시.
 * 응답의 shareUrl 은 chart-api(또는 CHART_APP_SHARE_PUBLIC_BASE_URL) 기준입니다.
 */
export async function POST(request: NextRequest) {
  const gate = await requireAdminApi();
  if (!gate.ok) return gate.response;

  const cfg = getChartApiProxyConfig();
  if (!cfg) {
    return NextResponse.json(
      { error: 'CHART_API_BASE_URL 과 CHART_APP_API_KEY 가 필요합니다.' },
      { status: 503 },
    );
  }

  let body: Record<string, unknown>;
  try {
    body = (await request.json()) as Record<string, unknown>;
  } catch {
    return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
  }

  const runId = String(body.runId ?? '').trim();
  if (!isParseRunUuid(runId)) {
    return NextResponse.json({ error: 'runId invalid' }, { status: 400 });
  }

  const url = `${cfg.outboundBase}/api/content/health-checkup/review-share`;
  try {
    const res = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${cfg.key}`,
      },
      body: JSON.stringify({ runId }),
    });
    const text = await res.text();
    let json: unknown;
    try {
      json = JSON.parse(text) as unknown;
    } catch {
      return NextResponse.json(
        { error: `chart-api 응답이 JSON이 아닙니다 (${res.status})`, raw: text.slice(0, 400) },
        { status: 502 },
      );
    }
    return NextResponse.json(json, { status: res.status });
  } catch (e) {
    console.error('POST /api/admin/health-report/review-share:', e);
    return NextResponse.json(
      { error: e instanceof Error ? e.message : 'chart-api 호출 실패' },
      { status: 502 },
    );
  }
}
