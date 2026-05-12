-- ATTACH (PDF) DB — 실행 후 decoder_json 한 칸 복사 → scripts/sql/tmp/paste-result-basic-info-export-for-decoder.json

select coalesce(
  json_agg(
    json_build_object(
      'format',
      format(
        $f$insert into staging.result_basic_info (
  id, parse_run_id, owner_name, patient_name, species, breed, birth, sex,
  created_at, hospital_name, age
) values (
  %L::uuid, %L::uuid, %L, %L, %L, %L, %L, %L,
  %L::timestamptz, %L, %L::integer
);$f$,
        id::text,
        parse_run_id::text,
        owner_name,
        patient_name,
        species,
        breed,
        birth,
        sex,
        created_at,
        hospital_name,
        age
      )
    )
    order by
      created_at,
      id
  ),
  '[]'::json
)::text as decoder_json
from public.result_basic_info;
