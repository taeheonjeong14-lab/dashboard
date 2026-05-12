-- TEMPLATE — 우리 DB. staging 에 행을 넣은 뒤 실행.
--
-- 순서:
--   1) scripts/sql/create-staging-documents.sql (기존 가정 스키마면 drop 후 재생성)
--   2) 디코더로 만든 INSERT → staging.documents 적재
--   3) supabase migration 으로 chart_pdf.documents 스키마 확인
--   4) 이 파일 실행 → chart_pdf.documents 반영
--
-- 디코더 예:
--   node scripts/sql/decode-supabase-format-json-to-sql.mjs scripts/sql/tmp/paste-documents-export-for-decoder.json scripts/sql/tmp/documents-inserts.sql documents

begin;

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

commit;
