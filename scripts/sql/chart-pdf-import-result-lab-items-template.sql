-- TEMPLATE — staging 적재 후 chart_pdf 반영. parse_runs 선행.

begin;

insert into chart_pdf.result_lab_items (
  id,
  parse_run_id,
  date_time,
  item_name,
  value_text,
  unit,
  reference_range,
  flag,
  row_order,
  created_at,
  raw_item_name
)
select
  id,
  parse_run_id,
  date_time,
  item_name,
  value_text,
  unit,
  reference_range,
  flag,
  row_order,
  created_at,
  raw_item_name
from staging.result_lab_items
on conflict (id) do update set
  parse_run_id = excluded.parse_run_id,
  date_time = excluded.date_time,
  item_name = excluded.item_name,
  value_text = excluded.value_text,
  unit = excluded.unit,
  reference_range = excluded.reference_range,
  flag = excluded.flag,
  row_order = excluded.row_order,
  created_at = excluded.created_at,
  raw_item_name = excluded.raw_item_name;

commit;
