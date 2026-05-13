-- chart_pdf.documents — attach public.documents (introspection 2026-05).
-- id, file_name, file_hash, chart_type, created_at — outgoing FK 없음.

create table if not exists chart_pdf.documents (
  id uuid primary key default gen_random_uuid(),
  file_name text not null,
  file_hash text,
  chart_type text not null default 'intovet'::text,
  created_at timestamptz not null default now()
);

comment on table chart_pdf.documents is
  'Migrated from attach public.documents; columns match attach introspection (file_name, file_hash, chart_type).';

grant select, insert, update, delete on table chart_pdf.documents to service_role;
grant select on table chart_pdf.documents to authenticated;
