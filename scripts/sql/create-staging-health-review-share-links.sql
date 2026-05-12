-- 우리 DB(SQL Editor)에서 한 번 실행 — staging 테이블이 예전 stub 컬럼(token만)이면 아래에서 DROP 후 재실행.
--
-- 컬럼은 attach public.health_review_share_links 와 동일.

create schema if not exists staging;

create table if not exists staging.health_review_share_links (
  id uuid primary key,
  parse_run_id uuid not null,
  content_type text not null,
  token_hash text not null,
  expires_at timestamptz not null,
  revoked_at timestamptz null,
  created_by text null,
  last_accessed_at timestamptz null,
  created_at timestamptz not null,
  updated_at timestamptz not null
);

create index if not exists staging_health_review_share_links_parse_run_id_idx
  on staging.health_review_share_links (parse_run_id);

create index if not exists staging_health_review_share_links_active_idx
  on staging.health_review_share_links (content_type, expires_at, revoked_at);
