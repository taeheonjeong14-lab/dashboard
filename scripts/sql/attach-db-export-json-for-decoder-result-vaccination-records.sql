-- ATTACH (PDF) DB — decoder_json 한 칸 → scripts/sql/tmp/paste-result-vaccination-records-export-for-decoder.json

select coalesce(
  json_agg(
    json_build_object(
      'format',
      format(
        $f$insert into staging.result_vaccination_records (
  id, parse_run_id, record_type, dose_order, product_name, administered_date, "sign", page, row_order
) values (
  %L::uuid, %L::uuid, %L, %L, %L, %L, %L, %L::integer, %L::integer
);$f$,
        id::text,
        parse_run_id::text,
        record_type,
        dose_order,
        product_name,
        administered_date,
        r."sign",
        page,
        row_order
      )
    )
    order by
      page,
      row_order,
      id
  ),
  '[]'::json
)::text as decoder_json
from public.result_vaccination_records r;
