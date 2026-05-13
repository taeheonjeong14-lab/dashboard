import { NextRequest, NextResponse } from 'next/server';
import { chartAppAuthMiddleware } from '@/lib/chart-app/auth';
import { resolveChartExportRequestId, chartExportRequestIdHeaders } from '@/lib/chart-app/export-request-id';
import { buildHealthCheckupPrintUrlForRequest } from '@/lib/chart-app/health-checkup-export-print-url';
import { PARSE_RUN_UUID_RE, parseRunExists } from '@/lib/parse-run-check';
import { getHealthCheckupGeneratedContentForRun } from '@/lib/generated-run-content';

/** 진단만 수행 · PDF 바이너리 없음 */
export const maxDuration = 60;
export const runtime = 'nodejs';

async function probePrintPage(printUrl: string): Promise<{
  ok: boolean;
  status: number;
  contentType: string | null;
  ms: number;
  bytesRead: number;
  hasReportTokensMarker: boolean;
  error?: string;
}> {
  const t0 = Date.now();
  try {
    const ac = new AbortController();
    const timer = setTimeout(() => ac.abort(), 28_000);
    const res = await fetch(printUrl, {
      redirect: 'follow',
      signal: ac.signal,
      headers: {
        Accept: 'text/html,*/*',
        'User-Agent': 'chart-api-export-debug/1',
      },
    });
    clearTimeout(timer);
    const ms = Date.now() - t0;
    const ab = await res.arrayBuffer();
    const n = Math.min(ab.byteLength, 262_144);
    const slice = new TextDecoder('utf8', { fatal: false }).decode(ab.slice(0, n));
    return {
      ok: res.ok,
      status: res.status,
      contentType: res.headers.get('content-type'),
      ms,
      bytesRead: ab.byteLength,
      hasReportTokensMarker: slice.includes('report-a4-tokens'),
    };
  } catch (e) {
    return {
      ok: false,
      status: 0,
      contentType: null,
      ms: Date.now() - t0,
      bytesRead: 0,
      hasReportTokensMarker: false,
      error: e instanceof Error ? e.message : String(e),
    };
  }
}

// POST /api/report/health-checkup/export-debug — Bearer 필요 · Failed to fetch 원인 좁히기
export async function POST(request: NextRequest) {
  const authErr = chartAppAuthMiddleware(request);
  if (authErr) return authErr;

  const requestId = resolveChartExportRequestId(request);
  const idHeaders = chartExportRequestIdHeaders(requestId);

  let body: { runId?: unknown; probePrintUrl?: unknown };
  try {
    body = (await request.json()) as { runId?: unknown; probePrintUrl?: unknown };
  } catch {
    return NextResponse.json({ error: 'Invalid JSON', requestId }, { status: 400, headers: idHeaders });
  }

  const runId = typeof body.runId === 'string' ? body.runId.trim() : '';
  const probePrintUrl = body.probePrintUrl !== false;

  const envSnapshot = {
    vercelRegion: process.env.VERCEL_REGION ?? null,
    vercelUrlHost: process.env.VERCEL_URL ?? null,
    nodeEnv: process.env.NODE_ENV ?? null,
    hasDatabaseUrl: Boolean(process.env.DATABASE_URL?.trim()),
    hasAutomationBypassSecret: Boolean(process.env.VERCEL_AUTOMATION_BYPASS_SECRET?.trim()),
    hasPlaywrightPdfServiceUrl: Boolean(process.env.PLAYWRIGHT_PDF_SERVICE_URL?.trim()),
  };

  const checks: Record<string, unknown> = { env: envSnapshot };
  const hints: string[] = [];

  if (!envSnapshot.hasAutomationBypassSecret && process.env.VERCEL_URL) {
    hints.push(
      'VERCEL_AUTOMATION_BYPASS_SECRET 미설정 — Deployment Protection 이 켜져 있으면 서버가 자기 인쇄 URL을 열지 못할 수 있습니다.',
    );
  }

  if (!runId) {
    hints.push('runId 없음 — 전체 점검만 반환했습니다. 문제 재현 runId를 넣어 probePrintUrl 을 실행하세요.');
    return NextResponse.json({ ok: true, requestId, checks, hints }, { headers: idHeaders });
  }

  if (!PARSE_RUN_UUID_RE.test(runId)) {
    return NextResponse.json(
      { ok: false, error: '유효한 runId가 필요합니다.', requestId, checks, hints },
      { status: 400, headers: idHeaders },
    );
  }

  const runExists = await parseRunExists(runId);
  const generatedRow = await getHealthCheckupGeneratedContentForRun(null, runId);
  checks.run = {
    exists: runExists,
    hasGeneratedHealthContent: generatedRow != null,
  };

  if (!runExists) hints.push('parse_run 없음 — export 는 404에 가깝습니다.');
  if (!generatedRow) hints.push('generated_run_content(건강검진) 없음 — 인쇄 페이지가 404 notFound 일 수 있습니다.');

  const printPath = `/runs/${encodeURIComponent(runId)}/report/print`;
  checks.print = {
    path: printPath,
    requestOrigin: new URL(request.url).origin,
  };

  if (probePrintUrl) {
    const printUrl = buildHealthCheckupPrintUrlForRequest(request.url, runId);
    const fetchResult = await probePrintPage(printUrl);
    checks.printPageFetch = fetchResult;

    if (fetchResult.error) {
      hints.push(`인쇄 URL fetch 실패: ${fetchResult.error}`);
    } else if (fetchResult.status >= 400) {
      hints.push(`인쇄 URL HTTP ${fetchResult.status} — 보호 페이지·호스트 불일치·만료 가능`);
    } else if (!fetchResult.hasReportTokensMarker) {
      hints.push(
        '응답에 .report-a4-tokens 없음 — 다른 배포 HTML·로그인 월·오류 페이지일 수 있습니다.',
      );
    }
  }

  return NextResponse.json(
    {
      ok: true,
      requestId,
      checks,
      hints,
      usageKo:
        '실패한 브라우저 요청에 헤더 X-Chart-Export-Request-Id 를 넣으면 Vercel 로그의 [export-pdf] rid= 와 매칭됩니다.',
    },
    { headers: idHeaders },
  );
}
