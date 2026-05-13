import { NextRequest, NextResponse } from 'next/server';
import sharp from 'sharp';
import { chartAppAuthMiddleware } from '@/lib/chart-app/auth';
import { getChartAppSupabaseService } from '@/lib/chart-app/supabase-service';
import { getChartPgPool } from '@/lib/db';

const HOSPITAL_ASSETS = 'hospital-assets';
const SIGNED_SEC = 60 * 60 * 24 * 365;

// POST /api/admin/hospitals/[id]/assets — multipart file + asset_type logo|seal
export async function POST(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  const authErr = chartAppAuthMiddleware(request);
  if (authErr) return authErr;

  const { id } = await params;
  const hid = id?.trim();
  if (!hid) return NextResponse.json({ error: 'id required' }, { status: 400 });

  try {
    const form = await request.formData();
    const assetType = String(form.get('asset_type') ?? form.get('assetType') ?? '').trim().toLowerCase();
    const file = form.get('file');
    if (!file || typeof file !== 'object' || !('arrayBuffer' in file)) {
      return NextResponse.json({ error: 'file required' }, { status: 400 });
    }
    if (assetType !== 'logo' && assetType !== 'seal') {
      return NextResponse.json({ error: 'asset_type must be logo or seal' }, { status: 400 });
    }

    const f = file as File;
    const buf = Buffer.from(await f.arrayBuffer());
    const webp = await sharp(buf).rotate().webp({ quality: 85 }).resize({ width: 1024, height: 1024, fit: 'inside' }).toBuffer();

    const storagePath = `${hid}/${assetType}.webp`;
    const supabase = getChartAppSupabaseService();
    const up = await supabase.storage.from(HOSPITAL_ASSETS).upload(storagePath, webp, {
      contentType: 'image/webp',
      upsert: true,
    });
    if (up.error) {
      return NextResponse.json({ error: up.error.message }, { status: 500 });
    }

    const signed = await supabase.storage.from(HOSPITAL_ASSETS).createSignedUrl(storagePath, SIGNED_SEC);
    const url = signed.data?.signedUrl;
    if (!url) {
      return NextResponse.json({ error: 'could not sign asset URL' }, { status: 500 });
    }

    const pool = getChartPgPool();
    if (assetType === 'logo') {
      await pool.query(`UPDATE core.hospitals SET "logoUrl" = $2 WHERE id::text = $1`, [hid, url]);
    } else {
      await pool.query(`UPDATE core.hospitals SET seal_url = $2 WHERE id::text = $1`, [hid, url]);
    }

    return NextResponse.json({ ok: true, asset_type: assetType, url });
  } catch (e) {
    console.error('POST hospitals assets:', e);
    return NextResponse.json(
      { error: e instanceof Error ? e.message : 'Unknown error' },
      { status: 500 },
    );
  }
}
