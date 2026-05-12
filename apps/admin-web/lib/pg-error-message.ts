/** API 라우트에서 Postgres·네트워크 예외를 사람이 읽을 메시지(+ code)로 정리 */
export function formatPgRouteError(e: unknown): { message: string; pgCode?: string } {
  const pgCode =
    typeof e === 'object' &&
    e !== null &&
    'code' in e &&
    typeof (e as { code: unknown }).code === 'string' &&
    (e as { code: string }).code.length > 0
      ? (e as { code: string }).code
      : undefined;

  if (typeof e === 'string') {
    const t = e.trim();
    return { message: t || '알 수 없는 오류(문자열)', pgCode };
  }

  if (typeof AggregateError !== 'undefined' && e instanceof AggregateError) {
    const parts = e.errors.map((sub) => formatPgRouteError(sub).message).filter(Boolean);
    const msg = parts.length > 0 ? parts.join(' · ') : e.message?.trim() || '';
    return { message: msg || 'AggregateError', pgCode };
  }

  if (e instanceof Error) {
    const msg = e.message?.trim() || '';
    if (msg) return { message: msg, pgCode };
    const cause = 'cause' in e ? (e as Error & { cause?: unknown }).cause : undefined;
    if (cause !== undefined) {
      const inner = formatPgRouteError(cause);
      if (inner.message) return { message: inner.message, pgCode: inner.pgCode ?? pgCode };
    }
    return { message: e.name || 'Error(메시지 없음)', pgCode };
  }

  if (e && typeof e === 'object' && 'message' in e) {
    const m = (e as { message: unknown }).message;
    if (typeof m === 'string' && m.trim()) return { message: m.trim(), pgCode };
  }

  try {
    const s = JSON.stringify(e);
    if (s && s !== '{}') return { message: s.slice(0, 500), pgCode };
  } catch {
    /* ignore */
  }

  return { message: String(e) || '알 수 없는 오류', pgCode };
}

/** 직접 DB 포트가 막혀 ETIMEDOUT 등이 날 때 한글 안내 (Session 5432 / Transaction 6543 / 망 구분) */
export function appendPostgresConnectFailureHint(message: string): string {
  const m = message.toLowerCase();
  if (
    m.includes('etimedout') ||
    m.includes('econnrefused') ||
    m.includes('enotfound') ||
    m.includes('getaddrinfo')
  ) {
    const port5432 = m.includes(':5432');
    const poolerHost = m.includes('pooler.supabase.com');
    const extra =
      port5432 && poolerHost
        ? ' 이미 `*.pooler.supabase.com:5432`(Session 풀러)인데도 타임아웃이면, 같은 화면의 **Transaction** 풀러 문자열(보통 포트 **6543**, 사용자 `postgres.<project-ref>`)로 바꿔 보세요. 회사망은 **나가는 5432만** 막고 6543은 허용하는 경우가 있습니다.'
        : port5432
          ? ' `db.*.supabase.co:5432`(직접 연결)이면 Session 풀러(`*.pooler.supabase.com:5432`)로 바꾸고, 그래도 안 되면 **Transaction 풀러(:6543)** 를 쓰세요.'
          : ' Supabase Dashboard → Database → Connection string에서 Pooler URI를 확인하세요.';

    return (
      `${message} ` +
      '[안내] VPN·사내망은 Postgres용 **5432** 나가는 연결을 통째로 막는 경우가 많습니다. ' +
      '원격으로 맞는지 보려면 VPN 끄기·핸드폰 테더로 한 번만 테스트해 보는 것도 좋습니다.' +
      extra
    );
  }
  return message;
}
