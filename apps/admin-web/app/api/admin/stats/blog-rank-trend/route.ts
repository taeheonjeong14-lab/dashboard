import { NextRequest, NextResponse } from 'next/server';
import { fetchBlogKeywordRankTrend } from '@/lib/admin-stats/queries-server';
import { requireAdminApi } from '@/lib/assert-admin-api';
import { isHospitalUuid } from '@/lib/admin-stats/hospital-id';
import { statsRouteError } from '@/app/api/admin/stats/_utils';

export const dynamic = 'force-dynamic';

export async function GET(request: NextRequest) {
  const gate = await requireAdminApi();
  if (!gate.ok) return gate.response;

  const url = new URL(request.url);
  const hospitalId = url.searchParams.get('hospitalId')?.trim() ?? '';
  const keyword = url.searchParams.get('keyword')?.trim() ?? '';
  if (!hospitalId || !isHospitalUuid(hospitalId)) {
    return NextResponse.json({ error: '유효한 hospitalId 가 필요합니다.' }, { status: 400 });
  }
  if (!keyword) {
    return NextResponse.json({ error: 'keyword 가 필요합니다.' }, { status: 400 });
  }

  try {
    const points = await fetchBlogKeywordRankTrend(hospitalId, keyword);
    return NextResponse.json({ hospitalId, keyword, points });
  } catch (e) {
    console.error('GET /api/admin/stats/blog-rank-trend:', e);
    return NextResponse.json({ error: statsRouteError(e) }, { status: 500 });
  }
}
