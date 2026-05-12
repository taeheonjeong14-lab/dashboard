-- TEMPLATE — 우리 DB. staging 적재 후 실행.
-- 순서: migrate chart_pdf.report_case_images → create-staging-report-case-images.sql (또는 일괄 스크립트) → 디코더 INSERT → 이 파일
--
-- 디코더 예:
--   node scripts/sql/decode-supabase-format-json-to-sql.mjs scripts/sql/tmp/paste-report-case-images-export-for-decoder.json scripts/sql/tmp/report-case-images-inserts.sql report_case_images
--
-- chart_pdf.parse_runs 가 먼저 채워져 있어야 FK 성립.

begin;

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

commit;
