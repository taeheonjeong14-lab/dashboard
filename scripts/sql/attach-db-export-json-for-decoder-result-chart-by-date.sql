-- ATTACH (PDF) DB — decoder_json 한 칸 → scripts/sql/tmp/paste-result-chart-by-date-export-for-decoder.json

select coalesce(
  json_agg(
    json_build_object(
      'format',
      format(
        $f$insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  %L::uuid, %L::uuid, %L, %L, %L, %L::boolean, %L::integer, %L::timestamptz
);$f$,
        id::text,
        parse_run_id::text,
        date_time,
        body_text,
        plan_text,
        plan_detected,
        row_order,
        created_at
      )
    )
    order by
      created_at,
      id
  ),
  '[]'::json
)::text as decoder_json
from public.result_chart_by_date;
