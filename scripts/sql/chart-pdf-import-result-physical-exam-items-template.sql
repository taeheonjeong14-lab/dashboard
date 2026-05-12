-- TEMPLATE — staging 적재 후 chart_pdf 반영. parse_runs · result_chart_by_date 선행.

begin;

insert into chart_pdf.result_physical_exam_items (
  id,
  parse_run_id,
  chart_by_date_id,
  date_time,
  item_name,
  reference_range,
  value_text,
  unit,
  raw_text,
  row_order,
  created_at
)
select
  id,
  parse_run_id,
  chart_by_date_id,
  date_time,
  item_name,
  reference_range,
  value_text,
  unit,
  raw_text,
  row_order,
  created_at
from staging.result_physical_exam_items
on conflict (id) do update set
  parse_run_id = excluded.parse_run_id,
  chart_by_date_id = excluded.chart_by_date_id,
  date_time = excluded.date_time,
  item_name = excluded.item_name,
  reference_range = excluded.reference_range,
  value_text = excluded.value_text,
  unit = excluded.unit,
  raw_text = excluded.raw_text,
  row_order = excluded.row_order,
  created_at = excluded.created_at;

commit;
