-- ATTACH (PDF) DB — Supabase SQL Editor 에서 실행.
-- 결과 decoder_json 한 칸 전체 복사 → scripts/sql/tmp/paste-report-case-images-export-for-decoder.json
-- 행이 많으면 SQL Editor 한도·파일 크기 이슈 → psql 또는 LIMIT/OFFSET 로 나눠 실행.

select coalesce(
  json_agg(
    json_build_object(
      'format',
      format(
        $f$insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  %L::uuid, %L::uuid, %L::date, %L, %L, %L, %L,
  %L::boolean, %L, %L, %L::integer, %L::timestamptz,
  %L::jsonb, %L, %L
);$f$,
        id::text,
        parse_run_id::text,
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
        finding_spots::text,
        finding_confidence,
        related_assessment_condition
      )
    )
    order by
      created_at,
      id
  ),
  '[]'::json
)::text as decoder_json
from public.report_case_images;
