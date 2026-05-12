import { NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

/** 로그인(세션)만 필요. 관리자 판정(ddx-api check)은 하지 않음. */
export async function requireAuthedApi(): Promise<
  { ok: true; userId: string } | { ok: false; response: NextResponse }
> {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) {
    return { ok: false, response: NextResponse.json({ error: 'Unauthorized' }, { status: 401 }) };
  }
  return { ok: true, userId: user.id };
}

