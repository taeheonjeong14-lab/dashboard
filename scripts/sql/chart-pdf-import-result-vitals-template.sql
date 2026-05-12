-- TEMPLATE — staging 적재 후 chart_pdf 반영. parse_runs 선행 (chart_by_date_id 사용 시 result_chart_by_date 선행).

begin;

insert into chart_pdf.result_vitals (
  id,
  parse_run_id,
  chart_by_date_id,
  date_time,
  weight,
  temperature,
  respiratory_rate,
  heart_rate,
  bp_systolic,
  bp_diastolic,
  raw_text,
  row_order,
  created_at
)
select
  id,
  parse_run_id,
  chart_by_date_id,
  date_time,
  weight,
  temperature,
  respiratory_rate,
  heart_rate,
  bp_systolic,
  bp_diastolic,
  raw_text,
  row_order,
  created_at
from staging.result_vitals
on conflict (id) do update set
  parse_run_id = excluded.parse_run_id,
  chart_by_date_id = excluded.chart_by_date_id,
  date_time = excluded.date_time,
  weight = excluded.weight,
  temperature = excluded.temperature,
  respiratory_rate = excluded.respiratory_rate,
  heart_rate = excluded.heart_rate,
  bp_systolic = excluded.bp_systolic,
  bp_diastolic = excluded.bp_diastolic,
  raw_text = excluded.raw_text,
  row_order = excluded.row_order,
  created_at = excluded.created_at;

commit;
