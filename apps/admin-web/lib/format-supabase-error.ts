/** PostgREST 에러 메시지 보강 */
export function formatSupabaseError(err: unknown): string {
  if (err == null) return 'Unknown error';
  if (typeof err === 'string') return err;
  const e = err as { message?: string; details?: string; hint?: string; code?: string };
  const msg = e.message || String(err);
  const extra = [e.details, e.hint, e.code].filter(Boolean).join(' | ');
  return extra ? `${msg} (${extra})` : msg;
}
