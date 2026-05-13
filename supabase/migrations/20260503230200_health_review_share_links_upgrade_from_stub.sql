-- Upgrades health_report.health_review_share_links when an older stub migration created only:
--   id, parse_run_id, token, created_at, updated_at
-- Fresh installs skip this path (no column `token`).
-- Safe to apply multiple times (checks column presence).

do $$
begin
  if to_regclass('health_report.health_review_share_links') is null then
    return;
  end if;

  if exists (
    select 1
    from information_schema.columns
    where table_schema = 'health_report'
      and table_name = 'health_review_share_links'
      and column_name = 'token'
  ) then
    alter table health_report.health_review_share_links
      drop constraint if exists health_review_share_links_token_key;

    alter table health_report.health_review_share_links
      rename column token to token_hash;

    alter table health_report.health_review_share_links
      add column content_type text not null default 'health_checkup';

    alter table health_report.health_review_share_links
      alter column content_type drop default;

    alter table health_report.health_review_share_links
      add column expires_at timestamptz not null default (now() + interval '100 years');

    alter table health_report.health_review_share_links
      alter column expires_at drop default;

    alter table health_report.health_review_share_links add column revoked_at timestamptz;
    alter table health_report.health_review_share_links add column created_by text;
    alter table health_report.health_review_share_links add column last_accessed_at timestamptz;

    alter table health_report.health_review_share_links
      add constraint health_review_share_links_token_hash_key unique (token_hash);

    create index if not exists health_review_share_links_active_idx
      on health_report.health_review_share_links (content_type, expires_at, revoked_at);
  end if;
end $$;
