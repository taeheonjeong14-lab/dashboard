-- 우리 DB — staging.result_vaccination_records (attach public 과 동일, 인트로스펙션 기준).

create schema if not exists staging;

drop table if exists staging.result_vaccination_records cascade;

create table if not exists staging.result_vaccination_records (
  id uuid primary key,
  parse_run_id uuid not null,
  record_type text not null,
  dose_order text not null,
  product_name text not null,
  administered_date text,
  "sign" text,
  page integer not null,
  row_order integer not null
);

create index if not exists staging_result_vaccination_records_parse_run_id_idx
  on staging.result_vaccination_records (parse_run_id);
