-- Run once on OUR Supabase (SQL Editor) before merge-core-hospitals-from-pdf-source-template.sql.
-- Then load rows from the attach DB into staging.pdf_hospitals (COPY / INSERT).

create schema if not exists staging;

create table if not exists staging.pdf_hospitals (
  id uuid primary key,
  name_ko text,
  name_en text,
  phone text,
  slug text,
  code text,
  director_name_ko text,
  seal_url text,
  cover_pet_image_url text,
  tagline_line1 text,
  tagline_line2 text,
  director_title text,
  blog_intro text,
  blog_outro text,
  brand_color_hex text,
  logo_url text
);
