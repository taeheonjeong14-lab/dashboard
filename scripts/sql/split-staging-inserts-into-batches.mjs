/**
 * 디코더가 만든 INSERT 묶음을 SQL Editor 크기 제한에 맞게 여러 파일로 나눈다.
 * 문장 구분: 디코더가 삽입하는 빈 줄(\n\n) + 다음 insert into staging.<table>
 *
 * 사용:
 *   node scripts/sql/split-staging-inserts-into-batches.mjs <in.sql> [table_name] [--max-chars=200000]
 *
 * 예:
 *   node scripts/sql/split-staging-inserts-into-batches.mjs scripts/sql/tmp/parse-runs-inserts.sql parse_runs --max-chars=150000
 *
 * 출력: <inBasename>-batch-001.sql, -batch-002.sql, ... (입력 파일과 같은 디렉터리)
 *
 * 한 건의 INSERT 만으로도 max-chars 를 넘으면 해당 파일 하나만 쓰고,
 * Supabase SQL Editor 대신 psql 등 직접 연결 실행을 안내한다.
 */

import fs from 'fs';
import path from 'path';

const args = process.argv.slice(2);
let maxChars = 200_000;
const positional = [];
for (const a of args) {
  if (a.startsWith('--max-chars=')) {
    maxChars = Number.parseInt(a.slice('--max-chars='.length), 10);
    if (!Number.isFinite(maxChars) || maxChars < 5000) {
      console.error('Invalid --max-chars');
      process.exit(1);
    }
  } else positional.push(a);
}

const [inPath, tableName = 'parse_runs'] = positional;
if (!inPath) {
  console.error(
    'Usage: node split-staging-inserts-into-batches.mjs <in.sql> [table_name] [--max-chars=200000]'
  );
  process.exit(1);
}

const raw = fs.readFileSync(inPath, 'utf8').trim();
const tableEsc = tableName.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
const splitRe = new RegExp(
  `\\n\\n(?=insert\\s+into\\s+staging\\.${tableEsc}\\b)`,
  'gi'
);
const statements = raw.split(splitRe).filter((s) => s.trim().length > 0);

if (!statements.length) {
  console.error('No INSERT statements found.');
  process.exit(1);
}

const batches = [];
let cur = [];
let curLen = 0;

function flush() {
  if (cur.length) {
    batches.push(cur.join('\n\n') + '\n');
    cur = [];
    curLen = 0;
  }
}

for (const stmt of statements) {
  const chunk = stmt.trim();
  const n = chunk.length;
  if (n > maxChars) {
    flush();
    batches.push(chunk + '\n');
    console.error(
      `WARN: single INSERT ~${n} chars exceeds --max-chars=${maxChars}; wrote alone. Use psql or DB CLI:\n  psql \"$DATABASE_URL\" -f <that-batch-file>`
    );
    continue;
  }
  const sep = cur.length ? 2 : 0;
  if (curLen + sep + n > maxChars) flush();
  cur.push(chunk);
  curLen += sep + n;
}
flush();

const dir = path.dirname(inPath);
const base = path.basename(inPath, path.extname(inPath));
const ext = path.extname(inPath) || '.sql';

let pad = String(batches.length).length;
for (let i = 0; i < batches.length; i++) {
  const num = String(i + 1).padStart(Math.max(3, pad), '0');
  const out = path.join(dir, `${base}-batch-${num}${ext}`);
  fs.writeFileSync(out, batches[i], 'utf8');
  console.error(`Wrote ${out} (${batches[i].length} chars)`);
}

console.error(`Done: ${batches.length} batch file(s) from ${statements.length} INSERT(s).`);
