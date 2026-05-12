-- TEMPLATE — staging 적재 후 chart_pdf 반영. parse_runs 선행.

begin;

insert into chart_pdf.result_basic_info (
  id,
  parse_run_id,
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
select
  id,
  parse_run_id,
  owner_name,
  patient_name,
  species,
  breed,
  birth,
  sex,
  created_at,
  hospital_name,
  age
from staging.result_basic_info
on conflict (parse_run_id) do update set
  owner_name = excluded.owner_name,
  patient_name = excluded.patient_name,
  species = excluded.species,
  breed = excluded.breed,
  birth = excluded.birth,
  sex = excluded.sex,
  created_at = excluded.created_at,
  hospital_name = excluded.hospital_name,
  age = excluded.age;

commit;
