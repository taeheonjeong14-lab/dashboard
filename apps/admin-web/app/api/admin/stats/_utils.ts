import type { NextRequest } from 'next/server';
import { NextResponse } from 'next/server';
import { requireAdminApi } from '@/lib/assert-admin-api';
import { isHospitalUuid } from '@/lib/admin-stats/hospital-id';
import { formatSupabaseError } from '@/lib/format-supabase-error';

/** Supabase/PostgREST 오류는 `Error` 가 아닐 수 있어 메시지가 ‘조회 실패’로만 나가지 않게 한다. */
export function statsRouteError(e: unknown): string {
  return formatSupabaseError(e);
}

export async function requireAdminAndHospital(
  request: NextRequest,
): Promise<{ ok: true; hospitalId: string } | { ok: false; response: NextResponse }> {
  const gate = await requireAdminApi();
  if (!gate.ok) return { ok: false, response: gate.response };

  const url = new URL(request.url);
  const hospitalId = url.searchParams.get('hospitalId')?.trim() ?? '';
  if (!hospitalId || !isHospitalUuid(hospitalId)) {
    return {
      ok: false,
      response: NextResponse.json({ error: '유효한 hospitalId(UUID)가 필요합니다.' }, { status: 400 }),
    };
  }
  return { ok: true, hospitalId };
}
