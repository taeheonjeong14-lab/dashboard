alter table if exists core.hospitals
  add column if not exists searchad_customer_id text;

alter table if exists core.hospitals
  add column if not exists searchad_api_license text;

alter table if exists core.hospitals
  add column if not exists searchad_secret_key_encrypted text;

alter table if exists core.hospitals
  add column if not exists searchad_is_active boolean not null default false;

alter table if exists core.hospitals
  add column if not exists searchad_last_synced_at timestamptz;

create unique index if not exists uq_hospitals_searchad_customer_id
  on core.hospitals (searchad_customer_id)
  where searchad_customer_id is not null;

