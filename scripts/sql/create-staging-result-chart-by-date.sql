-- 우리 DB — staging.result_chart_by_date (attach 와 동일, 인트로스펙션 기준).

create schema if not exists staging;

drop table if exists staging.result_chart_by_date cascade;

create table if not exists staging.result_chart_by_date (
  id uuid primary key,
  parse_run_id uuid not null,
  date_time text not null,
  body_text text,
  plan_text text,
  plan_detected boolean not null,
  row_order integer,
  created_at timestamptz not null
);

create index if not exists staging_result_chart_by_date_parse_run_id_idx
  on staging.result_chart_by_date (parse_run_id);

create index if not exists staging_result_chart_by_date_created_at_idx
  on staging.result_chart_by_date (created_at);
