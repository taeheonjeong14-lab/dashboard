-- TEMPLATE — 우리 DB. staging 에 행을 넣은 뒤 이 파일을 실행.
--
-- 순서:
--   1) scripts/sql/create-staging-health-review-share-links.sql 실행 (예전 stub staging 이면 drop 후 재생성)
--   2) 디코더로 만든 INSERT SQL 실행 → staging.health_review_share_links 적재
--   3) 이 파일 실행 → health_report.health_review_share_links 로 반영
--
-- 예전 마이그레이션으로 health_report 가 token 컬럼만 있었다면 Supabase 에서
--   supabase/migrations/20260503230200_health_review_share_links_upgrade_from_stub.sql 적용 후 진행.
--
-- 디코더:
--   node scripts/sql/decode-supabase-format-json-to-sql.mjs scripts/sql/tmp/paste-health-review-share-links-here.json scripts/sql/tmp/share-links-inserts.sql health_review_share_links

begin;

insert into health_report.health_review_share_links (
  id,
  parse_run_id,
  content_type,
  token_hash,
  expires_at,
  revoked_at,
  created_by,
  last_accessed_at,
  created_at,
  updated_at
)
select
  id,
  parse_run_id,
  content_type,
  token_hash,
  expires_at,
  revoked_at,
  created_by,
  last_accessed_at,
  created_at,
  updated_at
from staging.health_review_share_links
on conflict (id) do update set
  parse_run_id = excluded.parse_run_id,
  content_type = excluded.content_type,
  token_hash = excluded.token_hash,
  expires_at = excluded.expires_at,
  revoked_at = excluded.revoked_at,
  created_by = excluded.created_by,
  last_accessed_at = excluded.last_accessed_at,
  updated_at = excluded.updated_at;

commit;
