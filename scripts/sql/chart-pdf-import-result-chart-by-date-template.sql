-- TEMPLATE — staging 적재 후 chart_pdf 반영. parse_runs 선행.

begin;

insert into chart_pdf.result_chart_by_date (
  id,
  parse_run_id,
  date_time,
  body_text,
  plan_text,
  plan_detected,
  row_order,
  created_at
)
select
  id,
  parse_run_id,
  date_time,
  body_text,
  plan_text,
  plan_detected,
  row_order,
  created_at
from staging.result_chart_by_date
on conflict (id) do update set
  parse_run_id = excluded.parse_run_id,
  date_time = excluded.date_time,
  body_text = excluded.body_text,
  plan_text = excluded.plan_text,
  plan_detected = excluded.plan_detected,
  row_order = excluded.row_order,
  created_at = excluded.created_at;

commit;
