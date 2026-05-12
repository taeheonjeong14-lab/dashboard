-- 우리 DB — staging.* 일괄 이관 → chart_pdf.* · health_report.*
--
-- ═══ 선행 필수 (스키마 생성) ═══════════════════════════════════════════════════
-- 이 파일은 INSERT 만 수행한다. chart_pdf / health_report 테이블은 만들지 않는다.
-- ERROR: relation "chart_pdf.documents" does not exist → 마이그레이션이 원격 DB에
--   아직 적용되지 않은 것이다.
--
-- 해결: 레포 루트에서 Supabase 마이그레이션을 이 프로젝트(원격)에 반영한다.
--   • CLI: supabase link … 후  supabase db push
--   • 또는 Dashboard → SQL: supabase/migrations/*.sql 를 타임스탬프 순으로 실행
--   • 최소: 20260503220000_chart_pdf_health_report_schemas.sql (스키마)
--     이어서 20260503230300…documents, 20260503230400…parse_runs, health_report,
--     report_case_images, result_* … 전부 (supabase/migrations 의 20260503* 일괄)
--
-- 적용 여부 빠른 확인 (SQL Editor):
--   select nspname from pg_namespace where nspname in ('chart_pdf','health_report');
--   select tablename from pg_tables where schemaname = 'chart_pdf' order by 1;
--
-- 전제(데이터): staging.* 가 채워져 있고, 아래 INSERT 순서가 FK 를 만족할 것.
-- 실행: Supabase SQL Editor 또는 psql 에서 한 파일 통째로 실행.
--
-- 순서 (FK):
--   documents → parse_runs → health_report 두 테이블(parse_run_id) → report_case_images →
--   result_basic_info → result_chart_by_date → (chart_by_date 참조) lab / physical_exam / plan →
--   vaccination → vitals
--
-- 참고:
--   • generated_run_content 의 ON CONFLICT(parse_run_id, content_type) 는 해당 UNIQUE 가 있을 때만 유효.
--     없으면 마이그레이션 추가 또는 해당 INSERT 블록만 수정.
--   • 빈 staging 테이블이어도 동작 (0행 insert).

begin;

-- ─── chart_pdf.documents ─────────────────────────────────────────────────────

insert into chart_pdf.documents (
  id,
  file_name,
  file_hash,
  chart_type,
  created_at
)
select
  id,
  file_name,
  file_hash,
  chart_type,
  created_at
from staging.documents
on conflict (id) do update set
  file_name = excluded.file_name,
  file_hash = excluded.file_hash,
  chart_type = excluded.chart_type,
  created_at = excluded.created_at;

-- ─── chart_pdf.parse_runs ──────────────────────────────────────────────────────

insert into chart_pdf.parse_runs (
  id,
  document_id,
  status,
  provider,
  model,
  parser_version,
  raw_payload,
  error_message,
  created_at,
  friendly_id,
  hospital_id,
  ai_assessment
)
select
  id,
  document_id,
  status,
  provider,
  model,
  parser_version,
  raw_payload,
  error_message,
  created_at,
  friendly_id,
  hospital_id,
  ai_assessment
from staging.parse_runs
on conflict (id) do update set
  document_id = excluded.document_id,
  status = excluded.status,
  provider = excluded.provider,
  model = excluded.model,
  parser_version = excluded.parser_version,
  raw_payload = excluded.raw_payload,
  error_message = excluded.error_message,
  created_at = excluded.created_at,
  friendly_id = excluded.friendly_id,
  hospital_id = excluded.hospital_id,
  ai_assessment = excluded.ai_assessment;

-- ─── health_report.generated_run_content ───────────────────────────────────────

insert into health_report.generated_run_content (
  id,
  parse_run_id,
  content_type,
  payload,
  created_at,
  updated_at
)
select
  id,
  parse_run_id,
  content_type,
  payload,
  created_at,
  updated_at
from staging.generated_run_content
on conflict (parse_run_id, content_type) do update set
  payload = excluded.payload,
  updated_at = excluded.updated_at;

-- ─── health_report.health_review_share_links ──────────────────────────────────

insert into health_report.health_review_share_links (
  id,
  parse_run_id,
  content_type,
  token_hash,
  expires_at,
  revoked_at,
  created_by,
  last_accessed_at,
  created_at,
  updated_at
)
select
  id,
  parse_run_id,
  content_type,
  token_hash,
  expires_at,
  revoked_at,
  created_by,
  last_accessed_at,
  created_at,
  updated_at
from staging.health_review_share_links
on conflict (id) do update set
  parse_run_id = excluded.parse_run_id,
  content_type = excluded.content_type,
  token_hash = excluded.token_hash,
  expires_at = excluded.expires_at,
  revoked_at = excluded.revoked_at,
  created_by = excluded.created_by,
  last_accessed_at = excluded.last_accessed_at,
  updated_at = excluded.updated_at;

-- ─── chart_pdf.report_case_images ──────────────────────────────────────────────

insert into chart_pdf.report_case_images (
  id,
  parse_run_id,
  exam_date,
  file_name,
  exam_type,
  radiology_sub,
  brief_comment,
  has_notable_finding,
  storage_path,
  mime_type,
  byte_size,
  created_at,
  finding_spots,
  finding_confidence,
  related_assessment_condition
)
select
  id,
  parse_run_id,
  exam_date,
  file_name,
  exam_type,
  radiology_sub,
  brief_comment,
  has_notable_finding,
  storage_path,
  mime_type,
  byte_size,
  created_at,
  finding_spots,
  finding_confidence,
  related_assessment_condition
from staging.report_case_images
on conflict (id) do update set
  parse_run_id = excluded.parse_run_id,
  exam_date = excluded.exam_date,
  file_name = excluded.file_name,
  exam_type = excluded.exam_type,
  radiology_sub = excluded.radiology_sub,
  brief_comment = excluded.brief_comment,
  has_notable_finding = excluded.has_notable_finding,
  storage_path = excluded.storage_path,
  mime_type = excluded.mime_type,
  byte_size = excluded.byte_size,
  created_at = excluded.created_at,
  finding_spots = excluded.finding_spots,
  finding_confidence = excluded.finding_confidence,
  related_assessment_condition = excluded.related_assessment_condition;

-- ─── chart_pdf.result_basic_info ───────────────────────────────────────────────

insert into chart_pdf.result_basic_info (
  id,
  parse_run_id,
  owner_name,
  patient_name,
  species,
  breed,
  birth,
  sex,
  created_at,
  hospital_name,
  age
)
select
  id,
  parse_run_id,
  owner_name,
  patient_name,
  species,
  breed,
  birth,
  sex,
  created_at,
  hospital_name,
  age
from staging.result_basic_info
on conflict (parse_run_id) do update set
  owner_name = excluded.owner_name,
  patient_name = excluded.patient_name,
  species = excluded.species,
  breed = excluded.breed,
  birth = excluded.birth,
  sex = excluded.sex,
  created_at = excluded.created_at,
  hospital_name = excluded.hospital_name,
  age = excluded.age;

-- ─── chart_pdf.result_chart_by_date ────────────────────────────────────────────

insert into chart_pdf.result_chart_by_date (
  id,
  parse_run_id,
  date_time,
  body_text,
  plan_text,
  plan_detected,
  row_order,
  created_at
)
select
  id,
  parse_run_id,
  date_time,
  body_text,
  plan_text,
  plan_detected,
  row_order,
  created_at
from staging.result_chart_by_date
on conflict (id) do update set
  parse_run_id = excluded.parse_run_id,
  date_time = excluded.date_time,
  body_text = excluded.body_text,
  plan_text = excluded.plan_text,
  plan_detected = excluded.plan_detected,
  row_order = excluded.row_order,
  created_at = excluded.created_at;

-- ─── chart_pdf.result_lab_items ────────────────────────────────────────────────

insert into chart_pdf.result_lab_items (
  id,
  parse_run_id,
  date_time,
  item_name,
  value_text,
  unit,
  reference_range,
  flag,
  row_order,
  created_at,
  raw_item_name
)
select
  id,
  parse_run_id,
  date_time,
  item_name,
  value_text,
  unit,
  reference_range,
  flag,
  row_order,
  created_at,
  raw_item_name
from staging.result_lab_items
on conflict (id) do update set
  parse_run_id = excluded.parse_run_id,
  date_time = excluded.date_time,
  item_name = excluded.item_name,
  value_text = excluded.value_text,
  unit = excluded.unit,
  reference_range = excluded.reference_range,
  flag = excluded.flag,
  row_order = excluded.row_order,
  created_at = excluded.created_at,
  raw_item_name = excluded.raw_item_name;

-- ─── chart_pdf.result_physical_exam_items ────────────────────────────────────

insert into chart_pdf.result_physical_exam_items (
  id,
  parse_run_id,
  chart_by_date_id,
  date_time,
  item_name,
  reference_range,
  value_text,
  unit,
  raw_text,
  row_order,
  created_at
)
select
  id,
  parse_run_id,
  chart_by_date_id,
  date_time,
  item_name,
  reference_range,
  value_text,
  unit,
  raw_text,
  row_order,
  created_at
from staging.result_physical_exam_items
on conflict (id) do update set
  parse_run_id = excluded.parse_run_id,
  chart_by_date_id = excluded.chart_by_date_id,
  date_time = excluded.date_time,
  item_name = excluded.item_name,
  reference_range = excluded.reference_range,
  value_text = excluded.value_text,
  unit = excluded.unit,
  raw_text = excluded.raw_text,
  row_order = excluded.row_order,
  created_at = excluded.created_at;

-- ─── chart_pdf.result_plan_rows ────────────────────────────────────────────────

insert into chart_pdf.result_plan_rows (
  id,
  parse_run_id,
  chart_by_date_id,
  code,
  treatment_prescription,
  qty,
  unit,
  "day",
  total,
  route,
  sign_id,
  raw_text,
  row_order,
  created_at
)
select
  id,
  parse_run_id,
  chart_by_date_id,
  code,
  treatment_prescription,
  qty,
  unit,
  "day",
  total,
  route,
  sign_id,
  raw_text,
  row_order,
  created_at
from staging.result_plan_rows
on conflict (id) do update set
  parse_run_id = excluded.parse_run_id,
  chart_by_date_id = excluded.chart_by_date_id,
  code = excluded.code,
  treatment_prescription = excluded.treatment_prescription,
  qty = excluded.qty,
  unit = excluded.unit,
  "day" = excluded."day",
  total = excluded.total,
  route = excluded.route,
  sign_id = excluded.sign_id,
  raw_text = excluded.raw_text,
  row_order = excluded.row_order,
  created_at = excluded.created_at;

-- ─── chart_pdf.result_vaccination_records ────────────────────────────────────

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

-- ─── chart_pdf.result_vitals ─────────────────────────────────────────────────

insert into chart_pdf.result_vitals (
  id,
  parse_run_id,
  chart_by_date_id,
  date_time,
  weight,
  temperature,
  respiratory_rate,
  heart_rate,
  bp_systolic,
  bp_diastolic,
  raw_text,
  row_order,
  created_at
)
select
  id,
  parse_run_id,
  chart_by_date_id,
  date_time,
  weight,
  temperature,
  respiratory_rate,
  heart_rate,
  bp_systolic,
  bp_diastolic,
  raw_text,
  row_order,
  created_at
from staging.result_vitals
on conflict (id) do update set
  parse_run_id = excluded.parse_run_id,
  chart_by_date_id = excluded.chart_by_date_id,
  date_time = excluded.date_time,
  weight = excluded.weight,
  temperature = excluded.temperature,
  respiratory_rate = excluded.respiratory_rate,
  heart_rate = excluded.heart_rate,
  bp_systolic = excluded.bp_systolic,
  bp_diastolic = excluded.bp_diastolic,
  raw_text = excluded.raw_text,
  row_order = excluded.row_order,
  created_at = excluded.created_at;

commit;
