-- chart_pdf.result_plan_rows — attach public.result_plan_rows (introspection 2026-05).

create table if not exists chart_pdf.result_plan_rows (
  id uuid primary key default gen_random_uuid(),
  parse_run_id uuid not null,
  chart_by_date_id uuid not null,
  code text,
  treatment_prescription text,
  qty text,
  unit text,
  "day" text,
  total text,
  route text,
  sign_id text,
  raw_text text not null,
  row_order integer not null default 0,
  created_at timestamptz not null default now(),
  constraint result_plan_rows_parse_run_id_fkey
    foreign key (parse_run_id) references chart_pdf.parse_runs (id)
    on update cascade on delete cascade,
  constraint result_plan_rows_chart_by_date_id_fkey
    foreign key (chart_by_date_id) references chart_pdf.result_chart_by_date (id)
    on update cascade on delete cascade
);

create index if not exists idx_result_plan_rows_parse_run_id
  on chart_pdf.result_plan_rows (parse_run_id);

create index if not exists idx_result_plan_rows_chart_by_date_id
  on chart_pdf.result_plan_rows (chart_by_date_id);

comment on table chart_pdf.result_plan_rows is
  'Migrated from attach public.result_plan_rows.';

grant select, insert, update, delete on table chart_pdf.result_plan_rows to service_role;
grant select on table chart_pdf.result_plan_rows to authenticated;
