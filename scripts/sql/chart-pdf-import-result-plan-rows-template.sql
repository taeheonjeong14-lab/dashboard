-- TEMPLATE — staging 적재 후 chart_pdf 반영. parse_runs · result_chart_by_date 선행.

begin;

insert into chart_pdf.result_plan_rows (
  id,
  parse_run_id,
  chart_by_date_id,
  code,
  treatment_prescription,
  qty,
  unit,
  "day",
  total,
  route,
  sign_id,
  raw_text,
  row_order,
  created_at
)
select
  id,
  parse_run_id,
  chart_by_date_id,
  code,
  treatment_prescription,
  qty,
  unit,
  "day",
  total,
  route,
  sign_id,
  raw_text,
  row_order,
  created_at
from staging.result_plan_rows
on conflict (id) do update set
  parse_run_id = excluded.parse_run_id,
  chart_by_date_id = excluded.chart_by_date_id,
  code = excluded.code,
  treatment_prescription = excluded.treatment_prescription,
  qty = excluded.qty,
  unit = excluded.unit,
  "day" = excluded."day",
  total = excluded.total,
  route = excluded.route,
  sign_id = excluded.sign_id,
  raw_text = excluded.raw_text,
  row_order = excluded.row_order,
  created_at = excluded.created_at;

commit;
