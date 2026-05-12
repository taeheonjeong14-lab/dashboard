-- RUN ON THE ATTACH (PDF) DB — NOT 우리 DB.
-- 결과 행마다 나오는 문자열 전체를 복사해 우리 DB에서 실행 (표 헤더 | 같은 거 빼고 INSERT만).
--
-- 대상: 우리 DB에는 없고 붙이는 DB에만 있던 병원 4곳 sourceHospital UUID.

select format(
  $fmt$
insert into staging.pdf_hospitals (
  id, name_ko, name_en, phone, slug, code, director_name_ko, seal_url,
  cover_pet_image_url, tagline_line1, tagline_line2, director_title,
  blog_intro, blog_outro, brand_color_hex, logo_url
) values (
  %L::uuid, %L, %L, %L, %L, %L, %L, %L, %L, %L, %L, %L, %L, %L, %L, %L
);
$fmt$,
  id,
  name_ko,
  name_en,
  phone,
  slug,
  code,
  director_name_ko,
  seal_url,
  cover_pet_image_url,
  tagline_line1,
  tagline_line2,
  director_title,
  blog_intro,
  blog_outro,
  brand_color_hex,
  logo_url
)
from public.hospitals
where id in (
  '06447f13-958f-4252-9c17-1505c5239e33'::uuid,
  '34eba3f2-5062-405a-8160-33ef17dcc77c'::uuid,
  '39035676-2ec3-42c4-9a1c-922a680632b8'::uuid,
  '57d29d60-abde-4811-a978-1660fd4a54ae'::uuid
);
