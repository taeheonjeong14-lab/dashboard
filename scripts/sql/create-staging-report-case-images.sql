-- 우리 DB(SQL Editor)에서 한 번 실행 — staging.report_case_images
-- attach public.report_case_images 와 동일 (인트로스펙션 기준).
-- 일괄 생성은 create-staging-chart-pdf-parse-and-results.sql

create schema if not exists staging;

create table if not exists staging.report_case_images (
  id uuid primary key,
  parse_run_id uuid not null,
  exam_date date not null,
  file_name text not null,
  exam_type text not null,
  radiology_sub text,
  brief_comment text not null,
  has_notable_finding boolean not null,
  storage_path text not null,
  mime_type text,
  byte_size integer,
  created_at timestamptz not null,
  finding_spots jsonb,
  finding_confidence text,
  related_assessment_condition text
);

create index if not exists staging_report_case_images_parse_run_id_idx
  on staging.report_case_images (parse_run_id);

create index if not exists staging_report_case_images_exam_date_idx
  on staging.report_case_images (exam_date);
