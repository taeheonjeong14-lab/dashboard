-- 우리 DB(SQL Editor)에서 한 번 실행 — staging.documents
--
-- attach public.documents 와 동일 (인트로스펙션 기준).
-- 예전 stub 컬럼으로 만들어 두었다면 drop table staging.documents 후 재실행.

create schema if not exists staging;

create table if not exists staging.documents (
  id uuid primary key,
  file_name text not null,
  file_hash text,
  chart_type text not null,
  created_at timestamptz not null
);

create index if not exists staging_documents_chart_type_created_at_idx
  on staging.documents (chart_type, created_at);
