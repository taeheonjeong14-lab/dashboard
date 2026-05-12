-- ATTACH (PDF) DB — decoder_json 한 칸 → scripts/sql/tmp/paste-result-physical-exam-items-export-for-decoder.json

select coalesce(
  json_agg(
    json_build_object(
      'format',
      format(
        $f$insert into staging.result_physical_exam_items (
  id, parse_run_id, chart_by_date_id, date_time, item_name, reference_range,
  value_text, unit, raw_text, row_order, created_at
) values (
  %L::uuid, %L::uuid, %L::uuid, %L, %L, %L,
  %L, %L, %L, %L::integer, %L::timestamptz
);$f$,
        id::text,
        parse_run_id::text,
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
    )
    order by
      created_at,
      row_order,
      id
  ),
  '[]'::json
)::text as decoder_json
from public.result_physical_exam_items;
