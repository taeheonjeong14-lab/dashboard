-- Add DDx-style admin fields to core.users so admin-web can manage users.
-- Safe to run multiple times.

alter table if exists core.users
  add column if not exists approved boolean not null default false;

alter table if exists core.users
  add column if not exists rejected boolean not null default false;

alter table if exists core.users
  add column if not exists active boolean not null default true;

alter table if exists core.users
  add column if not exists deleted_at timestamptz;

alter table if exists core.users
  add column if not exists custom_hospital_name text;

alter table if exists core.users
  add column if not exists hospital_address text;

alter table if exists core.users
  add column if not exists hospital_address_detail text;

create index if not exists idx_core_users_deleted_at
  on core.users (deleted_at);

create index if not exists idx_core_users_approved_rejected
  on core.users (approved, rejected);

-- admin-web user management APIs run with SUPABASE_SERVICE_ROLE_KEY.
grant select, insert, update, delete on table core.users to service_role;

