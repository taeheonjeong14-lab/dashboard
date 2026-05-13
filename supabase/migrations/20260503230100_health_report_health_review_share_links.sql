-- health_report.health_review_share_links — attach public.health_review_share_links (introspection 2026-05).

create table if not exists health_report.health_review_share_links (
  id uuid primary key default gen_random_uuid(),
  parse_run_id uuid not null,
  content_type text not null,
  token_hash text not null,
  expires_at timestamptz not null,
  revoked_at timestamptz null,
  created_by text null,
  last_accessed_at timestamptz null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint health_review_share_links_token_hash_key unique (token_hash)
);

create index if not exists health_review_share_links_parse_run_id_idx
  on health_report.health_review_share_links (parse_run_id);

create index if not exists health_review_share_links_active_idx
  on health_report.health_review_share_links (content_type, expires_at, revoked_at);

-- FK (attach: health_review_share_links_parse_run_id_fkey → public.parse_runs):
--   alter table health_report.health_review_share_links
--     add constraint health_review_share_links_parse_run_id_fkey
--     foreign key (parse_run_id) references chart_pdf.parse_runs (id)
--     on update cascade on delete cascade;

comment on table health_report.health_review_share_links is
  'Migrated from attach public.health_review_share_links.';

grant select, insert, update, delete on table health_report.health_review_share_links to service_role;
grant select on table health_report.health_review_share_links to authenticated;
