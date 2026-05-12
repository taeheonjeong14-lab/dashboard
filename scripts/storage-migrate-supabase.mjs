#!/usr/bin/env node
/**
 * Supabase Storage bulk copy: source project/bucket → destination project/bucket.
 *
 * Usage:
 *   node scripts/storage-migrate-supabase.mjs [--dry-run] [--list-only] [--clear-checkpoint]
 *
 * Single bucket: SOURCE_BUCKET + DEST_BUCKET (defaults pdf-uploads).
 * Multiple buckets (one run): MIGRATE_BUCKETS=a,b,c (same name both sides), or
 *   MIGRATE_BUCKET_PAIRS=srcA:dstA,srcB:dstB
 *
 * Env: scripts/storage-migrate.env.example
 */

import { createClient } from '@supabase/supabase-js';
import * as fs from 'node:fs';
import * as path from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

async function loadDotenv() {
  const candidates = [
    process.env.DOTENV_PATH,
    path.join(process.cwd(), '.env.storage-migrate'),
    path.join(__dirname, '..', '.env.storage-migrate'),
  ].filter(Boolean);
  const dotenvPath = candidates.find((p) => fs.existsSync(p));
  if (!dotenvPath) return;
  try {
    const { config } = await import('dotenv');
    config({ path: dotenvPath });
  } catch {
    /* dotenv optional */
  }
}

function env(name, fallback = '') {
  const v = process.env[name];
  return v === undefined || v === '' ? fallback : v;
}

function parseArgs(argv) {
  return {
    dryRun: argv.includes('--dry-run'),
    listOnly: argv.includes('--list-only'),
    clearCheckpoint: argv.includes('--clear-checkpoint'),
  };
}

/** @returns {{ sourceBucket: string, destBucket: string }[]} */
function parseBucketJobs() {
  const pairsRaw = env('MIGRATE_BUCKET_PAIRS', '').trim();
  const bucketsRaw = env('MIGRATE_BUCKETS', '').trim();

  if (pairsRaw) {
    return pairsRaw
      .split(',')
      .map((s) => s.trim())
      .filter(Boolean)
      .map((line) => {
        const parts = line.split(':').map((x) => x.trim());
        if (parts.length !== 2 || !parts[0] || !parts[1]) {
          throw new Error(`Invalid MIGRATE_BUCKET_PAIRS entry (want src:dst): "${line}"`);
        }
        return { sourceBucket: parts[0], destBucket: parts[1] };
      });
  }

  if (bucketsRaw) {
    return bucketsRaw
      .split(',')
      .map((s) => s.trim())
      .filter(Boolean)
      .map((name) => ({ sourceBucket: name, destBucket: name }));
  }

  return [{ sourceBucket: env('SOURCE_BUCKET'), destBucket: env('DEST_BUCKET', 'pdf-uploads') }];
}

function checkpointPathForBucket(checkpointDir, sourceBucket, destBucket, explicitCheckpointFile) {
  if (explicitCheckpointFile) return path.resolve(explicitCheckpointFile);
  const tag =
    sourceBucket === destBucket ? sourceBucket : `${sourceBucket}__to__${destBucket}`;
  const safe = tag.replace(/[^a-zA-Z0-9._-]+/g, '_');
  return path.join(checkpointDir, `checkpoint-${safe}.json`);
}

/**
 * List all file objects under prefix (recursive, paginated per folder).
 */
async function listAllFilePaths(supabase, bucket, folderPrefix = '') {
  const files = [];
  let offset = 0;
  const limit = 100;
  for (;;) {
    const { data, error } = await supabase.storage.from(bucket).list(folderPrefix, {
      limit,
      offset,
      sortBy: { column: 'name', order: 'asc' },
    });
    if (error) throw error;
    if (!data?.length) break;

    for (const item of data) {
      const objectPath = folderPrefix ? `${folderPrefix}/${item.name}` : item.name;
      const isFile =
        item.metadata &&
        typeof item.metadata === 'object' &&
        typeof item.metadata.size === 'number';

      if (isFile) {
        files.push(objectPath);
      } else {
        const nested = await listAllFilePaths(supabase, bucket, objectPath);
        files.push(...nested);
      }
    }

    if (data.length < limit) break;
    offset += limit;
  }
  return files;
}

function mapDestKey(srcKey, stripPrefix, addPrefix) {
  let k = srcKey;
  if (stripPrefix && k.startsWith(stripPrefix)) {
    k = k.slice(stripPrefix.length);
  }
  if (addPrefix) {
    const join = k.startsWith('/') ? k.slice(1) : k;
    const prefix = addPrefix.endsWith('/') ? addPrefix.slice(0, -1) : addPrefix;
    k = join ? `${prefix}/${join}` : prefix;
  }
  return k.replace(/^\/+/, '');
}

function readCheckpoint(checkpointFile) {
  try {
    const raw = fs.readFileSync(checkpointFile, 'utf8');
    const data = JSON.parse(raw);
    return new Set(Array.isArray(data.done) ? data.done : []);
  } catch {
    return new Set();
  }
}

function writeCheckpoint(checkpointFile, doneSet) {
  const dir = path.dirname(checkpointFile);
  if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true });
  fs.writeFileSync(
    checkpointFile,
    JSON.stringify({ done: [...doneSet], updatedAt: new Date().toISOString() }, null, 2),
    'utf8',
  );
}

async function copyOne(sourceClient, destClient, srcBucket, destBucket, srcKey, destKey, dryRun) {
  if (dryRun) {
    return { ok: true, dryRun: true };
  }
  const { data: blob, error: dlErr } = await sourceClient.storage.from(srcBucket).download(srcKey);
  if (dlErr) throw new Error(`download ${srcKey}: ${dlErr.message}`);

  const arrayBuffer = await blob.arrayBuffer();
  const contentType = blob.type || 'application/octet-stream';

  const { error: upErr } = await destClient.storage.from(destBucket).upload(destKey, arrayBuffer, {
    contentType,
    upsert: true,
  });
  if (upErr) throw new Error(`upload ${destKey}: ${upErr.message}`);
  return { ok: true };
}

/**
 * @returns {{ ok: number, fail: number }}
 */
async function migrateBucketPair(params) {
  const {
    sourceClient,
    destClient,
    sourceBucket,
    destBucket,
    stripPrefix,
    addPrefix,
    filterPrefix,
    concurrency,
    checkpointFile,
    args,
  } = params;

  console.log('\n━━━', { sourceBucket, destBucket }, '━━━');
  console.log('Listing objects…', { filterPrefix: filterPrefix || '(none)' });

  let allPaths = await listAllFilePaths(sourceClient, sourceBucket, '');
  const listedBeforeFilter = allPaths.length;
  if (filterPrefix) {
    const fp = filterPrefix.endsWith('/') ? filterPrefix : `${filterPrefix}/`;
    allPaths = allPaths.filter((p) => p === filterPrefix || p.startsWith(fp));
  }

  console.log('Total file paths:', allPaths.length);
  if (filterPrefix && listedBeforeFilter > 0 && allPaths.length === 0) {
    console.log(
      '→ MIGRATE_FILTER_PREFIX 때문에 파일이 0개가 되었습니다. prefix가 소스 경로와 맞는지 확인하세요.',
    );
  }

  if (args.listOnly) {
    for (const p of allPaths.slice(0, 80)) console.log(' ', p);
    if (allPaths.length > 80) console.log(` … and ${allPaths.length - 80} more`);
    return { ok: 0, fail: 0 };
  }

  const done = readCheckpoint(checkpointFile);
  const pending = allPaths.filter((k) => !done.has(k));
  console.log('Already done (checkpoint):', done.size, '| Pending:', pending.length);

  if (pending.length === 0) {
    if (allPaths.length === 0) {
      if (listedBeforeFilter > 0 && filterPrefix) {
        console.log('→ Skip: 위 메시지대로 MIGRATE_FILTER_PREFIX 로 목록이 비었습니다.');
      } else {
        console.log(
          '→ Skip: 소스 버킷에서 파일이 0개입니다. SOURCE_SUPABASE_URL·SOURCE_BUCKET 이름이 맞는지, 옛 프로젝트 Storage에 객체가 있는지 대시보드에서 확인하세요.',
        );
      }
    } else if (done.size > 0) {
      console.log(
        '→ Skip: 체크포인트에 이미 모두 완료로 기록됨(재복사 안 함). 처음부터 다시 옮기려면 --clear-checkpoint 로 체크포인트를 지운 뒤 실행하세요.',
      );
    } else {
      console.log('Nothing to migrate for this bucket.');
    }
    return { ok: 0, fail: 0 };
  }

  if (args.dryRun) {
    console.log('[dry-run] First 15 mappings:');
    for (const src of pending.slice(0, 15)) {
      console.log(' ', src, '→', mapDestKey(src, stripPrefix, addPrefix));
    }
    return { ok: 0, fail: 0 };
  }

  let ok = 0;
  let fail = 0;
  for (let i = 0; i < pending.length; i += concurrency) {
    const chunk = pending.slice(i, i + concurrency);
    await Promise.all(
      chunk.map(async (srcKey) => {
        const destKey = mapDestKey(srcKey, stripPrefix, addPrefix);
        try {
          await copyOne(sourceClient, destClient, sourceBucket, destBucket, srcKey, destKey, false);
          done.add(srcKey);
          ok++;
          process.stdout.write(`\rCopied ${ok + fail}/${pending.length}`);
        } catch (e) {
          fail++;
          console.error(`\nFAIL ${srcKey} → ${destKey}:`, e.message || e);
        }
      }),
    );
    writeCheckpoint(checkpointFile, done);
  }

  console.log(`\nBucket done. OK: ${ok}, FAIL: ${fail}, checkpoint: ${checkpointFile}`);
  return { ok, fail };
}

async function main() {
  await loadDotenv();

  const args = parseArgs(process.argv.slice(2));

  const sourceUrl = env('SOURCE_SUPABASE_URL');
  const sourceKey = env('SOURCE_SUPABASE_SERVICE_ROLE_KEY');
  const destUrl = env('DEST_SUPABASE_URL');
  const destKey = env('DEST_SUPABASE_SERVICE_ROLE_KEY');

  const stripPrefix = env('MIGRATE_STRIP_PREFIX', '');
  const addPrefix = env('MIGRATE_ADD_PREFIX', '');
  const filterPrefix = env('MIGRATE_FILTER_PREFIX', '');
  const concurrency = Math.max(1, parseInt(env('CONCURRENCY', '4'), 10) || 4);

  const checkpointDir = path.resolve(env('CHECKPOINT_DIR', path.join(__dirname, 'storage-migrate')));
  const explicitCheckpoint = env('CHECKPOINT_FILE', '').trim();

  let jobs;
  try {
    jobs = parseBucketJobs();
  } catch (e) {
    console.error(e.message || e);
    process.exit(1);
  }

  const missingBucket = jobs.some((j) => !j.sourceBucket || !j.destBucket);
  if (!sourceUrl || !sourceKey || !destUrl || !destKey || missingBucket || jobs.length === 0) {
    console.error(
      'Missing env: SOURCE_SUPABASE_URL, SOURCE_SUPABASE_SERVICE_ROLE_KEY, DEST_SUPABASE_URL, DEST_SUPABASE_SERVICE_ROLE_KEY',
    );
    console.error(
      'And either SOURCE_BUCKET + DEST_BUCKET, or MIGRATE_BUCKETS (comma list), or MIGRATE_BUCKET_PAIRS (src:dst,...)',
    );
    process.exit(1);
  }

  if (args.clearCheckpoint) {
    if (explicitCheckpoint && jobs.length === 1) {
      const cp = path.resolve(explicitCheckpoint);
      if (fs.existsSync(cp)) {
        fs.unlinkSync(cp);
        console.log('Cleared checkpoint:', cp);
      }
    } else {
      for (const job of jobs) {
        const cp = checkpointPathForBucket(checkpointDir, job.sourceBucket, job.destBucket, null);
        if (fs.existsSync(cp)) {
          fs.unlinkSync(cp);
          console.log('Cleared checkpoint:', cp);
        }
      }
    }
  }

  const sourceClient = createClient(sourceUrl, sourceKey, {
    auth: { persistSession: false, autoRefreshToken: false },
  });
  const destClient = createClient(destUrl, destKey, {
    auth: { persistSession: false, autoRefreshToken: false },
  });

  console.log(`Migrating ${jobs.length} bucket pair(s) in order…`);

  let totalFail = 0;
  let totalOk = 0;

  for (let idx = 0; idx < jobs.length; idx++) {
    const job = jobs[idx];
    const checkpointFile =
      jobs.length === 1 && explicitCheckpoint
        ? path.resolve(explicitCheckpoint)
        : checkpointPathForBucket(checkpointDir, job.sourceBucket, job.destBucket, null);

    if (jobs.length > 1 && explicitCheckpoint) {
      console.warn(
        'CHECKPOINT_FILE ignored for multi-bucket run; using CHECKPOINT_DIR + per-bucket files:',
        checkpointDir,
      );
    }

    const r = await migrateBucketPair({
      sourceClient,
      destClient,
      sourceBucket: job.sourceBucket,
      destBucket: job.destBucket,
      stripPrefix,
      addPrefix,
      filterPrefix,
      concurrency,
      checkpointFile,
      args,
    });
    totalOk += r.ok;
    totalFail += r.fail;
  }

  if (jobs.length > 1) {
    console.log(`\n═══ All buckets finished. Total OK: ${totalOk}, FAIL: ${totalFail} ═══`);
    if (totalOk === 0 && totalFail === 0 && !args.listOnly && !args.dryRun) {
      console.log(
        '\n※ 복사된 파일이 0개입니다. 각 버킷의 "Total file paths"를 보세요.\n' +
          '  • paths가 0 → 소스 프로젝트/버킷 이름이 비었거나 잘못됐을 가능성이 큽니다.\n' +
          '  • paths는 있는데 Pending만 0 → 체크포인트만 남은 상태일 수 있습니다 (--clear-checkpoint).',
      );
    }
  }

  if (totalFail > 0) process.exit(1);
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
