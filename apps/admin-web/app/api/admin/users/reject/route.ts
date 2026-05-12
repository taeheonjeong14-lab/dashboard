import { NextRequest, NextResponse } from 'next/server';
import { requireAuthedApi } from '@/lib/require-auth-api';
import { createServiceRoleClient } from '@/lib/supabase/service-role';
import { formatSupabaseError } from '@/lib/format-supabase-error';

// POST /api/admin/users/reject — body: { targetUserId }
// Reject: mark rejected=true, active=false and try deleting the Supabase Auth user.
export async function POST(request: NextRequest) {
  const gate = await requireAuthedApi();
  if (!gate.ok) return gate.response;

  try {
    const body = (await request.json().catch(() => null)) as { targetUserId?: string } | null;
    const targetUserId = body?.targetUserId?.trim();
    if (!targetUserId) {
      return NextResponse.json({ success: false, error: 'targetUserId required' }, { status: 400 });
    }

    const supabase = createServiceRoleClient();

    const { error: updErr } = await supabase
      .schema('core')
      .from('users')
      .update({ rejected: true, approved: false, active: false })
      .eq('id', targetUserId);
    if (updErr) throw updErr;

    const authRes = await supabase.auth.admin.deleteUser(targetUserId);
    if (authRes.error) {
      return NextResponse.json(
        {
          success: false,
          error: `거절은 처리됐으나 Auth 삭제 실패: ${authRes.error.message}. Supabase 대시보드에서 수동 삭제하세요.`,
        },
        { status: 500 },
      );
    }

    return NextResponse.json({ success: true });
  } catch (e) {
    return NextResponse.json(
      { success: false, error: formatSupabaseError(e) },
      { status: 500 },
    );
  }
}

