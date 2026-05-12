/** admin 서버 → chart-api `fetch` 실패 시 사용자·로그용 메시지 */
export function formatChartApiFetchError(e: unknown): string {
  if (typeof AggregateError !== 'undefined' && e instanceof AggregateError) {
    const parts = (e.errors ?? []).map((x) => formatChartApiFetchError(x));
    const head = e.message?.trim() ? e.message.trim() : '';
    return [head, ...parts].filter(Boolean).join(' | ');
  }
  if (e instanceof TypeError && e.message === 'fetch failed') {
    const cause = (e as Error & { cause?: unknown }).cause;
    if (cause instanceof Error) {
      const code = 'code' in cause ? String((cause as NodeJS.ErrnoException).code ?? '') : '';
      return `chart-api에 연결하지 못했습니다 (${cause.message}${code ? `, ${code}` : ''}). CHART_API_BASE_URL 이 이 Next 서버(터미널)에서 접근 가능한 주소인지 확인하세요. (예: WSL과 Windows가 다르면 localhost 대신 호스트 IP, chart-api dev 서버 실행 여부)`;
    }
    return 'chart-api에 연결하지 못했습니다(fetch failed). CHART_API_BASE_URL·포트·chart-api 실행 여부를 확인하세요.';
  }
  if (e instanceof Error) return e.message;
  return String(e ?? '알 수 없는 오류');
}
