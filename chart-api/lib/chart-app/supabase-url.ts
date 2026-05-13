/**
 * Supabase Storage 서명 URL을 클라이언트에서 바로 쓰기 좋게 절대 URL 로 만듭니다.
 */
export function absolutizeSupabaseStorageUrl(signedUrl: string): string {
  const s = signedUrl.trim();
  if (/^https?:\/\//i.test(s)) return s;
  const base = process.env.NEXT_PUBLIC_SUPABASE_URL?.trim().replace(/\/$/, '');
  if (!base) return s;
  return s.startsWith('/') ? `${base}${s}` : `${base}/${s}`;
}
