-- health_report.generated_run_content — matches attach public.generated_run_content (introspection 2026-05).
-- No hospital_id column; linkage is parse_run_id → chart_pdf.parse_runs (FK added once parse_runs exists).

create table if not exists health_report.generated_run_content (
  id uuid primary key default gen_random_uuid(),
  parse_run_id uuid not null,
  content_type text not null,
  payload jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint generated_run_content_parse_run_content_key unique (parse_run_id, content_type)
);

create index if not exists generated_run_content_parse_run_id_idx
  on health_report.generated_run_content (parse_run_id);

-- FK (attach: generated_run_content_parse_run_id_fkey → public.parse_runs):
--   alter table health_report.generated_run_content
--     add constraint generated_run_content_parse_run_id_fkey
--     foreign key (parse_run_id) references chart_pdf.parse_runs (id)
--     on update cascade on delete cascade;

comment on table health_report.generated_run_content is
  'Migrated from attach public.generated_run_content; unique (parse_run_id, content_type).';

grant select, insert, update, delete on table health_report.generated_run_content to service_role;
grant select on table health_report.generated_run_content to authenticated;
