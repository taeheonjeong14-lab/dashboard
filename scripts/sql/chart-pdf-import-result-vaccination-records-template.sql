-- TEMPLATE — staging 적재 후 chart_pdf 반영. parse_runs 선행.

begin;

insert into chart_pdf.result_vaccination_records (
  id,
  parse_run_id,
  record_type,
  dose_order,
  product_name,
  administered_date,
  "sign",
  page,
  row_order
)
select
  id,
  parse_run_id,
  record_type,
  dose_order,
  product_name,
  administered_date,
  "sign",
  page,
  row_order
from staging.result_vaccination_records
on conflict (id) do update set
  parse_run_id = excluded.parse_run_id,
  record_type = excluded.record_type,
  dose_order = excluded.dose_order,
  product_name = excluded.product_name,
  administered_date = excluded.administered_date,
  "sign" = excluded."sign",
  page = excluded.page,
  row_order = excluded.row_order;

commit;
