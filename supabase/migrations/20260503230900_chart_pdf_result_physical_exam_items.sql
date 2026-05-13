-- chart_pdf.result_physical_exam_items — attach public.result_physical_exam_items (introspection 2026-05).

create table if not exists chart_pdf.result_physical_exam_items (
  id uuid primary key default gen_random_uuid(),
  parse_run_id uuid not null,
  chart_by_date_id uuid,
  date_time text not null,
  item_name text not null,
  reference_range text,
  value_text text not null,
  unit text,
  raw_text text,
  row_order integer not null default 0,
  created_at timestamptz not null default now(),
  constraint result_physical_exam_items_parse_run_id_fkey
    foreign key (parse_run_id) references chart_pdf.parse_runs (id)
    on update cascade on delete cascade,
  constraint result_physical_exam_items_chart_by_date_id_fkey
    foreign key (chart_by_date_id) references chart_pdf.result_chart_by_date (id)
    on update cascade on delete set null
);

create index if not exists idx_result_physical_exam_items_parse_run_id
  on chart_pdf.result_physical_exam_items (parse_run_id);

create index if not exists idx_result_physical_exam_items_chart_by_date_id
  on chart_pdf.result_physical_exam_items (chart_by_date_id);

create index if not exists idx_result_physical_exam_items_date_time
  on chart_pdf.result_physical_exam_items (date_time);

comment on table chart_pdf.result_physical_exam_items is
  'Migrated from attach public.result_physical_exam_items.';

grant select, insert, update, delete on table chart_pdf.result_physical_exam_items to service_role;
grant select on table chart_pdf.result_physical_exam_items to authenticated;
