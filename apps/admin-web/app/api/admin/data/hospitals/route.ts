import { NextResponse } from 'next/server';
import { requireAdminApi } from '@/lib/assert-admin-api';
import { formatSupabaseError } from '@/lib/format-supabase-error';
import { createServiceRoleClient } from '@/lib/supabase/service-role';
import { HOSPITAL_LIST_COLUMNS } from '@/lib/legacy/hospital-db';

export async function GET() {
  const gate = await requireAdminApi();
  if (!gate.ok) return gate.response;

  let supabase;
  try {
    supabase = createServiceRoleClient();
  } catch {
    return NextResponse.json(
      { error: 'SUPABASE_SERVICE_ROLE_KEY 가 서버에 설정되지 않았습니다.' },
      { status: 503 },
    );
  }

  const attempts = [
    // addressDetail camelCase schema
    { cols: 'id,name,address,addressDetail', orderByName: true },
    { cols: 'id,name,address,addressDetail', orderByName: false },
    // address_detail snake_case schema
    { cols: 'id,name,address,address_detail', orderByName: true },
    { cols: 'id,name,address,address_detail', orderByName: false },
    // address only
    { cols: 'id,name,address', orderByName: true },
    { cols: 'id,name,address', orderByName: false },
    // legacy fallback
    { cols: HOSPITAL_LIST_COLUMNS, orderByName: true },
    { cols: 'id,name', orderByName: true },
    { cols: 'id,name', orderByName: false },
  ];

  let lastError: unknown = null;
  for (const att of attempts) {
    let query = supabase.schema('core').from('hospitals').select(att.cols);
    if (att.orderByName) query = query.order('name', { ascending: true });
    const res = await query;
    if (!res.error) {
      return NextResponse.json({ hospitals: res.data || [] });
    }
    lastError = res.error;
  }

  return NextResponse.json(
    { error: formatSupabaseError(lastError), hospitals: [] },
    { status: 500 },
  );
}
