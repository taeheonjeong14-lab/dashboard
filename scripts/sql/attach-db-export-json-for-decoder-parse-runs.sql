-- ATTACH (PDF) DB — Supabase SQL Editor 에서 실행.
--
-- 행마다 raw_payload 가 크면 디코더 결과가 SQL Editor 최대 크기를 넘을 수 있음 →
--   node scripts/sql/split-staging-inserts-into-batches.mjs scripts/sql/tmp/parse-runs-inserts.sql parse_runs --max-chars=150000
-- 로 배치 파일 여러 개로 나눠 순서대로 실행하거나, psql 로 전체 파일 직접 실행.
-- 결과 한 셀 전체를 복사 → scripts/sql/tmp/paste-parse-runs-export-for-decoder.json 에 저장(전체 교체).
-- 그리드가 [{ "decoder_json": "[...]" }] 형태여도 decode-supabase-format-json-to-sql.mjs 가 안쪽 배열을 풀어 처리함.
--
-- 컬럼: 인트로스펙션 기준 (updated_at 없음). chart_pdf 적재 전 chart_pdf.documents 가 있어야 FK 성립.

select coalesce(
  json_agg(
    json_build_object(
      'format',
      format(
        $f$insert into staging.parse_runs (
  id, document_id, status, provider, model, parser_version, raw_payload, error_message, created_at, friendly_id, hospital_id, ai_assessment
) values (
  %L::uuid, %L::uuid, %L, %L, %L, %L, %L::jsonb, %L, %L::timestamptz, %L, %L::uuid, %L::jsonb
);$f$,
        id::text,
        document_id::text,
        status,
        provider,
        model,
        parser_version,
        raw_payload::text,
        error_message,
        created_at,
        friendly_id,
        hospital_id::text,
        ai_assessment::text
      )
    )
    order by
      created_at,
      id
  ),
  '[]'::json
)::text as decoder_json
from public.parse_runs;
