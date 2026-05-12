-- TEMPLATE — 우리 DB. staging 에 행을 넣은 뒤 실행.
--
-- 순서:
--   1) chart_pdf.documents 적재 완료 (document_id FK)
--   2) scripts/sql/create-staging-parse-runs.sql
--   3) 디코더 INSERT → staging.parse_runs
--   4) 이 파일 실행 → chart_pdf.parse_runs
--
-- 디코더 예:
--   node scripts/sql/decode-supabase-format-json-to-sql.mjs scripts/sql/tmp/paste-parse-runs-export-for-decoder.json scripts/sql/tmp/parse-runs-inserts.sql parse_runs
--
-- 이후 health_report: generated_run_content·health_review_share_links 의 parse_run_id FK 는
--   supabase/migrations 주석 참고.

begin;

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

commit;
