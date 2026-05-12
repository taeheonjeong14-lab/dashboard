export function absolutizeSupabaseStorageUrl(signedUrl: string): string {
  const s = signedUrl.trim();
  if (/^https?:\/\//i.test(s)) return s;
  const base = process.env.NEXT_PUBLIC_SUPABASE_URL?.trim().replace(/\/$/, '');
  if (!base) return s;
  return s.startsWith('/') ? `${base}${s}` : `${base}/${s}`;
}

