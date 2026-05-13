alter table if exists core.hospitals
  add column if not exists googleads_customer_id text;

alter table if exists core.hospitals
  add column if not exists googleads_refresh_token_encrypted text;

alter table if exists core.hospitals
  add column if not exists googleads_is_active boolean not null default false;

alter table if exists core.hospitals
  add column if not exists googleads_last_synced_at timestamptz;

alter table if exists core.hospitals
  add column if not exists googleads_metadata jsonb not null default '{}'::jsonb;

create unique index if not exists uq_hospitals_googleads_customer_id
  on core.hospitals (googleads_customer_id)
  where googleads_customer_id is not null;

