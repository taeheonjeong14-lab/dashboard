-- chart_pdf.result_lab_items: lab PATCH saves raw display vs canonical item_name.
-- Safe if 20260503230800 already defined the column (IF NOT EXISTS).

alter table chart_pdf.result_lab_items
  add column if not exists raw_item_name text;
