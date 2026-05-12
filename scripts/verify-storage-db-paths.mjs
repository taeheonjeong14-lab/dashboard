#!/usr/bin/env node
/**
 * chart_pdf DB에 적힌 Storage 경로가 실제 버킷 객체와 맞는지 샘플 검증합니다.
 *
 * Usage:
 *   npm run verify:storage-db-paths
 *
 * Env: DATABASE_URL, NEXT_PUBLIC_SUPABASE_URL (or SUPABASE_URL), SUPABASE_SERVICE_ROLE_KEY
 * 대안: DEST_SUPABASE_URL + DEST_SUPABASE_SERVICE_ROLE_KEY (.env.storage-migrate)
 *
 * dotenv (존재하는 파일만, 나중 것이 chart-api면 덮어씀):
 *   .env, .env.local, ddx-api/.env*, .env.storage-migrate, chart-api/.env, chart-api/.env.local
 * 또는 단일 파일: VERIFY_DOTENV_PATH=C:\\path\\.env
 */

import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import * as fs from 'node:fs';
import * as path from 'node:path';
import { fileURLToPath } from 'node:url';
import pg from 'pg';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const repoRoot = path.join(__dirname, '..');

/** @returns {string[]} 로드한 파일 경로 (디버그용) */
function loadEnvFiles() {
  const explicit = process.env.VERIFY_DOTENV_PATH?.trim();
  if (explicit) {
    const p = path.resolve(explicit);
    if (fs.existsSync(p)) {
      dotenv.config({ path: p, override: true });
      return [p];
    }
    console.warn('VERIFY_DOTENV_PATH 가 없습니다:', p);
  }

  const loaded = [];
  /** @type {[string, boolean][]} path, override */
  const chain = [
    [path.join(repoRoot, '.env'), false],
    [path.join(repoRoot, '.env.local'), false],
    [path.join(repoRoot, 'ddx-api', '.env'), false],
    [path.join(repoRoot, 'ddx-api', '.env.local'), false],
    [path.join(repoRoot, '.env.storage-migrate'), false],
    [path.join(repoRoot, 'chart-api', '.env'), true],
    [path.join(repoRoot, 'chart-api', '.env.local'), true],
  ];

  for (const [p, override] of chain) {
    if (!fs.existsSync(p)) continue;
    dotenv.config({ path: p, override });
    loaded.push(p);
  }
  return loaded;
}

const loadedEnvPaths = loadEnvFiles();

function env(name, fallback = '') {
  const v = process.env[name];
  return v === undefined || v === '' ? fallback : v;
}

/** List-based existence (다운로드 없이 부모 폴더 나열). */
async function objectExistsByList(supabase, bucket, objectPath) {
  const normalized = String(objectPath || '').trim().replace(/^\/+/, '');
  if (!normalized) return { ok: false, detail: 'empty path' };

  const slash = normalized.lastIndexOf('/');
  const folder = slash === -1 ? '' : normalized.slice(0, slash);
  const fileName = slash === -1 ? normalized : normalized.slice(slash + 1);

  let offset = 0;
  const limit = 500;
  for (;;) {
    const { data, error } = await supabase.storage.from(bucket).list(folder, {
      limit,
      offset,
      sortBy: { column: 'name', order: 'asc' },
    });
    if (error) return { ok: false, detail: error.message };

    const hit = data?.find(
      (x) =>
        x.name === fileName &&
        x.metadata &&
        typeof x.metadata === 'object' &&
        typeof x.metadata.size === 'number',
    );
    if (hit) return { ok: true, bytes: hit.metadata.size };

    if (!data?.length || data.length < limit) break;
    offset += limit;
  }

  return { ok: false, detail: `목록에 없음 (bucket=${bucket}, folder="${folder}", file="${fileName}")` };
}

async function main() {
  const databaseUrl = env('DATABASE_URL').trim();
  const supabaseUrl =
    env('NEXT_PUBLIC_SUPABASE_URL') || env('SUPABASE_URL') || env('DEST_SUPABASE_URL').trim();
  const serviceKey =
    env('SUPABASE_SERVICE_ROLE_KEY').trim() || env('DEST_SUPABASE_SERVICE_ROLE_KEY').trim();
  const sampleLimit = Math.max(1, parseInt(env('VERIFY_SAMPLE_LIMIT', '12'), 10) || 12);
  const pdfBucketDefault = env('VERIFY_PDF_BUCKET', 'pdf-uploads');
  const caseBucket = env('VERIFY_CASE_IMAGE_BUCKET', 'case-image');

  if (!databaseUrl || !supabaseUrl || !serviceKey) {
    console.error(
      '필요: DATABASE_URL + Supabase URL + service role 키.\n' +
        '  URL/키 이름: NEXT_PUBLIC_SUPABASE_URL 또는 DEST_SUPABASE_URL,\n' +
        '  SUPABASE_SERVICE_ROLE_KEY 또는 DEST_SUPABASE_SERVICE_ROLE_KEY',
    );
    console.error(
      '로드한 env 파일:',
      loadedEnvPaths.length ? loadedEnvPaths.map((p) => path.relative(repoRoot, p)).join(', ') : '(해당 경로에 파일 없음)',
    );
    console.error(
      'DATABASE_URL 은 Supabase Dashboard → Connect → Connection string (pooling URI) 또는 chart-api/.env.local 에 넣으면 됩니다.',
    );
    process.exit(1);
  }

  const supabase = createClient(supabaseUrl, serviceKey, {
    auth: { persistSession: false, autoRefreshToken: false },
  });

  const pool = new pg.Pool({ connectionString: databaseUrl, max: 3 });

  try {
    console.log('Sample limit per table:', sampleLimit);
    console.log('Defaults: PDF bucket →', pdfBucketDefault, '| Case images →', caseBucket);
    console.log('');

    let miss = 0;
    let hit = 0;

    // --- parse_runs.raw_payload (text-bucketing 등) ---
    const runs = await pool.query(
      `
      SELECT id::text AS id,
             friendly_id,
             COALESCE(NULLIF(trim(raw_payload->>'storageBucket'), ''), $2) AS bucket,
             trim(raw_payload->>'storagePath') AS path
      FROM chart_pdf.parse_runs
      WHERE raw_payload ? 'storagePath'
        AND trim(raw_payload->>'storagePath') <> ''
      ORDER BY created_at DESC
      LIMIT $1::int
      `,
      [sampleLimit, pdfBucketDefault],
    );

    console.log('━━━ chart_pdf.parse_runs (raw_payload.storagePath) ━━━');
    if (runs.rows.length === 0) {
      console.log('(행 없음 — 스키마 없거나 아직 버킷팅 안 함)');
    }
    for (const row of runs.rows) {
      const r = await objectExistsByList(supabase, row.bucket, row.path);
      if (r.ok) {
        hit++;
        console.log(
          `OK  ${row.id} ${row.bucket}/${row.path}${r.bytes != null ? ` (${r.bytes} B)` : ''} friendly=${row.friendly_id}`,
        );
      } else {
        miss++;
        console.log(`MISS ${row.id} friendly=${row.friendly_id} ${row.bucket}/${row.path}`);
        console.log(`     → ${r.detail}`);
      }
    }

    console.log('');

    // --- report_case_images ---
    const imgs = await pool.query(
      `
      SELECT id::text AS id, parse_run_id::text AS parse_run_id, storage_path
      FROM chart_pdf.report_case_images
      ORDER BY created_at DESC
      LIMIT $1::int
      `,
      [sampleLimit],
    );

    console.log('━━━ chart_pdf.report_case_images.storage_path ━━━');
    console.log('Bucket:', caseBucket);
    if (imgs.rows.length === 0) {
      console.log('(행 없음)');
    }
    for (const row of imgs.rows) {
      const r = await objectExistsByList(supabase, caseBucket, row.storage_path);
      if (r.ok) {
        hit++;
        console.log(`OK  ${row.id} run=${row.parse_run_id} ${caseBucket}/${row.storage_path}`);
      } else {
        miss++;
        console.log(`MISS ${row.id} run=${row.parse_run_id} ${caseBucket}/${row.storage_path}`);
        console.log(`     → ${r.detail}`);
      }
    }

    console.log('');
    console.log(`요약: 존재 ${hit}, 없음 ${miss} (샘플 범위 안에서만)`);
    if (miss > 0) process.exitCode = 1;
  } finally {
    await pool.end();
  }
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
