-- TEMPLATE ONLY — do not run blindly.
--
-- FIRST (once): run scripts/sql/create-staging-pdf-hospitals.sql, then load data into staging.pdf_hospitals.
-- Without that table you get: relation "staging.pdf_hospitals" does not exist.
--
-- This repo’s Supabase layout (dashboard-data):
--   • Canonical hospitals live in core.hospitals (see supabase/schema.sql: legacy public.hospitals
--     is moved into core when present).
--   • public.hospitals may not exist after cleanup (scripts/sql/drop-public-legacy-tables.sql).
--   • So: load a snapshot from the PDF/other DB into staging.pdf_hospitals (below), then run this.
--
-- Prerequisites:
--   staging.pdf_hospitals populated from the attach DB (same column names as used in the CTE),
--     or adjust the JOIN table name.
--   Rows in core.hospital_pdf_merge_map (source_hospital_id = attach-side uuid, core_hospital_id = core.hospitals.id text).
--
-- Merge rules (from plan):
--   SET name, brandColor, logoUrl, and PDF-only snake_case columns from source.
--   Do NOT set: createdAt, updatedAt, address, addressDetail,
--     naver_blog_id, smartplace_stat_url, debug_port (keep core values).
--   Ignore source address / address line fields.
--
-- Before production run:
--   1) Verify slug uniqueness among mapped rows: SELECT slug, count(*) FROM ... GROUP BY 1 HAVING count(*) > 1;
--   2) Run in a transaction on staging first.
--
-- One-time snapshot DDL (run on OUR DB if staging.pdf_hospitals does not exist yet; tune types to match export):
--
-- create schema if not exists staging;
-- create table if not exists staging.pdf_hospitals (
--   id uuid primary key,
--   name_ko text,
--   name_en text,
--   phone text,
--   slug text,
--   code text,
--   director_name_ko text,
--   seal_url text,
--   cover_pet_image_url text,
--   tagline_line1 text,
--   tagline_line2 text,
--   director_title text,
--   blog_intro text,
--   blog_outro text,
--   brand_color_hex text,
--   logo_url text
-- );
-- -- Then: COPY / INSERT from the attach DB dump into staging.pdf_hospitals.

begin;

with src as (
  select
    m.core_hospital_id,
    h.name_ko,
    h.name_en,
    h.phone,
    h.slug,
    h.code,
    h.director_name_ko,
    h.seal_url,
    h.cover_pet_image_url,
    h.tagline_line1,
    h.tagline_line2,
    h.director_title,
    h.blog_intro,
    h.blog_outro,
    h.brand_color_hex,
    h.logo_url
  from core.hospital_pdf_merge_map m
  join staging.pdf_hospitals h on h.id = m.source_hospital_id
)
update core.hospitals c
set
  name = src.name_ko,
  "brandColor" = src.brand_color_hex,
  "logoUrl" = src.logo_url,
  name_en = src.name_en,
  phone = src.phone,
  slug = src.slug,
  code = src.code,
  director_name_ko = src.director_name_ko,
  seal_url = src.seal_url,
  cover_pet_image_url = src.cover_pet_image_url,
  tagline_line1 = src.tagline_line1,
  tagline_line2 = src.tagline_line2,
  director_title = src.director_title,
  blog_intro = src.blog_intro,
  blog_outro = src.blog_outro
from src
where c.id = src.core_hospital_id;

commit;

-- Rollback recipe (manual): restore affected rows from backup or reverse UPSERT from pre-merge snapshot.
