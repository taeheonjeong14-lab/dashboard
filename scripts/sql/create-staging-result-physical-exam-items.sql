-- 우리 DB — staging.result_physical_exam_items (attach public 과 동일, 인트로스펙션 기준).

create schema if not exists staging;

drop table if exists staging.result_physical_exam_items cascade;

create table if not exists staging.result_physical_exam_items (
  id uuid primary key,
  parse_run_id uuid not null,
  chart_by_date_id uuid,
  date_time text not null,
  item_name text not null,
  reference_range text,
  value_text text not null,
  unit text,
  raw_text text,
  row_order integer not null,
  created_at timestamptz not null
);

create index if not exists staging_result_physical_exam_items_parse_run_id_idx
  on staging.result_physical_exam_items (parse_run_id);

create index if not exists staging_result_physical_exam_items_chart_by_date_id_idx
  on staging.result_physical_exam_items (chart_by_date_id);

create index if not exists staging_result_physical_exam_items_date_time_idx
  on staging.result_physical_exam_items (date_time);
