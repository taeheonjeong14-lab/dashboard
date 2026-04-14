create schema if not exists core;
create schema if not exists analytics;
create schema if not exists robovet;

do $$
begin
  -- Core tables
  if exists (select 1 from information_schema.tables where table_schema = 'public' and table_name = 'email_verifications')
     and not exists (select 1 from information_schema.tables where table_schema = 'core' and table_name = 'email_verifications') then
    alter table public.email_verifications set schema core;
  end if;

  if exists (select 1 from information_schema.tables where table_schema = 'public' and table_name = 'users')
     and not exists (select 1 from information_schema.tables where table_schema = 'core' and table_name = 'users') then
    alter table public.users set schema core;
  end if;

  if exists (select 1 from information_schema.tables where table_schema = 'public' and table_name = 'hospitals')
     and not exists (select 1 from information_schema.tables where table_schema = 'core' and table_name = 'hospitals') then
    alter table public.hospitals set schema core;
  end if;

  -- Analytics tables/views
  if exists (
    select 1
    from information_schema.tables
    where table_schema = 'public'
      and table_name = 'analytics_daily_metrics'
  )
  and not exists (
    select 1
    from information_schema.tables
    where table_schema = 'analytics'
      and table_name = 'analytics_daily_metrics'
  ) then
    alter table public.analytics_daily_metrics set schema analytics;
  end if;

  if exists (
    select 1
    from information_schema.views
    where table_schema = 'public'
      and table_name = 'analytics_daily_metrics_daily_view'
  )
  and not exists (
    select 1
    from information_schema.views
    where table_schema = 'analytics'
      and table_name = 'analytics_daily_metrics_daily_view'
  ) then
    alter view public.analytics_daily_metrics_daily_view set schema analytics;
  end if;
end $$;

-- Grants by schema ownership
grant usage on schema core to service_role, authenticated, anon;
grant usage on schema analytics to service_role, authenticated, anon;
grant usage on schema robovet to service_role;

grant select on table core.hospitals to service_role, authenticated, anon;
grant select on table core.users to service_role, authenticated;
grant select, insert, update on table analytics.analytics_daily_metrics to service_role;
grant select on table analytics.analytics_daily_metrics_daily_view to service_role, authenticated;

grant all privileges on all tables in schema robovet to service_role;

create table if not exists analytics.analytics_daily_metrics (
  account_id text not null,
  hospital_id text,
  hospital_name text,
  source text not null,
  metric_date date not null,
  metric_key text not null,
  metric_value numeric,
  metadata jsonb not null default '{}'::jsonb,
  collected_at timestamptz not null default now(),
  primary key (account_id, source, metric_date, metric_key)
);

alter table if exists core.hospitals
  add column if not exists naver_blog_id text;

create unique index if not exists uq_hospitals_naver_blog_id
  on core.hospitals (naver_blog_id)
  where naver_blog_id is not null;

alter table if exists core.users
  add column if not exists role text not null default 'member';

alter table if exists core.users
  add column if not exists hospital_id text;

create index if not exists idx_core_users_hospital
  on core.users (hospital_id);

create index if not exists idx_analytics_daily_metrics_account_date
  on analytics.analytics_daily_metrics (account_id, metric_date desc);

create index if not exists idx_analytics_daily_metrics_hospital_date
  on analytics.analytics_daily_metrics (hospital_id, metric_date desc);

create or replace view analytics.analytics_daily_metrics_daily_view as
select
  m.metric_date,
  m.hospital_id,
  coalesce(max(m.hospital_name), max(h.name)) as hospital_name,
  m.account_id,
  max(case when m.metric_key = 'blog_views' then m.metric_value end) as blog_views,
  max(case when m.metric_key = 'blog_unique_visitors' then m.metric_value end) as blog_unique_visitors,
  max(case when m.metric_key = 'smartplace_inflow' then m.metric_value end) as smartplace_inflow,
  max(m.collected_at) as last_collected_at
from analytics.analytics_daily_metrics m
left join core.hospitals h
  on h.id::text = m.hospital_id
group by
  m.metric_date,
  m.hospital_id,
  m.account_id;

alter table core.users enable row level security;
alter table analytics.analytics_daily_metrics enable row level security;

drop policy if exists "users_select_own" on core.users;
create policy "users_select_own"
  on core.users
  for select
  to authenticated
  using (id::text = auth.uid()::text);

drop policy if exists "metrics_select_assigned_hospitals" on analytics.analytics_daily_metrics;
create policy "metrics_select_assigned_hospitals"
  on analytics.analytics_daily_metrics
  for select
  to authenticated
  using (
    exists (
      select 1
      from core.users u
      where u.id::text = auth.uid()::text
        and (
          lower(coalesce(u.role, 'member')) = 'admin'
          or u.hospital_id = analytics_daily_metrics.hospital_id
        )
    )
  );

do $$
declare
  t record;
begin
  -- Everything else in public => robovet
  for t in
    select tablename
    from pg_tables
    where schemaname = 'public'
      and tablename not in ('email_verifications', 'hospitals', 'users', 'analytics_daily_metrics', 'spatial_ref_sys')
  loop
    execute format('alter table public.%I set schema robovet', t.tablename);
  end loop;
end $$;
