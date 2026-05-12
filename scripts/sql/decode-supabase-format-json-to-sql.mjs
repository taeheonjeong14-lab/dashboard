/**

 * Supabase / 에디터에서 가져온 텍스트를 풀어서 하나의 .sql 파일로 만든다.

 *

 * 지원 입력:

 * 1) JSON 배열: [{ "format": "insert ..." }, ...]

 * 2) Supabase 결과 한 행 래핑: [{ "decoder_json": "[{\\"format\\": ...}]" }] → 안쪽 배열 자동 언랩

 * 3) 마크다운 표: "| format |" 헤더 + 셀 안의 INSERT (Table Editor 복사본)

 * 4) 그 외: 줄 시작이 insert 인 블록들

 *

 * 사용:

 *   node scripts/sql/decode-supabase-format-json-to-sql.mjs <in.txt-or.json> <out.sql> [staging_table_name]

 *

 * 여러 테이블은 decode-supabase-batch.mjs + decode-supabase-batch.config.example.json 참고.

 */



import fs from 'fs';

import { decodeSupabaseExport } from './decode-supabase-format-json-to-sql-lib.mjs';



const [,, inPath, outPath, tableNameArg = 'generated_run_content'] = process.argv;

if (!inPath || !outPath) {

  console.error(

    'Usage: node decode-supabase-format-json-to-sql.mjs <in.txt-or.json> <out.sql> [staging_table_name]'

  );

  process.exit(1);

}



const raw = fs.readFileSync(inPath, 'utf8');



let parts;

try {

  parts = decodeSupabaseExport(raw, tableNameArg);

} catch (e) {

  console.error(e.message);

  process.exit(1);

}



fs.writeFileSync(outPath, parts.join('\n\n') + '\n', 'utf8');

console.error(`Wrote ${parts.length} statement(s) for staging.${tableNameArg} to ${outPath}`);


