import { NextRequest, NextResponse } from 'next/server';
import { requireAdminApi } from '@/lib/assert-admin-api';
import { createServiceRoleClient } from '@/lib/supabase/service-role';
import { getPdfUploadsBucket } from '@/lib/chart-extraction/storage-config';
import { absolutizeSupabaseStorageUrl } from '@/lib/chart-extraction/supabase-url';
import { buildPdfExtractStoragePath } from '@/lib/chart-extraction/upload-path';

const MAX_BYTES = 30 * 1024 * 1024;

type UploadUrlBody = {
  fileName?: string;
  fileType?: string;
  fileSize?: number;
};

export async function POST(request: NextRequest) {
  const gate = await requireAdminApi();
  if (!gate.ok) return gate.response;

  let body: UploadUrlBody;
  try {
    body = (await request.json()) as UploadUrlBody;
  } catch {
    return NextResponse.json({ error: 'Invalid JSON body' }, { status: 400 });
  }

  const fileName = typeof body.fileName === 'string' ? body.fileName.trim() : '';
  const fileType = typeof body.fileType === 'string' ? body.fileType.trim().toLowerCase() : '';
  const fileSize = typeof body.fileSize === 'number' ? body.fileSize : Number.NaN;

  if (!fileName) return NextResponse.json({ error: 'fileName is required' }, { status: 400 });
  if (fileType !== 'application/pdf') {
    return NextResponse.json({ error: 'fileType must be application/pdf' }, { status: 400 });
  }
  if (!Number.isFinite(fileSize) || fileSize <= 0 || fileSize > MAX_BYTES) {
    return NextResponse.json({ error: `fileSize must be between 1 and ${MAX_BYTES} bytes` }, { status: 400 });
  }

  const storagePath = buildPdfExtractStoragePath(fileName);
  try {
    const bucket = getPdfUploadsBucket();
    const supabase = createServiceRoleClient();
    const { data, error } = await supabase.storage.from(bucket).createSignedUploadUrl(storagePath);
    if (error || !data) {
      return NextResponse.json(
        { error: 'Storage signing failed', bucket, supabaseError: error?.message ?? 'unknown' },
        { status: 500 },
      );
    }
    return NextResponse.json({
      bucket,
      storagePath,
      signedUrl: absolutizeSupabaseStorageUrl(data.signedUrl),
      token: data.token,
    });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : 'Unexpected server error' },
      { status: 500 },
    );
  }
}

