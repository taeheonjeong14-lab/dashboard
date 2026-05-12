-- 우리 DB(SQL Editor)에서 한 번 실행 — staging.parse_runs
-- parse_runs 만 필요 없고 결과 테이블까지 한꺼번에면 → create-staging-chart-pdf-parse-and-results.sql
--
-- attach public.parse_runs 와 동일 (인트로스펙션 기준). updated_at 없음.
-- 예전 stub 컬럼이면 drop table staging.parse_runs 후 재실행.

create schema if not exists staging;

create table if not exists staging.parse_runs (
  id uuid primary key,
  document_id uuid not null,
  status text not null,
  provider text,
  model text,
  parser_version text,
  raw_payload jsonb,
  error_message text,
  created_at timestamptz not null,
  friendly_id text,
  hospital_id uuid,
  ai_assessment jsonb
);

create index if not exists staging_parse_runs_document_id_idx
  on staging.parse_runs (document_id);

create index if not exists staging_parse_runs_hospital_id_created_at_idx
  on staging.parse_runs (hospital_id, created_at);
