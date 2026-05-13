-- chart_pdf.result_lab_items — attach public.result_lab_items (introspection 2026-05).

create table if not exists chart_pdf.result_lab_items (
  id uuid primary key default gen_random_uuid(),
  parse_run_id uuid not null,
  date_time text,
  item_name text not null,
  value_text text,
  unit text,
  reference_range text,
  flag text,
  row_order integer,
  created_at timestamptz not null default now(),
  raw_item_name text,
  constraint result_lab_items_parse_run_id_fkey
    foreign key (parse_run_id) references chart_pdf.parse_runs (id)
    on update cascade on delete cascade
);

create index if not exists idx_result_lab_items_parse_run_id
  on chart_pdf.result_lab_items (parse_run_id);

create index if not exists idx_result_lab_items_date_time
  on chart_pdf.result_lab_items (date_time);

comment on table chart_pdf.result_lab_items is
  'Migrated from attach public.result_lab_items.';

grant select, insert, update, delete on table chart_pdf.result_lab_items to service_role;
grant select on table chart_pdf.result_lab_items to authenticated;
