-- ATTACH (PDF) DB — decoder_json 한 칸 → scripts/sql/tmp/paste-result-vitals-export-for-decoder.json

select coalesce(
  json_agg(
    json_build_object(
      'format',
      format(
        $f$insert into staging.result_vitals (
  id, parse_run_id, chart_by_date_id, date_time, weight, temperature, respiratory_rate,
  heart_rate, bp_systolic, bp_diastolic, raw_text, row_order, created_at
) values (
  %L::uuid, %L::uuid, %L::uuid, %L, %L, %L, %L,
  %L, %L, %L, %L, %L::integer, %L::timestamptz
);$f$,
        r.id::text,
        r.parse_run_id::text,
        r.chart_by_date_id,
        r.date_time,
        r.weight,
        r.temperature,
        r.respiratory_rate,
        r.heart_rate,
        r.bp_systolic,
        r.bp_diastolic,
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
from public.result_vitals r;
