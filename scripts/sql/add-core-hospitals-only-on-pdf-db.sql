-- 우리 DB(SQL Editor)에서 실행.
-- 붙이는 DB에만 있던 병원 4곳: core.hospitals 행 생성 + hospital_pdf_merge_map 연결.
-- 이후 붙이는 DB에서 동일한 방식으로 이 4개 source uuid 행만 INSERT into staging.pdf_hospitals 한 뒤
-- merge-core-hospitals-from-pdf-source-template.sql 의 begin…commit 블록을 다시 실행.

-- 새 core id (한 번 배정; 충돌 시 다른 UUID로 교체)
-- 백동물의료센터       <- 06447f13-958f-4252-9c17-1505c5239e33
-- 정든동물병원         <- 34eba3f2-5062-405a-8160-33ef17dcc77c
-- 정담동물메디컬센터   <- 39035676-2ec3-42c4-9a1c-922a680632b8
-- 분당중앙동물병원     <- 57d29d60-abde-4811-a978-1660fd4a54ae

begin;

insert into core.hospitals (id, name, "createdAt", "updatedAt") values
  ('c485b488-0968-4983-a1e5-7b46568833c4', '백동물의료센터', now(), now()),
  ('9cb53e94-41bf-44de-8058-f1f2df0c501c', '정든동물병원', now(), now()),
  ('79c80ec0-8e2e-4e98-ac7a-c97939d1a6bf', '정담동물메디컬센터', now(), now()),
  ('c1d80ebc-a18c-4046-accb-0df2785a160c', '분당중앙동물병원', now(), now());

insert into core.hospital_pdf_merge_map (source_hospital_id, core_hospital_id) values
  ('06447f13-958f-4252-9c17-1505c5239e33'::uuid, 'c485b488-0968-4983-a1e5-7b46568833c4'),
  ('34eba3f2-5062-405a-8160-33ef17dcc77c'::uuid, '9cb53e94-41bf-44de-8058-f1f2df0c501c'),
  ('39035676-2ec3-42c4-9a1c-922a680632b8'::uuid, '79c80ec0-8e2e-4e98-ac7a-c97939d1a6bf'),
  ('57d29d60-abde-4811-a978-1660fd4a54ae'::uuid, 'c1d80ebc-a18c-4046-accb-0df2785a160c')
on conflict (source_hospital_id) do update set
  core_hospital_id = excluded.core_hospital_id;

commit;
