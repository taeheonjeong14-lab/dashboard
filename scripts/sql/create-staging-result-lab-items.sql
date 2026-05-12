-- 우리 DB — staging.result_lab_items (attach public 과 동일, 인트로스펙션 기준).

create schema if not exists staging;

drop table if exists staging.result_lab_items cascade;

create table if not exists staging.result_lab_items (
  id uuid primary key,
  parse_run_id uuid not null,
  date_time text,
  item_name text not null,
  value_text text,
  unit text,
  reference_range text,
  flag text,
  row_order integer,
  created_at timestamptz not null,
  raw_item_name text
);

create index if not exists staging_result_lab_items_parse_run_id_idx
  on staging.result_lab_items (parse_run_id);

create index if not exists staging_result_lab_items_date_time_idx
  on staging.result_lab_items (date_time);
