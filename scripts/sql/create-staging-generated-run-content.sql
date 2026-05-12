-- 우리 DB(SQL Editor)에서 한 번 실행 — staging.generated_run_content
--
-- attach public.generated_run_content 와 동일 (디코더 export 템플릿 기준).
-- 예전 테이블과 컬럼이 다르면 drop table staging.generated_run_content 후 재실행.

create schema if not exists staging;

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
