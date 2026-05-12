import { NextRequest, NextResponse } from 'next/server';
import { requireAuthedApi } from '@/lib/require-auth-api';
import { createServiceRoleClient } from '@/lib/supabase/service-role';
import { formatSupabaseError } from '@/lib/format-supabase-error';

// PATCH /api/admin/users/[id] — 사용자 정보 수정 (로그인만)
export async function PATCH(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  const gate = await requireAuthedApi();
  if (!gate.ok) return gate.response;

  try {
    const { id } = await params;
    const targetUserId = String(id || '').trim();
    if (!targetUserId) {
      return NextResponse.json({ success: false, error: 'user id required' }, { status: 400 });
    }

    const body = (await request.json().catch(() => null)) as Record<string, unknown> | null;
    if (!body) return NextResponse.json({ success: false, error: 'Invalid JSON' }, { status: 400 });

    const patch: Record<string, unknown> = {};
    if (typeof body.name === 'string') patch.name = body.name.trim() || null;
    if (typeof body.phone === 'string') patch.phone = body.phone.trim() || null;
    if (typeof body.active === 'boolean') patch.active = body.active;
    if ('hospitalId' in body) patch.hospital_id = typeof body.hospitalId === 'string' ? body.hospitalId.trim() || null : null;
    if ('customHospitalName' in body) patch.custom_hospital_name = typeof body.customHospitalName === 'string' ? body.customHospitalName.trim() || null : null;
    if ('hospitalAddress' in body) patch.hospital_address = typeof body.hospitalAddress === 'string' ? body.hospitalAddress.trim() || null : null;
    if ('hospitalAddressDetail' in body) patch.hospital_address_detail = typeof body.hospitalAddressDetail === 'string' ? body.hospitalAddressDetail.trim() || null : null;

    const supabase = createServiceRoleClient();
    const { data, error } = await supabase
      .schema('core')
      .from('users')
      .update(patch)
      .eq('id', targetUserId)
      .select('id,email,name,phone,approved,rejected,active,hospital_id,custom_hospital_name,hospital_address,hospital_address_detail')
      .maybeSingle();
    if (error) throw error;

    return NextResponse.json({
      success: true,
      user: data
        ? {
            id: String((data as any).id),
            email: (data as any).email ?? null,
            name: (data as any).name ?? null,
            phone: (data as any).phone ?? null,
            approved: Boolean((data as any).approved),
            rejected: Boolean((data as any).rejected),
            active: Boolean((data as any).active),
            hospitalId: (data as any).hospital_id ?? null,
            customHospitalName: (data as any).custom_hospital_name ?? null,
            hospitalAddress: (data as any).hospital_address ?? null,
            hospitalAddressDetail: (data as any).hospital_address_detail ?? null,
          }
        : null,
    });
  } catch (e) {
    return NextResponse.json(
      { success: false, error: formatSupabaseError(e) },
      { status: 500 },
    );
  }
}

