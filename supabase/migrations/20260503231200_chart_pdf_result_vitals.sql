-- chart_pdf.result_vitals — attach public.result_vitals (introspection 2026-05).

create table if not exists chart_pdf.result_vitals (
  id uuid primary key default gen_random_uuid(),
  parse_run_id uuid not null,
  chart_by_date_id uuid,
  date_time text not null,
  weight text,
  temperature text,
  respiratory_rate text,
  heart_rate text,
  bp_systolic text,
  bp_diastolic text,
  raw_text text,
  row_order integer not null default 0,
  created_at timestamptz not null default now(),
  constraint result_vitals_parse_run_id_fkey
    foreign key (parse_run_id) references chart_pdf.parse_runs (id)
    on update cascade on delete cascade,
  constraint result_vitals_chart_by_date_id_fkey
    foreign key (chart_by_date_id) references chart_pdf.result_chart_by_date (id)
    on update cascade on delete set null
);

create index if not exists idx_result_vitals_parse_run_id
  on chart_pdf.result_vitals (parse_run_id);

create index if not exists idx_result_vitals_chart_by_date_id
  on chart_pdf.result_vitals (chart_by_date_id);

create index if not exists idx_result_vitals_date_time
  on chart_pdf.result_vitals (date_time);

comment on table chart_pdf.result_vitals is
  'Migrated from attach public.result_vitals.';

grant select, insert, update, delete on table chart_pdf.result_vitals to service_role;
grant select on table chart_pdf.result_vitals to authenticated;
