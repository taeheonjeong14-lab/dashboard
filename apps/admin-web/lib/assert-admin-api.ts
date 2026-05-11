import { NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';
import { fetchDdxAdminAllowed } from '@/lib/require-admin';

export async function requireAdminApi(): Promise<
  { ok: true; userId: string } | { ok: false; response: NextResponse }
> {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) {
    return { ok: false, response: NextResponse.json({ error: 'Unauthorized' }, { status: 401 }) };
  }
  const allowed = await fetchDdxAdminAllowed(user.id);
  if (!allowed) {
    return { ok: false, response: NextResponse.json({ error: 'Forbidden' }, { status: 403 }) };
  }
  return { ok: true, userId: user.id };
}
