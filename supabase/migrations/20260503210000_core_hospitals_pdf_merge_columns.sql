-- core.hospitals: columns sourced from legacy PDF-app hospitals row merge (snapshot usually loaded into staging.pdf_hospitals on this DB; canonical table here is core.hospitals, not public.hospitals).
--
-- Policy (name_en / slug):
--   Hospitals without a merged PDF-app row keep these columns NULL — no default empty string.
--   Populate only via UPDATE from source after filling core.hospital_pdf_merge_map.
--
-- Policy (slug uniqueness):
--   Non-null, non-blank slugs must be globally unique (partial unique index below).
--
-- Preserved on merge (do not overwrite from source in DML): createdAt, updatedAt,
--   address, addressDetail, naver_blog_id, smartplace_stat_url, debug_port.

alter table if exists core.hospitals
  add column if not exists name_en text,
  add column if not exists phone text,
  add column if not exists slug text,
  add column if not exists code text,
  add column if not exists director_name_ko text,
  add column if not exists seal_url text,
  add column if not exists cover_pet_image_url text,
  add column if not exists tagline_line1 text,
  add column if not exists tagline_line2 text,
  add column if not exists director_title text,
  add column if not exists blog_intro text,
  add column if not exists blog_outro text;

create unique index if not exists uq_core_hospitals_slug_when_set
  on core.hospitals (slug)
  where slug is not null and btrim(slug) <> '';

create table if not exists core.hospital_pdf_merge_map (
  source_hospital_id uuid primary key,
  core_hospital_id text not null references core.hospitals (id)
    on update cascade on delete cascade,
  constraint uq_hospital_pdf_merge_map_core unique (core_hospital_id)
);

comment on table core.hospital_pdf_merge_map is
  'Maps legacy PDF-app hospital UUID (source_hospital_id) to canonical core.hospitals.id (text). Fill via CSV/SQL before merge-core-hospitals-from-pdf-source-template.sql.';
