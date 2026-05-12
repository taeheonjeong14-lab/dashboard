-- ATTACH (PDF) DB — Supabase SQL Editor 에서 실행.
-- 결과 한 셀 전체를 복사 → scripts/sql/tmp/paste-attach-export-for-decoder.json 에 저장(전체 교체).
-- 그리드가 [{ "decoder_json": "[...]" }] 형태로 한 줄 감싸도 decode-supabase-format-json-to-sql.mjs 가 안쪽 배열을 풀어 처리함.

select coalesce(
  json_agg(
    json_build_object(
      'format',
      format(
        $f$insert into staging.health_review_share_links (
  id, parse_run_id, content_type, token_hash, expires_at, revoked_at, created_by, last_accessed_at, created_at, updated_at
) values (
  %L::uuid, %L::uuid, %L, %L, %L::timestamptz, %L::timestamptz, %L, %L::timestamptz, %L::timestamptz, %L::timestamptz
);$f$,
        id::text,
        parse_run_id::text,
        content_type,
        token_hash,
        expires_at,
        revoked_at,
        created_by,
        last_accessed_at,
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
from public.health_review_share_links;
