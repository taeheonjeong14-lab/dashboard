import { NextResponse } from 'next/server';
import { requireAdminApi } from '@/lib/assert-admin-api';
import { formatSupabaseError } from '@/lib/format-supabase-error';
import { createServiceRoleClient } from '@/lib/supabase/service-role';
import { fetchHospitalAdsColumns } from '@/lib/legacy/hospital-db';

function buildKeywordText(rows: { keyword: string }[] | null | undefined) {
  return (rows || []).map((r) => `${r.keyword}`).join('\n');
}

export async function GET(_request: Request, context: { params: Promise<{ id: string }> }) {
  const gate = await requireAdminApi();
  if (!gate.ok) return gate.response;

  const { id } = await context.params;
  const hospitalId = String(id || '').trim();
  if (!hospitalId) {
    return NextResponse.json({ error: 'id required' }, { status: 400 });
  }

  try {
    const supabase = createServiceRoleClient();

    const { data: row, error: rowErr } = await supabase
      .schema('core')
      .from('hospitals')
      .select('id,name,naver_blog_id,smartplace_stat_url,debug_port')
      .eq('id', hospitalId)
      .maybeSingle();

    if (rowErr) throw rowErr;
    if (!row) {
      return NextResponse.json({ error: 'Not found' }, { status: 404 });
    }

    const [bt, pt] = await Promise.all([
      supabase
        .schema('analytics')
        .from('analytics_blog_keyword_targets')
        .select('keyword')
        .eq('hospital_id', hospitalId)
        .eq('is_active', true),
      supabase
        .schema('analytics')
        .from('analytics_place_keyword_targets')
        .select('keyword')
        .eq('hospital_id', hospitalId)
        .eq('is_active', true),
    ]);

    if (bt.error) throw bt.error;
    if (pt.error) throw pt.error;

    const ads = await fetchHospitalAdsColumns(supabase, hospitalId);

    const base = {
      id: String(row.id || ''),
      name: row.name || '',
      naver_blog_id: row.naver_blog_id || '',
      smartplace_stat_url: row.smartplace_stat_url || '',
      debug_port: row.debug_port == null ? '' : String(row.debug_port),
      blog_keywords_text: buildKeywordText(bt.data || []),
      place_keywords_text: buildKeywordText(pt.data || []),
      searchad_customer_id:
        ads.searchad_customer_id != null ? String(ads.searchad_customer_id || '') : '',
      searchad_api_license:
        ads.searchad_api_license != null ? String(ads.searchad_api_license || '') : '',
      searchad_secret_key_encrypted:
        ads.searchad_secret_key_encrypted != null
          ? String(ads.searchad_secret_key_encrypted || '')
          : '',
      googleads_customer_id:
        ads.googleads_customer_id != null ? String(ads.googleads_customer_id || '') : '',
      googleads_refresh_token_encrypted:
        ads.googleads_refresh_token_encrypted != null
          ? String(ads.googleads_refresh_token_encrypted || '')
          : '',
    };

    return NextResponse.json({ form: base });
  } catch (e) {
    return NextResponse.json({ error: formatSupabaseError(e) }, { status: 500 });
  }
}
