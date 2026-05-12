import { NextResponse, type NextRequest } from 'next/server';
import { createClient } from '@/lib/supabase/server';
import { fetchDdxAdminAllowed } from '@/lib/require-admin';

export async function GET(request: NextRequest) {
  // Never expose auth debug info in production.
  if (process.env.NODE_ENV === 'production') {
    return NextResponse.json({ error: 'not_found' }, { status: 404 });
  }

  const cookieNames = request.cookies.getAll().map((c) => c.name).sort();

  const supabase = await createClient();
  const {
    data: { user },
    error,
  } = await supabase.auth.getUser();

  const ddxBase = process.env.DDX_API_BASE_URL?.trim() || null;
  const allowed = user ? await fetchDdxAdminAllowed(user.id) : null;

  return NextResponse.json({
    nodeEnv: process.env.NODE_ENV,
    cookieNames,
    supabaseAuthError: error?.message || null,
    user: user
      ? {
          id: user.id,
          email: user.email || null,
        }
      : null,
    ddxApiBaseConfigured: Boolean(ddxBase),
    ddxApiAllowed: allowed,
  });
}

