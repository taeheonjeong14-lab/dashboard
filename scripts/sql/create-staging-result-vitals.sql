-- 우리 DB — staging.result_vitals (attach public 과 동일, 인트로스펙션 기준).

create schema if not exists staging;

drop table if exists staging.result_vitals cascade;

create table if not exists staging.result_vitals (
  id uuid primary key,
  parse_run_id uuid not null,
  chart_by_date_id uuid,
  date_time text not null,
  weight text,
  temperature text,
  respiratory_rate text,
  heart_rate text,
  bp_systolic text,
  bp_diastolic text,
  raw_text text,
  row_order integer not null,
  created_at timestamptz not null
);

create index if not exists staging_result_vitals_parse_run_id_idx
  on staging.result_vitals (parse_run_id);

create index if not exists staging_result_vitals_chart_by_date_id_idx
  on staging.result_vitals (chart_by_date_id);

create index if not exists staging_result_vitals_date_time_idx
  on staging.result_vitals (date_time);
