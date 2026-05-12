import { NextRequest, NextResponse } from 'next/server';
import { requireAdminApi } from '@/lib/assert-admin-api';
import { createServiceRoleClient } from '@/lib/supabase/service-role';
import { formatSupabaseError } from '@/lib/format-supabase-error';

const HOSPITAL_ASSETS_BUCKET = process.env.SUPABASE_HOSPITAL_ASSETS_BUCKET?.trim() || 'hospital-assets';

export async function POST(
  request: NextRequest,
  context: { params: Promise<{ id: string }> },
) {
  const gate = await requireAdminApi();
  if (!gate.ok) return gate.response;

  const { id } = await context.params;
  const hospitalId = String(id || '').trim();
  if (!hospitalId) {
    return NextResponse.json({ error: 'id required' }, { status: 400 });
  }

  try {
    const form = await request.formData();
    const assetType = String(form.get('asset_type') ?? form.get('assetType') ?? '')
      .trim()
      .toLowerCase();
    const file = form.get('file');
    if (!file || typeof file !== 'object' || !('arrayBuffer' in file)) {
      return NextResponse.json({ error: 'file required' }, { status: 400 });
    }
    if (assetType !== 'logo' && assetType !== 'seal') {
      return NextResponse.json({ error: 'asset_type must be logo or seal' }, { status: 400 });
    }

    const f = file as File;
    const ext = f.name.includes('.') ? f.name.split('.').pop()!.toLowerCase() : '';
    const allowed = new Set(['png', 'jpg', 'jpeg', 'webp', 'svg']);
    if (!allowed.has(ext)) {
      return NextResponse.json({ error: 'unsupported file type' }, { status: 400 });
    }

    const bytes = Buffer.from(await f.arrayBuffer());
    const objectPath = `${hospitalId}/${assetType}.${ext || 'png'}`;
    const supabase = createServiceRoleClient();

    const up = await supabase.storage.from(HOSPITAL_ASSETS_BUCKET).upload(objectPath, bytes, {
      contentType: f.type || 'application/octet-stream',
      upsert: true,
    });
    if (up.error) {
      return NextResponse.json({ error: up.error.message }, { status: 500 });
    }

    const pub = supabase.storage.from(HOSPITAL_ASSETS_BUCKET).getPublicUrl(objectPath);
    const url = pub.data.publicUrl;
    if (!url) {
      return NextResponse.json({ error: 'could not resolve uploaded URL' }, { status: 500 });
    }

    const updateCandidates =
      assetType === 'logo'
        ? [{ logoUrl: url }, { logo_url: url }]
        : [{ seal_url: url }, { sealUrl: url }];

    let updated = false;
    let lastErr: unknown = null;
    for (const patch of updateCandidates) {
      const res = await supabase
        .schema('core')
        .from('hospitals')
        .update(patch)
        .eq('id', hospitalId);
      if (!res.error) {
        updated = true;
        break;
      }
      lastErr = res.error;
    }
    if (!updated && lastErr) throw lastErr;

    return NextResponse.json({ ok: true, assetType, url, path: objectPath, bucket: HOSPITAL_ASSETS_BUCKET });
  } catch (e) {
    return NextResponse.json({ error: formatSupabaseError(e) }, { status: 500 });
  }
}

