-- ATTACH (PDF) DB — decoder_json 한 칸 → scripts/sql/tmp/paste-result-plan-rows-export-for-decoder.json

select coalesce(
  json_agg(
    json_build_object(
      'format',
      format(
        $f$insert into staging.result_plan_rows (
  id, parse_run_id, chart_by_date_id, code, treatment_prescription, qty, unit, "day", total, route, sign_id, raw_text, row_order, created_at
) values (
  %L::uuid, %L::uuid, %L::uuid, %L, %L, %L, %L, %L, %L, %L, %L, %L, %L::integer, %L::timestamptz
);$f$,
        r.id::text,
        r.parse_run_id::text,
        r.chart_by_date_id,
        r.code,
        r.treatment_prescription,
        r.qty,
        r.unit,
        r."day",
        r.total,
        r.route,
        r.sign_id,
        r.raw_text,
        r.row_order,
        r.created_at
      )
    )
    order by
      r.created_at,
      r.row_order,
      r.id
  ),
  '[]'::json
)::text as decoder_json
from public.result_plan_rows r;
