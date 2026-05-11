import { NextResponse } from 'next/server';
import { requireAdminApi } from '@/lib/assert-admin-api';

/** 서버에 Service Role 등 설정 여부만 노출 (키 값은 절대 반환하지 않음) */
export async function GET() {
  const gate = await requireAdminApi();
  if (!gate.ok) return gate.response;

  const urlOk = Boolean(process.env.NEXT_PUBLIC_SUPABASE_URL?.trim());
  const serviceOk = Boolean(process.env.SUPABASE_SERVICE_ROLE_KEY?.trim());

  return NextResponse.json({
    serviceRoleConfigured: urlOk && serviceOk,
    supabaseUrlConfigured: urlOk,
  });
}
