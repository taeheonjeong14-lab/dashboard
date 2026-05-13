-- chart_pdf.result_vaccination_records — attach public.result_vaccination_records (introspection 2026-05).

create table if not exists chart_pdf.result_vaccination_records (
  id uuid primary key default gen_random_uuid(),
  parse_run_id uuid not null,
  record_type text not null,
  dose_order text not null,
  product_name text not null,
  administered_date text,
  "sign" text,
  page integer not null default 1,
  row_order integer not null default 0,
  constraint result_vaccination_records_parse_run_id_fkey
    foreign key (parse_run_id) references chart_pdf.parse_runs (id)
    on update cascade on delete cascade
);

create index if not exists idx_result_vaccination_records_parse_run_id
  on chart_pdf.result_vaccination_records (parse_run_id);

comment on table chart_pdf.result_vaccination_records is
  'Migrated from attach public.result_vaccination_records.';

grant select, insert, update, delete on table chart_pdf.result_vaccination_records to service_role;
grant select on table chart_pdf.result_vaccination_records to authenticated;
