/** Server-only: chart-api base URL + service API key for admin → chart-api proxies. */
export function getChartApiProxyConfig(): { base: string; outboundBase: string; key: string } | null {
  const base = process.env.CHART_API_BASE_URL?.trim().replace(/\/+$/, '') ?? '';
  const key = process.env.CHART_APP_API_KEY?.trim();
  if (!base || !key) return null;
  return { base, outboundBase: normalizeChartApiOutboundBaseUrl(base), key };
}

/**
 * Node(undici)가 `localhost`를 `::1`로 먼저 시도해 chart-api가 IPv4만 listen 할 때 ECONNREFUSED 나는 경우가 있어,
 * 서버→chart-api `fetch` 전용으로 호스트를 127.0.0.1 로 바꿉니다. (.env 표기는 localhost 그대로 두어도 됨)
 */
export function normalizeChartApiOutboundBaseUrl(base: string): string {
  const trimmed = base.trim().replace(/\/+$/, '');
  try {
    const u = new URL(trimmed);
    const h = u.hostname.toLowerCase();
    if (h === 'localhost' || h === '::1') {
      u.hostname = '127.0.0.1';
    }
    let out = u.toString();
    if (out.endsWith('/')) out = out.slice(0, -1);
    return out;
  } catch {
    return trimmed;
  }
}

/** Origin for browser-open print preview (same host as chart-api). */
export function chartApiOriginFromBase(base: string): string {
  try {
    return new URL(base).origin;
  } catch {
    return base;
  }
}

/**
 * CHART_API_BASE_URL 이 이 admin 요청과 동일 origin(같은 호스트·포트)이면 잘못된 설정입니다.
 * (admin이 자기 자신을 chart-api라고 부르는 경우)
 */
export function chartApiSelfProxyErrorMessage(chartBase: string, incomingRequestUrl: string): string | null {
  try {
    const b = new URL(chartBase.trim().replace(/\/+$/, ''));
    const r = new URL(incomingRequestUrl);
    if (b.origin === r.origin) {
      return `CHART_API_BASE_URL(${b.origin})이 지금 이 admin 서버와 같습니다. chart-api를 별도로 띄운 뒤 그 주소를 넣어 주세요. 이 레포 기본값: chart-api dev 포트 3003, admin-web 3011.`;
    }
  } catch {
    return null;
  }
  return null;
}

/** ECONNREFUSED 등 연결 실패 시 안내(포트 혼동 방지) */
export function chartApiConnectionRefusedHint(): string {
  return [
    '이 레포 기본 포트: `chart-api`는 `npm run dev` 시 3003, `admin-web`은 3011입니다.',
    '`CHART_API_BASE_URL`에는 admin(3011)이 아니라 chart-api 주소를 넣어야 합니다. 예: http://127.0.0.1:3003',
    '지금 .env에 3001처럼 다른 포트가 있으면, chart-api가 실제로 listen 중인 포트와 맞는지 확인하세요.',
  ].join(' ');
}
