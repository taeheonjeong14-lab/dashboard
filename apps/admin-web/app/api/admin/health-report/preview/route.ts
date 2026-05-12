import { NextRequest, NextResponse } from 'next/server';
import { requireAdminApi } from '@/lib/assert-admin-api';
import { isParseRunUuid } from '@/lib/chart-extraction/uuid';
import { getChartApiProxyConfig, chartApiSelfProxyErrorMessage, chartApiConnectionRefusedHint } from '@/lib/chart-api-proxy-env';
import { formatChartApiFetchError } from '@/lib/chart-api-fetch-error';

export const dynamic = 'force-dynamic';

/** chart-api `POST /api/report/health-checkup/preview` — JSON 모델만 프록시(브라우저는 admin origin에서 모달 렌더). */
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

  const selfErr = chartApiSelfProxyErrorMessage(cfg.base, request.url);
  if (selfErr) {
    return NextResponse.json({ error: selfErr, chartApiBase: cfg.base }, { status: 503 });
  }

  let body: unknown;
  try {
    body = await request.json();
  } catch {
    return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
  }

  const o = body as Record<string, unknown>;
  const runId = String(o.runId ?? '').trim();
  if (!isParseRunUuid(runId)) {
    return NextResponse.json({ error: 'runId invalid' }, { status: 400 });
  }

  const url = `${cfg.outboundBase}/api/report/health-checkup/preview`;
  let outboundBody: string;
  try {
    outboundBody = JSON.stringify(body);
  } catch (e) {
    return NextResponse.json(
      { error: '미리보기 요청 본문을 JSON으로 만들 수 없습니다.', detail: String(e) },
      { status: 400 },
    );
  }
  try {
    const res = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${cfg.key}`,
      },
      body: outboundBody,
    });
    const text = await res.text();
    let json: unknown;
    try {
      json = JSON.parse(text) as unknown;
    } catch {
      console.error('[health-report/preview] non-JSON from chart-api', {
        status: res.status,
        snippet: text.slice(0, 500),
        chartUrl: url,
      });
      return NextResponse.json(
        {
          error: `chart-api 응답이 JSON이 아닙니다 (HTTP ${res.status}).`,
          detail: text.slice(0, 600),
          chartApiBase: cfg.base,
          chartApiFetchBase: cfg.outboundBase,
          chartApiPath: '/api/report/health-checkup/preview',
        },
        { status: 502 },
      );
    }
    return NextResponse.json(json, { status: res.status });
  } catch (e) {
    const msg = formatChartApiFetchError(e);
    console.error('[health-report/preview] fetch chart-api failed', { chartUrl: url, err: e });
    const hint = /ECONNREFUSED|ENOTFOUND|ETIMEDOUT/i.test(msg) ? chartApiConnectionRefusedHint() : undefined;
    return NextResponse.json(
      {
        error: msg,
        hint,
        chartApiBase: cfg.base,
        chartApiFetchBase: cfg.outboundBase,
        chartApiPath: '/api/report/health-checkup/preview',
      },
      { status: 502 },
    );
  }
}
