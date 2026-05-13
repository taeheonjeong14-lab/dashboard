/**
 * vet-report 인쇄 페이지 URL.
 * Chart API는 별도 호스트에서 돌기 때문에 request.url origin 이 vet-report 가 아닐 수 있음 → env 로 공개 URL 명시.
 *
 * Run 기준(로그인·health-checkup/export): …/runs/<runId>/report/print
 * 공유(export-by-share): …/review/health-checkup/<token>/print  — runId 가 아님
 *
 * - `HEALTH_CHECKUP_PRINT_URL_TEMPLATE` — `{runId}` 치환
 * - `HEALTH_CHECKUP_SHARE_PRINT_URL_TEMPLATE` — `{token}` 치환 (export-by-share)
 * - `VET_REPORT_PUBLIC_ORIGIN` — run: 기본 …/runs/{runId}/report/print, share: 기본 …/review/health-checkup/{token}/print
 */

function trimOrigin(o: string): string {
  return o.trim().replace(/\/$/, '');
}

export function buildHealthCheckupPrintUrl(runId: string, explicitUrl?: string): string | null {
  const u = explicitUrl?.trim();
  if (u) return u;

  const template = process.env.HEALTH_CHECKUP_PRINT_URL_TEMPLATE?.trim();
  if (template) {
    if (template.includes('{runId}')) {
      return template.replace(/\{runId\}/g, runId);
    }
    return `${template.replace(/\/$/, '')}/${runId}`;
  }

  const base = process.env.HEALTH_CHECKUP_PRINT_BASE_URL?.trim();
  if (base) {
    return `${base.replace(/\/$/, '')}/${runId}`;
  }

  const vetOrigin = process.env.VET_REPORT_PUBLIC_ORIGIN?.trim();
  if (vetOrigin) {
    const customSub = process.env.VET_REPORT_HEALTH_PRINT_SUBPATH?.trim();
    if (customSub) {
      const sub = customSub.replace(/^\/+|\/+$/g, '');
      return `${trimOrigin(vetOrigin)}/${sub}/${runId}`;
    }
    return `${trimOrigin(vetOrigin)}/runs/${runId}/report/print`;
  }

  return null;
}

/**
 * export-by-share 전용 — vet-report: …/review/health-checkup/<token>/print
 * (parse_run_id / runId 가 아닌 URL raw token)
 */
export function buildHealthCheckupSharePrintUrl(shareToken: string): string | null {
  const t = shareToken.trim();
  if (!t) return null;

  const template = process.env.HEALTH_CHECKUP_SHARE_PRINT_URL_TEMPLATE?.trim();
  if (template) {
    if (template.includes('{token}')) {
      return template.replace(/\{token\}/g, encodeURIComponent(t));
    }
    return `${template.replace(/\/$/, '')}/${encodeURIComponent(t)}/print`;
  }

  const vetOrigin = process.env.VET_REPORT_PUBLIC_ORIGIN?.trim();
  if (vetOrigin) {
    const sub =
      process.env.VET_REPORT_HEALTH_SHARE_PRINT_SUBPATH?.trim().replace(/^\/+|\/+$/g, '') ||
      'review/health-checkup';
    return `${trimOrigin(vetOrigin)}/${sub}/${encodeURIComponent(t)}/print`;
  }

  return null;
}
