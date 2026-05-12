-- 우리 DB(SQL Editor)에서 한 번 실행 — Attach 디코더 INSERT 용 staging 일괄 생성.
--
-- 포함: documents, generated_run_content, health_review_share_links
-- chart_pdf parse_runs·결과 테이블 → create-staging-chart-pdf-parse-and-results.sql
-- 병원 병합용 staging.pdf_hospitals → create-staging-pdf-hospitals.sql 별도.
--
-- 예전 stub 스키마가 남아 있으면 해당 테이블만 drop 후 이 파일 전체를 다시 실행.

create schema if not exists staging;

-- documents (chart_pdf)
create table if not exists staging.documents (
  id uuid primary key,
  file_name text not null,
  file_hash text,
  chart_type text not null,
  created_at timestamptz not null
);

create index if not exists staging_documents_chart_type_created_at_idx
  on staging.documents (chart_type, created_at);

-- generated_run_content (health_report)
create table if not exists staging.generated_run_content (
  id uuid primary key,
  parse_run_id uuid not null,
  content_type text not null,
  payload jsonb not null,
  created_at timestamptz not null,
  updated_at timestamptz not null
);

create index if not exists staging_generated_run_content_parse_run_id_idx
  on staging.generated_run_content (parse_run_id);

-- health_review_share_links (health_report)
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
