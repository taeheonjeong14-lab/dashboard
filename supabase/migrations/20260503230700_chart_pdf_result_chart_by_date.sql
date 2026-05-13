-- chart_pdf.result_chart_by_date — attach public.result_chart_by_date (introspection 2026-05).

create table if not exists chart_pdf.result_chart_by_date (
  id uuid primary key default gen_random_uuid(),
  parse_run_id uuid not null,
  date_time text not null,
  body_text text,
  plan_text text,
  plan_detected boolean not null default false,
  row_order integer,
  created_at timestamptz not null default now(),
  constraint result_chart_by_date_parse_run_id_fkey
    foreign key (parse_run_id) references chart_pdf.parse_runs (id)
    on update cascade on delete cascade
);

create index if not exists idx_result_chart_by_date_parse_run_id
  on chart_pdf.result_chart_by_date (parse_run_id);

comment on table chart_pdf.result_chart_by_date is
  'Migrated from attach public.result_chart_by_date.';

grant select, insert, update, delete on table chart_pdf.result_chart_by_date to service_role;
grant select on table chart_pdf.result_chart_by_date to authenticated;
