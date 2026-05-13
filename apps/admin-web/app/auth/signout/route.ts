import { NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function GET(request: Request) {
  const supabase = await createClient();
  await supabase.auth.signOut();
  const origin = process.env.NEXT_PUBLIC_SITE_URL?.trim() || new URL(request.url).origin;
  return NextResponse.redirect(`${origin}/login`);
}
