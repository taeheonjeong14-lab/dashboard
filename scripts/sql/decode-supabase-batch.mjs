/**
 * 여러 staging 테이블 붙여넣기 JSON을 한 번에 디코딩한다.
 *
 * 사용:
 *   node scripts/sql/decode-supabase-batch.mjs [decode-supabase-batch.config.json]
 *
 * 옵션:
 *   --skip-missing      입력 파일이 없으면 해당 job만 건너뜀
 *   --continue-on-error 한 job 실패해도 나머지 계속 (종료 코드는 여전히 1)
 */

import fs from 'fs';
import path from 'path';
import { decodeSupabaseExport } from './decode-supabase-format-json-to-sql-lib.mjs';

function parseArgs(argv) {
  let skipMissing = false;
  let continueOnError = false;
  const positional = [];
  for (const a of argv.slice(2)) {
    if (a === '--skip-missing') skipMissing = true;
    else if (a === '--continue-on-error') continueOnError = true;
    else positional.push(a);
  }
  return {
    configPath:
      positional[0] ?? path.join('scripts', 'sql', 'decode-supabase-batch.config.json'),
    skipMissing,
    continueOnError,
  };
}

function ensureDirForFile(filePath) {
  const dir = path.dirname(filePath);
  if (dir && dir !== '.') fs.mkdirSync(dir, { recursive: true });
}

function loadConfig(configPath) {
  const abs = path.resolve(configPath);
  const raw = fs.readFileSync(abs, 'utf8');
  const data = JSON.parse(raw);
  if (!data || !Array.isArray(data.jobs)) {
    throw new Error(`${configPath}: top-level "jobs" array required`);
  }
  return data.jobs;
}

const { configPath, skipMissing, continueOnError } = parseArgs(process.argv);

let jobs;
try {
  jobs = loadConfig(configPath);
} catch (e) {
  console.error(e.message);
  process.exit(1);
}

let failures = 0;
for (let i = 0; i < jobs.length; i++) {
  const job = jobs[i];
  const label = `job ${i + 1}/${jobs.length}`;
  const input = job.input ?? job.in;
  const output = job.output ?? job.out;
  const table = job.table ?? job.stagingTable;
  if (!input || !output || !table) {
    console.error(`${label}: each job needs "input", "output", "table"`);
    failures++;
    if (!continueOnError) process.exit(1);
    continue;
  }

  const inAbs = path.resolve(input);
  if (!fs.existsSync(inAbs)) {
    const msg = `${label}: missing input ${input}`;
    if (skipMissing) {
      console.error(`SKIP ${msg}`);
      continue;
    }
    console.error(msg);
    failures++;
    if (!continueOnError) process.exit(1);
    continue;
  }

  const raw = fs.readFileSync(inAbs, 'utf8');
  let parts;
  try {
    parts = decodeSupabaseExport(raw, table);
  } catch (e) {
    console.error(`${label} (${table}): ${e.message}`);
    failures++;
    if (!continueOnError) process.exit(1);
    continue;
  }

  const outAbs = path.resolve(output);
  ensureDirForFile(outAbs);
  fs.writeFileSync(outAbs, parts.join('\n\n') + '\n', 'utf8');
  console.error(`OK ${label} staging.${table} → ${output} (${parts.length} statement(s))`);
}

if (failures > 0) {
  console.error(`Finished with ${failures} failure(s).`);
  process.exit(1);
}
