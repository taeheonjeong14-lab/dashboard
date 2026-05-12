-- ATTACH (PDF) DB — Supabase SQL Editor 에서 실행.
-- 결과 한 셀 전체를 복사 → scripts/sql/tmp/paste-documents-export-for-decoder.json 에 저장(전체 교체).
-- 그리드가 [{ "decoder_json": "[...]" }] 형태여도 decode-supabase-format-json-to-sql.mjs 가 안쪽 배열을 풀어 처리함.

select coalesce(
  json_agg(
    json_build_object(
      'format',
      format(
        $f$insert into staging.documents (
  id, file_name, file_hash, chart_type, created_at
) values (
  %L::uuid, %L, %L, %L, %L::timestamptz
);$f$,
        id::text,
        file_name,
        file_hash,
        chart_type,
        created_at
      )
    )
    order by
      created_at,
      id
  ),
  '[]'::json
)::text as decoder_json
from public.documents;
