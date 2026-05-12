-- ATTACH (PDF) DB — Supabase SQL Editor 에서 실행.
-- 결과가 한 컬럼·한 행(JSON 배열 텍스트)으로 나옵니다 → 전체를 복사해
-- scripts/sql/tmp/paste-attach-export-for-decoder.json 에 그대로 저장(파일 전체 교체).
--
-- 행이 많으면 결과가 잘릴 수 있음 → psql 등으로 실행해 파일로 받거나, LIMIT 로 나눠 실행.

select coalesce(
  json_agg(
    json_build_object(
      'format',
      format(
        $f$insert into staging.generated_run_content (
  id, parse_run_id, content_type, payload, created_at, updated_at
) values (
  %L::uuid, %L::uuid, %L, %L::jsonb, %L::timestamptz, %L::timestamptz
);$f$,
        id::text,
        parse_run_id::text,
        content_type,
        payload::text,
        created_at,
        updated_at
      )
    )
    order by
      created_at,
      id
  ),
  '[]'::json
)::text as decoder_json
from public.generated_run_content;
