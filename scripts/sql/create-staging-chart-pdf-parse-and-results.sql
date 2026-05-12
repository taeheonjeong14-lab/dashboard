-- 우리 DB(SQL Editor) 한 번 실행 — chart_pdf 이관용 staging (parse_runs + 결과 테이블).
--
-- documents / generated_run_content / health_review_share_links 는
--   create-staging-all-attach-decoder-imports.sql 를 사용.
--
-- 컬럼 검증: Attach 에서 scripts/sql/attach-db-introspect-chart-pdf-staging-target-tables-columns-json.sql 실행 후
--   아래 CREATE 와 비교해 다르면 수정·drop table 후 재실행.
--
-- parse_runs · report_case_images 는 Attach 인트로스펙션(2026-05)과 일치.
-- result_basic_info 등 그 외 result_* 는 추정 스키마 → attach-db-describe-*.sql / suite JSON 과 대조.

create schema if not exists staging;

-- ─── parse_runs (확정) ─────────────────────────────────────────────────────
create table if not exists staging.parse_runs (
  id uuid primary key,
  document_id uuid not null,
  status text not null,
  provider text,
  model text,
  parser_version text,
  raw_payload jsonb,
  error_message text,
  created_at timestamptz not null,
  friendly_id text,
  hospital_id uuid,
  ai_assessment jsonb
);

create index if not exists staging_parse_runs_document_id_idx
  on staging.parse_runs (document_id);

create index if not exists staging_parse_runs_hospital_id_created_at_idx
  on staging.parse_runs (hospital_id, created_at);

-- ─── 추정: Attach 와 다를 수 있음 ─────────────────────────────────────────

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

create table if not exists staging.result_basic_info (
  id uuid primary key,
  parse_run_id uuid not null,
  owner_name text,
  patient_name text,
  species text,
  breed text,
  birth text,
  sex text,
  created_at timestamptz not null,
  hospital_name text,
  age integer
);

create index if not exists staging_result_basic_info_parse_run_id_idx
  on staging.result_basic_info (parse_run_id);

create table if not exists staging.result_chart_by_date (
  id uuid primary key,
  parse_run_id uuid not null,
  date_time text not null,
  body_text text,
  plan_text text,
  plan_detected boolean not null,
  row_order integer,
  created_at timestamptz not null
);

create index if not exists staging_result_chart_by_date_parse_run_id_idx
  on staging.result_chart_by_date (parse_run_id);

create index if not exists staging_result_chart_by_date_created_at_idx
  on staging.result_chart_by_date (created_at);

create table if not exists staging.result_lab_items (
  id uuid primary key,
  parse_run_id uuid not null,
  date_time text,
  item_name text not null,
  value_text text,
  unit text,
  reference_range text,
  flag text,
  row_order integer,
  created_at timestamptz not null,
  raw_item_name text
);

create index if not exists staging_result_lab_items_parse_run_id_idx
  on staging.result_lab_items (parse_run_id);

create index if not exists staging_result_lab_items_date_time_idx
  on staging.result_lab_items (date_time);

create table if not exists staging.result_physical_exam_items (
  id uuid primary key,
  parse_run_id uuid not null,
  chart_by_date_id uuid,
  date_time text not null,
  item_name text not null,
  reference_range text,
  value_text text not null,
  unit text,
  raw_text text,
  row_order integer not null,
  created_at timestamptz not null
);

create index if not exists staging_result_physical_exam_items_parse_run_id_idx
  on staging.result_physical_exam_items (parse_run_id);

create index if not exists staging_result_physical_exam_items_chart_by_date_id_idx
  on staging.result_physical_exam_items (chart_by_date_id);

create index if not exists staging_result_physical_exam_items_date_time_idx
  on staging.result_physical_exam_items (date_time);

create table if not exists staging.result_plan_rows (
  id uuid primary key,
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
  row_order integer not null,
  created_at timestamptz not null
);

create index if not exists staging_result_plan_rows_parse_run_id_idx
  on staging.result_plan_rows (parse_run_id);

create index if not exists staging_result_plan_rows_chart_by_date_id_idx
  on staging.result_plan_rows (chart_by_date_id);

create table if not exists staging.result_vaccination_records (
  id uuid primary key,
  parse_run_id uuid not null,
  record_type text not null,
  dose_order text not null,
  product_name text not null,
  administered_date text,
  "sign" text,
  page integer not null,
  row_order integer not null
);

create index if not exists staging_result_vaccination_records_parse_run_id_idx
  on staging.result_vaccination_records (parse_run_id);

create table if not exists staging.result_vitals (
  id uuid primary key,
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
  row_order integer not null,
  created_at timestamptz not null
);

create index if not exists staging_result_vitals_parse_run_id_idx
  on staging.result_vitals (parse_run_id);

create index if not exists staging_result_vitals_chart_by_date_id_idx
  on staging.result_vitals (chart_by_date_id);

create index if not exists staging_result_vitals_date_time_idx
  on staging.result_vitals (date_time);
