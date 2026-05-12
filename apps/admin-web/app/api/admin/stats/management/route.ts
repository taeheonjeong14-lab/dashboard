import { NextRequest, NextResponse } from 'next/server';
import { fetchHospitalManagementKpis } from '@/lib/admin-stats/queries-server';
import { requireAdminAndHospital, statsRouteError } from '@/app/api/admin/stats/_utils';

export const dynamic = 'force-dynamic';

export async function GET(request: NextRequest) {
  const gate = await requireAdminAndHospital(request);
  if (!gate.ok) return gate.response;
  try {
    const rows = await fetchHospitalManagementKpis(gate.hospitalId);
    return NextResponse.json({ hospitalId: gate.hospitalId, rows });
  } catch (e) {
    console.error('GET /api/admin/stats/management:', e);
    return NextResponse.json({ error: statsRouteError(e) }, { status: 500 });
  }
}
