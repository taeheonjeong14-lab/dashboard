-- 우리 DB — staging.result_plan_rows (attach public 과 동일, 인트로스펙션 기준).

create schema if not exists staging;

drop table if exists staging.result_plan_rows cascade;

create table if not exists staging.result_plan_rows (
  id uuid primary key,
  parse_run_id uuid not null,
  chart_by_date_id uuid not null,
  code text,
  treatment_prescription text,
  qty text,
  unit text,
  "day" text,
  total text,
  route text,
  sign_id text,
  raw_text text not null,
  row_order integer not null,
  created_at timestamptz not null
);

create index if not exists staging_result_plan_rows_parse_run_id_idx
  on staging.result_plan_rows (parse_run_id);

create index if not exists staging_result_plan_rows_chart_by_date_id_idx
  on staging.result_plan_rows (chart_by_date_id);
