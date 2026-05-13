/** 건강검진 PDF export 가 내부에서 여는 인쇄 페이지 URL (배포 보호 우회 쿼리 포함). */
export function buildHealthCheckupPrintUrlForRequest(requestUrl: string, runId: string): string {
  const origin = new URL(requestUrl).origin;
  let printUrl = `${origin}/runs/${encodeURIComponent(runId)}/report/print`;
  const bypass = process.env.VERCEL_AUTOMATION_BYPASS_SECRET?.trim();
  if (bypass) {
    printUrl += `?x-vercel-protection-bypass=${encodeURIComponent(bypass)}`;
  }
  return printUrl;
}
