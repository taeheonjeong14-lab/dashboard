import { NextRequest, NextResponse } from 'next/server';
import { fetchSummaryPlaceRanks } from '@/lib/admin-stats/queries-server';
import { requireAdminAndHospital, statsRouteError } from '@/app/api/admin/stats/_utils';

export const dynamic = 'force-dynamic';

export async function GET(request: NextRequest) {
  const gate = await requireAdminAndHospital(request);
  if (!gate.ok) return gate.response;
  try {
    const rows = await fetchSummaryPlaceRanks(gate.hospitalId);
    return NextResponse.json({ hospitalId: gate.hospitalId, rows });
  } catch (e) {
    console.error('GET /api/admin/stats/place-ranks:', e);
    return NextResponse.json({ error: statsRouteError(e) }, { status: 500 });
  }
}
