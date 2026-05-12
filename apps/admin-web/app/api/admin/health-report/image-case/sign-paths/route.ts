import { NextRequest, NextResponse } from 'next/server';
import { requireAdminApi } from '@/lib/assert-admin-api';
import { createServiceRoleClient } from '@/lib/supabase/service-role';
import { signCaseImagePathsOriginalKeys } from '@/lib/health-report-admin/case-image-signing';

export const dynamic = 'force-dynamic';

const TTL_SEC = 60 * 60 * 24 * 7;
const MAX_PATHS = 48;
const MAX_PATH_LEN = 512;

function isSafeStoragePath(p: string): boolean {
  if (!p || p.length > MAX_PATH_LEN) return false;
  if (p.includes('..') || p.includes('\0')) return false;
  if (/^https?:\/\//i.test(p) || p.startsWith('blob:') || p.startsWith('data:')) return false;
  return true;
}

/**
 * 페이로드 슬롯 `src` 등 storage 객체 키에 대해 signed URL 발급.
 * 응답 `signed`의 키는 **요청에 넣은 원본 path 문자열**과 동일합니다.
 */
export async function POST(request: NextRequest) {
  const gate = await requireAdminApi();
  if (!gate.ok) return gate.response;

  let body: unknown;
  try {
    body = await request.json();
  } catch {
    return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
  }

  const pathsRaw = (body as Record<string, unknown>).paths;
  if (!Array.isArray(pathsRaw)) {
    return NextResponse.json({ error: 'paths must be an array of strings' }, { status: 400 });
  }

  const paths = [...new Set(pathsRaw.map((x) => String(x ?? '').trim()).filter((p) => isSafeStoragePath(p)))].slice(
    0,
    MAX_PATHS,
  );

  try {
    const supabase = createServiceRoleClient();
    const { signed, errors } = await signCaseImagePathsOriginalKeys(supabase, paths, TTL_SEC);
    return NextResponse.json({ signed, ...(Object.keys(errors).length ? { errors } : {}) });
  } catch (e) {
    console.error('POST /api/admin/health-report/image-case/sign-paths:', e);
    return NextResponse.json(
      { error: e instanceof Error ? e.message : 'Unknown error' },
      { status: 500 },
    );
  }
}
