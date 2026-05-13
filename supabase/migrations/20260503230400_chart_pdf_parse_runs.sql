-- chart_pdf.parse_runs — attach public.parse_runs (introspection 2026-05).
-- updated_at 컬럼 없음. documents 선행 적재 후 FK 만족.

create table if not exists chart_pdf.parse_runs (
  id uuid primary key default gen_random_uuid(),
  document_id uuid not null,
  status text not null,
  provider text,
  model text,
  parser_version text,
  raw_payload jsonb,
  error_message text,
  created_at timestamptz not null default now(),
  friendly_id text,
  hospital_id uuid,
  ai_assessment jsonb,
  constraint parse_runs_document_id_fkey
    foreign key (document_id) references chart_pdf.documents (id)
    on update cascade on delete cascade
);

create index if not exists chart_pdf_parse_runs_document_id_idx
  on chart_pdf.parse_runs (document_id);

create unique index if not exists parse_runs_friendly_id_key
  on chart_pdf.parse_runs (friendly_id)
  where friendly_id is not null;

create index if not exists chart_pdf_parse_runs_hospital_id_created_at_idx
  on chart_pdf.parse_runs (hospital_id, created_at);

create index if not exists chart_pdf_parse_runs_hospital_id_idx
  on chart_pdf.parse_runs (hospital_id);

-- FK (Attach: parse_runs_hospital_id_fkey → public.hospitals):
--   우리 DB 병원 정규화 후 core.hospitals 등과 연결 시 추가.

comment on table chart_pdf.parse_runs is
  'Migrated from attach public.parse_runs; document_id → chart_pdf.documents.';

grant select, insert, update, delete on table chart_pdf.parse_runs to service_role;
grant select on table chart_pdf.parse_runs to authenticated;
