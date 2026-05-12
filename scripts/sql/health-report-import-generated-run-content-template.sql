-- TEMPLATE — 우리 DB. Attach `public.generated_run_content` 와 동일 컬럼의 스테이징을 채운 뒤 이관.
-- 이 테이블에는 hospital_id 가 없음 → 병원 매핑은 parse_runs 이관 시 hospital_id 와 함께 처리하거나,
--   필요하면 나중에 denormalized 컬럼을 ALTER 로 추가.
--
-- 스테이징: scripts/sql/create-staging-generated-run-content.sql
--   (일괄: create-staging-all-attach-decoder-imports.sql)
--
-- 데이터 적재 후:

begin;

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

commit;

-- 주의: 위 ON CONFLICT 는 우리 쪽에 UNIQUE(parse_run_id, content_type) 가 있을 때만 동작.
-- 최초 적재만 할 거면 일반 INSERT 만 쓰면 됨.
