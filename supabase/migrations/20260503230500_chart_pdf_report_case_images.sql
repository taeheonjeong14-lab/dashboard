-- chart_pdf.report_case_images — attach public.report_case_images (introspection 2026-05).

create table if not exists chart_pdf.report_case_images (
  id uuid primary key default gen_random_uuid(),
  parse_run_id uuid not null,
  exam_date date not null,
  file_name text not null,
  exam_type text not null,
  radiology_sub text,
  brief_comment text not null,
  has_notable_finding boolean not null default false,
  storage_path text not null,
  mime_type text,
  byte_size integer,
  created_at timestamptz not null default now(),
  finding_spots jsonb,
  finding_confidence text,
  related_assessment_condition text,
  constraint report_case_images_parse_run_id_fkey
    foreign key (parse_run_id) references chart_pdf.parse_runs (id)
    on update cascade on delete cascade
);

create index if not exists chart_pdf_report_case_images_exam_date_idx
  on chart_pdf.report_case_images (exam_date);

create index if not exists chart_pdf_report_case_images_parse_run_id_idx
  on chart_pdf.report_case_images (parse_run_id);

comment on table chart_pdf.report_case_images is
  'Migrated from attach public.report_case_images; FK parse_run_id → chart_pdf.parse_runs.';

grant select, insert, update, delete on table chart_pdf.report_case_images to service_role;
grant select on table chart_pdf.report_case_images to authenticated;
