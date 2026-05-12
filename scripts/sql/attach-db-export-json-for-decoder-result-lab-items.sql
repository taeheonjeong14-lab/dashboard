-- ATTACH (PDF) DB — decoder_json 한 칸 → scripts/sql/tmp/paste-result-lab-items-export-for-decoder.json

select coalesce(
  json_agg(
    json_build_object(
      'format',
      format(
        $f$insert into staging.result_lab_items (
  id, parse_run_id, date_time, item_name, value_text, unit, reference_range,
  flag, row_order, created_at, raw_item_name
) values (
  %L::uuid, %L::uuid, %L, %L, %L, %L, %L,
  %L, %L::integer, %L::timestamptz, %L
);$f$,
        id::text,
        parse_run_id::text,
        date_time,
        item_name,
        value_text,
        unit,
        reference_range,
        flag,
        row_order,
        created_at,
        raw_item_name
      )
    )
    order by
      created_at,
      row_order nulls last,
      id
  ),
  '[]'::json
)::text as decoder_json
from public.result_lab_items;
