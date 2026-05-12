-- 우리 DB(SQL Editor) 한 번 실행 — staging.result_basic_info
-- attach public.result_basic_info 와 동일 (인트로스펙션 기준).

create schema if not exists staging;

create table if not exists staging.result_basic_info (
  id uuid primary key,
  parse_run_id uuid not null,
  owner_name text,
  patient_name text,
  species text,
  breed text,
  birth text,
  sex text,
  created_at timestamptz not null,
  hospital_name text,
  age integer
);

create index if not exists staging_result_basic_info_parse_run_id_idx
  on staging.result_basic_info (parse_run_id);
