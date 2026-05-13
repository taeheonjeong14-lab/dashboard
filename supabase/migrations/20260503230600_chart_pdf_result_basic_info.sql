-- chart_pdf.result_basic_info — attach public.result_basic_info (introspection 2026-05).
-- 한 parse_run 당 최대 1행 — UNIQUE(parse_run_id).

create table if not exists chart_pdf.result_basic_info (
  id uuid primary key default gen_random_uuid(),
  parse_run_id uuid not null,
  owner_name text,
  patient_name text,
  species text,
  breed text,
  birth text,
  sex text,
  created_at timestamptz not null default now(),
  hospital_name text,
  age integer,
  constraint result_basic_info_parse_run_id_fkey
    foreign key (parse_run_id) references chart_pdf.parse_runs (id)
    on update cascade on delete cascade,
  constraint result_basic_info_parse_run_id_key unique (parse_run_id)
);

comment on table chart_pdf.result_basic_info is
  'Migrated from attach public.result_basic_info; unique (parse_run_id).';

grant select, insert, update, delete on table chart_pdf.result_basic_info to service_role;
grant select on table chart_pdf.result_basic_info to authenticated;
