insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '313339d1-da69-4c57-a697-08d37ccad396'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.276.0.7230010.3.0.3.5.1.14813896.263753912.jpg', 'radiology', 'dental', '일부 치아 주변 골 소실 및 치근단 변화가 관찰됩니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775469684735_0_fe7e0719.webp', 'image/webp', '29472'::integer, '2026-04-06 10:01:26.631828+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '5e002f09-8607-49bd-a15d-f1d5bde90bfd'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.276.0.7230010.3.0.3.5.1.14813896.572081546.jpg', 'radiology', 'dental', '여러 치아 주변의 치조골 소실 및 치근단 투과성 변화가 의심됩니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775469685321_1_71929b12.webp', 'image/webp', '31146'::integer, '2026-04-06 10:01:26.631828+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '63ec434a-07ed-4c95-a421-c0b1a1c63288'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.276.0.7230010.3.0.3.5.1.14813896.2740341731.jpg', 'radiology', 'dental', '하악 견치 부위의 치근 노출과 주변 골 소실이 뚜렷하게 관찰됩니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775469685568_2_3fa06172.webp', 'image/webp', '22190'::integer, '2026-04-06 10:01:26.631828+00'::timestamptz,
  NULL::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '968a6289-77c1-4efa-96de-f6ee046d5a3b'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.276.0.7230010.3.0.3.5.1.14813895.2564285692.jpg', 'radiology', 'dental', '치아 주변의 치조골 소실과 일부 치근의 불규칙한 형태가 관찰됩니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775469686286_5_cf69ad21.webp', 'image/webp', '36220'::integer, '2026-04-06 10:01:26.631828+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c388ac09-15fb-4570-a70f-92bb2735b310'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.276.0.7230010.3.0.3.5.1.14813895.1261349087.jpg', 'radiology', 'dental', '구강 및 비강 영역에서 미약한 골 밀도 변화와 비대칭이 관찰됩니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775469686036_4_5186ae84.webp', 'image/webp', '37676'::integer, '2026-04-06 10:01:26.631828+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c502b4c0-c701-425d-821d-1774ea989532'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.276.0.7230010.3.0.3.5.1.14813895.438684872.jpg', 'radiology', 'dental', '일부 치아 뿌리 주변의 골 밀도 변화 및 미약한 투과성이 보입니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775469685800_3_2313d85e.webp', 'image/webp', '25478'::integer, '2026-04-06 10:01:26.631828+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '599d65a1-b402-48ea-9813-d51738a3ebef'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.17348.7081.jpg', 'radiology', 'abdomen', '요추 부위에 경미한 측만증이 관찰됩니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775469801874_0_4bac7b26.webp', 'image/webp', '61602'::integer, '2026-04-06 10:03:22.538988+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '266f1ef9-8249-40fc-9dac-db7274427a95'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.10815.2675.jpg', 'radiology', 'thorax', '폐야에 간질성 패턴 증가 및 기관지 주변 침윤 가능성이 관찰되며, 기도 주변의 미묘한 변화가 있습니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775469836591_0_092b1346.webp', 'image/webp', '67884'::integer, '2026-04-06 10:03:57.201492+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '5d14c3b0-5737-43cc-8ed4-e0b18ec7f6d1'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '화면 캡처 2026-04-06 191356.png', 'radiology', 'thorax', '경부 피하에 마이크로칩이 관찰되며, 흉강 내에 선형의 이물질이 확인됩니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775470505998_0_165cd5b5.webp', 'image/webp', '42102'::integer, '2026-04-06 10:15:06.633753+00'::timestamptz,
  NULL::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'bef450c0-fe92-4dce-bcd7-6d7ba2d47e73'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '14295_19032_KakaoTalk_20260202_110104430_04.jpg', 'other', NULL, '왼쪽 치아에도 치석과 잇몸 염증이 관찰됩니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775470617094_1_6abd08a9.webp', 'image/webp', '122884'::integer, '2026-04-06 10:16:58.278731+00'::timestamptz,
  NULL::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'ec9ec43b-b51b-4efb-9cce-85437d084a43'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '14295_19030_KakaoTalk_20260202_110104430_02.jpg', 'other', NULL, '앞니와 송곳니 주변에 치석과 잇몸 염증이 보입니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775470617738_2_d4bc1d38.webp', 'image/webp', '213648'::integer, '2026-04-06 10:16:58.278731+00'::timestamptz,
  NULL::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f4eff358-457e-487a-a56a-1e7cec1d5188'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '14295_19031_KakaoTalk_20260202_110104430_03.jpg', 'other', NULL, '오른쪽 치아에 치석과 잇몸 염증이 관찰됩니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775470616302_0_609beb3b.webp', 'image/webp', '157862'::integer, '2026-04-06 10:16:58.278731+00'::timestamptz,
  NULL::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '36ead4db-fe97-4511-ba82-030a2a6b1cc5'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '14295_19032_KakaoTalk_20260202_110104430_04.jpg', 'other', NULL, '왼쪽 치아에도 상당한 양의 치석과 치태가 보이며 잇몸의 발적도 관찰됩니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775470771549_1_361b4e85.webp', 'image/webp', '122884'::integer, '2026-04-06 10:19:32.770925+00'::timestamptz,
  NULL::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '3bca775f-b304-4f4a-b666-c3fd9b7a9dee'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '14295_19030_KakaoTalk_20260202_110104430_02.jpg', 'other', NULL, '앞니 주변 잇몸에 경미한 발적과 치태가 관찰됩니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775470772248_2_f9b7d67a.webp', 'image/webp', '213648'::integer, '2026-04-06 10:19:32.770925+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8d2cb478-5ff6-4566-af60-dfad7a78ba80'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '14295_19031_KakaoTalk_20260202_110104430_03.jpg', 'other', NULL, '치아에 심한 치석과 치태가 관찰되며 잇몸 염증이 의심됩니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775470771025_0_04af1d5f.webp', 'image/webp', '157862'::integer, '2026-04-06 10:19:32.770925+00'::timestamptz,
  NULL::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '1cb9400a-508e-4c2e-9e54-4c888a637fdd'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1728915110.13.1.jpg', 'ultrasound', NULL, '장벽이 비후된 위장관 초음파 소견으로, 염증성 변화를 시사할 수 있습니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775470993518_3_2dd542a7.webp', 'image/webp', '31518'::integer, '2026-04-06 10:23:16.296328+00'::timestamptz,
  NULL::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '4f153c74-2aad-44e2-b14d-942d1e299a7b'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1728915126.14.1.jpg', 'ultrasound', NULL, '비후된 장벽과 확장된 내강을 보이는 위장관 초음파 소견입니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775470993910_4_a7edc1fc.webp', 'image/webp', '30860'::integer, '2026-04-06 10:23:16.296328+00'::timestamptz,
  NULL::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '82e3c311-a444-44ad-a4b4-75e1179064bb'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1728915166.16.1.jpg', 'ultrasound', NULL, '내부 침전물이 관찰되는 확장된 담낭 또는 위장관의 초음파 소견입니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775470993055_1_6be7451d.webp', 'image/webp', '34874'::integer, '2026-04-06 10:23:16.296328+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c7036a5b-5f97-403b-bc13-01e6b9c069bb'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1728915141.15.1.jpg', 'ultrasound', NULL, '복부 장기의 전반적인 초음파 영상으로, 뚜렷한 병변은 관찰되지 않습니다.',
  'f'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775470990289_0_c0671994.webp', 'image/webp', '32320'::integer, '2026-04-06 10:23:16.296328+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'ed35f38e-ad8b-4a90-89a6-d961d04d5520'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1728915182.17.1.jpg', 'ultrasound', NULL, '복부 장기의 초음파 영상으로, 특이 소견은 뚜렷하게 관찰되지 않습니다.',
  'f'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775470993279_2_25aa930e.webp', 'image/webp', '35924'::integer, '2026-04-06 10:23:16.296328+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '38dba236-2024-4f7c-8f93-4663b5c5beb0'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1770028571.3.1.jpg', 'ultrasound', NULL, '강한 후방 음영을 동반한 고에코성 구조물이 확인됩니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775471048614_2_b7c260fe.webp', 'image/webp', '34090'::integer, '2026-04-06 10:24:09.571743+00'::timestamptz,
  NULL::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '56886254-7603-411e-a2ad-1c3a838df3ce'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1770028623.7.1.jpg', 'ultrasound', NULL, '복강 내 낭성 또는 복합성 병변이 관찰됩니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775471048069_0_dfe6f390.webp', 'image/webp', '27316'::integer, '2026-04-06 10:24:09.571743+00'::timestamptz,
  NULL::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8fae9756-f67c-4b7f-9096-39b7241f9931'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1770028598.5.1.jpg', 'ultrasound', NULL, '뚜렷한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775471049065_4_c1f5e9cd.webp', 'image/webp', '28288'::integer, '2026-04-06 10:24:09.571743+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'a31fecb7-d4d1-43ac-ae37-f0fbccdb24f5'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1770028574.4.1.jpg', 'ultrasound', NULL, '강한 후방 음영을 동반한 고에코성 구조물이 확인됩니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775471048850_3_44c1d813.webp', 'image/webp', '34170'::integer, '2026-04-06 10:24:09.571743+00'::timestamptz,
  NULL::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b57da3ad-3fcb-4fce-8437-9b088cdd85d5'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1770028651.8.1.jpg', 'ultrasound', NULL, '우측 신장의 내부 에코 구조에 변화가 관찰됩니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775471048385_1_74e1b89c.webp', 'image/webp', '33034'::integer, '2026-04-06 10:24:09.571743+00'::timestamptz,
  NULL::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e0291812-b2a3-4756-a4a6-2d4e17556b02'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1770028613.6.1.jpg', 'ultrasound', NULL, '뚜렷한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775471049288_5_7baa7abf.webp', 'image/webp', '28022'::integer, '2026-04-06 10:24:09.571743+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '230ac5df-73ee-44cd-8d97-1008ae04b151'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1770028772.13.1.jpg', 'ultrasound', NULL, '장벽의 비후 또는 비정상적인 층 구조가 의심됩니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775471275061_1_5c7fffb2.webp', 'image/webp', '33808'::integer, '2026-04-06 10:27:56.338395+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '64b501b2-2d46-488a-b69a-7702f92e30f3'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1770028822.14.1.jpg', 'ultrasound', NULL, '좌측 부신이 측정되었으며, 크기에 대한 추가 평가가 필요할 수 있습니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775471275343_2_3a9e89b5.webp', 'image/webp', '31438'::integer, '2026-04-06 10:27:56.338395+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '7f3cf7c5-1ebd-4e10-863b-b07eb61aa876'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1770028761.12.1.jpg', 'ultrasound', NULL, '비장 초음파 검사에서 뚜렷한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775471274594_0_a26094a7.webp', 'image/webp', '34954'::integer, '2026-04-06 10:27:56.338395+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8f7930ad-c6d0-459f-9c78-59941b8abad0'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1770028738.11.1.jpg', 'ultrasound', NULL, '췌장 초음파 검사에서 특이 소견은 관찰되지 않습니다.',
  'f'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775471276025_5_7a75f936.webp', 'image/webp', '33290'::integer, '2026-04-06 10:27:56.338395+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'bd817af8-5142-44b2-a20b-6f188ac8e24d'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1770028706.10.1.jpg', 'ultrasound', NULL, '복강 내 장기의 일반적인 초음파 소견으로 판단됩니다.',
  'f'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775471275793_4_5a938c9a.webp', 'image/webp', '30372'::integer, '2026-04-06 10:27:56.338395+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'da92a975-5546-4100-8025-be75f1026d52'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1770028700.9.1.jpg', 'ultrasound', NULL, '우측 부신이 측정되었으며, 크기에 대한 추가 평가가 필요할 수 있습니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775471275582_3_26c55e33.webp', 'image/webp', '29368'::integer, '2026-04-06 10:27:56.338395+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '177971b3-d82b-4c57-86c7-a9a72b7a0510'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.17207.7078.jpg', 'radiology', 'abdomen', '측면 복부에서 다수의 고밀도 장내 내용물(배변 정체 또는 변비 가능성)이 관찰됨.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775472441640_4_db3fb977.webp', 'image/webp', '40972'::integer, '2026-04-06 10:47:22.537417+00'::timestamptz,
  NULL::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '17aad5a8-95f8-4445-82e2-09277913e58c'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.10770.2674.jpg', 'radiology', 'thorax', '흉부에 경미한 기관지성/간질성 무늬가 보이며, 소형 금속성 이물이 관찰됨.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775472440675_1_be19020c.webp', 'image/webp', '42924'::integer, '2026-04-06 10:47:22.537417+00'::timestamptz,
  NULL::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '3f10a0f3-893b-47f9-bbba-7a1839648e2d'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.10815.2675.jpg', 'radiology', 'thorax', '흉부에서 경미한 기관지성/간질성 무늬가 관찰됨.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775472440970_2_978bd4d2.webp', 'image/webp', '67884'::integer, '2026-04-06 10:47:22.537417+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8241cb7f-3c07-4db9-ac50-dd821b725671'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.17348.7081.jpg', 'radiology', 'abdomen', '복부 전반에 뚜렷한 이상 소견은 관찰되지 않음.',
  'f'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775472440187_0_8e45ec8a.webp', 'image/webp', '61602'::integer, '2026-04-06 10:47:22.537417+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'be42dd68-2381-4dc8-b3df-2015828854ad'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.17086.7076.jpg', 'radiology', 'thorax', '측면 흉부 영상에서 명확한 금속성 이물과 경미한 폐 무늬 변화가 관찰됨.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775472441329_3_06ec853d.webp', 'image/webp', '48038'::integer, '2026-04-06 10:47:22.537417+00'::timestamptz,
  NULL::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c0534c84-3e9e-4784-bf14-a5c2d4f8eb88'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.17318.7080.jpg', 'radiology', 'thorax', '배면-복와 영상에서 금속성 이물이 확인되며 경미한 기관지성 무늬가 보임.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775472441892_5_de1c916f.webp', 'image/webp', '82788'::integer, '2026-04-06 10:47:22.537417+00'::timestamptz,
  NULL::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '4bfdd277-8ab9-459f-b4a8-8ec430ca702a'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '14295_19024_IntoCNS_000001.jpg', 'endoscopy', NULL, '이도 내 다량의 털과 분비물이 관찰되어 외이염과 관련될 수 있습니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775487101456_1_bc1c55ae.webp', 'image/webp', '74966'::integer, '2026-04-06 14:51:48.451506+00'::timestamptz,
  '[{"cx": 50, "cy": 60}]'::jsonb, NULL, '외이염'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'dea3c592-287d-4db3-bcee-5a6a536ad1af'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '14295_19025_IntoCNS_000002.jpg', 'endoscopy', NULL, '검이경 검사에서 이도 발적과 부종이 관찰되어 외이염 소견이 뚜렷합니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775487100764_0_9995957c.webp', 'image/webp', '19580'::integer, '2026-04-06 14:51:48.451506+00'::timestamptz,
  '[{"cx": 50, "cy": 45}]'::jsonb, 'clear', '외이염'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '05fc1768-7b6b-4e34-91ef-0b02f3e84dd2'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1728915141.15.1.jpg', 'ultrasound', NULL, '복부 초음파의 간 부위 횡단면 영상입니다.',
  'f'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775487234123_2_5d2502dd.webp', 'image/webp', '32320'::integer, '2026-04-06 14:54:01.491996+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '54260b32-1e0b-4a84-a46f-1bf7439f7ee1'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1728915166.16.1.jpg', 'ultrasound', NULL, '초음파에서 담낭 내 슬러지로 의심되는 에코패턴이 뚜렷하게 관찰됩니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775487233919_1_e3e150a2.webp', 'image/webp', '34874'::integer, '2026-04-06 14:54:01.491996+00'::timestamptz,
  '[{"cx": 45, "cy": 48}]'::jsonb, 'clear', '담낭슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '63cb0f94-922f-4e45-a86e-1cb203bed603'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1728915182.17.1.jpg', 'ultrasound', NULL, '초음파에서 담낭 내 슬러지로 의심되는 침전물이 관찰됩니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775487233409_0_5141ad9e.webp', 'image/webp', '35924'::integer, '2026-04-06 14:54:01.491996+00'::timestamptz,
  '[{"cx": 60, "cy": 65}]'::jsonb, 'clear', '담낭슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '7d506fc9-7873-4724-b87c-2d325680cb97'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1728915126.14.1.jpg', 'ultrasound', NULL, '초음파에서 담낭 내 슬러지로 의심되는 소견이 관찰됩니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775487234429_3_baacf8da.webp', 'image/webp', '30860'::integer, '2026-04-06 14:54:01.491996+00'::timestamptz,
  '[{"cx": 50, "cy": 58}]'::jsonb, 'clear', '담낭슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f65dde51-80bd-40cc-a04d-49b68337b708'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.2.840.113619.2.400.390130752.1728915110.13.1.jpg', 'ultrasound', NULL, '초음파에서 담낭 내 슬러지로 의심되는 침전물이 관찰됩니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775487234737_4_b4a918ba.webp', 'image/webp', '31518'::integer, '2026-04-06 14:54:01.491996+00'::timestamptz,
  '[{"cx": 48, "cy": 62}]'::jsonb, 'clear', '담낭슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '251a12c4-8f6c-4ac1-a8c7-184aedad2e2d'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.10770.2674.jpg', 'radiology', 'thorax', '측면 흉부 방사선에서 기관의 좁아진 부위가 관찰되어 기관허탈 가능성이 있습니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775488754419_1_55d1d873.webp', 'image/webp', '42924'::integer, '2026-04-06 15:19:21.266747+00'::timestamptz,
  '[{"cx": 42, "cy": 22}]'::jsonb, NULL, '기관허탈'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'dcbd69bc-ee77-4bf7-b758-30b14a816e82'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.10815.2675.jpg', 'radiology', 'thorax', '복부-흉부 정면 방사선에서 기관 일부가 좁아져 기관허탈 가능성이 있습니다.',
  't'::boolean, 'dodam-260329-01_33d65cc1/2026-02-02/1775488753770_0_4122e678.webp', 'image/webp', '67884'::integer, '2026-04-06 15:19:21.266747+00'::timestamptz,
  NULL::jsonb, NULL, '기관허탈'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '09ac23f4-77dd-452a-b633-00be8a6fde88'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '1.2.410.200028.100.2.202412131426150569.2746.1.6.Jpg', 'radiology', 'dental', '하악 견치·전구치 방사선 사진으로 특이 소견은 확실하지 않습니다.',
  'f'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775538664152_3_a43f2567.webp', 'image/webp', '58982'::integer, '2026-04-07 05:11:05.170847+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '0c09a422-16b0-4a72-9ab7-62f9dd4d8f38'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '1.2.410.200028.100.2.202412131423350301.31666.1.1.Jpg', 'radiology', 'dental', '상악 전치부 교합면 방사선으로 명확한 병변은 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775538664418_4_6b787531.webp', 'image/webp', '47282'::integer, '2026-04-07 05:11:05.170847+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '15b8afe1-a2f1-4790-a29b-e1f5d8d0f97c'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '1.2.410.200028.100.2.202412131425550230.1823.1.5.Jpg', 'radiology', 'dental', '견치 및 전구치 방사선 사진으로 명확한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775538663833_2_d5d3ccad.webp', 'image/webp', '54978'::integer, '2026-04-07 05:11:05.170847+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '58f440f3-9aaf-4e4c-95ab-de1407d4a495'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '1.2.410.200028.100.2.202412131424240441.10300.1.3.Jpg', 'radiology', 'dental', '상악 구치 부위에 치근 흡수가 의심되는 방사선 소견이 관찰됩니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775538663140_0_3d1f52d6.webp', 'image/webp', '57300'::integer, '2026-04-07 05:11:05.170847+00'::timestamptz,
  '[{"cx": 64, "cy": 45}]'::jsonb, 'clear', '치근 흡수'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '73e165e2-9cff-46a4-855f-82b98075f747'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '1.2.410.200028.100.2.202412131424520188.15209.1.4.Jpg', 'radiology', 'dental', '해당 구치에서 치근 병변이 의심되어 추가 평가가 필요합니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775538663578_1_d728e961.webp', 'image/webp', '48572'::integer, '2026-04-07 05:11:05.170847+00'::timestamptz,
  NULL::jsonb, NULL, '치근 흡수'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'afe204bb-0373-429c-9b7e-3aac3cb8ee63'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '1.2.410.200028.100.2.202412131423590686.4640.1.2.Jpg', 'radiology', 'dental', '대구치 주변에 치근 병변 또는 골파괴가 의심되어 추가 진단이 권장됩니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775538664639_5_ef62a9c2.webp', 'image/webp', '63918'::integer, '2026-04-07 05:11:05.170847+00'::timestamptz,
  NULL::jsonb, NULL, '치근 흡수'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '140292c8-a6ff-414d-b25a-3f00214e1e01'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '1.2.410.200028.100.2.202412131426280375.20407.1.7.Jpg', 'radiology', 'dental', '견치 및 구치 부위 방사선에서 치근 흡수가 뚜렷합니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775538752961_4_82e4213f.webp', 'image/webp', '55894'::integer, '2026-04-07 05:12:33.84498+00'::timestamptz,
  '[{"cx": 52, "cy": 64}]'::jsonb, 'clear', '치근 흡수'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '55bee48c-4511-4459-9b92-08e3421897f3'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '1.2.410.200028.100.2.202412131426410674.25833.1.8.Jpg', 'radiology', 'dental', '교합면 및 근심-원심 촬영에서 뚜렷한 병변은 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775538753190_5_12a1dc0d.webp', 'image/webp', '62796'::integer, '2026-04-07 05:12:33.84498+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '6f7c4a57-6da9-4549-a919-9b20a0175b38'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '1.2.410.200028.100.2.202412131427010975.7245.1.9.Jpg', 'radiology', 'dental', '상악 구치부 방사선에서 치근 흡수 소견이 뚜렷하게 관찰됩니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775538751385_0_7d05eee5.webp', 'image/webp', '52354'::integer, '2026-04-07 05:12:33.84498+00'::timestamptz,
  '[{"cx": 68, "cy": 48}]'::jsonb, 'clear', '치근 흡수'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '96f0c892-81d4-4536-8f18-f8d763f082c6'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '1.2.410.200028.100.2.202412131428240576.11765.1.10.Jpg', 'radiology', 'dental', '전치부 교합면 방사선에서 명확한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775538752105_1_b69aa9f3.webp', 'image/webp', '43814'::integer, '2026-04-07 05:12:33.84498+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'af419e72-62ce-4eb7-9521-a67a16e7977d'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '1.2.410.200028.100.2.202412131429290556.16335.1.11.Jpg', 'radiology', 'dental', '상악 전치 및 소구치 측면 촬영에서 특이 소견은 보이지 않습니다.',
  'f'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775538752330_2_ea4838f9.webp', 'image/webp', '61284'::integer, '2026-04-07 05:12:33.84498+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'edb19806-c152-4c9e-88cc-56daa704bf73'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '1.2.410.200028.100.2.202412131429510930.14567.1.12.Jpg', 'radiology', 'dental', '해당 치아에서 일부 치근 흡수가 의심되는 소견이 있습니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775538752613_3_8db95cca.webp', 'image/webp', '70802'::integer, '2026-04-07 05:12:33.84498+00'::timestamptz,
  '[{"cx": 60, "cy": 45}]'::jsonb, NULL, '치근 흡수'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '0872a8ad-ec31-4aa8-acf2-b747d733f063'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '1.2.410.200028.100.2.202412131550080808.30486.1.16.Jpg', 'radiology', 'dental', '상악 치근단 주변의 방사선 투과성 병변이 관찰되어 치첨 농양이 의심됩니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775538833380_1_c08b110b.webp', 'image/webp', '52890'::integer, '2026-04-07 05:13:55.018319+00'::timestamptz,
  '[{"cx": 50, "cy": 45}]'::jsonb, 'clear', '치첨 농양'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '6a3eea32-1edb-453b-9622-aaff21fd5cac'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '1.2.410.200028.100.2.202412131431040769.20114.1.14.Jpg', 'radiology', 'dental', '하악 구치부 치과 방사선 사진으로 특이 소견은 보이지 않습니다.',
  'f'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775538834422_5_3c3d2b66.webp', 'image/webp', '62930'::integer, '2026-04-07 05:13:55.018319+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b38c8354-f0ef-49a7-b021-68d1cfb9706e'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '1.2.410.200028.100.2.202412131430320309.12926.1.13.Jpg', 'radiology', 'dental', '하악 전치부 치과 방사선 사진으로 뚜렷한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775538834167_4_fae864a9.webp', 'image/webp', '52618'::integer, '2026-04-07 05:13:55.018319+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b98ff28b-f86a-4384-989f-022624b78936'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '1.2.410.200028.100.2.202412131606240709.18867.1.17.Jpg', 'radiology', 'dental', '상악 치근단 주변에 방사선 투과성 병변이 보여 치첨 농양이 의심됩니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775538833678_2_00e17271.webp', 'image/webp', '52480'::integer, '2026-04-07 05:13:55.018319+00'::timestamptz,
  '[{"cx": 50, "cy": 48}]'::jsonb, 'clear', '치첨 농양'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c0e4221b-34cf-4e43-97c4-92cf46789135'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '1.2.410.200028.100.2.202412131609230740.12150.1.18.Jpg', 'radiology', 'dental', '상악 치근단 부위의 방사선 투과성 병변이 관찰되어 치첨 농양이 의심됩니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775538833917_3_e1e80764.webp', 'image/webp', '52656'::integer, '2026-04-07 05:13:55.018319+00'::timestamptz,
  '[{"cx": 45, "cy": 48}]'::jsonb, 'clear', '치첨 농양'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'ce3c4b01-7638-461b-84e4-912589043f2b'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '1.2.410.200028.100.2.202412131431220798.27671.1.15.Jpg', 'radiology', 'dental', '하악 구치부 치과 방사선 사진으로 눈에 띄는 이상 소견은 없습니다.',
  'f'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775538832684_0_5dc61863.webp', 'image/webp', '67090'::integer, '2026-04-07 05:13:55.018319+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '1b87f899-649a-4aa2-8bc5-af1af81170e4'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-09'::date, '1.2.410.200067.100.3.20241209.1857050075.4525.1.3.Jpg', 'radiology', 'thorax', '흉부 방사선에서 기관지 패턴이 증가되어 기관지염이 의심되며, 최종 진단은 수의사가 결정합니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-09/1775538904133_1_65728050.webp', 'image/webp', '90258'::integer, '2026-04-07 05:15:04.668541+00'::timestamptz,
  '[{"cx": 50, "cy": 38}]'::jsonb, NULL, '기관지염'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f457ab98-fdfd-4232-bdf4-ae1edfbd3991'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-09'::date, '1.2.410.200067.100.3.20241209.1856320802.4417.1.2.Jpg', 'radiology', 'thorax', '흉부 방사선에서 기관지 패턴이 증가되어 기관지염이 의심되며, 최종 진단은 수의사가 결정합니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-09/1775538903742_0_da412ae9.webp', 'image/webp', '103916'::integer, '2026-04-07 05:15:04.668541+00'::timestamptz,
  '[{"cx": 46, "cy": 48}]'::jsonb, NULL, '기관지염'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '076474b5-fe47-4f68-a48d-9baf161291e5'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-20'::date, '24400_233504_IntoCNS_000003.jpg', 'other', NULL, '하악 구치부 사진으로 특이 소견은 명확하지 않아 추가 평가가 권장됩니다.',
  'f'::boolean, 'nuel-260406-01_a9a7feff/2024-12-20/1775539002073_6_9e2a536b.webp', 'image/webp', '30832'::integer, '2026-04-07 05:16:42.501655+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '11e8b78f-afda-40bc-bc0b-58b0974b00c7'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-20'::date, '24400_233507_IntoCNS_000005.jpg', 'other', NULL, '치은이 융기한 국소적인 부종이 관찰되며 수의사의 임상적 확인이 필요합니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-20/1775539001130_2_588b5f43.webp', 'image/webp', '26448'::integer, '2026-04-07 05:16:42.501655+00'::timestamptz,
  '[{"cx": 60, "cy": 30}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '145187eb-cc4f-4245-a954-6915ba909d73'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-20'::date, '24400_233502_IntoCNS_000001.jpg', 'other', NULL, '전치부 전반 사진으로 명확한 국소 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260406-01_a9a7feff/2024-12-20/1775539001620_4_e21efbb3.webp', 'image/webp', '20686'::integer, '2026-04-07 05:16:42.501655+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '840be04c-039c-4243-888f-29061b5599c4'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-20'::date, '24400_233508_IntoCNS_000014.jpg', 'other', NULL, '상악 구치부 치은에 국소적인 종창이 보이며 추가 치과적 평가가 필요합니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-20/1775539001359_3_f83e643a.webp', 'image/webp', '26898'::integer, '2026-04-07 05:16:42.501655+00'::timestamptz,
  '[{"cx": 60, "cy": 30}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c3426e83-7ebf-4442-a727-09f62de63671'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-20'::date, '24400_233505_IntoCNS_000004.jpg', 'other', NULL, '상악 구치부 잇몸에 국소적인 부종과 홍반이 관찰되며 수의사의 추가 진찰이 필요합니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-20/1775539000175_0_a6ec27bd.webp', 'image/webp', '26842'::integer, '2026-04-07 05:16:42.501655+00'::timestamptz,
  '[{"cx": 60, "cy": 22}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'cf5d0659-c293-40c3-a273-75b3a869e9e1'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-20'::date, '24400_233506_IntoCNS_000006.jpg', 'other', NULL, '상악 구치부 점막에 국소적 발적과 약간의 부종 소견이 보여 추가 평가가 권장됩니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-20/1775539000883_1_3639a2b1.webp', 'image/webp', '26788'::integer, '2026-04-07 05:16:42.501655+00'::timestamptz,
  '[{"cx": 45, "cy": 22}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'eaff906d-bb32-4d4d-8577-69e83f702d77'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-20'::date, '24400_233503_IntoCNS_000002.jpg', 'other', NULL, '견치 부위 잇몸에 국소적인 홍반과 부종이 관찰되어 수의사의 확인이 필요합니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-20/1775539001830_5_69307051.webp', 'image/webp', '28188'::integer, '2026-04-07 05:16:42.501655+00'::timestamptz,
  '[{"cx": 65, "cy": 25}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '23855a86-bb22-4788-98fa-3871511a2615'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '24225_230609_IntoCNS_000008.jpg', 'other', NULL, '구강 내 치아 표면에 만성 치석 침착이 뚜렷하게 관찰됩니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775539190972_4_a703db8c.webp', 'image/webp', '32226'::integer, '2026-04-07 05:19:52.202909+00'::timestamptz,
  '[{"cx": 52, "cy": 50}]'::jsonb, 'clear', '만성 치석 침착'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '326ea2db-1158-4aa3-b583-1910bc4211f9'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '24225_230611_IntoCNS_000010.jpg', 'other', NULL, '구강 내 치아 표면에 만성 치석 침착이 뚜렷하게 관찰됩니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775539191594_6_304146b5.webp', 'image/webp', '31812'::integer, '2026-04-07 05:19:52.202909+00'::timestamptz,
  '[{"cx": 54, "cy": 48}]'::jsonb, 'clear', '만성 치석 침착'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '3e940351-7ebe-444b-9de4-a8723ed63782'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '24225_230612_IntoCNS_000011.jpg', 'other', NULL, '구강 내 치아 표면에 만성 치석 침착이 뚜렷하게 관찰됩니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775539191786_7_68818ead.webp', 'image/webp', '30256'::integer, '2026-04-07 05:19:52.202909+00'::timestamptz,
  '[{"cx": 62, "cy": 60}, {"cx": 48, "cy": 52}]'::jsonb, 'clear', '만성 치석 침착'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '6ff2b34e-c7d7-4a0d-8001-00e20d782fd7'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '24225_230605_IntoCNS_000004.jpg', 'other', NULL, '구강 내 치아 표면에 만성 치석 침착이 뚜렷하게 관찰됩니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775539189903_0_28e8818a.webp', 'image/webp', '27592'::integer, '2026-04-07 05:19:52.202909+00'::timestamptz,
  '[{"cx": 62, "cy": 48}]'::jsonb, 'clear', '만성 치석 침착'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '95ce17af-4494-472f-a93a-ea00fe5c4236'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '24225_230610_IntoCNS_000009.jpg', 'other', NULL, '구강 내 치아 표면에 만성 치석 침착이 뚜렷하게 관찰됩니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775539191354_5_87a28003.webp', 'image/webp', '34414'::integer, '2026-04-07 05:19:52.202909+00'::timestamptz,
  '[{"cx": 54, "cy": 48}]'::jsonb, 'clear', '만성 치석 침착'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '9a019c58-2918-41e4-b461-ecff6c9b2604'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '24225_230606_IntoCNS_000005.jpg', 'other', NULL, '구강 내 치아 표면에 만성 치석 침착이 뚜렷하게 관찰됩니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775539190290_1_1e22d8b5.webp', 'image/webp', '30456'::integer, '2026-04-07 05:19:52.202909+00'::timestamptz,
  '[{"cx": 58, "cy": 48}]'::jsonb, 'clear', '만성 치석 침착'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '9b21172c-21f5-4c76-8e50-b76bcd57f540'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '24225_230607_IntoCNS_000006.jpg', 'other', NULL, '구강 내 치아 표면에 만성 치석 침착이 뚜렷하게 관찰됩니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775539190533_2_2055112e.webp', 'image/webp', '30762'::integer, '2026-04-07 05:19:52.202909+00'::timestamptz,
  '[{"cx": 45, "cy": 40}]'::jsonb, 'clear', '만성 치석 침착'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'd49529f2-9d14-420b-8cd6-43b986e5a75c'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13'::date, '24225_230608_IntoCNS_000007.jpg', 'other', NULL, '구강 내 치아 표면에 만성 치석 침착이 뚜렷하게 관찰됩니다.',
  't'::boolean, 'nuel-260406-01_a9a7feff/2024-12-13/1775539190747_3_0930005d.webp', 'image/webp', '39090'::integer, '2026-04-07 05:19:52.202909+00'::timestamptz,
  '[{"cx": 32, "cy": 30}, {"cx": 68, "cy": 28}]'::jsonb, 'clear', '만성 치석 침착'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '59df572b-56b1-40ad-a45f-6f2fafe4d8a3'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-03-12'::date, '1.2.276.0.7230010.3.0.3.5.1.15852162.2637138347.jpg', 'radiology', 'dental', '치주염과 잇몸 후퇴 소견이 뚜렷하여 치과적 처치(발치 등)가 필요할 수 있으며 최종 판정은 수의사가 합니다.',
  't'::boolean, 'dodam-260406-01_ff18168c/2026-03-12/1775540172287_1_5462b906.webp', 'image/webp', '25762'::integer, '2026-04-07 05:36:13.930172+00'::timestamptz,
  '[{"r": 10, "cx": 55, "cy": 55}]'::jsonb, 'clear', '심한 치주염 및 치은퇴축'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '6d40f71d-9390-4e8d-b37a-c4ee4c9a5ef5'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-03-12'::date, '1.2.276.0.7230010.3.0.3.5.1.15852162.255576773.jpg', 'radiology', 'dental', '치주염과 잇몸 후퇴 소견이 뚜렷하여 치과적 처치(발치 등)가 필요할 수 있으며 최종 판정은 수의사가 합니다.',
  't'::boolean, 'dodam-260406-01_ff18168c/2026-03-12/1775540171784_0_91bd69c0.webp', 'image/webp', '32274'::integer, '2026-04-07 05:36:13.930172+00'::timestamptz,
  '[{"r": 10, "cx": 50, "cy": 60}]'::jsonb, 'clear', '심한 치주염 및 치은퇴축'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '7e00cb6b-279d-4c07-90ca-cbdf9102c18d'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-03-12'::date, '1.2.276.0.7230010.3.0.3.5.1.15852186.4135301790.jpg', 'radiology', 'dental', '치주염과 잇몸 후퇴 소견이 뚜렷하여 치과적 처치(발치 등)가 필요할 수 있으며 최종 판정은 수의사가 합니다.',
  't'::boolean, 'dodam-260406-01_ff18168c/2026-03-12/1775540173372_6_29c9774c.webp', 'image/webp', '26668'::integer, '2026-04-07 05:36:13.930172+00'::timestamptz,
  '[{"r": 10, "cx": 60, "cy": 40}]'::jsonb, 'clear', '심한 치주염 및 치은퇴축'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c5728bec-b649-4686-8e8f-bb4b1de059d8'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-03-12'::date, '1.2.276.0.7230010.3.0.3.5.1.15852162.4159039848.jpg', 'radiology', 'dental', '치주염과 잇몸 후퇴 소견이 뚜렷하여 치과적 처치(발치 등)가 필요할 수 있으며 최종 판정은 수의사가 합니다.',
  't'::boolean, 'dodam-260406-01_ff18168c/2026-03-12/1775540172740_3_667176b7.webp', 'image/webp', '28840'::integer, '2026-04-07 05:36:13.930172+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 35}]'::jsonb, 'clear', '심한 치주염 및 치은퇴축'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'cbfa54cf-532f-438e-8459-eb4bb5ab8e49'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-03-12'::date, '1.2.276.0.7230010.3.0.3.5.1.15852186.2983982659.jpg', 'radiology', 'dental', '치주염과 잇몸 후퇴 소견이 뚜렷하여 치과적 처치(발치 등)가 필요할 수 있으며 최종 판정은 수의사가 합니다.',
  't'::boolean, 'dodam-260406-01_ff18168c/2026-03-12/1775540173169_5_111116a4.webp', 'image/webp', '27814'::integer, '2026-04-07 05:36:13.930172+00'::timestamptz,
  '[{"r": 12, "cx": 60, "cy": 45}]'::jsonb, 'clear', '심한 치주염 및 치은퇴축'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'd683e5ac-193a-40d5-b4a1-5daeb0b91ea8'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-03-12'::date, '1.2.276.0.7230010.3.0.3.5.1.15852186.1074980543.jpg', 'radiology', 'dental', '치주염과 잇몸 후퇴 소견이 뚜렷하여 치과적 처치(발치 등)가 필요할 수 있으며 최종 판정은 수의사가 합니다.',
  't'::boolean, 'dodam-260406-01_ff18168c/2026-03-12/1775540172955_4_afed29a5.webp', 'image/webp', '34224'::integer, '2026-04-07 05:36:13.930172+00'::timestamptz,
  '[{"r": 10, "cx": 45, "cy": 60}]'::jsonb, 'clear', '심한 치주염 및 치은퇴축'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'dc3a8ef5-c60d-4e32-b49d-ad80e361c762'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-03-12'::date, '1.2.276.0.7230010.3.0.3.5.1.15852162.3876911789.jpg', 'radiology', 'dental', '치주염과 잇몸 후퇴 소견이 뚜렷하여 치과적 처치(발치 등)가 필요할 수 있으며 최종 판정은 수의사가 합니다.',
  't'::boolean, 'dodam-260406-01_ff18168c/2026-03-12/1775540172531_2_41bbdd4f.webp', 'image/webp', '25830'::integer, '2026-04-07 05:36:13.930172+00'::timestamptz,
  '[{"r": 10, "cx": 50, "cy": 50}]'::jsonb, 'clear', '심한 치주염 및 치은퇴축'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '159ff207-c475-42b3-b0f7-37d492aa5c10'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-02-23'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.5871.7258.jpg', 'radiology', 'abdomen', '복부 측면 방사선으로 뚜렷한 이상 소견은 확인되지 않습니다.',
  'f'::boolean, 'dodam-260406-01_ff18168c/2026-02-23/1775540248388_2_90aaa5eb.webp', 'image/webp', '44500'::integer, '2026-04-07 05:37:29.415782+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '61bd82c0-4d4d-4227-bfe8-7b228e9d722d'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-02-23'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.5813.7256.jpg', 'radiology', 'thorax', '흉부 방사선에서 기관 협착 소견(기관허탈 가능성)이 관찰되며 최종 판정은 수의사 소견이 필요합니다.',
  't'::boolean, 'dodam-260406-01_ff18168c/2026-02-23/1775540247625_0_9744c028.webp', 'image/webp', '58508'::integer, '2026-04-07 05:37:29.415782+00'::timestamptz,
  '[{"r": 6, "cx": 50, "cy": 18}]'::jsonb, 'clear', '기관허탈'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '7c52699e-056e-41e2-ba9a-2ad1f00e1e87'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-02-23'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.5780.7255.jpg', 'radiology', 'abdomen', '복부 배측-복위 방사선에서 특이 소견은 관찰되지 않습니다.',
  'f'::boolean, 'dodam-260406-01_ff18168c/2026-02-23/1775540248651_3_68e2b90b.webp', 'image/webp', '43420'::integer, '2026-04-07 05:37:29.415782+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'a610f0b1-7a55-493b-9c4a-a14b69b45406'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-02-23'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.5845.7257.jpg', 'radiology', 'thorax', '측면 흉부 방사선에서 기관의 부분적 협착 소견(기관허탈 가능성)이 보이며 수의사 확인이 필요합니다.',
  't'::boolean, 'dodam-260406-01_ff18168c/2026-02-23/1775540248112_1_09f1fa86.webp', 'image/webp', '48122'::integer, '2026-04-07 05:37:29.415782+00'::timestamptz,
  '[{"r": 5, "cx": 40, "cy": 20}]'::jsonb, 'clear', '기관허탈'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '0e1440db-12db-4017-af42-a46d60187562'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-02-23'::date, '1.2.840.113619.2.400.390130752.1771840995.3.1.jpg', 'ultrasound', NULL, '위의 복부 초음파 영상입니다.',
  'f'::boolean, 'dodam-260406-01_ff18168c/2026-02-23/1775540324848_4_4fa56e87.webp', 'image/webp', '25612'::integer, '2026-04-07 05:38:45.267456+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '13bb67f9-a015-4bcd-94a4-766b68b20806'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-02-23'::date, '1.2.840.113619.2.400.390130752.1771841059.7.1.jpg', 'ultrasound', NULL, '간의 복부 초음파 영상입니다.',
  'f'::boolean, 'dodam-260406-01_ff18168c/2026-02-23/1775540324636_3_5cda940e.webp', 'image/webp', '29556'::integer, '2026-04-07 05:38:45.267456+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '4ae216a0-4d89-4200-8b5a-65f3b93e1a95'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-02-23'::date, '1.2.840.113619.2.400.390130752.1771841046.6.1.jpg', 'ultrasound', NULL, '왼쪽 부신의 초음파 영상입니다.',
  'f'::boolean, 'dodam-260406-01_ff18168c/2026-02-23/1775540324412_2_8b0d634f.webp', 'image/webp', '29670'::integer, '2026-04-07 05:38:45.267456+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '896aaa74-5911-4bfa-82c8-0e3582207e09'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-02-23'::date, '1.2.840.113619.2.400.390130752.1771841015.5.1.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지 소견이 관찰되어 수의사의 최단 판단이 필요합니다.',
  't'::boolean, 'dodam-260406-01_ff18168c/2026-02-23/1775540324195_1_97e2ce1c.webp', 'image/webp', '36666'::integer, '2026-04-07 05:38:45.267456+00'::timestamptz,
  '[{"r": 10, "cx": 52, "cy": 28}]'::jsonb, 'clear', '담낭슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'a0171f0c-55c3-408c-b73c-76067bcd8107'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-02-23'::date, '1.2.840.113619.2.400.390130752.1771841002.4.1.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지 소견이 관찰되어 수의사의 최종 판단이 필요합니다.',
  't'::boolean, 'dodam-260406-01_ff18168c/2026-02-23/1775540323893_0_67fb4b83.webp', 'image/webp', '34578'::integer, '2026-04-07 05:38:45.267456+00'::timestamptz,
  '[{"r": 10, "cx": 50, "cy": 25}]'::jsonb, 'clear', '담낭슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '3031d174-42c1-4184-9dab-973b7ad749ab'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-02-23'::date, '1.2.840.113619.2.400.390130752.1771841347.20.1.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 침전물이 관찰되어 담낭슬러지 소견입니다.',
  't'::boolean, 'dodam-260406-01_ff18168c/2026-02-23/1775540384623_6_87e4a5b9.webp', 'image/webp', '29498'::integer, '2026-04-07 05:39:45.155798+00'::timestamptz,
  '[{"r": 6, "cx": 55, "cy": 25}]'::jsonb, 'clear', '담낭슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '637fd5a4-d3aa-4158-a27b-915e3fac1958'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-02-23'::date, '1.2.840.113619.2.400.390130752.1771841249.15.1.jpg', 'ultrasound', NULL, '복부 초음파(췌장 부위) 영상입니다. 수의사의 최종 판독이 필요합니다.',
  'f'::boolean, 'dodam-260406-01_ff18168c/2026-02-23/1775540383398_1_6fc8df79.webp', 'image/webp', '32220'::integer, '2026-04-07 05:39:45.155798+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '77f72986-1f31-4cc2-9a13-16db74518b79'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-02-23'::date, '1.2.840.113619.2.400.390130752.1771841272.17.1.jpg', 'ultrasound', NULL, '복부 초음파 영상입니다. 수의사의 최종 판독이 필요합니다.',
  'f'::boolean, 'dodam-260406-01_ff18168c/2026-02-23/1775540383918_3_94541881.webp', 'image/webp', '31578'::integer, '2026-04-07 05:39:45.155798+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8667a9bb-141f-43c3-8ffc-7d683c780b58'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-02-23'::date, '1.2.840.113619.2.400.390130752.1771841257.16.1.jpg', 'ultrasound', NULL, '복부 초음파 횡단면 영상입니다. 수의사의 최종 판독이 필요합니다.',
  'f'::boolean, 'dodam-260406-01_ff18168c/2026-02-23/1775540383616_2_96edddaf.webp', 'image/webp', '33546'::integer, '2026-04-07 05:39:45.155798+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '9846a853-9736-41f9-b60a-2a8233ed7070'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-02-23'::date, '1.2.840.113619.2.400.390130752.1771841295.18.1.jpg', 'ultrasound', NULL, '복부 초음파 횡단면 영상입니다. 수의사의 최종 판독이 필요합니다.',
  'f'::boolean, 'dodam-260406-01_ff18168c/2026-02-23/1775540384206_4_f8de35db.webp', 'image/webp', '30106'::integer, '2026-04-07 05:39:45.155798+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '9e7d89f7-65e6-4d09-bf2d-af07cedffa2c'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-02-23'::date, '1.2.840.113619.2.400.390130752.1771841303.19.1.jpg', 'ultrasound', NULL, '복부 초음파(방광 영역, UB 라벨) 영상입니다. 수의사의 최종 판독이 필요합니다.',
  'f'::boolean, 'dodam-260406-01_ff18168c/2026-02-23/1775540384427_5_bd65522a.webp', 'image/webp', '32268'::integer, '2026-04-07 05:39:45.155798+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c8bee6b0-f613-454a-b492-02ed57b3b0dd'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-02-23'::date, '1.2.840.113619.2.400.390130752.1771841237.14.1.jpg', 'ultrasound', NULL, '복부 초음파 영상입니다. 수의사의 최종 판독이 필요합니다.',
  'f'::boolean, 'dodam-260406-01_ff18168c/2026-02-23/1775540383059_0_339214da.webp', 'image/webp', '33744'::integer, '2026-04-07 05:39:45.155798+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '0026f73a-7468-4b12-ad8e-d2d2a50a1a20'::uuid, '875632e0-b225-49c2-ad2c-5a32122d1e6f'::uuid, '2026-04-01'::date, '34672_366778_IntoCNS_000026.jpg', 'slit_lamp', NULL, '결막이 돌출된 양상과 함께 충혈이 관찰됩니다.',
  't'::boolean, 'nuel-260408-02_875632e0/2026-04-01/1775614820980_4_5fadd88a.webp', 'image/webp', '71076'::integer, '2026-04-08 02:20:24.540463+00'::timestamptz,
  '[{"r": 10, "cx": 60, "cy": 60}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '058cbfc8-db6f-4dc7-a293-ccb1a32ffbea'::uuid, '875632e0-b225-49c2-ad2c-5a32122d1e6f'::uuid, '2026-04-01'::date, '34672_366756_IntoCNS_000004.jpg', 'slit_lamp', NULL, '결막 부위에 충혈과 약간의 부종 소견이 관찰됩니다.',
  't'::boolean, 'nuel-260408-02_875632e0/2026-04-01/1775614818268_0_99aeeace.webp', 'image/webp', '79660'::integer, '2026-04-08 02:20:24.540463+00'::timestamptz,
  '[{"r": 6, "cx": 60, "cy": 40}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '1ccb62c1-4b46-4c25-aa92-9523bf568d48'::uuid, '875632e0-b225-49c2-ad2c-5a32122d1e6f'::uuid, '2026-04-01'::date, '34672_366762_IntoCNS_000010.jpg', 'slit_lamp', NULL, '동공 부근에 소량의 침착(노란 점)이 관찰됩니다.',
  't'::boolean, 'nuel-260408-02_875632e0/2026-04-01/1775614819881_2_a9bd1340.webp', 'image/webp', '70790'::integer, '2026-04-08 02:20:24.540463+00'::timestamptz,
  '[{"r": 4, "cx": 50, "cy": 45}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '4c7e1fff-981b-464e-9794-e5b5ab87e25f'::uuid, '875632e0-b225-49c2-ad2c-5a32122d1e6f'::uuid, '2026-04-01'::date, '34672_366754_IntoCNS_000002.jpg', 'slit_lamp', NULL, '동공 주변에 작은 침착물이 관찰됩니다.',
  't'::boolean, 'nuel-260408-02_875632e0/2026-04-01/1775614823281_7_9e32d9c8.webp', 'image/webp', '83774'::integer, '2026-04-08 02:20:24.540463+00'::timestamptz,
  '[{"r": 5, "cx": 52, "cy": 60}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '5e6ef9b6-6f52-4957-89f3-55087381f32c'::uuid, '875632e0-b225-49c2-ad2c-5a32122d1e6f'::uuid, '2026-04-01'::date, '34672_366757_IntoCNS_000005.jpg', 'slit_lamp', NULL, '결막에 혈관 확장과 미세한 충혈이 보입니다.',
  't'::boolean, 'nuel-260408-02_875632e0/2026-04-01/1775614819341_1_0af2d1aa.webp', 'image/webp', '69088'::integer, '2026-04-08 02:20:24.540463+00'::timestamptz,
  '[{"r": 6, "cx": 70, "cy": 55}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '93857cb3-5e8e-438f-b972-64308cce70ea'::uuid, '875632e0-b225-49c2-ad2c-5a32122d1e6f'::uuid, '2026-04-01'::date, '34672_366764_IntoCNS_000012.jpg', 'slit_lamp', NULL, '하측 결막에 충혈과 혈관 증식 소견이 있습니다.',
  't'::boolean, 'nuel-260408-02_875632e0/2026-04-01/1775614820427_3_52e1b396.webp', 'image/webp', '70028'::integer, '2026-04-08 02:20:24.540463+00'::timestamptz,
  '[{"r": 8, "cx": 45, "cy": 70}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'a1c718f3-9f53-47e1-bd31-4a5541e1e9ae'::uuid, '875632e0-b225-49c2-ad2c-5a32122d1e6f'::uuid, '2026-04-01'::date, '34672_366758_IntoCNS_000006.jpg', 'other', NULL, '하악 잇몸에 치석과 홍반이 뚜렷하게 관찰됩니다.',
  't'::boolean, 'nuel-260408-02_875632e0/2026-04-01/1775614821554_5_f59919ae.webp', 'image/webp', '64124'::integer, '2026-04-08 02:20:24.540463+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 45}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b78ccaa8-dda3-4590-b7de-dacc8b0d0d08'::uuid, '875632e0-b225-49c2-ad2c-5a32122d1e6f'::uuid, '2026-04-01'::date, '34672_366755_IntoCNS_000003.jpg', 'slit_lamp', NULL, '결막 및 공막에 경미한 충혈 소견이 보입니다.',
  't'::boolean, 'nuel-260408-02_875632e0/2026-04-01/1775614822202_6_bd5939e7.webp', 'image/webp', '87650'::integer, '2026-04-08 02:20:24.540463+00'::timestamptz,
  '[{"r": 8, "cx": 65, "cy": 50}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '1e8864bc-8cd3-4045-8a15-98fd4885262c'::uuid, '875632e0-b225-49c2-ad2c-5a32122d1e6f'::uuid, '2026-04-01'::date, '34672_366743_IntoCNS_000001.jpg', 'endoscopy', NULL, '내시경 영상으로 관찰된 점막과 분비물이 보이나, 목록의 특정 질환과의 명확한 연관성은 보이지 않습니다.',
  'f'::boolean, 'nuel-260408-02_875632e0/2026-04-01/1775614988896_4_43040052.webp', 'image/webp', '11184'::integer, '2026-04-08 02:23:11.622722+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '5527f5fb-1f11-42f6-a751-644501f7a5a5'::uuid, '875632e0-b225-49c2-ad2c-5a32122d1e6f'::uuid, '2026-04-01'::date, '1.2.410.200067.100.3.20260401.1729580702.12945.1.5.jpg', 'radiology', 'thorax', '흉부 배측-복부 방사선 사진으로 폐와 흉곽 구조가 관찰되며 뚜렷한 이상 소견은 없습니다.',
  'f'::boolean, 'nuel-260408-02_875632e0/2026-04-01/1775614988520_3_b945c32d.webp', 'image/webp', '42714'::integer, '2026-04-08 02:23:11.622722+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '59ed47f3-2821-4072-acb4-3d380923db67'::uuid, '875632e0-b225-49c2-ad2c-5a32122d1e6f'::uuid, '2026-04-01'::date, '34672_366747_IntoCNS_000005.jpg', 'endoscopy', NULL, '내시경 영상으로 관 내부의 점막 주름이 관찰되나 목록의 특정 질환과 직접 연결되지는 않습니다.',
  'f'::boolean, 'nuel-260408-02_875632e0/2026-04-01/1775614989683_5_f9ab4314.webp', 'image/webp', '19676'::integer, '2026-04-08 02:23:11.622722+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '627a57f4-fac1-4be0-a186-7568b88fc6e9'::uuid, '875632e0-b225-49c2-ad2c-5a32122d1e6f'::uuid, '2026-04-01'::date, '1.2.410.200067.100.3.20260401.1728410416.12694.1.1.jpg', 'radiology', 'thorax', '측면 흉부 방사선 사진으로 심폐 윤곽은 평가되나 명백한 병변은 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260408-02_875632e0/2026-04-01/1775614987255_0_dc4d21be.webp', 'image/webp', '41544'::integer, '2026-04-08 02:23:11.622722+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '77e32a83-69c6-41fa-be70-9cdb361ee9c6'::uuid, '875632e0-b225-49c2-ad2c-5a32122d1e6f'::uuid, '2026-04-01'::date, '34672_366774_IntoCNS_000022.jpg', 'other', NULL, '구강 사진에서 치아 표면의 치석과 잇몸의 발적이 관찰되어 치주 질환이 의심됩니다.',
  't'::boolean, 'nuel-260408-02_875632e0/2026-04-01/1775614990412_7_39806647.webp', 'image/webp', '44898'::integer, '2026-04-08 02:23:11.622722+00'::timestamptz,
  '[{"r": 6, "cx": 55, "cy": 65}]'::jsonb, 'clear', '중등도 치석 및 치은염'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8091f2a4-da23-42c6-8ebe-cae6731b19f9'::uuid, '875632e0-b225-49c2-ad2c-5a32122d1e6f'::uuid, '2026-04-01'::date, '1.2.410.200067.100.3.20260401.1729240205.12834.1.3.jpg', 'radiology', 'abdomen', '복부 배측-복부 방사선 사진으로 위장관과 장 내용물이 관찰되며 명확한 병변은 보이지 않습니다.',
  'f'::boolean, 'nuel-260408-02_875632e0/2026-04-01/1775614988143_2_43d2799c.webp', 'image/webp', '44544'::integer, '2026-04-08 02:23:11.622722+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'ee89defb-68c5-4051-9567-5dda16990464'::uuid, '875632e0-b225-49c2-ad2c-5a32122d1e6f'::uuid, '2026-04-01'::date, '1.2.410.200067.100.3.20260401.1729020359.12762.1.2.jpg', 'radiology', 'abdomen', '측면 복부 방사선 사진으로 복부 장기 윤곽은 관찰되며 특이 소견은 뚜렷하지 않습니다.',
  'f'::boolean, 'nuel-260408-02_875632e0/2026-04-01/1775614987757_1_d0b1b890.webp', 'image/webp', '28848'::integer, '2026-04-08 02:23:11.622722+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f7c605e2-3746-4a6b-aa01-16a8f4b04e04'::uuid, '875632e0-b225-49c2-ad2c-5a32122d1e6f'::uuid, '2026-04-01'::date, '34672_366753_IntoCNS_000001.jpg', 'other', NULL, '장비 디스플레이 사진으로 검사항목 정보가 보이며 임상적 병변 평가는 불가능합니다.',
  'f'::boolean, 'nuel-260408-02_875632e0/2026-04-01/1775614990043_6_77a5f5a3.webp', 'image/webp', '22198'::integer, '2026-04-08 02:23:11.622722+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '05e8f2e6-1529-4a8c-9a52-947931c9a5a7'::uuid, '4ddf80b9-78ec-4eb4-8966-747ace19d079'::uuid, '2026-04-04'::date, '1.3.12.2.1107.5.5.9.362069.20260404161959.502565.jpg', 'ultrasound', NULL, '초음파 기기에서 출력된 측정값 표가 포함된 이미지로 개별 수치 해석은 원본 데이터와 임상 맥락이 필요합니다.',
  'f'::boolean, 'nuel-260408-03_4ddf80b9/2026-04-04/1775616079368_1_254f2555.webp', 'image/webp', '15818'::integer, '2026-04-08 02:41:24.023872+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '30cefd21-7dea-49d8-8a49-c9bb08352f30'::uuid, '4ddf80b9-78ec-4eb4-8966-747ace19d079'::uuid, '2026-04-04'::date, '34734_368336_IntoCNS_000001.jpg', 'other', NULL, '기기 디스플레이의 문자 이미지로 임상적 소견 판독에는 추가 정보가 필요합니다.',
  'f'::boolean, 'nuel-260408-03_4ddf80b9/2026-04-04/1775616081398_5_7d13692a.webp', 'image/webp', '37454'::integer, '2026-04-08 02:41:24.023872+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '80154993-6da0-4e82-a533-dfad8b714716'::uuid, '4ddf80b9-78ec-4eb4-8966-747ace19d079'::uuid, '2026-04-04'::date, '34734_368385_IntoCNS_000026.jpg', 'other', NULL, '구강 사진에서 일부 치아 표면에 다량의 치석과 잇몸 가장자리 염증 의심 소견이 보입니다.',
  't'::boolean, 'nuel-260408-03_4ddf80b9/2026-04-04/1775616082402_6_645231e9.webp', 'image/webp', '29228'::integer, '2026-04-08 02:41:24.023872+00'::timestamptz,
  '[{"r": 10, "cx": 70, "cy": 20}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8a043407-3859-47b0-9b90-404509ba0d0e'::uuid, '4ddf80b9-78ec-4eb4-8966-747ace19d079'::uuid, '2026-04-04'::date, '1.3.12.2.1107.5.5.9.362069.20260404162003.502572.jpg', 'ultrasound', NULL, '초음파 판막 관련 수치 표가 촬영된 이미지로 영상 기반의 병변은 실제 영상에서 평가해야 합니다.',
  'f'::boolean, 'nuel-260408-03_4ddf80b9/2026-04-04/1775616080003_2_a5fce1b3.webp', 'image/webp', '15690'::integer, '2026-04-08 02:41:24.023872+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '982feda3-443c-4bb8-8052-fd9edc5e087c'::uuid, '4ddf80b9-78ec-4eb4-8966-747ace19d079'::uuid, '2026-04-04'::date, '1.3.12.2.1107.5.5.9.362069.20260404162006.502579.jpg', 'ultrasound', NULL, '심실 및 심장 치수 관련 측정표가 포함된 이미지로 구조적 소견은 실제 초음파 영상에서 재확인해야 합니다.',
  'f'::boolean, 'nuel-260408-03_4ddf80b9/2026-04-04/1775616080392_3_dbf3e489.webp', 'image/webp', '15754'::integer, '2026-04-08 02:41:24.023872+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'd7ced04b-480f-47e8-b51e-01f04d04fb74'::uuid, '4ddf80b9-78ec-4eb4-8966-747ace19d079'::uuid, '2026-04-04'::date, '34734_368235_IntoCNS_000003.jpg', 'endoscopy', NULL, '내시경 영상에서 관내에 가늘고 선 모양의 이물성 또는 섬유성 구조물이 관찰됩니다.',
  't'::boolean, 'nuel-260408-03_4ddf80b9/2026-04-04/1775616080768_4_1f169ef6.webp', 'image/webp', '20540'::integer, '2026-04-08 02:41:24.023872+00'::timestamptz,
  '[{"r": 4, "cx": 55, "cy": 52}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'da9d62a5-5142-4417-9bad-97abf1eb4cd1'::uuid, '4ddf80b9-78ec-4eb4-8966-747ace19d079'::uuid, '2026-04-04'::date, '1.3.12.2.1107.5.5.9.362069.20260404161153.502498.jpg', 'ultrasound', NULL, '심초음파 컬러 도플러 영상에서 판막 주변에 색 혼합이 뚜렷한 혈류 제트가 관찰됩니다.',
  't'::boolean, 'nuel-260408-03_4ddf80b9/2026-04-04/1775616078645_0_ce6936bf.webp', 'image/webp', '22744'::integer, '2026-04-08 02:41:24.023872+00'::timestamptz,
  '[{"r": 10, "cx": 62, "cy": 34}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'dd03b081-00bd-4efd-a40e-d96c15a8a2f9'::uuid, '4ddf80b9-78ec-4eb4-8966-747ace19d079'::uuid, '2026-04-04'::date, '34734_369202_20260404_123011_지원_구름.jpg', 'other', NULL, '신속 검사 키트에서 두 측정창 모두 대조선만 관찰되어 현재 관찰상 음성 소견으로 보입니다.',
  't'::boolean, 'nuel-260408-03_4ddf80b9/2026-04-04/1775616082761_7_c8924d8e.webp', 'image/webp', '45350'::integer, '2026-04-08 02:41:24.023872+00'::timestamptz,
  '[{"r": 6, "cx": 33, "cy": 62}, {"r": 6, "cx": 66, "cy": 62}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '0354f91c-4754-40d5-a827-a0581576e781'::uuid, '4ddf80b9-78ec-4eb4-8966-747ace19d079'::uuid, '2026-04-04'::date, '1.2.410.200067.100.3.20260404.1116430820.32587.1.11.jpg', 'radiology', 'abdomen', '복부 배측-복와 영상에서 위장관의 가스 및 내용물이 보이나 명확한 폐쇄나 급성 병변은 확인되지 않아 수의사 확인이 필요합니다.',
  'f'::boolean, 'nuel-260408-03_4ddf80b9/2026-04-04/1775616538338_2_fbd62cac.webp', 'image/webp', '46156'::integer, '2026-04-08 02:49:01.557907+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '630bfd14-d32b-4bbc-b669-0ac41e2929e2'::uuid, '4ddf80b9-78ec-4eb4-8966-747ace19d079'::uuid, '2026-04-04'::date, '1.2.410.200067.100.3.20260404.1124220188.1318.1.23.jpg', 'radiology', 'joint', '사지 측면 영상에서 뼈의 정렬과 골밀도에 명확한 이상은 없어 보이나 최종 판단은 수의사와 상의하세요.',
  'f'::boolean, 'nuel-260408-03_4ddf80b9/2026-04-04/1775616539812_6_7b88d1b6.webp', 'image/webp', '37544'::integer, '2026-04-08 02:49:01.557907+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b0c729d5-4ff5-4550-bbd5-e55ffeb6dbea'::uuid, '4ddf80b9-78ec-4eb4-8966-747ace19d079'::uuid, '2026-04-04'::date, '34734_369234_1904구름.jpg', 'other', NULL, '신체검사 진단표 사진으로 방사선 이미지가 아니며 세부 판독이나 상담은 수의사에게 문의하시기 바랍니다.',
  'f'::boolean, 'nuel-260408-03_4ddf80b9/2026-04-04/1775616540281_7_8e9e994e.webp', 'image/webp', '147112'::integer, '2026-04-08 02:49:01.557907+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b2f27f8f-c813-4905-993a-bc7f33328f6f'::uuid, '4ddf80b9-78ec-4eb4-8966-747ace19d079'::uuid, '2026-04-04'::date, '1.2.410.200067.100.3.20260404.1123080058.1076.1.20.jpg', 'radiology', 'joint', '사지 방사선에서 골절이나 뚜렷한 골 병변은 관찰되지 않으나 통증 원인 평가 등은 수의사 판단이 필요합니다.',
  'f'::boolean, 'nuel-260408-03_4ddf80b9/2026-04-04/1775616539458_5_feaabc87.webp', 'image/webp', '26896'::integer, '2026-04-08 02:49:01.557907+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'd3ca553a-1185-4a0b-a642-859db5ab74f6'::uuid, '4ddf80b9-78ec-4eb4-8966-747ace19d079'::uuid, '2026-04-04'::date, '1.2.410.200067.100.3.20260404.1118370952.191.1.14.jpg', 'radiology', 'thorax', '흉부 배측 영상에서 폐 실질이나 흉강에 뚜렷한 침윤·삼출은 관찰되지 않으나 최종 판독은 수의사에게 요청하세요.',
  'f'::boolean, 'nuel-260408-03_4ddf80b9/2026-04-04/1775616538712_3_5c6c9066.webp', 'image/webp', '39694'::integer, '2026-04-08 02:49:01.557907+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e8a4f875-040b-4dc1-ac46-5172054e44d0'::uuid, '4ddf80b9-78ec-4eb4-8966-747ace19d079'::uuid, '2026-04-04'::date, '1.2.410.200067.100.3.20260404.1115450694.32397.1.9.jpg', 'radiology', 'abdomen', '복부 방사선에서 장내 가스와 분변이 관찰되지만 뚜렷한 이상 소견은 확인되지 않아 수의사 최종 판단이 필요합니다.',
  'f'::boolean, 'nuel-260408-03_4ddf80b9/2026-04-04/1775616537469_0_df35f0da.webp', 'image/webp', '27500'::integer, '2026-04-08 02:49:01.557907+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'efdd98f0-763f-44af-84a5-989951637315'::uuid, '4ddf80b9-78ec-4eb4-8966-747ace19d079'::uuid, '2026-04-04'::date, '1.2.410.200067.100.3.20260404.1116150446.32495.1.10.jpg', 'radiology', 'thorax', '흉부 측면 방사선에서 폐 및 심영이 전반적으로 큰 이상은 없어 보이나 임상증상에 따라 수의사 추가 판독이 필요합니다.',
  'f'::boolean, 'nuel-260408-03_4ddf80b9/2026-04-04/1775616538001_1_ba6bf284.webp', 'image/webp', '41910'::integer, '2026-04-08 02:49:01.557907+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f1a64463-f65c-4e4c-b931-207869e3aa98'::uuid, '4ddf80b9-78ec-4eb4-8966-747ace19d079'::uuid, '2026-04-04'::date, '1.2.410.200067.100.3.20260404.1121450976.805.1.18.jpg', 'radiology', 'joint', '골반 및 고관절 영상에서 양측 대칭성이 유지되는 것으로 보이나 관절 내부 병변 여부는 수의사 추가 판독이 필요합니다.',
  'f'::boolean, 'nuel-260408-03_4ddf80b9/2026-04-04/1775616539068_4_923adda8.webp', 'image/webp', '42968'::integer, '2026-04-08 02:49:01.557907+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '365e14b2-a746-4143-9f00-09c8b5f778a8'::uuid, 'ff350571-1c93-4fae-b24f-a11e26de124c'::uuid, '2026-03-28'::date, '1.2.410.200067.100.3.20260328.1057120737.19820.1.6.Jpg', 'radiology', 'thorax', '현저한 이상 음영은 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260408-04_ff350571/2026-03-28/1775617530965_2_8ab0ec51.webp', 'image/webp', '125198'::integer, '2026-04-08 03:05:35.426546+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '84e6cbad-7805-4ef3-8c39-cf5fd31b3842'::uuid, 'ff350571-1c93-4fae-b24f-a11e26de124c'::uuid, '2026-03-28'::date, '1.2.410.200067.100.3.20260328.1056080975.19611.1.3.Jpg', 'radiology', 'thorax', '흉부 방사선에서 기관지·간질성 무늬의 증가가 관찰됩니다.',
  't'::boolean, 'nuel-260408-04_ff350571/2026-03-28/1775617529033_0_15bbfccb.webp', 'image/webp', '98014'::integer, '2026-04-08 03:05:35.426546+00'::timestamptz,
  '[{"r": 12, "cx": 45, "cy": 50}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '99266a3b-ef69-4b44-9970-f585e1863180'::uuid, 'ff350571-1c93-4fae-b24f-a11e26de124c'::uuid, '2026-03-28'::date, '1.2.410.200067.100.3.20260328.1058310781.20078.1.5.Jpg', 'radiology', 'dental', '두부(구강) 방사선에서 뚜렷한 골성 이상은 보이지 않습니다.',
  'f'::boolean, 'nuel-260408-04_ff350571/2026-03-28/1775617533038_4_461f7a54.webp', 'image/webp', '47526'::integer, '2026-04-08 03:05:35.426546+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'a3216aaa-6e41-42b8-8523-bb4c94016c5c'::uuid, 'ff350571-1c93-4fae-b24f-a11e26de124c'::uuid, '2026-03-28'::date, '1.2.410.200067.100.3.20260328.1057360884.19899.1.7.Jpg', 'radiology', 'abdomen', '복부 방사선에서 명확한 병변은 확인되지 않습니다.',
  'f'::boolean, 'nuel-260408-04_ff350571/2026-03-28/1775617531896_3_04133edf.webp', 'image/webp', '107200'::integer, '2026-04-08 03:05:35.426546+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b27bba26-5845-42a8-bbf5-829a37e12dfa'::uuid, 'ff350571-1c93-4fae-b24f-a11e26de124c'::uuid, '2026-03-28'::date, '34577_365075_IntoCNS_000019.jpg', 'other', NULL, '하악 구치부에 잇몸 충혈과 치아 표면 결손이 관찰됩니다.',
  't'::boolean, 'nuel-260408-04_ff350571/2026-03-28/1775617533877_6_251ee7cc.webp', 'image/webp', '30142'::integer, '2026-04-08 03:05:35.426546+00'::timestamptz,
  '[{"r": 5, "cx": 60, "cy": 50}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b4dd1c85-6855-40ab-8ad8-b8120828de19'::uuid, 'ff350571-1c93-4fae-b24f-a11e26de124c'::uuid, '2026-03-28'::date, '1.2.410.200067.100.3.20260328.1056270048.19673.1.4.Jpg', 'radiology', 'abdomen', '복부 방사선에서 결장 내 고형 분변(대변 축적) 소견이 관찰됩니다.',
  't'::boolean, 'nuel-260408-04_ff350571/2026-03-28/1775617530330_1_fd360ff2.webp', 'image/webp', '113158'::integer, '2026-04-08 03:05:35.426546+00'::timestamptz,
  '[{"r": 10, "cx": 65, "cy": 60}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e021f10d-5b02-4df7-97d4-086baadf50cc'::uuid, 'ff350571-1c93-4fae-b24f-a11e26de124c'::uuid, '2026-03-28'::date, '1.2.410.200067.100.3.20260328.1059190562.20235.1.6.Jpg', 'radiology', 'dental', '측면 두부 방사선에서 명확한 골절이나 큰 병변은 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260408-04_ff350571/2026-03-28/1775617533423_5_5e61a929.webp', 'image/webp', '37850'::integer, '2026-04-08 03:05:35.426546+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e5938dcb-efc7-4d83-9a17-78c2ea77cb3a'::uuid, 'ff350571-1c93-4fae-b24f-a11e26de124c'::uuid, '2026-03-28'::date, '34577_365077_IntoCNS_000021.jpg', 'other', NULL, '해당 측 구강에서 잇몸 충혈과 치아 마모 소견이 관찰됩니다.',
  't'::boolean, 'nuel-260408-04_ff350571/2026-03-28/1775617534240_7_68ebe2dc.webp', 'image/webp', '24964'::integer, '2026-04-08 03:05:35.426546+00'::timestamptz,
  '[{"r": 5, "cx": 40, "cy": 55}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '2b9446a7-ec34-48cc-a02a-53057211e703'::uuid, 'ff350571-1c93-4fae-b24f-a11e26de124c'::uuid, '2026-03-28'::date, '34577_365065_IntoCNS_000009.jpg', 'slit_lamp', NULL, '안구 사진으로 홍채와 결막이 관찰되며 명확한 이상 소견은 보이지 않습니다.',
  'f'::boolean, 'nuel-260408-04_ff350571/2026-03-28/1775617593604_3_4de75cb1.webp', 'image/webp', '63558'::integer, '2026-04-08 03:06:35.160401+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '9b44208e-2f2f-4745-b505-9902b2a36f7e'::uuid, 'ff350571-1c93-4fae-b24f-a11e26de124c'::uuid, '2026-03-28'::date, '34577_365058_IntoCNS_000002.jpg', 'slit_lamp', NULL, '안구 전면 사진으로 동공과 홍채가 촬영되어 있으며 뚜렷한 병변은 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260408-04_ff350571/2026-03-28/1775617593216_2_43033d3f.webp', 'image/webp', '52194'::integer, '2026-04-08 03:06:35.160401+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c6270f06-c161-4ef3-b4fa-0da549521cca'::uuid, 'ff350571-1c93-4fae-b24f-a11e26de124c'::uuid, '2026-03-28'::date, '34577_365073_IntoCNS_000017.jpg', 'other', NULL, '구강 전면 사진으로 앞니와 잇몸 상태가 촬영되어 있으며 명확한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260408-04_ff350571/2026-03-28/1775617594230_4_693f0f93.webp', 'image/webp', '27562'::integer, '2026-04-08 03:06:35.160401+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'ed987e26-9118-4ca2-b244-c9e3814f6665'::uuid, 'ff350571-1c93-4fae-b24f-a11e26de124c'::uuid, '2026-03-28'::date, '34577_365074_IntoCNS_000018.jpg', 'other', NULL, '구강 측면 사진에서 잇몸에 작은 국소성 부종으로 보이는 소견이 관찰되어 수의사 최종 평가가 필요합니다.',
  't'::boolean, 'nuel-260408-04_ff350571/2026-03-28/1775617594624_5_2edafb08.webp', 'image/webp', '29768'::integer, '2026-04-08 03:06:35.160401+00'::timestamptz,
  '[{"r": 6, "cx": 55, "cy": 75}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'eed237c5-3da7-48fa-a8d0-446d61096a3e'::uuid, 'ff350571-1c93-4fae-b24f-a11e26de124c'::uuid, '2026-03-28'::date, '34577_365036_IntoCNS_000001.jpg', 'endoscopy', NULL, '내시경 사진에서 귀 내부에 갈색 분비물과 이물질로 보이는 소견이 관찰됩니다.',
  't'::boolean, 'nuel-260408-04_ff350571/2026-03-28/1775617592305_0_ac581c4a.webp', 'image/webp', '9972'::integer, '2026-04-08 03:06:35.160401+00'::timestamptz,
  '[{"r": 6, "cx": 30, "cy": 35}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f8cf426d-ba2f-400f-8704-1a107ad0e3f6'::uuid, 'ff350571-1c93-4fae-b24f-a11e26de124c'::uuid, '2026-03-28'::date, '34577_365041_IntoCNS_000006.jpg', 'endoscopy', NULL, '내시경으로 촬영한 귀 내부 소견이며 특이한 이상 소견은 명확하지 않습니다.',
  'f'::boolean, 'nuel-260408-04_ff350571/2026-03-28/1775617592671_1_40ffe741.webp', 'image/webp', '13190'::integer, '2026-04-08 03:06:35.160401+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '0b73def5-21af-46dc-a0f5-c07e8ce05bb0'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-03-12'::date, '1.2.276.0.7230010.3.0.3.5.1.15852162.2637138347.jpg', 'radiology', 'dental', '구후방 치아의 심한 치주골 소실과 치근 노출 소견이 있어 심한 치주염 및 치은퇴축과 연관된 소견으로 보입니다, 최종 판단은 수의사에게 확인이 필요합니다.',
  't'::boolean, 'dodam-260406-01_ff18168c/2026-03-12/1775719870627_3_9f835d85.webp', 'image/webp', '25762'::integer, '2026-04-09 07:31:13.013939+00'::timestamptz,
  '[{"r": 12, "cx": 45, "cy": 55}]'::jsonb, 'clear', '심한 치주염 및 치은퇴축'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '0d655be6-7e44-4524-a2bc-fc802acb39e3'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-03-12'::date, '1.2.276.0.7230010.3.0.3.5.1.15852162.4159039848.jpg', 'radiology', 'dental', '중심부 치아주위의 골흡수와 치은후퇴 소견이 관찰되어 심한 치주염 및 치은퇴축과 연관된 소견으로 보입니다, 최종 판단은 수의사에게 확인이 필요합니다.',
  't'::boolean, 'dodam-260406-01_ff18168c/2026-03-12/1775719869860_1_422d0959.webp', 'image/webp', '28840'::integer, '2026-04-09 07:31:13.013939+00'::timestamptz,
  '[{"r": 10, "cx": 50, "cy": 65}]'::jsonb, 'clear', '심한 치주염 및 치은퇴축'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '1781ac2b-fc9c-46ad-a1a6-0c13c8164821'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-03-12'::date, '1.2.276.0.7230010.3.0.3.5.1.15852162.255576773.jpg', 'radiology', 'dental', '치근 주위의 광범위한 방사선학적 골흡수와 치은퇴축이 보여 심한 치주염 및 치은퇴축과 관련된 소견으로 보입니다, 최종 판단은 수의사에게 확인이 필요합니다.',
  't'::boolean, 'dodam-260406-01_ff18168c/2026-03-12/1775719870242_2_846d7fe9.webp', 'image/webp', '32274'::integer, '2026-04-09 07:31:13.013939+00'::timestamptz,
  '[{"r": 10, "cx": 75, "cy": 60}]'::jsonb, 'clear', '심한 치주염 및 치은퇴축'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '20f19558-a88d-474f-a59b-f9cc1bf24887'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-03-12'::date, '1.2.276.0.7230010.3.0.3.5.1.15852186.2983982659.jpg', 'radiology', 'dental', '치조골의 불규칙한 흡수와 치은퇴축이 관찰되어 심한 치주염 및 치은퇴축과 관련될 가능성이 높아 보입니다, 최종 판단은 수의사에게 확인이 필요합니다.',
  't'::boolean, 'dodam-260406-01_ff18168c/2026-03-12/1775719870986_4_f761bed2.webp', 'image/webp', '27814'::integer, '2026-04-09 07:31:13.013939+00'::timestamptz,
  '[{"r": 12, "cx": 40, "cy": 50}]'::jsonb, 'clear', '심한 치주염 및 치은퇴축'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b2604578-a6c9-4999-8310-7cc0e133f68d'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-03-12'::date, '1.2.276.0.7230010.3.0.3.5.1.15852186.1074980543.jpg', 'radiology', 'dental', '치주골의 광범위한 소실 및 치은퇴축 소견이 관찰되어 심한 치주염 및 치은퇴축과 연관된 소견으로 보입니다, 최종 판단은 수의사에게 확인이 필요합니다.',
  't'::boolean, 'dodam-260406-01_ff18168c/2026-03-12/1775719871699_6_0a8f03a1.webp', 'image/webp', '34224'::integer, '2026-04-09 07:31:13.013939+00'::timestamptz,
  '[{"r": 10, "cx": 65, "cy": 60}]'::jsonb, 'clear', '심한 치주염 및 치은퇴축'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e63fc71a-ae3f-4daa-a5cd-75adfcfaa485'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-03-12'::date, '1.2.276.0.7230010.3.0.3.5.1.15852186.4135301790.jpg', 'radiology', 'dental', '치근 및 주위 골의 명백한 흡수 소견으로 심한 치주염 및 치은퇴축과 관련된 소견으로 보이며, 최종 판단은 수의사에게 확인이 필요합니다.',
  't'::boolean, 'dodam-260406-01_ff18168c/2026-03-12/1775719871342_5_dbf4675c.webp', 'image/webp', '26668'::integer, '2026-04-09 07:31:13.013939+00'::timestamptz,
  '[{"r": 10, "cx": 70, "cy": 45}]'::jsonb, 'clear', '심한 치주염 및 치은퇴축'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f1aae277-467d-4ac4-917b-50607ff14593'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-03-12'::date, '1.2.276.0.7230010.3.0.3.5.1.15852162.3876911789.jpg', 'radiology', 'dental', '치주골 흡수와 치은퇴축이 뚜렷하여 심한 치주염 및 치은퇴축과 관련된 소견으로 보이며, 최종 판단은 수의사에게 확인이 필요합니다.',
  't'::boolean, 'dodam-260406-01_ff18168c/2026-03-12/1775719868743_0_da2035d2.webp', 'image/webp', '25830'::integer, '2026-04-09 07:31:13.013939+00'::timestamptz,
  '[{"r": 12, "cx": 70, "cy": 50}]'::jsonb, 'clear', '심한 치주염 및 치은퇴축'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '0023810f-880c-411d-8fbc-815e29182678'::uuid, 'b39a7ebc-dcd8-488d-a0e1-01e7ecfad96f'::uuid, '2026-04-18'::date, '1.2.410.200067.100.3.20260418.1610430805.9772.1.9.jpg', 'radiology', 'joint', '좌우 고관절 측면 영상에서 관절면 불균일 및 가장자리 골증식이 관찰되어 고관절염이 의심됩니다.',
  't'::boolean, 'nuel-260422-01_b39a7ebc/2026-04-18/1776828509651_6_a336ec5b.webp', 'image/webp', '102110'::integer, '2026-04-22 03:28:30.538823+00'::timestamptz,
  '[{"r": 6, "cx": 30, "cy": 55}, {"r": 6, "cx": 70, "cy": 55}]'::jsonb, 'clear', '고관절염'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '4aa8ca00-4756-4e2e-a0fb-aedf12ee1b16'::uuid, 'b39a7ebc-dcd8-488d-a0e1-01e7ecfad96f'::uuid, '2026-04-18'::date, '1.2.410.200067.100.3.20260418.1607290752.9139.1.4.jpg', 'radiology', 'abdomen', '흉배부 측면 영상으로 척추 및 체강 전반을 평가하였으며 뚜렷한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260422-01_b39a7ebc/2026-04-18/1776828506890_2_c79b1b5c.webp', 'image/webp', '117482'::integer, '2026-04-22 03:28:30.538823+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '94bc6da6-8a0b-426d-a0ed-4ea7b2aa531e'::uuid, 'b39a7ebc-dcd8-488d-a0e1-01e7ecfad96f'::uuid, '2026-04-18'::date, '1.2.410.200067.100.3.20260418.1607450380.9191.1.5.jpg', 'radiology', 'thorax', '정중 방사선 촬영으로 심폐 및 흉부 구조를 평가하였으나 명확한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260422-01_b39a7ebc/2026-04-18/1776828508125_3_8542f7e6.webp', 'image/webp', '84242'::integer, '2026-04-22 03:28:30.538823+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'cf303a2e-a91e-4c78-8429-58cbb9fe4331'::uuid, 'b39a7ebc-dcd8-488d-a0e1-01e7ecfad96f'::uuid, '2026-04-18'::date, '1.2.410.200067.100.3.20260418.1606300497.8946.1.2.jpg', 'radiology', 'abdomen', '복부 및 흉부 측면 촬영으로 명확한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260422-01_b39a7ebc/2026-04-18/1776828506318_1_0db8569a.webp', 'image/webp', '114164'::integer, '2026-04-22 03:28:30.538823+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e016b6de-451d-494f-b5f9-80495d0b1a61'::uuid, 'b39a7ebc-dcd8-488d-a0e1-01e7ecfad96f'::uuid, '2026-04-18'::date, '1.2.410.200067.100.3.20260418.1608150792.9289.1.6.jpg', 'radiology', 'joint', '골반/고관절 정중영상에서 양측 고관절의 관절면 불규칙과 가장자리 골증식 소견이 관찰되어 고관절염이 의심됩니다.',
  't'::boolean, 'nuel-260422-01_b39a7ebc/2026-04-18/1776828508706_4_cd0d0126.webp', 'image/webp', '60998'::integer, '2026-04-22 03:28:30.538823+00'::timestamptz,
  '[{"r": 8, "cx": 42, "cy": 45}, {"r": 8, "cx": 58, "cy": 45}]'::jsonb, 'clear', '고관절염'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f7d5f034-16c7-496e-b81f-7de70cd3cdd9'::uuid, 'b39a7ebc-dcd8-488d-a0e1-01e7ecfad96f'::uuid, '2026-04-18'::date, '1.2.410.200067.100.3.20260418.1609270607.9524.1.7.jpg', 'radiology', 'joint', '측측 및 정중 영상에서 양측 고관절의 관절면 불규칙과 가장자리 골증식이 확인되어 고관절염이 의심됩니다.',
  't'::boolean, 'nuel-260422-01_b39a7ebc/2026-04-18/1776828509078_5_dc507a21.webp', 'image/webp', '101270'::integer, '2026-04-22 03:28:30.538823+00'::timestamptz,
  '[{"r": 8, "cx": 45, "cy": 50}, {"r": 8, "cx": 55, "cy": 50}]'::jsonb, 'clear', '고관절염'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'fdf49a9c-69f1-459b-8c3c-372df8f77714'::uuid, 'b39a7ebc-dcd8-488d-a0e1-01e7ecfad96f'::uuid, '2026-04-18'::date, '1.2.410.200067.100.3.20260418.1606060354.8868.1.1.jpg', 'radiology', 'thorax', '경부-흉부 측면 방사선에서 등쪽 피하에 작은 금속성 이물음영이 관찰됩니다.',
  't'::boolean, 'nuel-260422-01_b39a7ebc/2026-04-18/1776828505430_0_8039ebe8.webp', 'image/webp', '130002'::integer, '2026-04-22 03:28:30.538823+00'::timestamptz,
  '[{"r": 3, "cx": 60, "cy": 42}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '39aad68b-96c7-4208-b60f-c612ce4e05a4'::uuid, 'b39a7ebc-dcd8-488d-a0e1-01e7ecfad96f'::uuid, '2025-09-20'::date, '1.2.410.200067.100.3.20250920.1508180471.24185.1.2.Jpg', 'radiology', 'joint', '우측 대퇴부 및 슬관절의 측면 방사선 사진으로 명확한 골절이나 뚜렷한 관절 병변은 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260422-01_b39a7ebc/2025-09-20/1776828611740_1_71196a0b.webp', 'image/webp', '53938'::integer, '2026-04-22 03:30:13.441806+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '3f3ea38a-27ac-46ad-8c66-b7f872516253'::uuid, 'b39a7ebc-dcd8-488d-a0e1-01e7ecfad96f'::uuid, '2025-09-20'::date, '1.2.410.200067.100.3.20250920.1507130881.23973.1.1.Jpg', 'radiology', 'joint', '골반 촬영에서 양측 고관절의 관절면 불일치와 경미한 부정렬 소견이 보여 고관절염이 의심됩니다.',
  't'::boolean, 'nuel-260422-01_b39a7ebc/2025-09-20/1776828610615_0_7c477ed0.webp', 'image/webp', '59146'::integer, '2026-04-22 03:30:13.441806+00'::timestamptz,
  '[{"r": 6, "cx": 31, "cy": 28}, {"r": 6, "cx": 69, "cy": 28}]'::jsonb, NULL, '췌장염'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '4f22b6cc-e8d0-45c3-9d51-1a90ab10353b'::uuid, 'b39a7ebc-dcd8-488d-a0e1-01e7ecfad96f'::uuid, '2025-09-20'::date, '1.2.410.200067.100.3.20250920.1508550125.24306.1.3.Jpg', 'radiology', 'joint', '좌측 대퇴부 및 슬관절의 측면 영상으로 큰 이상 소견은 확인되지 않습니다.',
  'f'::boolean, 'nuel-260422-01_b39a7ebc/2025-09-20/1776828612779_2_57b63703.webp', 'image/webp', '50598'::integer, '2026-04-22 03:30:13.441806+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '26a75cca-6e18-4dbc-a180-3181c7b23485'::uuid, 'b39a7ebc-dcd8-488d-a0e1-01e7ecfad96f'::uuid, '2026-04-18'::date, '35103_374473_IntoCNS_000009.jpg', 'slit_lamp', NULL, '슬릿램프(안구) 사진으로 눈 표면과 결막을 관찰한 이미지입니다.',
  'f'::boolean, 'nuel-260422-01_b39a7ebc/2026-04-18/1776829754212_1_95ab84fd.webp', 'image/webp', '73536'::integer, '2026-04-22 03:49:18.76429+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '4709ceb1-e3eb-412b-aae1-bed717568429'::uuid, 'b39a7ebc-dcd8-488d-a0e1-01e7ecfad96f'::uuid, '2026-04-18'::date, '35103_374517_IntoCNS_000001.jpg', 'endoscopy', NULL, '외이도 내시경 사진으로 이개부 발적과 분비물이 관찰되어 외이염과 일치하는 소견으로 보입니다.',
  't'::boolean, 'nuel-260422-01_b39a7ebc/2026-04-18/1776829756937_6_d3b58c02.webp', 'image/webp', '15500'::integer, '2026-04-22 03:49:18.76429+00'::timestamptz,
  '[{"r": 10, "cx": 50, "cy": 50}]'::jsonb, 'clear', '외이염'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '4f19d5dd-7dc0-4057-bf1a-9539ec902c79'::uuid, 'b39a7ebc-dcd8-488d-a0e1-01e7ecfad96f'::uuid, '2026-04-18'::date, '35103_374466_IntoCNS_000002.jpg', 'slit_lamp', NULL, '슬릿램프(안구) 사진으로 안구 표면 상태 관찰용 이미지입니다.',
  'f'::boolean, 'nuel-260422-01_b39a7ebc/2026-04-18/1776829753169_0_054bc227.webp', 'image/webp', '62804'::integer, '2026-04-22 03:49:18.76429+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '651c39ec-5cc0-4de4-9f9d-2fff2c380790'::uuid, 'b39a7ebc-dcd8-488d-a0e1-01e7ecfad96f'::uuid, '2026-04-18'::date, '35103_374518_IntoCNS_000002.jpg', 'endoscopy', NULL, '외이도 내시경 사진으로 이개부 발적 및 귀지 소견이 관찰되어 외이염과 일치하는 소견으로 보입니다.',
  't'::boolean, 'nuel-260422-01_b39a7ebc/2026-04-18/1776829757545_7_c45c17f2.webp', 'image/webp', '13176'::integer, '2026-04-22 03:49:18.76429+00'::timestamptz,
  '[{"r": 10, "cx": 50, "cy": 50}]'::jsonb, 'clear', '외이염'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '728be117-f72a-4083-82ab-ed516fec13f6'::uuid, 'b39a7ebc-dcd8-488d-a0e1-01e7ecfad96f'::uuid, '2026-04-18'::date, '35103_374483_IntoCNS_000019.jpg', 'other', NULL, '구강 사진으로 송곳니와 주위 잇몸을 촬영한 이미지입니다.',
  'f'::boolean, 'nuel-260422-01_b39a7ebc/2026-04-18/1776829755780_3_d2da3c92.webp', 'image/webp', '31976'::integer, '2026-04-22 03:49:18.76429+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8f99636b-1e03-4b67-8849-89c2220f9dbc'::uuid, 'b39a7ebc-dcd8-488d-a0e1-01e7ecfad96f'::uuid, '2026-04-18'::date, '35103_374490_IntoCNS_000026.jpg', 'other', NULL, '구강 사진으로 측면 어금니와 잇몸 상태를 촬영한 이미지입니다.',
  'f'::boolean, 'nuel-260422-01_b39a7ebc/2026-04-18/1776829756595_5_e1b0261e.webp', 'image/webp', '30766'::integer, '2026-04-22 03:49:18.76429+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e6449e17-05e0-46d9-9d32-7fc7b5f436b2'::uuid, 'b39a7ebc-dcd8-488d-a0e1-01e7ecfad96f'::uuid, '2026-04-18'::date, '35103_374482_IntoCNS_000018.jpg', 'other', NULL, '구강 사진으로 앞니와 잇몸 상태를 관찰한 이미지입니다.',
  'f'::boolean, 'nuel-260422-01_b39a7ebc/2026-04-18/1776829754743_2_756d760f.webp', 'image/webp', '52044'::integer, '2026-04-22 03:49:18.76429+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'fa19cbfd-4960-4cd3-ad53-8332d8a55096'::uuid, 'b39a7ebc-dcd8-488d-a0e1-01e7ecfad96f'::uuid, '2026-04-18'::date, '35103_374485_IntoCNS_000021.jpg', 'other', NULL, '구강 사진으로 어금니와 치경부를 관찰한 이미지입니다.',
  'f'::boolean, 'nuel-260422-01_b39a7ebc/2026-04-18/1776829756226_4_757eae6a.webp', 'image/webp', '37970'::integer, '2026-04-22 03:49:18.76429+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '1d3137ed-af48-490c-be01-7bd3e087cbb4'::uuid, 'def92dd9-8572-48a3-bfed-3c2a1708678b'::uuid, '2026-04-04'::date, '34743_368337_IntoCNS_000001.jpg', 'other', NULL, '외이도에 갈색 귀지와 염증성 소견이 보여 외이도염이 의심됩니다.',
  't'::boolean, 'nuel-260422-02_def92dd9/2026-04-04/1776830517974_5_223fbfe9.webp', 'image/webp', '14362'::integer, '2026-04-22 04:01:59.931281+00'::timestamptz,
  '[{"r": 8, "cx": 50, "cy": 50}]'::jsonb, 'clear', '외이도염'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '2abd9956-1cc5-4b63-a5c6-4cf220798132'::uuid, 'def92dd9-8572-48a3-bfed-3c2a1708678b'::uuid, '2026-04-04'::date, '1.2.410.200067.100.3.20260404.1415410571.2116.1.1.Jpg', 'radiology', 'thorax', '측면 흉부/경부 방사선 영상으로 흉추와 늑골 평가 목적의 촬영입니다.',
  'f'::boolean, 'nuel-260422-02_def92dd9/2026-04-04/1776830513625_0_7cb44e98.webp', 'image/webp', '97340'::integer, '2026-04-22 04:01:59.931281+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '2e2c4b39-9bbe-49ed-b624-18996228ff90'::uuid, 'def92dd9-8572-48a3-bfed-3c2a1708678b'::uuid, '2026-04-04'::date, '34743_368339_IntoCNS_000003.jpg', 'other', NULL, '외이도에 갈색 귀지와 염증성 소견이 보여 외이도염이 의심됩니다.',
  't'::boolean, 'nuel-260422-02_def92dd9/2026-04-04/1776830518331_6_5a5e4132.webp', 'image/webp', '14828'::integer, '2026-04-22 04:01:59.931281+00'::timestamptz,
  '[{"r": 8, "cx": 50, "cy": 48}]'::jsonb, 'clear', '외이도염'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '736d623a-4da5-4c6b-8128-3996bb1fe3f0'::uuid, 'def92dd9-8572-48a3-bfed-3c2a1708678b'::uuid, '2026-04-04'::date, '1.2.410.200067.100.3.20260404.1415590201.2175.1.2.Jpg', 'radiology', 'abdomen', '측면 복부/흉요추 방사선 영상으로 복부 장기 및 척추 정렬 확인 목적의 촬영입니다.',
  'f'::boolean, 'nuel-260422-02_def92dd9/2026-04-04/1776830514819_1_e3e1ec10.webp', 'image/webp', '91452'::integer, '2026-04-22 04:01:59.931281+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'aed9a2a6-0b07-44f2-a1c3-f9ca53140664'::uuid, 'def92dd9-8572-48a3-bfed-3c2a1708678b'::uuid, '2026-04-04'::date, '34743_368450_IntoCNS_000002.jpg', 'slit_lamp', NULL, '결막에 충혈 및 각막 염색 소견이 의심되어 안과적 추가 평가가 권장됩니다.',
  't'::boolean, 'nuel-260422-02_def92dd9/2026-04-04/1776830518677_7_98934042.webp', 'image/webp', '69704'::integer, '2026-04-22 04:01:59.931281+00'::timestamptz,
  '[{"r": 15, "cx": 50, "cy": 50}]'::jsonb, NULL, '결막충혈'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b37451fa-1d1c-47a4-a4f6-d619680c16f1'::uuid, 'def92dd9-8572-48a3-bfed-3c2a1708678b'::uuid, '2026-04-04'::date, '3.PNG', 'other', NULL, '혈액 검사 결과표 이미지입니다; 임상 해석은 수의사 소견을 따르십시오.',
  'f'::boolean, 'nuel-260422-02_def92dd9/2026-04-04/1776830517616_4_3792e043.webp', 'image/webp', '11576'::integer, '2026-04-22 04:01:59.931281+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'cc282846-b2df-4f2c-8afa-ca1ac5a87feb'::uuid, 'def92dd9-8572-48a3-bfed-3c2a1708678b'::uuid, '2026-04-04'::date, '1.2.410.200067.100.3.20260404.1416300365.2276.1.3.Jpg', 'radiology', 'joint', '양측 고관절에 관절염 및 아탈구 소견이 의심되며 수의사 진단이 필요합니다.',
  't'::boolean, 'nuel-260422-02_def92dd9/2026-04-04/1776830515942_2_444879c6.webp', 'image/webp', '82052'::integer, '2026-04-22 04:01:59.931281+00'::timestamptz,
  '[{"r": 10, "cx": 60, "cy": 62}]'::jsonb, 'clear', '양측 고관절 관절염 및 아탈구'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'ce69def4-9480-4cfa-8022-2318b14407b7'::uuid, 'def92dd9-8572-48a3-bfed-3c2a1708678b'::uuid, '2026-04-04'::date, '1.2.410.200067.100.3.20260404.1417060130.2394.1.5.Jpg', 'radiology', 'joint', '양측 고관절에 관절염 및 아탈구 소견이 의심되며 수의사 진단이 필요합니다.',
  't'::boolean, 'nuel-260422-02_def92dd9/2026-04-04/1776830517047_3_31e30057.webp', 'image/webp', '99818'::integer, '2026-04-22 04:01:59.931281+00'::timestamptz,
  '[{"r": 8, "cx": 45, "cy": 72}, {"r": 8, "cx": 55, "cy": 72}]'::jsonb, 'clear', '양측 고관절 관절염 및 아탈구'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '229b5c78-afb9-4faa-8a04-93adf136e657'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2025-12-30'::date, '1.2.840.113619.2.400.390130752.1767086779.4.1.jpg', 'ultrasound', NULL, '우측 신장 초음파 영상으로, 명확한 병변은 관찰되지 않습니다.',
  'f'::boolean, 'dodam-260420-01_ba6e2344/2025-12-30/1776907888783_0_46939f3f.webp', 'image/webp', '34436'::integer, '2026-04-23 01:31:33.360832+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '2a6cfe94-1189-4514-8fc4-5fcbdb0eb172'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2025-12-30'::date, '1.2.840.113619.2.400.390130752.1767086754.3.1.jpg', 'ultrasound', NULL, '복부 초음파에서 특별한 이상 소견은 확인되지 않습니다.',
  'f'::boolean, 'dodam-260420-01_ba6e2344/2025-12-30/1776907889357_1_10bdb79e.webp', 'image/webp', '34612'::integer, '2026-04-23 01:31:33.360832+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '32ccc4ea-437b-4566-b7b3-d9d14277bb84'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2025-12-30'::date, '1.2.840.113619.2.400.390130752.1767086898.10.1.jpg', 'ultrasound', NULL, '복부 초음파에서 특이 소견은 관찰되지 않습니다.',
  'f'::boolean, 'dodam-260420-01_ba6e2344/2025-12-30/1776907891941_6_8e2be25e.webp', 'image/webp', '44226'::integer, '2026-04-23 01:31:33.360832+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '56cab372-7e6a-4aa2-916b-6d336f2c2c63'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2025-12-30'::date, '1.2.840.113619.2.400.390130752.1767086834.6.1.jpg', 'ultrasound', NULL, '좌측 신장에서 큰 무에코성 병변(액체성으로 추정)이 관찰되어 수의사의 추가 평가가 권장됩니다.',
  't'::boolean, 'dodam-260420-01_ba6e2344/2025-12-30/1776907891589_5_88653077.webp', 'image/webp', '32454'::integer, '2026-04-23 01:31:33.360832+00'::timestamptz,
  '[{"r": 15, "cx": 75, "cy": 62}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '677bcbd4-0095-4d1f-85e7-d2d88de74572'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2025-12-30'::date, '1.2.840.113619.2.400.390130752.1767086888.9.1.jpg', 'ultrasound', NULL, '초음파상 소화관의 층상 구조가 관찰되며 명확한 병변은 보이지 않습니다.',
  'f'::boolean, 'dodam-260420-01_ba6e2344/2025-12-30/1776907892329_7_49dfe0a9.webp', 'image/webp', '37234'::integer, '2026-04-23 01:31:33.360832+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8b4bcd55-66ad-495a-8b06-f8d85c21b223'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2025-12-30'::date, '1.2.840.113619.2.400.390130752.1767086874.8.1.jpg', 'ultrasound', NULL, '국소적인 환형 구조가 보이나 명확한 병변으로 단정할 수는 없습니다.',
  'f'::boolean, 'dodam-260420-01_ba6e2344/2025-12-30/1776907890773_3_d1ea3574.webp', 'image/webp', '40400'::integer, '2026-04-23 01:31:33.360832+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'aa6cbec4-86e6-42ff-a986-d9a4d49de665'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2025-12-30'::date, '1.2.840.113619.2.400.390130752.1767086862.7.1.jpg', 'ultrasound', NULL, '복부 소견에서 뚜렷한 병변은 보이지 않습니다.',
  'f'::boolean, 'dodam-260420-01_ba6e2344/2025-12-30/1776907890420_2_ecbf6b1f.webp', 'image/webp', '33624'::integer, '2026-04-23 01:31:33.360832+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b11a77c9-8d70-451e-8fd1-57f38c1985a4'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2025-12-30'::date, '1.2.840.113619.2.400.390130752.1767086804.5.1.jpg', 'ultrasound', NULL, '담낭이 관찰되며 뚜렷한 담석이나 대량의 슬러지는 보이지 않습니다.',
  'f'::boolean, 'dodam-260420-01_ba6e2344/2025-12-30/1776907891123_4_6ee59af5.webp', 'image/webp', '31272'::integer, '2026-04-23 01:31:33.360832+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '0246a072-8524-481d-b06d-7789299439c4'::uuid, '03d77abb-cdd5-46c3-b963-7d604fd3dd27'::uuid, '2026-04-13'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.23263.13691.jpg', 'radiology', 'abdomen', '측면 복부 방사선 사진에서 카테터와 수술 후 장치가 시야에 보입니다.',
  't'::boolean, 'baek-260423-02_03d77abb/2026-04-13/1776927759915_0_1a6f2017.webp', 'image/webp', '40918'::integer, '2026-04-23 07:02:43.705861+00'::timestamptz,
  '[{"r": 8, "cx": 78, "cy": 62}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '0e8de652-71e8-4ebd-9362-5a8a7321cb95'::uuid, '03d77abb-cdd5-46c3-b963-7d604fd3dd27'::uuid, '2026-04-13'::date, '1.2.840.113663.1500.1.464718846.3.4.20260409.143854.969.jpg', 'ultrasound', NULL, '방광 초음파에서 강한 에코를 가진 조직이 보이며 결석 가능성이 높습니다.',
  't'::boolean, 'baek-260423-02_03d77abb/2026-04-13/1776927761580_4_3e7c9b9c.webp', 'image/webp', '44358'::integer, '2026-04-23 07:02:43.705861+00'::timestamptz,
  '[{"r": 6, "cx": 50, "cy": 30}]'::jsonb, 'clear', '방광 결석'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '3b3bdf87-0422-41c1-bf30-122dcc3f2784'::uuid, '03d77abb-cdd5-46c3-b963-7d604fd3dd27'::uuid, '2026-04-13'::date, '1.2.840.113663.1500.1.464718846.3.3.20260413.103414.838.jpg', 'ultrasound', NULL, '심장 컬러도플러 영상에서 뚜렷한 혈류 혼탁이 보여 심장 질환과 관련될 소견입니다.',
  't'::boolean, 'baek-260423-02_03d77abb/2026-04-13/1776927761935_5_d3e912b4.webp', 'image/webp', '44226'::integer, '2026-04-23 07:02:43.705861+00'::timestamptz,
  NULL::jsonb, 'clear', '심장 질환'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '545e0d04-bdea-4aa2-9e52-1ffae6e5a8b5'::uuid, '03d77abb-cdd5-46c3-b963-7d604fd3dd27'::uuid, '2026-04-13'::date, '1.2.840.113663.1500.1.464718846.3.1.20260413.103404.404.jpg', 'ultrasound', NULL, '심장 초음파 영상에서 구조 및 혈류 이상 소견이 있어 심장 질환과 연관될 수 있습니다.',
  't'::boolean, 'baek-260423-02_03d77abb/2026-04-13/1776927762601_7_f7335e4b.webp', 'image/webp', '33302'::integer, '2026-04-23 07:02:43.705861+00'::timestamptz,
  NULL::jsonb, NULL, '심장 질환'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8160f26d-fde2-4804-b8d3-c8c1824f33f6'::uuid, '03d77abb-cdd5-46c3-b963-7d604fd3dd27'::uuid, '2026-04-13'::date, '1.2.840.113663.1500.1.464718846.3.21.20260413.103928.708.jpg', 'ultrasound', NULL, '심장 도플러(스펙트럴)에서 비정상적 혈류 패턴이 관찰되어 심장 질환과 관련될 수 있습니다.',
  't'::boolean, 'baek-260423-02_03d77abb/2026-04-13/1776927760491_1_7e3fee65.webp', 'image/webp', '20016'::integer, '2026-04-23 07:02:43.705861+00'::timestamptz,
  NULL::jsonb, NULL, '심장 질환'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '9448dce9-4626-42c9-a7a3-8a890cef5a52'::uuid, '03d77abb-cdd5-46c3-b963-7d604fd3dd27'::uuid, '2026-04-13'::date, '1.2.840.113663.1500.1.464718846.3.14.20260413.103743.482.jpg', 'ultrasound', NULL, '심장 컬러도플러에서 명확한 혈류 소용돌이(역류 가능)가 관찰되어 심장 질환과 연관될 수 있습니다.',
  't'::boolean, 'baek-260423-02_03d77abb/2026-04-13/1776927761205_3_071f9839.webp', 'image/webp', '25910'::integer, '2026-04-23 07:02:43.705861+00'::timestamptz,
  NULL::jsonb, 'clear', '심장 질환'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b9926a27-cd1d-4c28-8f04-54fcc229ee22'::uuid, '03d77abb-cdd5-46c3-b963-7d604fd3dd27'::uuid, '2026-04-13'::date, '1.2.840.113663.1500.1.464718846.3.20.20260413.103915.190.jpg', 'ultrasound', NULL, '심장 도플러 검사에서 연속파 도플러 소견이 확인되어 추가 심장 평가가 필요합니다.',
  't'::boolean, 'baek-260423-02_03d77abb/2026-04-13/1776927760858_2_289c04d1.webp', 'image/webp', '32850'::integer, '2026-04-23 07:02:43.705861+00'::timestamptz,
  NULL::jsonb, NULL, '심장 질환'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c3e2492b-8fc6-43ec-a78c-fa01d4b5e2d1'::uuid, '03d77abb-cdd5-46c3-b963-7d604fd3dd27'::uuid, '2026-04-13'::date, '1.2.840.113663.1500.1.464718846.3.1.20260409.143837.318.jpg', 'ultrasound', NULL, '방광 초음파에서 약 0.8 cm 크기의 고에코 구조(결석으로 보임)가 측정되어 관찰됩니다.',
  't'::boolean, 'baek-260423-02_03d77abb/2026-04-13/1776927762264_6_2397bbad.webp', 'image/webp', '24934'::integer, '2026-04-23 07:02:43.705861+00'::timestamptz,
  '[{"r": 4, "cx": 52, "cy": 45}]'::jsonb, 'clear', '방광 결석'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '0d556dc9-f8af-40a8-a6e3-1a7d265794b1'::uuid, '03d77abb-cdd5-46c3-b963-7d604fd3dd27'::uuid, '2026-04-13'::date, '1.2.840.113663.1500.1.464718846.3.8.20260413.103618.864.jpg', 'ultrasound', NULL, '심장 초음파에서 좌심방 확장 소견이 관찰되어 심장 질환과 관련이 의심됩니다.',
  't'::boolean, 'baek-260423-02_03d77abb/2026-04-13/1776927915747_0_20932336.webp', 'image/webp', '20302'::integer, '2026-04-23 07:05:16.453836+00'::timestamptz,
  '[{"r": 8, "cx": 55, "cy": 35}]'::jsonb, 'clear', '심장 질환'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'eac3d1ab-5e48-427f-b5c9-90625fe2cc4f'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(DR)(20260424160614)000.jpg', 'radiology', 'thorax', '흉부 측면 방사선영상에 흉부 상부에 선형의 방사선 불투과성 구조가 보여 이물 또는 의료기구 가능성이 있어 수의사 판정이 필요합니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777252466187_0_a42f4a03.webp', 'image/webp', '254720'::integer, '2026-04-27 01:14:27.989786+00'::timestamptz,
  '[{"r": 4, "cx": 60, "cy": 30}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '2874006d-065b-4d90-a9eb-4aeb2a80b841'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(DR)(20260424160633)003.jpg', 'radiology', 'thorax', '복부-흉부 정면 방사선 사진에서 급성 골절이나 명확한 장기 이상은 관찰되지 않습니다.',
  'f'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777252607719_2_c161c31d.webp', 'image/webp', '186784'::integer, '2026-04-27 01:16:49.72924+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'cb0c9d1c-0e24-491b-8cb4-ba345f2a0fb4'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(DR)(20260424160625)001.jpg', 'radiology', 'joint', '우측 전지·주관절 및 전완부 방사선 사진에서 명백한 골절이나 탈구는 관찰되지 않습니다.',
  'f'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777252606575_0_17a39c99.webp', 'image/webp', '61654'::integer, '2026-04-27 01:16:49.72924+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'd9f3be0d-dc4c-4fc3-972c-73a1d6e9b583'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(DR)(20260424160630)002.jpg', 'radiology', 'thorax', '흉요추부 방사선 사진에서 흉추-요추 경계부에 경미한 골융기(퇴행성 변화) 의심 소견이 보입니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777252607132_1_f8066a7a.webp', 'image/webp', '235536'::integer, '2026-04-27 01:16:49.72924+00'::timestamptz,
  '[{"r": 6, "cx": 55, "cy": 28}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '3cf085fe-4c17-4a9e-9bc0-181fd40ee020'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(DR)(20260424160636)004.jpg', 'radiology', 'abdomen', '우측 복부 부위에 작고 금속성의 이물 음영이 관찰되어 추가 확인이 필요합니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777252654915_0_ec6e7853.webp', 'image/webp', '227930'::integer, '2026-04-27 01:17:38.155663+00'::timestamptz,
  '[{"r": 4, "cx": 78, "cy": 68}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '862ba4cc-cc0c-4d8e-ac71-08d0f64e61dc'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(DR)(20260424160645)006.jpg', 'radiology', 'joint', '양측 하지 영상에서 좌측 대퇴부 근위부에 작은 방사선불투과성 이물음영이 관찰되어 확인이 권장됩니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777252656427_2_5d4ed387.webp', 'image/webp', '143500'::integer, '2026-04-27 01:17:38.155663+00'::timestamptz,
  '[{"r": 4, "cx": 42, "cy": 50}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b5cac0da-c195-4468-8359-b5554666c872'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(DR)(20260424160641)005.jpg', 'radiology', 'joint', '좌측 대퇴부 측면 영상에 작은 둥근 고밀도 음영이 보여 부착 위치 확인이 필요합니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777252656040_1_1da0653e.webp', 'image/webp', '62222'::integer, '2026-04-27 01:17:38.155663+00'::timestamptz,
  '[{"r": 4, "cx": 22, "cy": 62}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '490a09e5-4644-4111-8d39-ee98cbf13a91'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)(20260424162804)000.jpg', 'ultrasound', NULL, '복부 초음파에서 중심에 환형의 층상 구조가 관찰되어 추가 검사 및 수의사 판단이 권장됩니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777252958416_0_1cc1bd95.webp', 'image/webp', '10822'::integer, '2026-04-27 01:22:39.814078+00'::timestamptz,
  '[{"r": 12, "cx": 56, "cy": 42}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '894f383e-6ddb-41d6-8169-7131b8bb18d5'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)(20260424162806)001.jpg', 'ultrasound', NULL, '초음파에서 중심부에 둥글고 경계가 비교적 명확한 낭성 또는 혼합 에코 소견이 관찰되며 수의사의 추가 평가가 필요합니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777252975235_0_7e2ac507.webp', 'image/webp', '10458'::integer, '2026-04-27 01:22:55.774317+00'::timestamptz,
  '[{"r": 12, "cx": 48, "cy": 35}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'cd467239-a28b-44c4-b06f-3e8fc9521cf9'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)(20260424162809)002.jpg', 'ultrasound', NULL, '초음파에서 장관의 동심원(타깃) 모양의 병변이 관찰되어 장중첩 등 기계적 이상 가능성을 시사하나 최종 판단은 수의사가 해야 합니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777252990182_0_7201fe0e.webp', 'image/webp', '12324'::integer, '2026-04-27 01:23:11.236333+00'::timestamptz,
  '[{"r": 6, "cx": 35, "cy": 30}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'ec10f889-6554-4609-b96a-643ca0cb15fe'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)(20260424162811)003.jpg', 'ultrasound', NULL, '초음파에서 복부 장기의 전반적 구조는 관찰되나 명확한 이상 소견은 확인되지 않습니다.',
  'f'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253001159_0_3ff14928.webp', 'image/webp', '12140'::integer, '2026-04-27 01:23:22.133604+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'bc2a08ab-59af-4fad-9934-dc88cefeea80'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)(20260424162937)015.jpg', 'ultrasound', NULL, '초음파에서 상부 중심에 약 0.45 cm 크기의 둥글고 저에코성 병변이 관찰됩니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253015561_0_fc2b20d9.webp', 'image/webp', '13534'::integer, '2026-04-27 01:23:36.051255+00'::timestamptz,
  '[{"r": 4, "cx": 62, "cy": 30}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '1a64d53c-52d2-452f-aab7-fdf72650b93d'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)004.jpg', 'ultrasound', NULL, '복부 초음파에서 넓은 무에코 영역과 내부 유체성 에코가 보여 복수 또는 액체성 병변이 의심됩니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253028981_0_8464f081.webp', 'image/webp', '11952'::integer, '2026-04-27 01:23:49.947138+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 60}, {"r": 5, "cx": 66, "cy": 38}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'd45aa6df-f634-4671-babb-aec379bf7b09'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)005.jpg', 'ultrasound', NULL, '상부 복부에 경계가 불명확한 저에코성 병변이 관찰되어 추가 검사와 수의사 확인이 필요합니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253041228_0_7c1f6a54.webp', 'image/webp', '12440'::integer, '2026-04-27 01:24:01.74669+00'::timestamptz,
  '[{"r": 10, "cx": 55, "cy": 30}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '7fb54733-9dec-4e1a-b796-47ffb5601903'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)006.jpg', 'ultrasound', NULL, '복부 초음파에서 뚜렷한 병변은 관찰되지 않아 추가적인 임상평가가 필요합니다.',
  'f'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253051110_0_c98e9140.webp', 'image/webp', '13018'::integer, '2026-04-27 01:24:11.872105+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '17afdeaf-b930-42ee-b13b-3ca44d268fa3'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)007.jpg', 'ultrasound', NULL, '영상에서 복강 내 무에코성 액체 음영이 관찰되어 복수가 의심되며 최종 평가는 수의사 소견이 필요합니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253121753_0_bd5b622d.webp', 'image/webp', '13052'::integer, '2026-04-27 01:25:22.984362+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 65}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '60948d4c-8512-4f62-b905-e9faba5ca362'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)008.jpg', 'ultrasound', NULL, '초음파 영상에서 중앙에 국소적인 고에코 소견이 관찰되어 추가 평가가 필요합니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253133791_0_56195ee7.webp', 'image/webp', '11932'::integer, '2026-04-27 01:25:34.37806+00'::timestamptz,
  '[{"r": 5, "cx": 50, "cy": 36}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '3cdfe981-8b9c-4c81-977e-37b7f73fb9cc'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)009.jpg', 'ultrasound', NULL, '초음파 영상에서 명확한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253141352_0_36527c16.webp', 'image/webp', '10830'::integer, '2026-04-27 01:25:42.681522+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '17838ebd-234f-4710-baeb-4a358f27d383'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)010.jpg', 'ultrasound', NULL, '초음파 영상 중앙에 국소적인 고에코성 음영과 주변 에코 불균일성이 보여 추가 평가가 권장됩니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253153405_0_0c742535.webp', 'image/webp', '13784'::integer, '2026-04-27 01:25:54.389107+00'::timestamptz,
  '[{"r": 8, "cx": 54, "cy": 55}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b44e6f82-c80f-406e-b148-12f08e72231c'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)011.jpg', 'ultrasound', NULL, '초음파 영상에서 명확한 이상 소견은 관찰되지 않아 임상적 상관관계와 추가 검사가 필요합니다.',
  'f'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253164124_0_c1460d02.webp', 'image/webp', '16782'::integer, '2026-04-27 01:26:05.094265+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '4e2e1af6-6e1a-459e-a41a-4ab4c152d154'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)012.jpg', 'ultrasound', NULL, '복부 초음파에서 국소적인 액체음영이 관찰되어 추가 평가가 필요합니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253175528_0_6f5fd45b.webp', 'image/webp', '15590'::integer, '2026-04-27 01:26:16.626811+00'::timestamptz,
  '[{"r": 8, "cx": 50, "cy": 30}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '03f9587a-dd78-4428-bff8-f6ea90144823'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)013.jpg', 'ultrasound', NULL, '상복부 초음파에서 원형의 저에코 병변과 내부 고에코 점이 관찰되어 추가 평가가 권장됩니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253187406_0_296d5ef5.webp', 'image/webp', '16270'::integer, '2026-04-27 01:26:28.374649+00'::timestamptz,
  '[{"r": 5, "cx": 45, "cy": 28}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b41b3f11-8d84-4448-b04c-3be8750db056'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)014.jpg', 'ultrasound', NULL, '초음파에서 중심부에 약 0.6 cm 크기로 보이는 국소 병변 소견이 관찰되어 추가 평가가 필요합니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253200625_0_e5c4c28a.webp', 'image/webp', '13040'::integer, '2026-04-27 01:26:41.139387+00'::timestamptz,
  '[{"r": 4, "cx": 50, "cy": 36}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '79ce889b-7f09-4ac4-8d13-0587cbcd123f'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)016.jpg', 'ultrasound', NULL, '초음파에서 중앙 부위에 약 0.5cm 크기의 국소적인 소낭성/저에코 소견이 관찰되며 수의사의 추가 해석이 필요합니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253812952_0_d03fd130.webp', 'image/webp', '14756'::integer, '2026-04-27 01:36:53.476086+00'::timestamptz,
  '[{"r": 4, "cx": 56, "cy": 30}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e824f3c8-311f-4be1-8427-369f15ecbca4'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)017.jpg', 'ultrasound', NULL, '초음파에서 우측 복부에 약 0.3–0.5 cm 크기의 국소 소견이 측정되어 추가 평가가 필요합니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253822401_0_af207e42.webp', 'image/webp', '14268'::integer, '2026-04-27 01:37:02.98156+00'::timestamptz,
  '[{"r": 5, "cx": 64, "cy": 33}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e3fca738-ac24-4c14-aad9-2ea48a5f3a34'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)018.jpg', 'ultrasound', NULL, '방광으로 보이는 액체 내부에 침전물로 의심되는 에코가 관찰됩니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253832367_0_77fca43d.webp', 'image/webp', '14252'::integer, '2026-04-27 01:37:13.205978+00'::timestamptz,
  '[{"r": 8, "cx": 55, "cy": 30}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '5368bac3-4b40-48bc-802f-bb9d5bc1a9eb'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)019.jpg', 'ultrasound', NULL, '초음파에서 중심부에 고에코 병소와 후방 음영이 관찰되어 결석 또는 석회화 가능성이 있어 수의사의 추가 평가가 필요합니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253842102_0_5fff5f68.webp', 'image/webp', '18140'::integer, '2026-04-27 01:37:23.048001+00'::timestamptz,
  '[{"r": 5, "cx": 60, "cy": 70}, {"r": 4, "cx": 50, "cy": 68}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '98135dd4-bec8-40cf-9d70-0f189d025c01'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)020.jpg', 'ultrasound', NULL, '중앙 상부에 경계가 비교적 뚜렷한 무에코성 낭성 구조물이 관찰됩니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253849599_0_6f7182e2.webp', 'image/webp', '12242'::integer, '2026-04-27 01:37:30.126104+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 22}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '15faabf7-f815-4266-b555-b6ff2e4c0396'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)021.jpg', 'ultrasound', NULL, '초음파에서 중심부에 액체처럼 보이는 저에코 영역이 관찰됩니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253859120_0_3e07d0b7.webp', 'image/webp', '13278'::integer, '2026-04-27 01:37:39.613602+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 55}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'aeda1f1f-515b-410c-8409-b4a9ae7686f9'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)022.jpg', 'ultrasound', NULL, '복부 초음파에서 중앙 부위에 액체성(저에코) 음영과 주변 조직 불균질성이 관찰됩니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253867631_0_e40c98ba.webp', 'image/webp', '14318'::integer, '2026-04-27 01:37:48.137068+00'::timestamptz,
  '[{"r": 10, "cx": 40, "cy": 35}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'a5d525c7-092d-48d3-84a8-462243fd654c'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)023.jpg', 'ultrasound', NULL, '초음파에서 상복부에 약 0.4–0.5cm 크기의 소낭성 구조가 관찰되어 추가 평가가 필요합니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253874867_0_03668f17.webp', 'image/webp', '14952'::integer, '2026-04-27 01:37:55.772649+00'::timestamptz,
  '[{"r": 4, "cx": 49, "cy": 24}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '59c9f397-def3-4a60-9be6-ac3b539aebbd'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)024.jpg', 'ultrasound', NULL, '복부 초음파에서 상부 중심에 소형 무에코 병변과 중앙에 비교적 불균일한 에코 패턴이 관찰됩니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253883722_0_4386c632.webp', 'image/webp', '13516'::integer, '2026-04-27 01:38:04.646299+00'::timestamptz,
  '[{"r": 4, "cx": 50, "cy": 18}, {"r": 10, "cx": 50, "cy": 52}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'd9cb9780-7a23-4221-9652-cb9ebd0fe0b5'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)025.jpg', 'ultrasound', NULL, '복부 초음파에서 한쪽에 저에코성 소견과 조직의 불균질성이 관찰되어 수의사의 추가 평가가 필요합니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253892358_0_393c1ccf.webp', 'image/webp', '17444'::integer, '2026-04-27 01:38:12.979607+00'::timestamptz,
  '[{"r": 10, "cx": 45, "cy": 38}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'a3d1e00d-f07b-425b-bfc6-6e19c738629c'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)026.jpg', 'ultrasound', NULL, '초음파에서 복부 중심부에 장관 벽의 부분적 두꺼움과 주변 에코 변화가 보여 염증 또는 장관 이상 가능성이 의심됩니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253901339_0_8a7c6526.webp', 'image/webp', '19200'::integer, '2026-04-27 01:38:21.778747+00'::timestamptz,
  '[{"r": 10, "cx": 50, "cy": 35}, {"r": 8, "cx": 50, "cy": 80}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f06b967e-09a8-4747-80c3-90e75081e4ad'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)027.jpg', 'ultrasound', NULL, '복부 초음파에서 중앙에 원형의 저에코성 병변이 관찰되어 액체 또는 장 내용물 가능성이 있으므로 수의사 소견이 필요합니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253908778_0_371b21ab.webp', 'image/webp', '18750'::integer, '2026-04-27 01:38:29.731324+00'::timestamptz,
  '[{"r": 6, "cx": 50, "cy": 35}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '83891338-c35e-4da1-b958-f0942339aee6'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)028.jpg', 'ultrasound', NULL, '복부 초음파에서 명확한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253915503_0_12faf83b.webp', 'image/webp', '18646'::integer, '2026-04-27 01:38:35.947045+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'ff8e1909-856b-4b2f-987c-f9ae221335f3'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)029.jpg', 'ultrasound', NULL, '초음파 영상상 명확한 특이 소견은 관찰되지 않습니다.',
  'f'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253922127_0_b93d7800.webp', 'image/webp', '18870'::integer, '2026-04-27 01:38:42.594043+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c08768b7-5f59-4fb3-9a70-3d048a21347e'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)030.jpg', 'ultrasound', NULL, '초음파에서 중앙에 액체로 보이는 구조와 내부 침전물이 관찰되어 추가 검사가 권장됩니다.',
  't'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253930272_0_70d6de14.webp', 'image/webp', '17196'::integer, '2026-04-27 01:38:50.722898+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 45}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '618a4a32-5fea-4b49-a430-afdee76fa684'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24'::date, '202500235-노하진(밤이)(US)031.jpg', 'ultrasound', NULL, '초음파 영상에서 뚜렷한 이상 소견은 확인되지 않습니다.',
  'f'::boolean, 'jungdn-260427-01_b6511faa/2026-04-24/1777253938806_0_d197bd0d.webp', 'image/webp', '19522'::integer, '2026-04-27 01:38:59.380278+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '2c880c34-f608-4c60-8dbf-0df884ed8e42'::uuid, '5c809db0-0075-42ba-b535-304a933e666e'::uuid, '2026-04-07'::date, '1.2.840.113663.1500.1.464718846.3.3.20260407.174025.44.jpg', 'ultrasound', NULL, '간 실질의 불균질한 반점성 변화가 관찰되어 간병증 의심 소견이 있으며 최종 평가는 수의사에게 필요합니다.',
  't'::boolean, 'baek-260423-01_5c809db0/2026-04-07/1777266349535_0_13a6412c.webp', 'image/webp', '20944'::integer, '2026-04-27 05:05:50.201163+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 55}]'::jsonb, NULL, '간병증 의심'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'ac17d6b2-e87d-44ab-8230-cf2319dbf2f7'::uuid, '5c809db0-0075-42ba-b535-304a933e666e'::uuid, '2026-04-07'::date, '1.2.840.113663.1500.1.464718846.3.4.20260407.174030.456.jpg', 'ultrasound', NULL, '초음파 소견상 간 실질의 에코패턴이 불균질하게 보여 간병증이 의심되므로 최종 판단은 수의사가 결정해야 합니다.',
  't'::boolean, 'baek-260423-01_5c809db0/2026-04-07/1777266359760_0_f79f3ef9.webp', 'image/webp', '33734'::integer, '2026-04-27 05:06:00.273302+00'::timestamptz,
  '[{"r": 12, "cx": 68, "cy": 42}]'::jsonb, NULL, '간병증 의심'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '6725899d-829e-4805-a2d0-5d2011252c61'::uuid, '5c809db0-0075-42ba-b535-304a933e666e'::uuid, '2026-04-07'::date, '1.2.840.113663.1500.1.464718846.3.5.20260407.174038.502.jpg', 'ultrasound', NULL, '간과 담낭에 비정상 소견이 관찰되어 간병증 의심으로 추가 진단 및 수의사 평가를 권합니다.',
  't'::boolean, 'baek-260423-01_5c809db0/2026-04-07/1777266370446_0_8d506db0.webp', 'image/webp', '22100'::integer, '2026-04-27 05:06:11.036168+00'::timestamptz,
  '[{"r": 10, "cx": 60, "cy": 35}]'::jsonb, NULL, '간병증 의심'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '6b432711-2b44-44b6-9832-1b5036096983'::uuid, '5c809db0-0075-42ba-b535-304a933e666e'::uuid, '2026-04-07'::date, '1.2.840.113663.1500.1.464718846.3.6.20260407.174042.128.jpg', 'ultrasound', NULL, '간/담낭 부위에 낭성 또는 액체성 병변이 관찰되어 간병증 의심 소견이 있습니다.',
  't'::boolean, 'baek-260423-01_5c809db0/2026-04-07/1777266379011_0_c562548a.webp', 'image/webp', '37992'::integer, '2026-04-27 05:06:20.036935+00'::timestamptz,
  '[{"r": 10, "cx": 63, "cy": 34}]'::jsonb, 'clear', '간병증 의심'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '706e2f13-dbe3-42f7-ac33-0ddacacca016'::uuid, '5c809db0-0075-42ba-b535-304a933e666e'::uuid, '2026-04-07'::date, '1.2.840.113663.1500.1.464718846.3.7.20260407.174056.752.jpg', 'ultrasound', NULL, '장의 벽이 두꺼워 보이는 소견이 있어 염증성 장질환과 연관 가능성이 있으나 최종 판단은 수의사가 합니다.',
  't'::boolean, 'baek-260423-01_5c809db0/2026-04-07/1777266398209_0_5eea10c6.webp', 'image/webp', '24804'::integer, '2026-04-27 05:06:39.196941+00'::timestamptz,
  '[{"r": 8, "cx": 48, "cy": 35}]'::jsonb, NULL, '염증성 장질환'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '5d427664-06b3-4ff3-85da-1ec503845cf8'::uuid, '5c809db0-0075-42ba-b535-304a933e666e'::uuid, '2026-04-07'::date, '1.2.840.113663.1500.1.464718846.3.8.20260407.174100.366.jpg', 'ultrasound', NULL, '복부 초음파에서 위벽 주위의 두께 변화가 관찰되어 위염 또는 식도염이 의심됩니다.',
  't'::boolean, 'baek-260423-01_5c809db0/2026-04-07/1777266412809_0_a8c24387.webp', 'image/webp', '44530'::integer, '2026-04-27 05:06:53.890186+00'::timestamptz,
  '[{"r": 8, "cx": 50, "cy": 45}]'::jsonb, NULL, '위염 또는 식도염'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'a818e87d-d2d7-4aaf-8051-e7a24605d003'::uuid, '5c809db0-0075-42ba-b535-304a933e666e'::uuid, '2026-04-07'::date, '1.2.840.113663.1500.1.464718846.3.1.20260407.174017.96.jpg', 'ultrasound', NULL, '복부 초음파로 간과 위(위저) 부위를 촬영한 영상입니다.',
  'f'::boolean, 'baek-260423-01_5c809db0/2026-04-07/1777266422525_0_7269161c.webp', 'image/webp', '23454'::integer, '2026-04-27 05:07:03.08952+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8e387e93-1b96-4023-aacf-13160010d5d9'::uuid, '5c809db0-0075-42ba-b535-304a933e666e'::uuid, '2026-04-07'::date, '1.2.840.113663.1500.1.464718846.3.2.20260407.174020.881.jpg', 'ultrasound', NULL, '간으로 추정되는 부위에 저에코성 병변이 보여 간병증 의심 가능성이 있으니 최종 판단은 수의사가 합니다.',
  't'::boolean, 'baek-260423-01_5c809db0/2026-04-07/1777266442656_0_c94616b1.webp', 'image/webp', '34514'::integer, '2026-04-27 05:07:23.742997+00'::timestamptz,
  '[{"r": 12, "cx": 45, "cy": 50}]'::jsonb, NULL, '간병증 의심'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '72dafa10-0449-4467-905a-2d86c478fa99'::uuid, '5c809db0-0075-42ba-b535-304a933e666e'::uuid, '2026-04-07'::date, '1.2.840.113663.1500.1.464718846.3.11.20260407.174120.804.jpg', 'ultrasound', NULL, '초음파에서 십이지장 벽이 두꺼워 보이며 염증성 장질환(IBD)의 가능성이 있어 수의사의 추가 평가가 필요합니다.',
  't'::boolean, 'baek-260423-01_5c809db0/2026-04-07/1777266689221_0_3331c4cd.webp', 'image/webp', '26718'::integer, '2026-04-27 05:11:29.810724+00'::timestamptz,
  '[{"r": 8, "cx": 50, "cy": 65}]'::jsonb, NULL, '염증성 장질환'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f0390032-a445-465a-8946-ea4808ed2778'::uuid, '5c809db0-0075-42ba-b535-304a933e666e'::uuid, '2026-04-07'::date, '1.2.840.113663.1500.1.464718846.3.12.20260407.174124.569.jpg', 'ultrasound', NULL, '초음파에서 장벽의 국소적 비후가 관찰되어 염증성 장질환(IBD)이 의심되며 수의사 확진이 필요합니다.',
  't'::boolean, 'baek-260423-01_5c809db0/2026-04-07/1777266706026_0_230cb614.webp', 'image/webp', '43618'::integer, '2026-04-27 05:11:47.196874+00'::timestamptz,
  '[{"r": 8, "cx": 50, "cy": 20}]'::jsonb, NULL, '염증성 장질환'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '2390a56e-25f0-4e8e-bcf7-39fca10a949f'::uuid, '5c809db0-0075-42ba-b535-304a933e666e'::uuid, '2026-04-07'::date, '1.2.840.113663.1500.1.464718846.3.13.20260407.174129.497.jpg', 'ultrasound', NULL, '십이지장 벽의 국소적 비후 소견이 보여 염증성 장질환이 의심됩니다.',
  't'::boolean, 'baek-260423-01_5c809db0/2026-04-07/1777266720611_0_e02306be.webp', 'image/webp', '27102'::integer, '2026-04-27 05:12:01.074582+00'::timestamptz,
  '[{"r": 10, "cx": 50, "cy": 60}]'::jsonb, NULL, '염증성 장질환'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '050a5385-ac22-463c-a7f8-417713a0f6bd'::uuid, '5c809db0-0075-42ba-b535-304a933e666e'::uuid, '2026-04-07'::date, '1.2.840.113663.1500.1.464718846.3.14.20260407.174133.809.jpg', 'ultrasound', NULL, '초음파에서 간 에코텍스처의 비균질성이 보여 간병증 의심됩니다.',
  't'::boolean, 'baek-260423-01_5c809db0/2026-04-07/1777266737803_0_926f933e.webp', 'image/webp', '43428'::integer, '2026-04-27 05:12:18.30312+00'::timestamptz,
  NULL::jsonb, NULL, '간병증 의심'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b3c44cb0-e053-40c7-ab6c-6dc661afd991'::uuid, '5c809db0-0075-42ba-b535-304a933e666e'::uuid, '2026-04-07'::date, '1.2.840.113663.1500.1.464718846.3.15.20260407.174139.672.jpg', 'ultrasound', NULL, '초음파에서 장관의 환상형 및 벽층 변화가 관찰되어 염증성 장질환(IBD) 의심 소견입니다.',
  't'::boolean, 'baek-260423-01_5c809db0/2026-04-07/1777266754263_0_e232bf25.webp', 'image/webp', '43482'::integer, '2026-04-27 05:12:35.9176+00'::timestamptz,
  '[{"r": 6, "cx": 28, "cy": 18}]'::jsonb, 'clear', '염증성 장질환'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '0100ea37-c41f-460c-a9eb-fd22e1352494'::uuid, '5c809db0-0075-42ba-b535-304a933e666e'::uuid, '2026-04-07'::date, '1.2.840.113663.1500.1.464718846.3.16.20260407.174201.682.jpg', 'ultrasound', NULL, '초음파에서 장벽의 비후와 주름 패턴 변화가 관찰되어 염증성 장질환과 연관될 가능성이 있으니 수의사의 추가 평가가 필요합니다.',
  't'::boolean, 'baek-260423-01_5c809db0/2026-04-07/1777266771389_0_a94df278.webp', 'image/webp', '24482'::integer, '2026-04-27 05:12:54.198133+00'::timestamptz,
  '[{"r": 8, "cx": 50, "cy": 20}, {"r": 6, "cx": 45, "cy": 35}]'::jsonb, NULL, '염증성 장질환'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e4d3fe9a-4200-40de-9819-76bcade80d17'::uuid, '5c809db0-0075-42ba-b535-304a933e666e'::uuid, '2026-04-07'::date, '1.2.840.113663.1500.1.464718846.3.9.20260407.174109.277.jpg', 'ultrasound', NULL, '십이지장 벽 비후 소견이 있어 염증성 장질환과 관련 가능성이 있습니다.',
  't'::boolean, 'baek-260423-01_5c809db0/2026-04-07/1777266789290_0_a3490a3c.webp', 'image/webp', '24450'::integer, '2026-04-27 05:13:13.185365+00'::timestamptz,
  '[{"r": 6, "cx": 50, "cy": 15}]'::jsonb, NULL, '염증성 장질환'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'd6a1f77e-7a59-48cc-ab4b-062ffb169e26'::uuid, '5c809db0-0075-42ba-b535-304a933e666e'::uuid, '2026-04-07'::date, '1.2.840.113663.1500.1.464718846.3.10.20260407.174110.315.jpg', 'ultrasound', NULL, '복부 초음파에서 장벽 비후 소견이 있어 염증성 장질환(IBD)의 가능성이 있으나 최종 진단은 수의사가 결정해야 합니다.',
  't'::boolean, 'baek-260423-01_5c809db0/2026-04-07/1777266815571_0_c3296f28.webp', 'image/webp', '43096'::integer, '2026-04-27 05:13:36.344926+00'::timestamptz,
  '[{"r": 10, "cx": 50, "cy": 45}]'::jsonb, NULL, '염증성 장질환'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '7ff0ce21-dc0e-4aef-9280-ea6a9afbba86'::uuid, 'cf41a4eb-05d4-41a1-b412-7013f2defdfb'::uuid, '2026-01-23'::date, '1.2.410.200067.100.3.20260123.1056140901.17452.1.1.Jpg', 'radiology', 'thorax', '흉부 측면 방사선에서 기관지 및 폐 실질의 음영 증가가 보여 기관 허탈/기관지염이 의심되며 최종 판정은 수의사가 합니다.',
  't'::boolean, 'nuel-260413-01_cf41a4eb/2026-01-23/1777270186141_0_1be82f8d.webp', 'image/webp', '123240'::integer, '2026-04-27 06:09:47.508813+00'::timestamptz,
  NULL::jsonb, NULL, '기관 허탈/기관지염'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '195cb208-36ac-40fc-8c48-c342bcab6459'::uuid, 'cf41a4eb-05d4-41a1-b412-7013f2defdfb'::uuid, '2026-01-23'::date, '1.2.410.200067.100.3.20260123.1056550199.17586.1.2.Jpg', 'radiology', 'thorax', '흉부 방사선에서 심장 윤곽이 증가하여 만성 심장 질환과 관련될 수 있습니다.',
  't'::boolean, 'nuel-260413-01_cf41a4eb/2026-01-23/1777270210308_0_e58c0a8c.webp', 'image/webp', '90820'::integer, '2026-04-27 06:10:11.492494+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 45}]'::jsonb, NULL, '만성 심장 질환'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b39b1ce7-1769-42f6-9a28-2e0911c43582'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(DX)(20260420153157)003.jpg', 'radiology', 'abdomen', '측면 복부 방사선사진으로 척추와 복부 구조를 확인한 영상입니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777270747572_0_0c651d39.webp', 'image/webp', '101188'::integer, '2026-04-27 06:19:09.250432+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c0db7c49-9a30-4c25-ae5c-d3cb942f9471'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(DX)001.jpg', 'radiology', 'thorax', '측면 흉부-경부 방사선 사진에서 눈에 띄는 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777270762438_0_be30788a.webp', 'image/webp', '89352'::integer, '2026-04-27 06:19:23.385688+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '834df08b-12b6-48c7-b8a7-b79f9a712245'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(DX)002.jpg', 'radiology', 'thorax', '흉부 방사선 촬영으로 폐와 심장의 기초 평가를 시행한 영상입니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777270774699_0_341f253e.webp', 'image/webp', '58192'::integer, '2026-04-27 06:19:35.381686+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '66419ee2-f42b-4aaf-8759-8bbf28a3536b'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(DX)004.jpg', 'radiology', 'joint', '차트상 양측 슬개골 내측 탈구 2기가 확진되어 슬개골 관련 소견이 기록되어 있습니다.',
  't'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777270801113_0_eb939217.webp', 'image/webp', '100796'::integer, '2026-04-27 06:20:02.360575+00'::timestamptz,
  '[{"r": 6, "cx": 30, "cy": 82}, {"r": 6, "cx": 70, "cy": 82}]'::jsonb, NULL, '양측 슬개골 내측 탈구 2기'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '6c379afd-d305-447b-9dbe-2f79fe02dc62'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(DX)005.jpg', 'radiology', 'joint', '우측 슬관절 방사선 영상으로, 차트에 명시된 양측 슬개골 내측 탈구 2기와 관련된 소견 관찰을 위한 촬영입니다.',
  't'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777270826382_0_b2416367.webp', 'image/webp', '78242'::integer, '2026-04-27 06:20:27.574667+00'::timestamptz,
  '[{"r": 4, "cx": 55, "cy": 30}]'::jsonb, NULL, '양측 슬개골 내측 탈구 2기'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b8332f44-9131-4314-b84d-e9c192149e91'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(DX)006.jpg', 'radiology', 'joint', '이 방사선 사진에서 슬개골 위치 이상이 관찰되며 차트에 명시된 양측 슬개골 내측 탈구 2기와 관련될 수 있습니다.',
  't'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777270850128_0_24b8a3a0.webp', 'image/webp', '71190'::integer, '2026-04-27 06:20:51.260074+00'::timestamptz,
  NULL::jsonb, NULL, '양측 슬개골 내측 탈구 2기'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e4528bd7-f8c1-47e9-884b-35b6bc2715ef'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(DX)007.jpg', 'radiology', 'joint', '차트에 양측 슬개골 내측 탈구 2기가 기재되어 있습니다.',
  't'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777270872381_0_9bf4aca4.webp', 'image/webp', '84084'::integer, '2026-04-27 06:21:13.095279+00'::timestamptz,
  '[{"r": 4, "cx": 35, "cy": 78}, {"r": 4, "cx": 65, "cy": 78}]'::jsonb, NULL, '양측 슬개골 내측 탈구 2기'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '4bf941c2-d903-4821-b665-89b43e7b3f37'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)(20260420154214)000.jpg', 'ultrasound', NULL, '복부 초음파 검사 사진이며 이 이미지에서는 뚜렷한 이상 소견이 관찰되지 않습니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777270887451_0_e5e078d4.webp', 'image/webp', '27238'::integer, '2026-04-27 06:21:28.45237+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'ed8caa4c-fc73-44a2-b763-eb7b5264c8d3'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)(20260420154220)001.jpg', 'ultrasound', NULL, '복부 초음파 검사 영상입니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777270901012_0_0c3fb12b.webp', 'image/webp', '24940'::integer, '2026-04-27 06:21:41.853443+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '3b244f94-b6ca-4bc7-b642-a72967b8bfe0'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)(20260420154235)002.jpg', 'ultrasound', NULL, '복부 초음파 영상입니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777270911441_0_0e8e3e5e.webp', 'image/webp', '24208'::integer, '2026-04-27 06:21:51.897203+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '0a0d2c61-43ac-49c4-a898-80bb10563bb6'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)(20260420154238)003.jpg', 'ultrasound', NULL, '복부 초음파 검사 영상이며 명확한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777270922476_0_64196274.webp', 'image/webp', '25522'::integer, '2026-04-27 06:22:02.958642+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f4d1d13f-359f-4a5a-9628-e040d3491348'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)(20260420154341)009.jpg', 'ultrasound', NULL, '복부 초음파 영상으로, 이 이미지에서는 목록의 질환과 연관된 명확한 소견이 관찰되지 않습니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777270937429_0_3732e2b5.webp', 'image/webp', '24996'::integer, '2026-04-27 06:22:18.402255+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '75bbabce-556d-452e-9bf6-31942936a4ed'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)004.jpg', 'ultrasound', NULL, '복부 초음파 영상으로, 영상 소견의 최종 판단은 담당 수의사가 확정합니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777270948867_0_13b68306.webp', 'image/webp', '26574'::integer, '2026-04-27 06:22:29.623237+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '5f8672d3-9497-4194-b9a1-9c5ee5d6e708'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)005.jpg', 'ultrasound', NULL, '복부 초음파 검사 영상으로, 목록에 있는 평가된 질환과 명확히 연결되는 소견은 관찰되지 않습니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777270959477_0_02215630.webp', 'image/webp', '26740'::integer, '2026-04-27 06:22:39.99172+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'a8ca0e4f-ad10-4f5d-a635-31d3897a3a46'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)006.jpg', 'ultrasound', NULL, '복부 초음파 영상으로, 이 이미지에서는 명확한 이상 소견이 관찰되지 않습니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777270970557_0_7a4eb71d.webp', 'image/webp', '23990'::integer, '2026-04-27 06:22:51.615956+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '391066b5-bc49-4290-977d-7a097c67f5ba'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)007.jpg', 'ultrasound', NULL, '복부 초음파에서 좌측 신장 영상을 확인할 수 있으며 명확한 이상 소견은 보이지 않습니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777270983456_0_3c0252fb.webp', 'image/webp', '30944'::integer, '2026-04-27 06:23:03.987389+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'a697ddfc-6abe-496c-9a76-9aa7d93b369c'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)008.jpg', 'ultrasound', NULL, '복부 초음파로 좌측 부신(Lt. adrenal)을 촬영한 영상이며 목록 상 관련된 명확한 소견은 보이지 않습니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777270996202_0_06e2bf6f.webp', 'image/webp', '28092'::integer, '2026-04-27 06:23:16.725304+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'd9c3d859-9247-443d-a76d-8c83d8596f2f'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)010.jpg', 'ultrasound', NULL, '복부 초음파 영상으로 명확한 이상 소견은 보이지 않습니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777271006158_0_fd96fb81.webp', 'image/webp', '25838'::integer, '2026-04-27 06:23:26.89954+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'fc9b37bb-8a19-44ed-ab9a-f0f99f89af1a'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)011.jpg', 'ultrasound', NULL, '복부 초음파 영상으로 명백한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777271018873_0_2eec6078.webp', 'image/webp', '25548'::integer, '2026-04-27 06:23:39.378806+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'dedcc4ad-6d75-4a92-8120-20a9d90f8d7c'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)012.jpg', 'ultrasound', NULL, '복부 초음파 영상으로 현재로서는 명확한 이상 소견이 관찰되지 않습니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777271029152_0_1aabf46d.webp', 'image/webp', '24668'::integer, '2026-04-27 06:23:50.102294+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e631211f-11ff-483a-b274-1540f2216d69'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)013.jpg', 'ultrasound', NULL, '복부 초음파 검사 영상이며, 해당 이미지에서는 목록의 질환과 연관된 뚜렷한 소견은 관찰되지 않습니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777271038631_0_dec41a75.webp', 'image/webp', '26272'::integer, '2026-04-27 06:23:59.134978+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '6d145a94-1d66-429c-9ab7-0947348f894a'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)014.jpg', 'ultrasound', NULL, '복부 초음파 영상으로 현재 뚜렷한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777271049074_0_2c1ea854.webp', 'image/webp', '25036'::integer, '2026-04-27 06:24:09.566803+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '1715e31e-8084-4053-8943-b59d1d2635b8'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)015.jpg', 'ultrasound', NULL, '우측 신장 초음파 영상으로 이미지상 명확한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777271058836_0_71795d88.webp', 'image/webp', '26234'::integer, '2026-04-27 06:24:19.327062+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b43d7058-7984-46e5-b12a-40b524923c6a'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)016.jpg', 'ultrasound', NULL, '복부 초음파로 우측 부신 부위가 촬영된 영상입니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777271067982_0_f68837bd.webp', 'image/webp', '30596'::integer, '2026-04-27 06:24:28.439053+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '0cd5aaf0-409d-4f04-a2ad-f0f95b812c65'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)017.jpg', 'ultrasound', NULL, '복부 초음파 영상이며 특이 소견은 관찰되지 않습니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777271075421_0_e1524484.webp', 'image/webp', '26732'::integer, '2026-04-27 06:24:36.023029+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '0562a1ee-dd16-4a89-abc4-e0fdedef1f0f'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)018.jpg', 'ultrasound', NULL, '복부 초음파 영상으로 명확한 이상 소견은 확인되지 않습니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777271085211_0_808fb12c.webp', 'image/webp', '27304'::integer, '2026-04-27 06:24:46.132906+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c7dc2730-14a2-4131-a09f-b27a132d4d55'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)019.jpg', 'ultrasound', NULL, '복부 초음파 영상으로, 뚜렷한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777271095067_0_daca8bb8.webp', 'image/webp', '27022'::integer, '2026-04-27 06:24:55.522533+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '77c25b59-a7e1-476f-bc9e-0e2d5c0ada9e'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(DX)(20260420153129)000.jpg', 'radiology', 'thorax', '측면 흉부 방사선 사진으로, 목록에 있는 명확한 이상 소견은 확인되지 않습니다.',
  'f'::boolean, 'kimjoon-260427-02_62069645/2026-04-20/1777271105310_0_00daa6af.webp', 'image/webp', '97210'::integer, '2026-04-27 06:25:06.472348+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '5549c750-da46-4900-85dc-8561d9324532'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(DR)(20260425140944)000.jpg', 'radiology', 'thorax', '경추에 국소적인 골변화가 보이고 흉부 중심부에 경미한 간질/기관지성 패턴이 의심되어 수의사의 추가 평가가 필요합니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777279951222_0_b6c29212.webp', 'image/webp', '224738'::integer, '2026-04-27 08:52:32.250577+00'::timestamptz,
  '[{"r": 6, "cx": 30, "cy": 30}, {"r": 8, "cx": 50, "cy": 55}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '684a70ff-2bb5-4f4c-a452-d963b3f69d24'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(DR)(20260425140954)001.jpg', 'radiology', 'abdomen', '복부 및 요추 측면 방사선 사진에서 명확한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777279969043_0_3ffd6508.webp', 'image/webp', '150650'::integer, '2026-04-27 08:52:50.460224+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '3d6f3e70-e264-4bab-b911-b1f52d7af8f7'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(DR)(20260425141010)002.jpg', 'radiology', 'joint', '우측 대퇴골 중간부에 골간 불연속과 전위 소견이 보여 골절이 의심됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777279989188_0_16a2a318.webp', 'image/webp', '77930'::integer, '2026-04-27 08:53:11.280241+00'::timestamptz,
  '[{"r": 5, "cx": 56, "cy": 48}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '76066fc6-374f-407b-b40d-1ab10c5404ee'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(DR)(20260425141027)003.jpg', 'radiology', 'joint', '우측 고관절에서 관절와 밖으로 벗어난 것으로 보이는 소견이 있어 수의사의 추가 평가가 필요합니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280016832_0_3c0a5ce2.webp', 'image/webp', '141306'::integer, '2026-04-27 08:53:38.056667+00'::timestamptz,
  '[{"r": 6, "cx": 34, "cy": 42}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '4d0648ac-5b4b-4c97-973d-015de3a98f36'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(DR)(20260425141032)004.jpg', 'radiology', 'abdomen', '우측 상복부에 소형 방사선 불투과성 음영이 관찰되어 이물 또는 위내 내용물일 가능성이 있습니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280039959_0_7e38b6f2.webp', 'image/webp', '181940'::integer, '2026-04-27 08:54:01.455999+00'::timestamptz,
  '[{"r": 5, "cx": 66, "cy": 28}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e5b268c6-2bc6-452d-8549-1745cee58822'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(DR)(20260425141038)005.jpg', 'radiology', 'thorax', '흉부 방사선에서 명확한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280057249_0_45f10c65.webp', 'image/webp', '171288'::integer, '2026-04-27 08:54:18.036615+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'd5e438f4-c360-4a90-bfb5-1def23b38958'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(DR)(20260425141110)006.jpg', 'radiology', 'joint', '왼쪽 슬관절 부위에 작은 골화된 조각들이 보이며 추가 검사로 확인이 필요합니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280077334_0_f24b2ebc.webp', 'image/webp', '75426'::integer, '2026-04-27 08:54:38.124241+00'::timestamptz,
  '[{"r": 4, "cx": 45, "cy": 40}, {"r": 4, "cx": 50, "cy": 60}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '0fa200ce-28c4-4255-9f3c-10519810a434'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)(20260425141346)003.jpg', 'ultrasound', NULL, '복부 초음파에서 미세한 담낭 슬러지가 관찰되며 1년 뒤 초음파 재검이 권장됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280130395_0_4ebdf940.webp', 'image/webp', '11186'::integer, '2026-04-27 08:55:31.026627+00'::timestamptz,
  '[{"r": 8, "cx": 75, "cy": 72}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e1403978-7704-4823-bdbe-2b1836bbcc11'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)(20260425141504)014.jpg', 'ultrasound', NULL, '복부 초음파에서 미세한 담낭 슬러지가 관찰되어 1년 뒤 초음파 재검이 권장됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280157490_0_17c4c880.webp', 'image/webp', '19338'::integer, '2026-04-27 08:55:58.538244+00'::timestamptz,
  '[{"r": 4, "cx": 50, "cy": 22}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '77beb035-3e77-45d5-8544-8c17878225e8'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)004.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 미세 에코가 관찰되어 담낭 슬러지가 의심되며 수의사의 최종 판정이 필요합니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280188556_0_df836f0f.webp', 'image/webp', '10992'::integer, '2026-04-27 08:56:29.095299+00'::timestamptz,
  '[{"r": 10, "cx": 53, "cy": 34}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '4de3e475-fb1d-42be-8f5b-5c1b47f8919c'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)005.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 미세한 슬러지 소견이 관찰됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280209926_0_25131375.webp', 'image/webp', '14388'::integer, '2026-04-27 08:56:50.480559+00'::timestamptz,
  '[{"r": 10, "cx": 27, "cy": 20}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b37d033c-0591-4f84-868a-a167ba3b0c77'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)006.jpg', 'ultrasound', NULL, '복부 초음파에서 미세한 담낭 슬러지가 관찰되며 1년 뒤 초음파 재검이 권장됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280234530_0_b78758f5.webp', 'image/webp', '14082'::integer, '2026-04-27 08:57:15.18106+00'::timestamptz,
  '[{"r": 8, "cx": 50, "cy": 35}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'aad30e93-0b62-4565-8b99-ed0a943cea11'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)007.jpg', 'ultrasound', NULL, '복부 초음파에서 미세한 담낭 슬러지 소견이 관찰되어 1년 내 재검 또는 임상 경과 관찰이 권장됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280260005_0_fa908081.webp', 'image/webp', '16432'::integer, '2026-04-27 08:57:40.526614+00'::timestamptz,
  '[{"r": 10, "cx": 58, "cy": 65}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '021028f0-7b08-473a-a525-72b5fa796e90'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)008.jpg', 'ultrasound', NULL, '복부 초음파 검사에서 미세한 담낭 슬러지가 관찰되었으며, 1년 뒤 초음파 재검이 권장되었습니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280280062_0_e19a7501.webp', 'image/webp', '15678'::integer, '2026-04-27 08:58:00.614739+00'::timestamptz,
  '[{"r": 8, "cx": 52, "cy": 68}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '78f1448e-2ecb-4757-b034-79daf53789e3'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)009.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 미세한 슬러지 소견이 관찰됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280300168_0_6cb0c4f6.webp', 'image/webp', '17202'::integer, '2026-04-27 08:58:20.735716+00'::timestamptz,
  '[{"r": 6, "cx": 60, "cy": 40}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '1fa6a0c3-e641-4de6-8e23-0180bf287868'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)010.jpg', 'ultrasound', NULL, '복부 초음파에서 미세한 담낭 슬러지가 관찰되어 1년 뒤 초음파 재검이 권장됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280329138_0_bf71f89b.webp', 'image/webp', '18020'::integer, '2026-04-27 08:58:49.901183+00'::timestamptz,
  '[{"r": 8, "cx": 45, "cy": 25}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '86107960-ee68-4bf6-9cf6-5431a0a24a57'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)011.jpg', 'ultrasound', NULL, '복부 초음파에서 미세한 담낭 슬러지가 관찰됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280352695_0_cd7928ef.webp', 'image/webp', '26956'::integer, '2026-04-27 08:59:13.286111+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 45}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '5ccc4fe3-f789-47d0-a8c0-5fdb6bcd8781'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)012.jpg', 'ultrasound', NULL, '초음파에서 미세한 담낭 슬러지가 관찰되어 1년 뒤 초음파 재검이 권장됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280375729_0_db562186.webp', 'image/webp', '20684'::integer, '2026-04-27 08:59:36.229424+00'::timestamptz,
  '[{"r": 8, "cx": 50, "cy": 40}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b57a4692-303b-454d-8345-7c67dec6a796'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)013.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 미세한 슬러지 가능성이 보입니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280413282_0_7f1d48c4.webp', 'image/webp', '22566'::integer, '2026-04-27 09:00:13.802939+00'::timestamptz,
  '[{"r": 10, "cx": 50, "cy": 60}]'::jsonb, NULL, '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '69164e99-60a6-4929-ae42-55056b15f2c9'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)015.jpg', 'ultrasound', NULL, '복부 초음파에서 미세한 담낭 슬러지가 관찰되어 1년 뒤 초음파 재검이 권장됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280435463_0_96b439c0.webp', 'image/webp', '20426'::integer, '2026-04-27 09:00:36.445837+00'::timestamptz,
  '[{"r": 8, "cx": 50, "cy": 45}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'bad35fc1-32da-4525-b2b2-3e92a95678c2'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)016.jpg', 'ultrasound', NULL, '복부 초음파에서 미세한 담낭 슬러지 소견이 관찰됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280455898_0_74fc1f6c.webp', 'image/webp', '18868'::integer, '2026-04-27 09:00:56.999506+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 20}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '277af9c4-fc85-455b-9fe0-87a2473a5d1e'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)017.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 미세한 슬러지가 관찰되어 추적 초음파가 권장됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280478905_0_1d941076.webp', 'image/webp', '17414'::integer, '2026-04-27 09:01:19.44479+00'::timestamptz,
  '[{"r": 10, "cx": 60, "cy": 30}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '6bc54f2f-e264-46c9-ac39-e6df0e2c885c'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)018.jpg', 'ultrasound', NULL, '복부 초음파에서 미세한 담낭 슬러지 소견이 관찰됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280511704_0_93f1fa7b.webp', 'image/webp', '16726'::integer, '2026-04-27 09:01:52.651534+00'::timestamptz,
  '[{"r": 8, "cx": 50, "cy": 50}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b4b5e458-a84b-4577-b3a4-ed000c0227bb'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)019.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 미세한 슬러지 소견이 관찰됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280543121_0_b28c0512.webp', 'image/webp', '16344'::integer, '2026-04-27 09:02:24.325958+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 32}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '1f934525-6c36-4992-afb4-d7360243a204'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)020.jpg', 'ultrasound', NULL, '복부 초음파에서 미세한 담낭 슬러지가 관찰되어 1년 뒤 초음파 재검이 권장됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280575668_0_3823f77b.webp', 'image/webp', '18362'::integer, '2026-04-27 09:02:56.256024+00'::timestamptz,
  '[{"r": 6, "cx": 45, "cy": 18}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f6574de5-bdf1-4d2b-ac16-90682240d23b'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)021.jpg', 'ultrasound', NULL, '복부 초음파에서 미세한 담낭 슬러지가 관찰되며 1년 뒤 초음파 재검이 권장됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280598018_0_05682e46.webp', 'image/webp', '17586'::integer, '2026-04-27 09:03:18.585427+00'::timestamptz,
  '[{"r": 10, "cx": 52, "cy": 42}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8f3f89d5-535b-4906-9608-dcfa54a6f1ae'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)022.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 미세한 슬러지가 관찰됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280623675_0_7f6c281e.webp', 'image/webp', '17628'::integer, '2026-04-27 09:03:44.689107+00'::timestamptz,
  '[{"r": 10, "cx": 55, "cy": 40}, {"r": 4, "cx": 75, "cy": 70}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c2b6dfb7-e874-497f-88f9-e7018c328e34'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)023.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 미세한 슬러지가 관찰됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280644580_0_9eb977d9.webp', 'image/webp', '18632'::integer, '2026-04-27 09:04:05.136334+00'::timestamptz,
  '[{"r": 8, "cx": 50, "cy": 22}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '7dc42777-0c13-4fc5-bd8e-c2f2e5f38e36'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)024.jpg', 'ultrasound', NULL, '복부 초음파 검사에서 미세한 담낭 슬러지가 관찰되었으며, 1년 뒤 초음파 재검이 권장됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280667604_0_08e98755.webp', 'image/webp', '17188'::integer, '2026-04-27 09:04:28.193044+00'::timestamptz,
  '[{"r": 10, "cx": 65, "cy": 60}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '60756705-95f8-45e4-a84c-0349d7c52c23'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)025.jpg', 'ultrasound', NULL, '복부 초음파에서 미세한 담낭 슬러지가 관찰되며, 1년 뒤 초음파 재검이 권장됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280693872_0_07af8f57.webp', 'image/webp', '22090'::integer, '2026-04-27 09:04:54.894407+00'::timestamptz,
  '[{"r": 7, "cx": 37, "cy": 22}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '6f9c5ab2-42d8-440a-947b-9b9ea56da22d'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)026.jpg', 'ultrasound', NULL, '복부 초음파에서 미세한 담낭 슬러지가 관찰됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280723893_0_ab1e8b68.webp', 'image/webp', '17930'::integer, '2026-04-27 09:05:24.478927+00'::timestamptz,
  '[{"r": 8, "cx": 70, "cy": 55}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '816b15f7-ef2b-4255-af2f-40175d2f1a95'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)027.jpg', 'ultrasound', NULL, '복부 초음파에서 미세한 담낭 슬러지 소견이 관찰됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280751334_0_0c71e421.webp', 'image/webp', '18714'::integer, '2026-04-27 09:05:51.892362+00'::timestamptz,
  '[{"r": 8, "cx": 55, "cy": 60}]'::jsonb, NULL, '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '07dfd28a-0cc2-4dbb-8928-84f3066f3f08'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)028.jpg', 'ultrasound', NULL, '복부 초음파에서 미세한 담낭 슬러지가 관찰되어 1년 뒤 초음파 재검이 권장됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280771826_0_1d72f24f.webp', 'image/webp', '20982'::integer, '2026-04-27 09:06:12.854835+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 60}]'::jsonb, 'clear', '가려움증'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '264b70ab-39f3-4b04-8391-146af8d22a70'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)029.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 미세한 슬러지로 보이는 소견이 관찰되어 수의사 확인이 필요합니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280802462_0_ed8aee67.webp', 'image/webp', '16980'::integer, '2026-04-27 09:06:43.034655+00'::timestamptz,
  '[{"r": 6, "cx": 65, "cy": 30}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'cae76362-45d4-44b9-afa3-39dd061fd9f9'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)(20260425141331)000.jpg', 'ultrasound', NULL, '초음파에서 담낭 내 미세한 슬러지 소견이 관찰되어 담낭 슬러지가 의심됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280828682_0_5615cde8.webp', 'image/webp', '12850'::integer, '2026-04-27 09:07:09.229908+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 30}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '4ef46c68-7642-4522-b3bd-935e14e181e6'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)(20260425141337)001.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 슬러지 소견이 관찰됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280851860_0_f47c05be.webp', 'image/webp', '12524'::integer, '2026-04-27 09:07:32.598651+00'::timestamptz,
  '[{"r": 10, "cx": 32, "cy": 30}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '5984fe08-8013-4e12-980a-66f4a4cae4d6'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25'::date, '202300718-김경화(토리)(US)(20260425141341)002.jpg', 'ultrasound', NULL, '초음파에서 담낭 내 미세한 슬러지가 관찰되어 1년 후 재검이 권장됩니다.',
  't'::boolean, 'jungdn-260427-02_242be746/2026-04-25/1777280869593_0_837f586d.webp', 'image/webp', '11730'::integer, '2026-04-27 09:07:50.094422+00'::timestamptz,
  '[{"r": 8, "cx": 72, "cy": 30}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c0f8d185-f2da-42bc-9cca-19bfca2925c8'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)(20260420154220)001.jpg', 'ultrasound', NULL, '복부 초음파에서 내부가 무에코인 원형의 낭성 구조물이 관찰되어 낭종 또는 액체저류 가능성이 있어 수의사의 추가 판정이 필요합니다.',
  't'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336491693_0_5df6f847.webp', 'image/webp', '24940'::integer, '2026-04-28 00:34:52.984213+00'::timestamptz,
  '[{"r": 10, "cx": 58, "cy": 48}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '87769245-190f-421b-bc3e-4b6877ca3cf5'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)(20260420154235)002.jpg', 'ultrasound', NULL, '복부 초음파에서 명확한 이상 소견은 보이지 않으며 최종 판단은 수의사 진단이 필요합니다.',
  'f'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336507289_0_f86e4357.webp', 'image/webp', '24208'::integer, '2026-04-28 00:35:08.445878+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '4b14d854-299a-4791-bcf8-f1d3832f5327'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)(20260420154238)003.jpg', 'ultrasound', NULL, '흉부 초음파에서 흉막 하에 수직성 B-line이 다수 관찰되어 간질성 폐병변 또는 폐부종 가능성이 의심되며 최종 판단은 수의사 소견이 필요합니다.',
  't'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336529403_0_17e2798c.webp', 'image/webp', '25522'::integer, '2026-04-28 00:35:30.545765+00'::timestamptz,
  '[{"r": 5, "cx": 57, "cy": 50}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'db960a68-6b9e-49f6-85c9-26e283193868'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)(20260420154341)009.jpg', 'ultrasound', NULL, '초음파에서 표층에 경계가 뚜렷한 원형 저에코 병변과 그 아래 강한 후방음영이 관찰되어 추가 검사 및 수의사 판독이 필요합니다.',
  't'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336553103_0_e3f1564b.webp', 'image/webp', '24996'::integer, '2026-04-28 00:35:54.593259+00'::timestamptz,
  '[{"r": 6, "cx": 50, "cy": 20}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '3b8c5062-dc34-411e-88ff-e70478e55519'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)004.jpg', 'ultrasound', NULL, '흉부 초음파에서 흉막 부근에 수직 에코선이 관찰되어 폐 간질성 변화나 반향 가능성이 있으므로 최종 평가는 수의사 소견이 필요합니다.',
  't'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336571910_0_e1010259.webp', 'image/webp', '26574'::integer, '2026-04-28 00:36:13.012059+00'::timestamptz,
  '[{"r": 5, "cx": 52, "cy": 30}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '5a55ab31-7b93-4683-8573-c30d2592f23f'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)005.jpg', 'ultrasound', NULL, '폐 초음파에서 흉막선에서 시작해 아래로 뻗는 다수의 수직 반향선이 보여 폐 간질성 변화나 체액 축적이 의심됩니다.',
  't'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336593421_0_7c468868.webp', 'image/webp', '26740'::integer, '2026-04-28 00:36:34.523274+00'::timestamptz,
  '[{"r": 12, "cx": 60, "cy": 50}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '29a265d5-d0e3-4a78-b773-d7b1d61ca2b4'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)006.jpg', 'ultrasound', NULL, '초음파에서 무에코성 검은 영역이 넓게 관찰되어 체강 내 액체 축적(예: 삼출물/혈액) 가능성이 있습니다.',
  't'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336618150_0_55ebb209.webp', 'image/webp', '23990'::integer, '2026-04-28 00:36:59.182049+00'::timestamptz,
  '[{"r": 12, "cx": 52, "cy": 30}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '98b2f808-a045-4205-aa8b-df8b84db7bb4'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)007.jpg', 'ultrasound', NULL, '좌신장에서 중심부에 액체 같은 저에코 영역이 있어 신우확장(수신증) 가능성이 의심되며 최종 판단은 수의사가 합니다.',
  't'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336638673_0_f601b0f0.webp', 'image/webp', '30944'::integer, '2026-04-28 00:37:19.252986+00'::timestamptz,
  '[{"r": 8, "cx": 56, "cy": 42}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b23d0d0b-903d-4a7d-9b2b-28509347abd5'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)008.jpg', 'ultrasound', NULL, '좌측 부신에 약 4mm 크기의 결절상 저에코 병변이 관찰되며 추가 평가가 필요합니다.',
  't'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336654328_0_445660a9.webp', 'image/webp', '28092'::integer, '2026-04-28 00:37:35.546025+00'::timestamptz,
  '[{"r": 4, "cx": 58, "cy": 38}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c3868a8a-3189-4a17-a446-98463997e861'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)010.jpg', 'ultrasound', NULL, '복부 초음파에서 액체가 채워진 구조(방광으로 추정)가 관찰되며 명확한 이상 소견은 보이지 않습니다.',
  'f'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336668799_0_7678e559.webp', 'image/webp', '25838'::integer, '2026-04-28 00:37:50.328061+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '997a8f36-0eb0-4dd0-a054-1ba4f0612c78'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)011.jpg', 'ultrasound', NULL, '초음파 영상에서 명확한 이상 소견은 관찰되지 않아 최종 평가는 담당 수의사가 진행해야 합니다.',
  'f'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336685838_0_35a02b0c.webp', 'image/webp', '25548'::integer, '2026-04-28 00:38:06.827656+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '24530474-678a-422c-a725-e53a84a0a579'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)012.jpg', 'ultrasound', NULL, '복부 초음파에서 명확한 이상 소견은 보이지 않습니다.',
  'f'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336700950_0_69dd1e99.webp', 'image/webp', '24668'::integer, '2026-04-28 00:38:22.118436+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '5b2afb4d-5204-493c-a678-1aef4c5be8c4'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)013.jpg', 'ultrasound', NULL, '복부 초음파 소견으로 뚜렷한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336713886_0_4f703cb8.webp', 'image/webp', '26272'::integer, '2026-04-28 00:38:34.872861+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '3e81c829-003d-4d19-b285-f0737accc748'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)014.jpg', 'ultrasound', NULL, '초음파 영상에서 명확한 이상 소견은 관찰되지 않으며 최종 평가는 담당 수의사가 합니다.',
  'f'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336728676_0_54234a6e.webp', 'image/webp', '25036'::integer, '2026-04-28 00:38:49.687512+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '2957754a-edbe-4364-9da2-f4047a471585'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)015.jpg', 'ultrasound', NULL, '우측 신장의 초음파 영상에서 명확한 이상 소견은 보이지 않습니다.',
  'f'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336746138_0_ea07712a.webp', 'image/webp', '26234'::integer, '2026-04-28 00:39:07.60581+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f96fda59-4b8a-4636-9415-bfc994f50124'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)016.jpg', 'ultrasound', NULL, '우측 부신에서 국소적인 변화(결절 또는 비후 가능성)가 관찰됩니다.',
  't'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336769435_0_3f4bbd24.webp', 'image/webp', '30596'::integer, '2026-04-28 00:39:29.964178+00'::timestamptz,
  '[{"r": 5, "cx": 60, "cy": 48}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f4dd0b1b-c1c0-47eb-8455-9ff83a7ed77b'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)017.jpg', 'ultrasound', NULL, '복부 초음파 영상에서 중심부에 경계가 불분명한 저에코성 소견이 보여 국소 병변(낭종 또는 염증 등) 가능성이 있어 수의사의 추가 평가가 필요합니다.',
  't'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336788155_0_6ce27814.webp', 'image/webp', '26732'::integer, '2026-04-28 00:39:49.380862+00'::timestamptz,
  '[{"r": 6, "cx": 50, "cy": 30}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '4b737bef-0606-400d-bca5-0a058d62598f'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)018.jpg', 'ultrasound', NULL, '복부 초음파에서 뚜렷한 이상 소견은 관찰되지 않아 최종 판단은 수의사가 합니다.',
  'f'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336805899_0_896cb89f.webp', 'image/webp', '27304'::integer, '2026-04-28 00:40:06.483875+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '4f990651-a01e-49b9-90a7-1fbe32788b30'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(US)019.jpg', 'ultrasound', NULL, '복부 초음파에서 상부에 경계가 비교적 명확한 원형의 저에코성 병변이 관찰되며 추가 평가가 필요합니다.',
  't'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336824128_0_6c2a82b4.webp', 'image/webp', '27022'::integer, '2026-04-28 00:40:24.652+00'::timestamptz,
  '[{"r": 6, "cx": 48, "cy": 22}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '4e2bac9e-b9e7-482d-b545-d5ca7da968dd'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(DX)(20260420153129)000.jpg', 'radiology', 'thorax', '측면 흉부 방사선 사진에서 명확한 이상 소견은 관찰되지 않으며 최종 평가는 수의사가 합니다.',
  'f'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336838373_0_53403710.webp', 'image/webp', '97210'::integer, '2026-04-28 00:40:39.636035+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e2366f97-26a6-41ac-8381-9ce8769db57f'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(DX)(20260420153157)003.jpg', 'radiology', 'abdomen', '요추-천추 부위에 뼈의 돌출(골극) 소견이 보여 퇴행성 변화가 의심되며 최종 평가는 수의사가 합니다.',
  't'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336866725_0_a1816c1e.webp', 'image/webp', '101188'::integer, '2026-04-28 00:41:08.570043+00'::timestamptz,
  '[{"r": 5, "cx": 53, "cy": 40}, {"r": 6, "cx": 80, "cy": 50}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '966be92e-4fcf-4148-b75b-26a58e0b9911'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(DX)001.jpg', 'radiology', 'thorax', '목 부위 척추에 경미한 골극 및 퇴행성 변화가 의심되며 수의사의 최종 진단이 필요합니다.',
  't'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336888675_0_d836bbcd.webp', 'image/webp', '89352'::integer, '2026-04-28 00:41:29.966778+00'::timestamptz,
  '[{"r": 6, "cx": 30, "cy": 34}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '02c4301a-92db-40d2-b7c5-d2f988e7a6e9'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20'::date, '202400024-정종욱(쿠로미)(DX)002.jpg', 'radiology', 'thorax', '흉부 방사선에서 명확한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'abc-260427-01_069d2c39/2026-04-20/1777336900994_0_619a3d11.webp', 'image/webp', '58192'::integer, '2026-04-28 00:41:42.279427+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '952551f8-af31-4cb5-abe7-b84de2252272'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '17420_64916_KakaoTalk_20260415_111134936_07.jpg', 'other', NULL, '윗 어금니(송곳니) 주변 잇몸에 경미한 발적이 관찰되며 수의사 확인이 필요합니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777424781864_0_005f3aaf.webp', 'image/webp', '274930'::integer, '2026-04-29 01:06:23.580155+00'::timestamptz,
  '[{"r": 5, "cx": 72, "cy": 36}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '1e735ae8-275a-4e4d-8bc0-7ce7e3f5f267'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '17420_64917_KakaoTalk_20260415_111134936_08.jpg', 'other', NULL, '코 표면과 입 주위는 육안으로 특별한 이상 소견 없이 보입니다.',
  'f'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777424799393_0_a26735a1.webp', 'image/webp', '235028'::integer, '2026-04-29 01:06:41.508355+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8be7942d-8a0f-45fd-a214-ac893fd0973d'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '17420_64918_KakaoTalk_20260415_111134936_09.jpg', 'other', NULL, '눈 표면에 충혈과 각막 표면 불규칙성이 보여 수의사의 추가 안과 검진이 권장됩니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777424825262_0_72bfb3f5.webp', 'image/webp', '208744'::integer, '2026-04-29 01:07:06.787945+00'::timestamptz,
  '[{"r": 6, "cx": 48, "cy": 58}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '1ec08944-3fbc-4904-90e3-31e69cbabc1d'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '17420_64919_KakaoTalk_20260415_111134936_10.jpg', 'slit_lamp', NULL, '눈의 중앙 부위에 불투명한 혼탁이 관찰되어 상세한 안과 검진이 필요합니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777424845330_0_0c3e5114.webp', 'image/webp', '313284'::integer, '2026-04-29 01:07:26.994032+00'::timestamptz,
  '[{"r": 7, "cx": 50, "cy": 72}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '9aefda5f-e929-4bf1-a267-072c1473e55c'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '17420_64920_KakaoTalk_20260415_111134936_11.jpg', 'other', NULL, '눈 주변 사진에서 소량의 눈물과 분비물은 보이나 명확한 염증이나 상처는 관찰되지 않습니다.',
  'f'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777424863892_0_1ee8e94c.webp', 'image/webp', '488318'::integer, '2026-04-29 01:07:45.200186+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'cf92dbde-5e58-46c7-8138-379ca8edcc13'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '17420_64921_KakaoTalk_20260415_111134936_12.jpg', 'slit_lamp', NULL, '눈의 결막 부위에 약간의 충혈이 관찰되어 수의사의 추가 진찰이 권장됩니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777424887312_0_54f15d55.webp', 'image/webp', '357698'::integer, '2026-04-29 01:08:08.704141+00'::timestamptz,
  '[{"r": 6, "cx": 50, "cy": 30}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '64404e22-52fe-4e63-99a9-cc1c328db19b'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '17420_64901_16362_64898_16362_64896_IntoCNS_000004.jpg', 'endoscopy', NULL, '내시경에서 중앙에 털과 함께 보이는 연성 조직 소견이 관찰되며 최종 평가는 수의사가 결정합니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777424904024_0_81587504.webp', 'image/webp', '7368'::integer, '2026-04-29 01:08:24.515652+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 50}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '88cfdc75-a668-4d2e-a1ad-d02a11093903'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '17420_64902_16362_64899_16362_64893_IntoCNS_000001.jpg', 'endoscopy', NULL, '내시경 영상에서 명확한 병변은 관찰되지 않으니 수의사 소견이 필요합니다.',
  'f'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777424916021_0_3b85594b.webp', 'image/webp', '9306'::integer, '2026-04-29 01:08:36.532138+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '9d843984-73b2-4eb9-9d72-bc4f0709d8f0'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '17420_64903_16362_64900_16362_64894_IntoCNS_000002.jpg', 'endoscopy', NULL, '내시경 영상에서 점액성 조직과 털 같은 이물질이 관찰되어 추가 확인이 필요합니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777424934108_0_ed5e9ee9.webp', 'image/webp', '6750'::integer, '2026-04-29 01:08:54.621482+00'::timestamptz,
  '[{"r": 8, "cx": 55, "cy": 30}, {"r": 6, "cx": 55, "cy": 72}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '7cc0b063-7826-457b-b3db-ae00a27e44f0'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '17420_64904_16362_64897_16362_64895_IntoCNS_000003.jpg', 'endoscopy', NULL, '내시경 시야 중앙에 붉은 점막과 털·잔여물이 관찰되어 추가 평가가 필요합니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777424948370_0_efb6d951.webp', 'image/webp', '9138'::integer, '2026-04-29 01:09:08.897671+00'::timestamptz,
  '[{"r": 10, "cx": 50, "cy": 50}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '6c49d9e7-0638-4150-952b-1701bb211c4e'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '17420_64909_KakaoTalk_20260415_111134936.jpg', 'other', NULL, '복부와 사타구니 부위에 부분적인 탈모와 피부 발적이 관찰되며 추가 평가(피부 검사 또는 진찰)가 필요합니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777424972101_0_a5adc19c.webp', 'image/webp', '283796'::integer, '2026-04-29 01:09:33.195492+00'::timestamptz,
  '[{"r": 10, "cx": 50, "cy": 78}, {"r": 6, "cx": 30, "cy": 34}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '43ccf255-d678-4e76-a63f-f79c6c60fbcc'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '17420_64911_KakaoTalk_20260415_111134936_02.jpg', 'other', NULL, '배 중앙의 배꼽 주변에 국소적인 탈모와 피부 변색이 관찰됩니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777424996501_0_69230b97.webp', 'image/webp', '423626'::integer, '2026-04-29 01:09:57.684822+00'::timestamptz,
  '[{"r": 4, "cx": 50, "cy": 18}, {"r": 10, "cx": 50, "cy": 38}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c31d2561-0201-400f-abf1-5d844326a0b3'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '17420_64912_KakaoTalk_20260415_111134936_03.jpg', 'other', NULL, '피부 표면에 작은 분홍색 돌기 모양 소견이 관찰되어 수의사 진단이 필요합니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425017599_0_4b01b8c6.webp', 'image/webp', '254024'::integer, '2026-04-29 01:10:18.410939+00'::timestamptz,
  '[{"r": 4, "cx": 60, "cy": 35}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '3a890388-8569-4d6a-95d7-38b0974c07ad'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '17420_64913_KakaoTalk_20260415_111134936_04.jpg', 'other', NULL, '털 사이에 표면이 불규칙한 분홍색 돌기가 뚜렷하게 관찰됩니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425039905_0_cd4a9d9f.webp', 'image/webp', '228798'::integer, '2026-04-29 01:10:40.971575+00'::timestamptz,
  '[{"r": 6, "cx": 18, "cy": 38}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '7ef991e6-474f-424f-97c6-b90ed6ca62eb'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '17420_64914_KakaoTalk_20260415_111134936_05.jpg', 'other', NULL, '사진에서 명확한 피부 병변이나 탈모는 관찰되지 않습니다.',
  'f'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425056298_0_4a8a9a7f.webp', 'image/webp', '219374'::integer, '2026-04-29 01:10:57.077191+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e07c981a-2d42-433b-b91a-86c4b4256a1f'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '17420_64915_KakaoTalk_20260415_111134936_06.jpg', 'other', NULL, '입 안 사진에서 어금니 표면에 노란색 치석이 관찰되며 치은 염증 가능성이 있어 치과 검진이 권장됩니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425080460_0_125e5650.webp', 'image/webp', '245060'::integer, '2026-04-29 01:11:21.486103+00'::timestamptz,
  '[{"r": 6, "cx": 48, "cy": 63}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e4ffd208-301b-42db-93b2-53761efc5cfa'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.12356.13731.jpg', 'radiology', 'thorax', '흉부 방사선에서 VHS 9.5로 심장 비대가 의심되며 최종 판단은 수의사가 합니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425293252_0_8e7b7358.webp', 'image/webp', '36752'::integer, '2026-04-29 01:14:53.956913+00'::timestamptz,
  '[{"r": 10, "cx": 28, "cy": 42}]'::jsonb, NULL, '심장 비대'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '613147b4-1613-48d4-b800-14360e46a0de'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.12692.13732.jpg', 'radiology', 'thorax', '흉부 방사선 사진에서 심장 음영이 상대적으로 커 보여 심장 비대가 의심되며 최종 평가는 수의사 소견이 필요합니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425316326_0_b1d94872.webp', 'image/webp', '60876'::integer, '2026-04-29 01:15:17.145445+00'::timestamptz,
  '[{"r": 8, "cx": 50, "cy": 28}]'::jsonb, NULL, '심장 비대'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '61f01bcc-1b44-4dce-96e9-380650e03322'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.12803.13734.jpg', 'radiology', 'thorax', '흉부 방사선에서 심장 음영이 확대되어 심장 비대가 의심됩니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425344277_0_e06260f5.webp', 'image/webp', '60546'::integer, '2026-04-29 01:15:45.514459+00'::timestamptz,
  '[{"r": 10, "cx": 50, "cy": 38}]'::jsonb, NULL, '심장 비대'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c445598f-dacf-42a7-8ad0-196f0c2578b1'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.12271.13729.jpg', 'radiology', 'thorax', '흉부 방사선에서 심장 음영이 다소 확대되어 심장 비대가 의심됩니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425371331_0_a1c3a209.webp', 'image/webp', '144354'::integer, '2026-04-29 01:16:12.807215+00'::timestamptz,
  '[{"r": 10, "cx": 45, "cy": 45}]'::jsonb, NULL, '심장 비대'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '02f37b3f-3a3b-4293-9fa7-5a353834cee0'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.32.20260415.103255.49.jpg', 'ultrasound', NULL, '복부 초음파(대장) 영상으로 목록에 있는 확진/의심 질환과 명확히 연결되는 소견은 확인되지 않습니다.',
  'f'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425391723_0_caa89e98.webp', 'image/webp', '21098'::integer, '2026-04-29 01:16:32.82093+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '33075286-e4b0-4fd9-a5c1-d10933cc2dfb'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.33.20260415.103415.301.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 침착성 에코소견이 관찰되어 담낭 슬러지가 의심됩니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425415311_0_b61b1f78.webp', 'image/webp', '43340'::integer, '2026-04-29 01:16:55.877689+00'::timestamptz,
  '[{"r": 6, "cx": 30, "cy": 22}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '6b8f0447-bc63-4d48-a976-2ba56c57db2a'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.34.20260415.103448.965.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지로 보이는 소견이 관찰되어 담낭 슬러지가 의심됩니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425442655_0_4e6b2043.webp', 'image/webp', '43296'::integer, '2026-04-29 01:17:23.364161+00'::timestamptz,
  '[{"r": 12, "cx": 45, "cy": 45}]'::jsonb, NULL, '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '0279965d-431d-463e-8765-a154be6855ba'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.1.20260415.102616.12.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내에 저에코 또는 층상 에코가 보여 담낭 슬러지가 의심되며 최종 판단은 수의사가 합니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425460916_0_f671a258.webp', 'image/webp', '22144'::integer, '2026-04-29 01:17:41.989175+00'::timestamptz,
  '[{"r": 8, "cx": 50, "cy": 65}]'::jsonb, NULL, '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '6c3bf061-73cf-4fad-b047-9efe291a4588'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.2.20260415.102619.363.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지로 보이는 저에코 침전물이 관찰되어 담낭 슬러지가 의심됩니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425491272_0_0c9a26ed.webp', 'image/webp', '39358'::integer, '2026-04-29 01:18:11.903754+00'::timestamptz,
  '[{"r": 10, "cx": 70, "cy": 60}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8668e0d6-da31-41b3-88c1-32cf6b756954'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.3.20260415.102624.252.jpg', 'ultrasound', NULL, '복부 초음파 영상으로 간 부위가 관찰되며, 영상만으로 특정 질환을 확정할 수 없습니다.',
  'f'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425509930_0_ce076cb1.webp', 'image/webp', '22454'::integer, '2026-04-29 01:18:30.455689+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '6c2a58c3-0309-4ebd-8916-d941bad8c8c1'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.4.20260415.102635.940.jpg', 'ultrasound', NULL, '복부 초음파(간 부위) 영상이며, 명확한 이상 소견은 관찰되지 않아 수의사의 추가 판정이 필요합니다.',
  'f'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425526654_0_4a32fd2a.webp', 'image/webp', '22542'::integer, '2026-04-29 01:18:47.151487+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e49409fb-241b-47d6-858a-808577e927e1'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.5.20260415.102703.60.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지 소견이 보이며, 최종 판단은 수의사 진단을 따르세요.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425551885_0_7be9996d.webp', 'image/webp', '23682'::integer, '2026-04-29 01:19:12.377454+00'::timestamptz,
  '[{"r": 6, "cx": 22, "cy": 48}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'a43f383e-53c8-4b66-afb8-5414dcd76f74'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.6.20260415.102727.83.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지로 의심되는 에코성 내용물이 관찰됩니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425571163_0_3fc7621d.webp', 'image/webp', '22616'::integer, '2026-04-29 01:19:31.799776+00'::timestamptz,
  '[{"r": 12, "cx": 52, "cy": 58}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c54a78ec-75f0-45ef-ada5-d1ce13206699'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.7.20260415.102735.375.jpg', 'ultrasound', NULL, '복부 초음파에서 비장 영상을 촬영한 것으로, 제시된 질환 목록과 연관된 명확한 소견은 관찰되지 않습니다.',
  'f'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425584719_0_5dce53cb.webp', 'image/webp', '22938'::integer, '2026-04-29 01:19:45.184947+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'd37c39b1-b5bb-4448-aa3c-c30f0df4fef5'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.8.20260415.102739.772.jpg', 'ultrasound', NULL, '복부 초음파 영상으로, 이 이미지에서는 뚜렷한 이상 소견이 관찰되지 않습니다.',
  'f'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425600966_0_f0128203.webp', 'image/webp', '43980'::integer, '2026-04-29 01:20:02.005525+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '93a20426-b474-4411-a440-28c8f138c31b'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.9.20260415.102743.986.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지로 의심되는 에코성 물질이 관찰되며 최종 평가는 수의사가 결정합니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425619797_0_ef193e3c.webp', 'image/webp', '42704'::integer, '2026-04-29 01:20:21.134047+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 40}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '22ab1492-2087-4137-9593-1cc029b0da59'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.10.20260415.102758.240.jpg', 'ultrasound', NULL, '복부 초음파에서 비장 부위 영상이 확인되며, 목록의 평가 질환과 연결되는 명확한 소견은 확인되지 않습니다.',
  'f'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425633794_0_bb11885d.webp', 'image/webp', '22302'::integer, '2026-04-29 01:20:34.302656+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8e6103a6-b0d6-4821-acbc-ae2966f5ed3c'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.11.20260415.102828.717.jpg', 'ultrasound', NULL, '복부 초음파에서 좌측 신장에 석회화 의심 소견이 관찰되어 수의사의 추가 평가가 필요합니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425653366_0_86408e27.webp', 'image/webp', '23530'::integer, '2026-04-29 01:20:53.926743+00'::timestamptz,
  '[{"r": 8, "cx": 65, "cy": 50}]'::jsonb, NULL, '콩팥 석회화'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '20bd86f8-5d4a-40a9-a25c-2dd6aeac8921'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.12.20260415.102832.474.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 침전성 에코가 관찰되어 담낭 슬러지가 의심됩니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425672970_0_de7744b8.webp', 'image/webp', '41012'::integer, '2026-04-29 01:21:14.788031+00'::timestamptz,
  '[{"r": 10, "cx": 68, "cy": 25}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b1927a1f-cc50-49d0-acef-56af36a6030a'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.13.20260415.102841.471.jpg', 'ultrasound', NULL, '복부 초음파 영상으로, 눈에 띄는 이상 소견은 관찰되지 않아 추가 임상 평가가 필요합니다.',
  'f'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425691994_0_3dcab2d0.webp', 'image/webp', '44408'::integer, '2026-04-29 01:21:32.551566+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '24880637-5e1a-4df4-b7fe-9cc915add48f'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.14.20260415.102856.507.jpg', 'ultrasound', NULL, '복부 초음파에서 좌측 부신 영상이 촬영되었으며, 이상 유무는 수의사의 최종 판독이 필요합니다.',
  'f'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425705634_0_c26e51ab.webp', 'image/webp', '27872'::integer, '2026-04-29 01:21:46.164562+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'ddc6cc29-ff07-4c50-9ff4-0cba6703cac8'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.15.20260415.102908.331.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지가 관찰되며, 최종 진단은 수의사가 결정합니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425725099_0_b3bf97cb.webp', 'image/webp', '24114'::integer, '2026-04-29 01:22:05.595895+00'::timestamptz,
  '[{"r": 10, "cx": 40, "cy": 30}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e04f46a6-426b-407b-8773-9bdb02b6d8a2'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.16.20260415.102912.78.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지 소견이 관찰됩니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425745828_0_1f06e0df.webp', 'image/webp', '43526'::integer, '2026-04-29 01:22:26.367126+00'::timestamptz,
  '[{"r": 12, "cx": 45, "cy": 40}, {"r": 6, "cx": 50, "cy": 68}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'd5b6a7aa-72a3-4285-8a6b-809851005890'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.17.20260415.102942.239.jpg', 'ultrasound', NULL, '우측 콩팥 초음파에서 경미한 석회화 소견이 관찰되며 수의사의 추가 평가가 필요합니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425769055_0_ec168b15.webp', 'image/webp', '25428'::integer, '2026-04-29 01:22:49.99087+00'::timestamptz,
  '[{"r": 4, "cx": 52, "cy": 55}]'::jsonb, NULL, '콩팥 석회화'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '46f66567-aff2-4726-9bf6-0fbad80c143a'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.18.20260415.102946.85.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지 소견이 관찰됩니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425783649_0_67fa9e08.webp', 'image/webp', '44988'::integer, '2026-04-29 01:23:04.218613+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 60}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '12771eaf-a854-41fe-85e9-0aba0a962393'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.19.20260415.103000.141.jpg', 'ultrasound', NULL, '복부 초음파로 위 부위 횡단면 영상이며, 명확한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425802769_0_78104cb7.webp', 'image/webp', '23254'::integer, '2026-04-29 01:23:23.918553+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e7c8f5ce-0871-4d9b-8f5b-76df36ac85bb'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.20.20260415.103005.273.jpg', 'ultrasound', NULL, '복부 초음파 검사 영상으로, 현재 영상만으로는 명확한 이상 소견을 특정하기 어려우며 최종 판단은 수의사가 합니다.',
  'f'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425819517_0_05d587dd.webp', 'image/webp', '25632'::integer, '2026-04-29 01:23:40.065544+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '16662d5c-e836-4130-a87c-f281f2e2834c'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.21.20260415.103019.931.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지로 보이는 소견이 관찰됩니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425842811_0_af022ff8.webp', 'image/webp', '23214'::integer, '2026-04-29 01:24:03.357684+00'::timestamptz,
  '[{"r": 8, "cx": 50, "cy": 60}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'df9b60fb-fe04-4bf8-aa96-b72a060c38a1'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.22.20260415.103023.918.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지로 보이는 침착물이 관찰되며 최종 판단은 담당 수의사가 합니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425860532_0_d5c9cf41.webp', 'image/webp', '41720'::integer, '2026-04-29 01:24:21.046115+00'::timestamptz,
  '[{"r": 10, "cx": 62, "cy": 46}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'bfd3cd3d-6557-4967-b2bd-672165863127'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.23.20260415.103032.925.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지 소견이 관찰되며 최종 평가는 수의사 진단이 필요합니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425877427_0_06c01a00.webp', 'image/webp', '22922'::integer, '2026-04-29 01:24:37.935398+00'::timestamptz,
  '[{"r": 6, "cx": 50, "cy": 46}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c5d60fa2-066b-45a9-afa0-159ec1ce1750'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.24.20260415.103053.573.jpg', 'ultrasound', NULL, '복부 초음파(췌장) 영상에서 명확한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425887910_0_036f4e77.webp', 'image/webp', '22980'::integer, '2026-04-29 01:24:48.944486+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'a43c0b59-7f03-47c8-843e-2db464fae5c8'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.25.20260415.103129.435.jpg', 'ultrasound', NULL, '복부 초음파로 촬영한 십이지장(duodenum) 영상이며, 목록에 포함된 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425903566_0_eb5ff7c3.webp', 'image/webp', '24374'::integer, '2026-04-29 01:25:04.529605+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'eaa357bc-4611-4d1c-b4d7-bd9bdbea2db1'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.26.20260415.103143.675.jpg', 'ultrasound', NULL, '상복부 초음파로 십이지장이 관찰되며 특이한 소견은 확인되지 않습니다.',
  'f'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425916072_0_458d5fd4.webp', 'image/webp', '25372'::integer, '2026-04-29 01:25:16.681556+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '1793df7b-7212-4c46-9ca1-af61b303b07d'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.27.20260415.103204.805.jpg', 'ultrasound', NULL, '복부 초음파 영상으로, 이 이미지만으로는 명확한 담낭 슬러지나 콩팥 석회화 같은 소견이 확인되지 않습니다.',
  'f'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425929020_0_3422d8fb.webp', 'image/webp', '23108'::integer, '2026-04-29 01:25:29.577165+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'db830f0c-0f5a-433b-a1cd-a72c0e94810a'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.28.20260415.103212.47.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지 소견이 관찰되어 수의사 진단이 필요합니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425950837_0_a64c295b.webp', 'image/webp', '22044'::integer, '2026-04-29 01:25:51.730869+00'::timestamptz,
  '[{"r": 12, "cx": 55, "cy": 50}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f589aef7-1b28-4a04-ad9a-c1d1c957bc94'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.29.20260415.103220.122.jpg', 'ultrasound', NULL, '복부 초음파상 담낭 내에 슬러지로 보이는 저에코 침전물이 관찰됩니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425966872_0_4b69f16f.webp', 'image/webp', '22522'::integer, '2026-04-29 01:26:08.50189+00'::timestamptz,
  '[{"r": 8, "cx": 45, "cy": 40}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'ea20bbfb-6394-429e-86f9-96fc73d5c0cd'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.30.20260415.103225.358.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 에코가 보이는 슬러지 소견이 관찰되며 최종 해석은 수의사가 판단해야 합니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777425987494_0_74fe3338.webp', 'image/webp', '22080'::integer, '2026-04-29 01:26:28.399251+00'::timestamptz,
  '[{"r": 6, "cx": 50, "cy": 60}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c8f4a9b1-8ae5-4b06-b99d-a57cdc6f3921'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.31.20260415.103233.823.jpg', 'ultrasound', NULL, '복부 초음파상 담낭 내 침전성 저에코 물질이 관찰되어 담낭 슬러지 가능성이 높습니다.',
  't'::boolean, 'baek-260429-01_2b1b8190/2026-04-15/1777426006929_0_b817691d.webp', 'image/webp', '21674'::integer, '2026-04-29 01:26:47.862414+00'::timestamptz,
  '[{"r": 10, "cx": 65, "cy": 62}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '4858a3d1-f369-423c-9532-475f12cf1e4a'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '17420_64915_KakaoTalk_20260415_111134936_06.jpg', 'other', NULL, '입 안 사진에서 치아 표면에 치석으로 보이는 침착물이 관찰됩니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777437760686_0_c39cb9e8.webp', 'image/webp', '245060'::integer, '2026-04-29 04:42:43.285146+00'::timestamptz,
  '[{"r": 6, "cx": 58, "cy": 62}]'::jsonb, 'clear', '치석'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f0b33b2a-6da6-468e-b977-70dbb7526989'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '17420_64916_KakaoTalk_20260415_111134936_07.jpg', 'other', NULL, '치아에 경도-중등도의 치석이 관찰됩니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777437795685_0_4a8a6c94.webp', 'image/webp', '274930'::integer, '2026-04-29 04:43:17.196554+00'::timestamptz,
  '[{"r": 6, "cx": 68, "cy": 34}]'::jsonb, 'clear', '치석'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f549a788-974b-4b0d-b4cf-1c4be076dfb5'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '17420_64917_KakaoTalk_20260415_111134936_08.jpg', 'other', NULL, '코와 구강 전면을 촬영한 외부 사진으로, 제공된 분석 목록과 연관되는 명확한 이상 소견은 보이지 않습니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777437817895_0_fd48eb90.webp', 'image/webp', '235028'::integer, '2026-04-29 04:43:38.6459+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '7087ea8b-033c-4496-8ece-aa8b3d2c308c'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '17420_64918_KakaoTalk_20260415_111134936_09.jpg', 'slit_lamp', NULL, '안구 주변을 촬영한 외부 사진이며, 이 이미지에서는 특이 소견이 보이지 않습니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777437838699_0_6a757151.webp', 'image/webp', '208744'::integer, '2026-04-29 04:44:00.642625+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'db09f9b4-fd2d-4f74-8b90-c8e19f19af48'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '17420_64919_KakaoTalk_20260415_111134936_10.jpg', 'slit_lamp', NULL, '안구 확대 사진으로, 제공된 평가 목록과 연관된 명확한 소견은 관찰되지 않습니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777437862685_0_7ed58816.webp', 'image/webp', '313284'::integer, '2026-04-29 04:44:25.702586+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8e0600bd-cb7b-492c-be31-7a836f6a7501'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '17420_64920_KakaoTalk_20260415_111134936_11.jpg', 'other', NULL, '구강 주변을 근접 촬영한 임상 사진입니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777437885130_0_e5afcbbc.webp', 'image/webp', '488318'::integer, '2026-04-29 04:44:46.89959+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b2b86c27-a54b-41e9-9a55-6d35fe42a34f'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '17420_64921_KakaoTalk_20260415_111134936_12.jpg', 'slit_lamp', NULL, '안구 주변을 근접 촬영한 사진으로, 영상에서 명확한 목록 내 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777437907353_0_b0208d93.webp', 'image/webp', '357698'::integer, '2026-04-29 04:45:09.465147+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '73b7bd88-b0b2-4622-9845-fa5b21e0145f'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '17420_64901_16362_64898_16362_64896_IntoCNS_000004.jpg', 'endoscopy', NULL, '내시경으로 외이도 내부를 촬영한 영상입니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777437927961_0_6ead0440.webp', 'image/webp', '7368'::integer, '2026-04-29 04:45:28.949231+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '697fb3ef-f63f-4ed8-8b08-6fec6dc213a1'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '17420_64902_16362_64899_16362_64893_IntoCNS_000001.jpg', 'endoscopy', NULL, '내시경 사진으로 피부와 털 표면이 관찰되며 특징적인 소견은 확인되지 않습니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777437945819_0_3b7f13b3.webp', 'image/webp', '9306'::integer, '2026-04-29 04:45:46.800182+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '05d860b6-aee7-4cd6-8a44-1890c37ef82b'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '17420_64903_16362_64900_16362_64894_IntoCNS_000002.jpg', 'endoscopy', NULL, '내시경 영상에서 내부 구조가 관찰되며, 지정된 목록의 질환과 관련된 뚜렷한 소견은 보이지 않습니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777437965454_0_7528a78e.webp', 'image/webp', '6750'::integer, '2026-04-29 04:46:05.927352+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '6a935a6f-daf5-4b74-89d0-eb1898ac2fd2'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '17420_64904_16362_64897_16362_64895_IntoCNS_000003.jpg', 'endoscopy', NULL, '내시경 영상으로 관강 내부와 털이 관찰되며 뚜렷한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777437985434_0_c85b91c4.webp', 'image/webp', '9138'::integer, '2026-04-29 04:46:26.004377+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '6d3975cb-9a8b-4acf-9cfe-8b6291fae79e'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '17420_64909_KakaoTalk_20260415_111134936.jpg', 'other', NULL, '복부 사진으로, 목록의 해당 질환과 연결되는 명확한 소견은 관찰되지 않습니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438004472_0_f8331e6e.webp', 'image/webp', '283796'::integer, '2026-04-29 04:46:45.530171+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8f358069-9029-423c-a37d-fba9c35210bc'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '17420_64911_KakaoTalk_20260415_111134936_02.jpg', 'other', NULL, '배부(복부) 피부를 촬영한 사진으로 눈에 띄는 이상 소견은 보이지 않습니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438024117_0_e8a2634e.webp', 'image/webp', '423626'::integer, '2026-04-29 04:47:05.3538+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f0066034-2198-425c-805f-74325213a9b1'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '17420_64912_KakaoTalk_20260415_111134936_03.jpg', 'other', NULL, '피부 부위 사진으로 목록에 포함된 질환과 연결되는 뚜렷한 소견은 보이지 않습니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438044572_0_31bde654.webp', 'image/webp', '254024'::integer, '2026-04-29 04:47:26.018406+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e1fd5a95-f1b2-4baa-8e62-b7ecd41fea94'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '17420_64913_KakaoTalk_20260415_111134936_04.jpg', 'other', NULL, '피부 사진으로 중앙에 작은 돌기성 병변이 관찰됩니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438063848_0_43a9c6cb.webp', 'image/webp', '228798'::integer, '2026-04-29 04:47:45.294573+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '52e73291-3cfd-4bd1-9a27-08987fe87857'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '17420_64914_KakaoTalk_20260415_111134936_05.jpg', 'other', NULL, '진료대에서 촬영한 등과 옆모습을 포함한 외부 사진입니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438082580_0_cf989549.webp', 'image/webp', '219374'::integer, '2026-04-29 04:48:03.998515+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8eb6de5e-28b8-4d32-8548-64ee62609300'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.22.20260415.103023.918.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지 소견이 관찰됩니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438510765_0_b26c69d6.webp', 'image/webp', '41720'::integer, '2026-04-29 04:55:11.695516+00'::timestamptz,
  '[{"r": 8, "cx": 60, "cy": 50}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8ca5b74e-6690-4932-a00b-80316ae858c3'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.23.20260415.103032.925.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지 소견이 관찰되어 3개월 뒤 재검진을 권장합니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438538424_0_0c34969b.webp', 'image/webp', '22922'::integer, '2026-04-29 04:55:39.581288+00'::timestamptz,
  '[{"r": 5, "cx": 50, "cy": 45}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'bba6a78f-f1f6-4836-ac5e-c31ce2229221'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.24.20260415.103053.573.jpg', 'ultrasound', NULL, '복부 초음파로 췌장 부위를 촬영한 영상입니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438550703_0_3dd5a042.webp', 'image/webp', '22980'::integer, '2026-04-29 04:55:51.232039+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e586e3df-a390-4fd4-b57d-a4e3ba2e2672'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.25.20260415.103129.435.jpg', 'ultrasound', NULL, '복부 초음파(십이지장) 영상으로, 특이 소견은 관찰되지 않습니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438565073_0_5c7fc780.webp', 'image/webp', '24374'::integer, '2026-04-29 04:56:05.598829+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '2d3edccb-3290-467b-8bd2-020ec532eff4'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.26.20260415.103143.675.jpg', 'ultrasound', NULL, '복부 초음파로 십이지장 부위를 촬영한 영상이며, 이미지상 명확한 이상 소견은 보이지 않습니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438581710_0_59590b04.webp', 'image/webp', '25372'::integer, '2026-04-29 04:56:23.118322+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '7d3f2766-f0d8-43b0-9560-f1aabd6983f3'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.27.20260415.103204.805.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지로 보이는 에코가 관찰되어 경과 관찰이 권장됩니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438600028_0_3dbc17b6.webp', 'image/webp', '23108'::integer, '2026-04-29 04:56:40.955666+00'::timestamptz,
  '[{"r": 10, "cx": 50, "cy": 35}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '59c34908-6bd4-4420-979a-a6f929d35627'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.28.20260415.103212.47.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지로 보이는 소견이 관찰되어 경과 관찰이 권장됩니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438622114_0_d5f0ecf5.webp', 'image/webp', '22044'::integer, '2026-04-29 04:57:02.606326+00'::timestamptz,
  '[{"r": 10, "cx": 70, "cy": 55}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '70231a40-cf1e-4b36-8378-f60a896f3abb'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.29.20260415.103220.122.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지로 보이는 침전물이 관찰되며 수의사의 추가 평가가 필요합니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438646387_0_ce317727.webp', 'image/webp', '22522'::integer, '2026-04-29 04:57:27.471577+00'::timestamptz,
  '[{"r": 10, "cx": 70, "cy": 55}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b8c26540-a048-4c93-a320-689e17493fa8'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.30.20260415.103225.358.jpg', 'ultrasound', NULL, '복부 초음파상 담낭 내 에코가 관찰되어 담낭 슬러지가 의심됩니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438671363_0_6959406e.webp', 'image/webp', '22080'::integer, '2026-04-29 04:57:51.836752+00'::timestamptz,
  '[{"r": 10, "cx": 55, "cy": 45}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '36873ec6-8ba7-40ac-8bc1-49716b7a1249'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.31.20260415.103233.823.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 침전물(담낭 슬러지)이 의심되며 3개월 뒤 재검진을 통해 경과 관찰이 권장됩니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438695130_0_c59d2fb4.webp', 'image/webp', '21674'::integer, '2026-04-29 04:58:15.593289+00'::timestamptz,
  '[{"r": 8, "cx": 60, "cy": 65}]'::jsonb, NULL, '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '44740b4c-6c72-433f-ac95-445da3c2e23d'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.32.20260415.103255.49.jpg', 'ultrasound', NULL, '복부 초음파(대장) 영상으로, 명확한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438706258_0_82067230.webp', 'image/webp', '21098'::integer, '2026-04-29 04:58:26.718373+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '09beb8d8-4bbe-4164-a3d0-6d2a667bc0f9'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.33.20260415.103415.301.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 침전물이 관찰되어 담낭 슬러지가 의심됩니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438729204_0_be0a5450.webp', 'image/webp', '43340'::integer, '2026-04-29 04:58:49.718912+00'::timestamptz,
  '[{"r": 8, "cx": 15, "cy": 15}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '9f283328-a797-461a-99f8-c1fc0bcc3901'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.34.20260415.103448.965.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지로 의심되는 저에코 물질이 관찰됩니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438744330_0_ee5d9955.webp', 'image/webp', '43296'::integer, '2026-04-29 04:59:05.450165+00'::timestamptz,
  '[{"r": 12, "cx": 45, "cy": 40}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '4dc984f9-08b6-4b7a-baa8-132d549be716'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.1.20260415.102616.12.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지 소견이 관찰되며 수의사의 최종 판단이 필요합니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438762015_0_016113aa.webp', 'image/webp', '22144'::integer, '2026-04-29 04:59:22.615094+00'::timestamptz,
  '[{"r": 8, "cx": 48, "cy": 68}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '65724cb6-b3a7-41ad-9dfb-f2126f498fc7'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.2.20260415.102619.363.jpg', 'ultrasound', NULL, '복부 초음파에서 뚜렷한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438775462_0_120c3935.webp', 'image/webp', '39358'::integer, '2026-04-29 04:59:36.570168+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '6bf5d33c-d303-43bb-a30c-862071d9516c'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.3.20260415.102624.252.jpg', 'ultrasound', NULL, '복부 초음파로 간 영상을 촬영하였으며 현재 이미지에서 명확한 이상 소견은 보이지 않습니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438790652_0_01055e1c.webp', 'image/webp', '22454'::integer, '2026-04-29 04:59:51.580395+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b64c63ba-13d4-4a05-837c-dc685c338308'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.4.20260415.102635.940.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지로 보이는 소견이 관찰되어 경과 관찰이 권장됩니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438802261_0_1dd8e937.webp', 'image/webp', '22542'::integer, '2026-04-29 05:00:02.774246+00'::timestamptz,
  '[{"r": 10, "cx": 60, "cy": 60}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'cc8ceb4b-1763-4b96-a74b-c6b59f58a234'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.5.20260415.102703.60.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 침전물이 관찰되어 담낭 슬러지 가능성이 있습니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438818732_0_7f51d596.webp', 'image/webp', '23682'::integer, '2026-04-29 05:00:20.160144+00'::timestamptz,
  '[{"r": 6, "cx": 30, "cy": 42}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'be8c9533-08a0-4676-9b63-beba8526e16a'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.6.20260415.102727.83.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 에코가 보이는 슬러지 소견이 관찰되어 경과 관찰이 권장됩니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438833530_0_2eee51f8.webp', 'image/webp', '22616'::integer, '2026-04-29 05:00:36.790728+00'::timestamptz,
  '[{"r": 10, "cx": 50, "cy": 68}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '111a3d55-6b8a-4658-8f61-549de2a23b37'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.7.20260415.102735.375.jpg', 'ultrasound', NULL, '비장 초음파 영상이며, 목록의 특정 질환과 연결되는 명확한 소견은 확인되지 않습니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438846912_0_a6f27cab.webp', 'image/webp', '22938'::integer, '2026-04-29 05:00:47.38736+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '741e6563-f9d0-492d-a5c8-e4bc38848dbc'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.8.20260415.102739.772.jpg', 'ultrasound', NULL, '복부 초음파 영상으로, 현재 영상만으로는 명확한 이상 소견이 확인되지 않습니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438857486_0_d0bd3f9c.webp', 'image/webp', '43980'::integer, '2026-04-29 05:00:58.646057+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '67ebd237-80f4-4cfd-add1-f2018795605f'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.9.20260415.102743.986.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내부에 슬러지로 보이는 저에코 물질이 관찰됩니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438869375_0_806d1f85.webp', 'image/webp', '42704'::integer, '2026-04-29 05:01:10.965863+00'::timestamptz,
  '[{"r": 12, "cx": 45, "cy": 45}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '5839e474-5590-4854-abef-81794df0612c'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.10.20260415.102758.240.jpg', 'ultrasound', NULL, '복부 초음파에서 비장이 촬영되었으며 특별히 눈에 띄는 이상 소견은 확인되지 않습니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438879950_0_15222ee2.webp', 'image/webp', '22302'::integer, '2026-04-29 05:01:20.602032+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '87469b72-7ba4-49de-999f-cfd39bb3313e'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.11.20260415.102828.717.jpg', 'ultrasound', NULL, '좌측 신장 초음파에서 석회화로 의심되는 고에코 소견이 관찰되어 콩팥 석회화 가능성이 있습니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438897178_0_487cb63e.webp', 'image/webp', '23530'::integer, '2026-04-29 05:01:38.266828+00'::timestamptz,
  '[{"r": 5, "cx": 40, "cy": 48}]'::jsonb, 'clear', '콩팥 석회화'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '2af34486-dd1b-47de-a9fe-387e4d9af2e8'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.12.20260415.102832.474.jpg', 'ultrasound', NULL, '초음파 소견상 담낭 내 에코성 침전이 보여 담낭 슬러지가 의심되며 추적 관찰이 권장됩니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438914791_0_ff2da5c9.webp', 'image/webp', '41012'::integer, '2026-04-29 05:01:55.320608+00'::timestamptz,
  '[{"r": 8, "cx": 65, "cy": 35}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8a883072-0296-4126-bbc0-65a8f58f4a8d'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.13.20260415.102841.471.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지로 보이는 저에코 물질이 관찰되며 수의사 판단과 추적 검사가 권장됩니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438932913_0_e77fe891.webp', 'image/webp', '44408'::integer, '2026-04-29 05:02:13.523983+00'::timestamptz,
  '[{"r": 10, "cx": 45, "cy": 50}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'a9a33a15-ef1e-4a1f-ad0a-70f92434dc44'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.14.20260415.102856.507.jpg', 'ultrasound', NULL, '좌측 부신 초음파 영상으로 조직 구조와 측정 표식이 관찰되며 최종 평가는 담당 수의사가 합니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438942913_0_19f47a02.webp', 'image/webp', '27872'::integer, '2026-04-29 05:02:23.436582+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '007a40da-468c-435a-bbb0-33c863216174'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.15.20260415.102908.331.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 침전물이 관찰되어 담낭 슬러지가 의심되며 수의사의 추가 평가가 필요합니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438963062_0_75fb41d4.webp', 'image/webp', '24114'::integer, '2026-04-29 05:02:43.595539+00'::timestamptz,
  '[{"r": 12, "cx": 30, "cy": 25}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '7b022cab-f452-4205-9d68-03f18e61e628'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.16.20260415.102912.78.jpg', 'ultrasound', NULL, '복부 초음파상 담낭 내 슬러지가 관찰되어 3개월 뒤 재검진으로 경과 관찰이 권장됩니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438976692_0_8de15558.webp', 'image/webp', '43526'::integer, '2026-04-29 05:02:57.871268+00'::timestamptz,
  '[{"r": 12, "cx": 48, "cy": 40}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '7da0e7f3-4df2-4446-a583-463cb5f880e7'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.17.20260415.102942.239.jpg', 'ultrasound', NULL, '우측 신장 초음파에서 국소 고에코성 소견이 관찰되어 콩팥 석회화가 의심되며 수의사 최종 판단이 필요합니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777438996167_0_605e3e62.webp', 'image/webp', '25428'::integer, '2026-04-29 05:03:17.607634+00'::timestamptz,
  '[{"r": 6, "cx": 60, "cy": 55}]'::jsonb, NULL, '콩팥 석회화'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '7a113aa0-2785-437d-8fed-8bc589e8f575'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.18.20260415.102946.85.jpg', 'ultrasound', NULL, '복부 초음파에서 담낭 내 슬러지로 의심되는 소견이 관찰되어 경과 관찰이 권장됩니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777439012541_0_2bf750ca.webp', 'image/webp', '44988'::integer, '2026-04-29 05:03:33.132567+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 55}]'::jsonb, 'clear', '담낭 슬러지'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'bd54201f-641a-4859-b990-f8a92c8005e8'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.19.20260415.103000.141.jpg', 'ultrasound', NULL, '복부 초음파에서 위 부위가 촬영되었으며, 눈에 띄는 이상 소견은 관찰되지 않았습니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777439024217_0_39f69f2e.webp', 'image/webp', '23254'::integer, '2026-04-29 05:03:44.715203+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '380d3dd7-17ef-445f-8fb6-f4c881f077a3'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.20.20260415.103005.273.jpg', 'ultrasound', NULL, '복부 초음파(위) 영상으로 현재 명확한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777439035079_0_c73af292.webp', 'image/webp', '25632'::integer, '2026-04-29 05:03:56.023993+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '08372ee8-85d5-457e-b087-2153d8894e95'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.2.840.113663.1500.1.464718846.3.21.20260415.103019.931.jpg', 'ultrasound', NULL, '초음파 영상으로 특정한 병변 소견은 명확하지 않아 추가 진단은 수의사의 판단이 필요합니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777439048239_0_7dcd833a.webp', 'image/webp', '23214'::integer, '2026-04-29 05:04:09.317844+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'a1df793c-2ff0-4d7b-afc6-cf2a928bd351'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.12356.13731.jpg', 'radiology', 'abdomen', '복부 측면 방사선 영상으로, 현 사진만으로는 명확한 병변 또는 목록에 해당하는 소견이 확인되지 않습니다.',
  'f'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777439987358_0_52e98119.webp', 'image/webp', '36752'::integer, '2026-04-29 05:19:48.577205+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '75e95ce4-5019-4078-a19c-6cd582f4db38'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.12692.13732.jpg', 'radiology', 'thorax', '흉부 방사선 사진에서 심장 크기가 커 보이며 심장 비대가 의심되어 추가 평가가 필요합니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777440006984_0_dfab73ca.webp', 'image/webp', '60876'::integer, '2026-04-29 05:20:07.993285+00'::timestamptz,
  '[{"r": 10, "cx": 50, "cy": 23}]'::jsonb, NULL, '심장 비대 의증'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '6cf83889-309b-4785-b2ed-6cbe1d3f662f'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.12803.13734.jpg', 'radiology', 'thorax', '흉부 방사선에서 심장 음영이 커 보여 심장 비대 의증이 의심되며 추가 평가가 필요합니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777440025353_0_bdac4be4.webp', 'image/webp', '60546'::integer, '2026-04-29 05:20:27.232957+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 35}]'::jsonb, NULL, '심장 비대 의증'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '99de241b-9ef3-469f-9a9e-152c51d22373'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15'::date, '1.3.6.1.4.1.19179.1.116054159241525.3.12271.13729.jpg', 'radiology', 'thorax', '흉부 방사선에서 심장 음영이 상대적으로 증가되어 심장 비대 의증이 의심되며 추가 평가가 필요합니다.',
  't'::boolean, 'baek-260429-05_8e318390/2026-04-15/1777440043806_0_de00bb2b.webp', 'image/webp', '144354'::integer, '2026-04-29 05:20:45.289363+00'::timestamptz,
  '[{"r": 12, "cx": 55, "cy": 55}]'::jsonb, NULL, '심장 비대 의증'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e07ead48-dbd2-4149-8c3d-4726fc5d39e7'::uuid, '93130b68-93f4-4e63-9593-e3aeea157b03'::uuid, '2026-04-21'::date, '복부lat.Jpg', 'radiology', 'abdomen', '요추-천추 부위에 척추 가장자리의 골극 및 관절 변화가 관찰되며 최종 평가는 담당 수의사 소견이 필요합니다.',
  't'::boolean, 'nuel-260502-01_93130b68/2026-04-21/1777684997993_0_1ddcae3d.webp', 'image/webp', '95644'::integer, '2026-05-02 01:23:19.268283+00'::timestamptz,
  '[{"r": 6, "cx": 60, "cy": 45}, {"r": 7, "cx": 85, "cy": 45}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'd047c8e8-1ab7-4b5c-a70b-2e80b8f1af8c'::uuid, '93130b68-93f4-4e63-9593-e3aeea157b03'::uuid, '2026-04-21'::date, '복부vd.Jpg', 'radiology', 'abdomen', '복부 방사선 영상에서 명확한 급성 이상 소견은 관찰되지 않으나 수의사의 임상적 평가가 필요합니다.',
  'f'::boolean, 'nuel-260502-01_93130b68/2026-04-21/1777685010152_0_f8795c55.webp', 'image/webp', '96164'::integer, '2026-05-02 01:23:31.451473+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '9d3f1ffd-13e6-425a-a596-6957a64eed3a'::uuid, '93130b68-93f4-4e63-9593-e3aeea157b03'::uuid, '2026-04-21'::date, '치아 오른쪽 어금니.jpg', 'other', NULL, '우측 어금니 주변 잇몸에 국소적 발적과 소량 출혈이 관찰되며 최종 평가는 수의사가 해야 합니다.',
  't'::boolean, 'nuel-260502-01_93130b68/2026-04-21/1777685032373_0_586376f7.webp', 'image/webp', '33898'::integer, '2026-05-02 01:23:53.631356+00'::timestamptz,
  '[{"r": 5, "cx": 48, "cy": 22}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f14ee057-dfa6-497a-9533-9935deb24049'::uuid, '93130b68-93f4-4e63-9593-e3aeea157b03'::uuid, '2026-04-21'::date, '치아 왼쪽 어금니.jpg', 'other', NULL, '왼쪽 어금니 부위에 황색 치석과 잇몸 염증 소견이 관찰되어 치과 검진이 권장됩니다.',
  't'::boolean, 'nuel-260502-01_93130b68/2026-04-21/1777685043781_0_de577059.webp', 'image/webp', '49016'::integer, '2026-05-02 01:24:05.257624+00'::timestamptz,
  '[{"r": 6, "cx": 62, "cy": 42}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '555eb775-4697-43a0-863a-acc007fc393c'::uuid, '93130b68-93f4-4e63-9593-e3aeea157b03'::uuid, '2026-04-21'::date, '치아 정면.jpg', 'other', NULL, '현재 사진에서 명확한 이상 소견은 관찰되지 않으며 최종 평가는 수의사가 수행해야 합니다.',
  'f'::boolean, 'nuel-260502-01_93130b68/2026-04-21/1777685054006_0_d7763a5a.webp', 'image/webp', '24488'::integer, '2026-05-02 01:24:14.761073+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c6b706a6-4027-429c-8d0f-f8a510149f24'::uuid, '93130b68-93f4-4e63-9593-e3aeea157b03'::uuid, '2026-04-21'::date, '치아 측면 송곳니.jpg', 'other', NULL, '상악 송곳니 주변 잇몸에 발적과 염증 소견이 관찰되며 수의사의 추가 검진이 필요합니다.',
  't'::boolean, 'nuel-260502-01_93130b68/2026-04-21/1777685066123_0_0d65e008.webp', 'image/webp', '35602'::integer, '2026-05-02 01:24:27.404598+00'::timestamptz,
  '[{"r": 6, "cx": 48, "cy": 18}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '3a027315-f813-4307-a1ff-cf8d25519d12'::uuid, '93130b68-93f4-4e63-9593-e3aeea157b03'::uuid, '2026-04-21'::date, '흉부lat.Jpg', 'radiology', 'thorax', '흉부 측면 영상에서 등쪽 연부조직에 금속성 이물이 관찰됩니다.',
  't'::boolean, 'nuel-260502-01_93130b68/2026-04-21/1777685079732_0_edb62ae7.webp', 'image/webp', '109248'::integer, '2026-05-02 01:24:40.785399+00'::timestamptz,
  '[{"r": 4, "cx": 58, "cy": 23}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'd9ae69c0-3d63-4901-a7e8-5c67d25429cf'::uuid, '93130b68-93f4-4e63-9593-e3aeea157b03'::uuid, '2026-04-21'::date, '흉부vd.Jpg', 'radiology', 'thorax', '흉부 및 상복부에서 방사선불투과성 이물로 추정되는 소견이 보여 추가 평가가 필요합니다.',
  't'::boolean, 'nuel-260502-01_93130b68/2026-04-21/1777685095402_0_edb1f98f.webp', 'image/webp', '101960'::integer, '2026-05-02 01:24:56.642482+00'::timestamptz,
  '[{"r": 4, "cx": 66, "cy": 24}, {"r": 5, "cx": 60, "cy": 58}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '635b46d4-a463-40b7-902e-169ad350568f'::uuid, '93130b68-93f4-4e63-9593-e3aeea157b03'::uuid, '2026-04-21'::date, 'AD.jpg', 'endoscopy', NULL, '내시경 영상에서 외이도 중심부에 털과 잔여물로 보이는 물질이 관찰됩니다.',
  't'::boolean, 'nuel-260502-01_93130b68/2026-04-21/1777685105957_0_6e96beaf.webp', 'image/webp', '12770'::integer, '2026-05-02 01:25:06.919278+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 50}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'a787f5de-9ed6-40aa-a6e0-321b07c39262'::uuid, '93130b68-93f4-4e63-9593-e3aeea157b03'::uuid, '2026-04-21'::date, 'AS.jpg', 'endoscopy', NULL, '외이도 내 이물(모발 모양)과 주변 점막의 발적 및 분비물이 관찰됩니다.',
  't'::boolean, 'nuel-260502-01_93130b68/2026-04-21/1777685116578_0_a7bf2263.webp', 'image/webp', '15414'::integer, '2026-05-02 01:25:18.090475+00'::timestamptz,
  '[{"r": 4, "cx": 58, "cy": 50}, {"r": 8, "cx": 52, "cy": 38}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '41ca07c4-d40b-4513-b250-9a7e3e74ae4e'::uuid, '93130b68-93f4-4e63-9593-e3aeea157b03'::uuid, '2026-04-21'::date, 'OD.jpg', 'slit_lamp', NULL, '우안 중심부에 회백색의 수정체 혼탁이 보여 시력 저하 가능성이 있습니다.',
  't'::boolean, 'nuel-260502-01_93130b68/2026-04-21/1777685126918_0_d76cec93.webp', 'image/webp', '60748'::integer, '2026-05-02 01:25:27.471637+00'::timestamptz,
  '[{"r": 6, "cx": 50, "cy": 52}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '3d6c6391-8b3f-433e-b484-995b2613a090'::uuid, '93130b68-93f4-4e63-9593-e3aeea157b03'::uuid, '2026-04-21'::date, 'OS.jpg', 'slit_lamp', NULL, '슬릿램프로 촬영한 좌안 전안부 근접 사진입니다.',
  'f'::boolean, 'nuel-260502-01_93130b68/2026-04-21/1777685138424_0_4e4843b1.webp', 'image/webp', '73266'::integer, '2026-05-02 01:25:39.588027+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '0b2efa10-aba1-44e7-ae6c-a5c9a371d1a9'::uuid, '3a6dff31-2ad2-4e3c-8b07-9ad9566de248'::uuid, '2026-04-18'::date, '치아 측면 송곳니.jpg', 'other', NULL, '구강 내측 치아 사진입니다. 최종 평가는 수의사 소견이 필요합니다.',
  'f'::boolean, 'nuel-260422-06_3a6dff31/2026-04-18/1777686228819_0_a6a24676.webp', 'image/webp', '41274'::integer, '2026-05-02 01:43:49.702211+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'd7871889-b9a5-472b-92c2-0de3137bfddc'::uuid, '3a6dff31-2ad2-4e3c-8b07-9ad9566de248'::uuid, '2026-04-18'::date, '치아 우측 어금니.jpg', 'other', NULL, '구강 내부 사진으로 치아 상태 관찰을 위해 촬영된 영상입니다.',
  'f'::boolean, 'nuel-260422-06_3a6dff31/2026-04-18/1777686240120_0_a81497a4.webp', 'image/webp', '34236'::integer, '2026-05-02 01:44:00.742324+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c6ae9827-29b0-4456-9083-5e9e1512fdd7'::uuid, '3a6dff31-2ad2-4e3c-8b07-9ad9566de248'::uuid, '2026-04-18'::date, '치아 정면.jpg', 'other', NULL, '구강 전면 사진이며 치아와 잇몸의 상태는 수의사의 추가 진찰이 필요합니다.',
  'f'::boolean, 'nuel-260422-06_3a6dff31/2026-04-18/1777686250500_0_f8505329.webp', 'image/webp', '23346'::integer, '2026-05-02 01:44:11.465878+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'a2b2d6b7-5e0d-4520-860e-9678fa1c83af'::uuid, '3a6dff31-2ad2-4e3c-8b07-9ad9566de248'::uuid, '2026-04-18'::date, '귀 AS.jpg', 'endoscopy', NULL, '외이도 내 귀지와 이물질(잔여물)이 관찰됩니다.',
  'f'::boolean, 'nuel-260422-06_3a6dff31/2026-04-18/1777686260209_0_e9301c23.webp', 'image/webp', '39256'::integer, '2026-05-02 01:44:20.745868+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c145fa9e-4fe6-4b55-aefb-5ca7e9f3a597'::uuid, '3a6dff31-2ad2-4e3c-8b07-9ad9566de248'::uuid, '2026-04-18'::date, '귀 AD.jpg', 'endoscopy', NULL, '귀 내부를 촬영한 내시경 사진이며 목록의 특정 질환과 관련 소견은 확인되지 않습니다.',
  'f'::boolean, 'nuel-260422-06_3a6dff31/2026-04-18/1777686269702_0_9b732c7d.webp', 'image/webp', '22306'::integer, '2026-05-02 01:44:31.135949+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '9d498267-28c8-4801-be08-21f6a567eb73'::uuid, '3a6dff31-2ad2-4e3c-8b07-9ad9566de248'::uuid, '2026-04-18'::date, '치아 좌측 어금니.jpg', 'other', NULL, '구강 내 왼쪽 어금니 부위를 촬영한 구강 사진입니다.',
  'f'::boolean, 'nuel-260422-06_3a6dff31/2026-04-18/1777686287293_0_be970730.webp', 'image/webp', '107866'::integer, '2026-05-02 01:44:49.611194+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'bf580e40-d0d3-4167-904a-16e969b5bb7f'::uuid, '3a6dff31-2ad2-4e3c-8b07-9ad9566de248'::uuid, '2026-04-18'::date, '흉부 LAT.Jpg', 'radiology', 'thorax', '흉부 측면 방사선 사진으로 폐와 심장의 기본 구조를 확인하기 위한 영상입니다.',
  'f'::boolean, 'nuel-260422-06_3a6dff31/2026-04-18/1777686308487_0_19dc5519.webp', 'image/webp', '133282'::integer, '2026-05-02 01:45:10.205721+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'cf385fe3-7404-460d-865d-86c1d1567466'::uuid, '3a6dff31-2ad2-4e3c-8b07-9ad9566de248'::uuid, '2026-04-18'::date, '복부 LAT.Jpg', 'radiology', 'abdomen', '흉요추부에 명확한 퇴행성 골증식(척추증) 소견이 관찰되어 퇴행성 관절 질환의 가능성이 있습니다.',
  't'::boolean, 'nuel-260422-06_3a6dff31/2026-04-18/1777686326253_0_d8604e51.webp', 'image/webp', '108358'::integer, '2026-05-02 01:45:27.447323+00'::timestamptz,
  '[{"r": 8, "cx": 44, "cy": 35}, {"r": 10, "cx": 62, "cy": 36}]'::jsonb, 'clear', '퇴행성 관절 질환 및 슬개골 탈구'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'b0eba086-c7df-4fb0-a8cc-0e16c834c75f'::uuid, '3a6dff31-2ad2-4e3c-8b07-9ad9566de248'::uuid, '2026-04-18'::date, '복부 VD.Jpg', 'radiology', 'abdomen', '복부 VD 방사선 사진으로 복부 장기 위치와 가스 패턴을 평가할 수 있습니다.',
  'f'::boolean, 'nuel-260422-06_3a6dff31/2026-04-18/1777686338599_0_78e04630.webp', 'image/webp', '104314'::integer, '2026-05-02 01:45:40.395166+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '9f11f37c-47b5-4f26-b71b-7d28341e8740'::uuid, '3a6dff31-2ad2-4e3c-8b07-9ad9566de248'::uuid, '2026-04-18'::date, '흉부 VD.Jpg', 'radiology', 'thorax', 'VD 흉부 방사선 영상으로 심장과 폐의 윤곽을 확인하였으며, 명확한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260422-06_3a6dff31/2026-04-18/1777686351304_0_5bca2b4e.webp', 'image/webp', '117954'::integer, '2026-05-02 01:45:52.735233+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'dc4897d4-1d0f-44ee-8084-48f30736ffdf'::uuid, '3a6dff31-2ad2-4e3c-8b07-9ad9566de248'::uuid, '2026-04-18'::date, '근골격 VD.Jpg', 'radiology', 'joint', '골반 및 고관절에 퇴행성 변화가 관찰되어 퇴행성 관절 질환이 의심됩니다.',
  't'::boolean, 'nuel-260422-06_3a6dff31/2026-04-18/1777686370490_0_0d859d0d.webp', 'image/webp', '86124'::integer, '2026-05-02 01:46:11.487824+00'::timestamptz,
  '[{"r": 8, "cx": 35, "cy": 24}, {"r": 8, "cx": 65, "cy": 24}]'::jsonb, 'clear', '퇴행성 관절 질환 및 슬개골 탈구'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'fab370d4-7ebd-4e1a-bd45-2f5ce841b7a0'::uuid, '3a6dff31-2ad2-4e3c-8b07-9ad9566de248'::uuid, '2026-04-18'::date, '근골격 R.Jpg', 'radiology', 'joint', '우측 하지를 촬영한 측면 방사선 사진으로 명백한 골절이나 확실한 관절병변은 관찰되지 않아 수의사의 추가 판독이 필요합니다.',
  'f'::boolean, 'nuel-260422-06_3a6dff31/2026-04-18/1777686383393_0_ccfbdc11.webp', 'image/webp', '103696'::integer, '2026-05-02 01:46:24.594892+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '2aefe96f-3bd3-4299-b7c8-ee9a4515b67c'::uuid, '3a6dff31-2ad2-4e3c-8b07-9ad9566de248'::uuid, '2026-04-18'::date, '근골굑 L.Jpg', 'radiology', 'joint', '후지 관절에 퇴행성 변화 소견이 보이며 슬개골 탈구 가능성이 있어 수의사의 추가 평가가 필요합니다.',
  't'::boolean, 'nuel-260422-06_3a6dff31/2026-04-18/1777686404203_0_81080b5e.webp', 'image/webp', '109898'::integer, '2026-05-02 01:46:45.466805+00'::timestamptz,
  '[{"r": 8, "cx": 65, "cy": 30}, {"r": 8, "cx": 65, "cy": 68}]'::jsonb, NULL, '퇴행성 관절 질환 및 슬개골 탈구'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '0b0b0cee-2d5b-4bf3-9f75-c12ac7bc76e4'::uuid, '3a6dff31-2ad2-4e3c-8b07-9ad9566de248'::uuid, '2026-04-18'::date, '두부 DV.Jpg', 'radiology', 'dental', '두부 DV 방사선 사진으로 치아 및 두개골 평가용 영상입니다.',
  'f'::boolean, 'nuel-260422-06_3a6dff31/2026-04-18/1777686414585_0_c3e48a72.webp', 'image/webp', '51974'::integer, '2026-05-02 01:46:55.520929+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '056a0313-891c-4448-91fe-48aea78911ff'::uuid, '3a6dff31-2ad2-4e3c-8b07-9ad9566de248'::uuid, '2026-04-18'::date, '두부 LAT.Jpg', 'radiology', 'dental', '두부 측면 방사선 사진으로 두개골과 치아의 배열 및 골격 구조를 확인할 수 있습니다.',
  'f'::boolean, 'nuel-260422-06_3a6dff31/2026-04-18/1777686426620_0_0f76cbea.webp', 'image/webp', '68426'::integer, '2026-05-02 01:47:08.330353+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f47639e2-7d3e-4d82-a223-2519add3f880'::uuid, '3a6dff31-2ad2-4e3c-8b07-9ad9566de248'::uuid, '2026-04-18'::date, '눈 OS.jpg', 'slit_lamp', NULL, '슬릿램프(안과) 사진으로 전안부가 촬영된 영상이며 최종 판단은 수의사가 합니다.',
  'f'::boolean, 'nuel-260422-06_3a6dff31/2026-04-18/1777686461505_0_7466f56d.webp', 'image/webp', '91196'::integer, '2026-05-02 01:47:42.197578+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '514065ae-a628-4541-a098-345d1813fa7e'::uuid, '3a6dff31-2ad2-4e3c-8b07-9ad9566de248'::uuid, '2026-04-18'::date, '눈OD.jpg', 'slit_lamp', NULL, '우안 슬릿램프 검사 사진으로 전안부 관찰용 영상입니다.',
  'f'::boolean, 'nuel-260422-06_3a6dff31/2026-04-18/1777686471597_0_8a58b564.webp', 'image/webp', '61758'::integer, '2026-05-02 01:47:52.737603+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'eca7fab5-0e5f-43bd-b6ba-d582c0057b96'::uuid, '3a6dff31-2ad2-4e3c-8b07-9ad9566de248'::uuid, '2026-04-18'::date, '요검사.jpg', 'microscopy', NULL, '요검사(소변검사) 결과표입니다.',
  'f'::boolean, 'nuel-260422-06_3a6dff31/2026-04-18/1777688062795_0_3f35b35e.webp', 'image/webp', '32494'::integer, '2026-05-02 02:14:24.070701+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '19dd605b-14df-444d-a375-711b6ddadd34'::uuid, '3a6dff31-2ad2-4e3c-8b07-9ad9566de248'::uuid, '2026-04-18'::date, '종양표지자 검사.jpg', 'other', NULL, '종양표지자 검사에서 암 가능성 지표가 상승하여 신생물 가능성을 배제할 수 없어 추가 정밀 검사가 필요합니다.',
  't'::boolean, 'nuel-260422-06_3a6dff31/2026-04-18/1777688075495_0_9fca76b9.webp', 'image/webp', '18516'::integer, '2026-05-02 02:14:36.624094+00'::timestamptz,
  NULL::jsonb, NULL, '다발성 종괴'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'ffcb40a3-8bf8-4d9a-9025-25870dc5c25b'::uuid, '866623d4-2049-4bc3-a81d-1f5d248a9f69'::uuid, '2026-04-25'::date, '귀 AS.jpg', 'endoscopy', NULL, '외이도 내에 귀지와 털로 보이는 이물이 다수 관찰됩니다.',
  't'::boolean, 'nuel-260427-01_866623d4/2026-04-25/1777693016330_0_faf08d3b.webp', 'image/webp', '19370'::integer, '2026-05-02 03:36:57.984936+00'::timestamptz,
  '[{"r": 10, "cx": 50, "cy": 52}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e5415dc9-3e2f-4760-b789-24e4e050c0a0'::uuid, '866623d4-2049-4bc3-a81d-1f5d248a9f69'::uuid, '2026-04-25'::date, '근골격 L.Jpg', 'radiology', 'joint', '좌측 전지(앞다리) 방사선에서 명확한 골절이나 탈구는 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260427-01_866623d4/2026-04-25/1777693025532_0_f2670c14.webp', 'image/webp', '49636'::integer, '2026-05-02 03:37:06.077696+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '7a50f7bd-22bb-4b05-bf08-12bfdaba335c'::uuid, '866623d4-2049-4bc3-a81d-1f5d248a9f69'::uuid, '2026-04-25'::date, '근골격 R.Jpg', 'radiology', 'joint', '우측 앞다리 측면 방사선에서 명확한 골절 또는 탈구는 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260427-01_866623d4/2026-04-25/1777693035463_0_10697c4d.webp', 'image/webp', '49078'::integer, '2026-05-02 03:37:16.418932+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '57c218b7-324d-42de-8def-011ef243c5bd'::uuid, '866623d4-2049-4bc3-a81d-1f5d248a9f69'::uuid, '2026-04-25'::date, '근골격 VD.Jpg', 'radiology', 'joint', '골반 및 양측 고관절에서 관절면 덮개 감소와 약간의 아탈구가 의심되어 정밀 평가가 필요합니다.',
  't'::boolean, 'nuel-260427-01_866623d4/2026-04-25/1777693046644_0_e20bf3ef.webp', 'image/webp', '70642'::integer, '2026-05-02 03:37:27.881493+00'::timestamptz,
  '[{"r": 6, "cx": 35, "cy": 30}, {"r": 6, "cx": 65, "cy": 30}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '5cab1323-9651-4f81-acfd-13279e1b7734'::uuid, '866623d4-2049-4bc3-a81d-1f5d248a9f69'::uuid, '2026-04-25'::date, '눈 OD.jpg', 'slit_lamp', NULL, '우안에서 중심부 렌즈/각막 혼탁이 관찰되어 정밀 안과 평가가 권장됩니다.',
  't'::boolean, 'nuel-260427-01_866623d4/2026-04-25/1777693057807_0_d7968223.webp', 'image/webp', '42130'::integer, '2026-05-02 03:37:38.942044+00'::timestamptz,
  '[{"r": 6, "cx": 48, "cy": 53}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e4bb8a6a-cbdc-45b8-aab5-54a78bbe7ed4'::uuid, '866623d4-2049-4bc3-a81d-1f5d248a9f69'::uuid, '2026-04-25'::date, '눈 OS.jpg', 'slit_lamp', NULL, '좌안 전안부 사진에서 명확한 병변은 확인되지 않아 정밀 검사는 수의사의 추가 평가가 필요합니다.',
  'f'::boolean, 'nuel-260427-01_866623d4/2026-04-25/1777693066745_0_0516153f.webp', 'image/webp', '76766'::integer, '2026-05-02 03:37:48.348856+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8a378fdc-144a-41f3-96b4-48b85378aac4'::uuid, '866623d4-2049-4bc3-a81d-1f5d248a9f69'::uuid, '2026-04-25'::date, '복부 LAT.Jpg', 'radiology', 'abdomen', '복부 측면 방사선에서 명확한 급성 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260427-01_866623d4/2026-04-25/1777693079938_0_1bdd759b.webp', 'image/webp', '99092'::integer, '2026-05-02 03:38:01.094152+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '47c488a2-0598-450a-9958-49ccf0f1bede'::uuid, '866623d4-2049-4bc3-a81d-1f5d248a9f69'::uuid, '2026-04-25'::date, '복부VD.Jpg', 'radiology', 'abdomen', '복부 방사선에서 위·장관에 가스와 불균질한 내용물이 많이 분포되어 있는 소견이 보이며 수의사의 추가 평가가 필요합니다.',
  't'::boolean, 'nuel-260427-01_866623d4/2026-04-25/1777693094686_0_61f11a9f.webp', 'image/webp', '87928'::integer, '2026-05-02 03:38:15.684028+00'::timestamptz,
  '[{"r": 10, "cx": 58, "cy": 30}, {"r": 12, "cx": 50, "cy": 48}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f00fca0c-24a6-44c9-b89f-59847d919c05'::uuid, '866623d4-2049-4bc3-a81d-1f5d248a9f69'::uuid, '2026-04-25'::date, '치아 우측 어금니.jpg', 'other', NULL, '오른쪽 어금니 부위에 잇몸 발적과 치아 표면의 변색이 보여 추가 평가가 필요합니다.',
  't'::boolean, 'nuel-260427-01_866623d4/2026-04-25/1777693104773_0_04042921.webp', 'image/webp', '23988'::integer, '2026-05-02 03:38:25.710743+00'::timestamptz,
  '[{"r": 5, "cx": 57, "cy": 64}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '530c93ec-f6d4-4feb-967d-48e9db0c70e9'::uuid, '866623d4-2049-4bc3-a81d-1f5d248a9f69'::uuid, '2026-04-25'::date, '치아 정면.jpg', 'other', NULL, '구강 사진에서 치아와 잇몸이 관찰되며 눈에 띄는 이상 소견은 보이지 않습니다.',
  'f'::boolean, 'nuel-260427-01_866623d4/2026-04-25/1777693113355_0_44b14712.webp', 'image/webp', '31098'::integer, '2026-05-02 03:38:34.045194+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '680d9811-5aa8-4e45-8b48-58e6f6e57802'::uuid, '866623d4-2049-4bc3-a81d-1f5d248a9f69'::uuid, '2026-04-25'::date, '치아 좌측 어금니.jpg', 'other', NULL, '좌측 어금니의 육안검사에서 특별히 눈에 띄는 이상은 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260427-01_866623d4/2026-04-25/1777693121514_0_3a2158fe.webp', 'image/webp', '34944'::integer, '2026-05-02 03:38:42.675813+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '16d91e89-6e6c-4cb6-aeee-03108c4ee012'::uuid, '866623d4-2049-4bc3-a81d-1f5d248a9f69'::uuid, '2026-04-25'::date, '치아 측면 송곳니.jpg', 'other', NULL, '송곳니 부위 잇몸에 경미한 발적과 치태가 보여 치주 검사 및 스케일링 검토가 권장됩니다.',
  't'::boolean, 'nuel-260427-01_866623d4/2026-04-25/1777693131251_0_e44a3d90.webp', 'image/webp', '27608'::integer, '2026-05-02 03:38:52.86357+00'::timestamptz,
  '[{"r": 6, "cx": 62, "cy": 28}, {"r": 4, "cx": 46, "cy": 34}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'cdfc3569-ca87-4efd-b6e8-a76de6ae094e'::uuid, '866623d4-2049-4bc3-a81d-1f5d248a9f69'::uuid, '2026-04-25'::date, '흉부 LAT.Jpg', 'radiology', 'thorax', '흉부 측면 방사선에서 명확한 급성 이상 소견은 관찰되지 않으나 최종 판단은 수의사가 합니다.',
  'f'::boolean, 'nuel-260427-01_866623d4/2026-04-25/1777693141687_0_e9148cb1.webp', 'image/webp', '111736'::integer, '2026-05-02 03:39:02.896914+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '039f5c95-735a-419d-b47e-9a70215882ff'::uuid, '866623d4-2049-4bc3-a81d-1f5d248a9f69'::uuid, '2026-04-25'::date, '흉부VD.Jpg', 'radiology', 'thorax', '흉부 VD 방사선에서 명확한 폐 또는 심장에 대한 이상 소견은 확인되지 않습니다.',
  'f'::boolean, 'nuel-260427-01_866623d4/2026-04-25/1777693150925_0_3a0a6634.webp', 'image/webp', '95072'::integer, '2026-05-02 03:39:12.100457+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '40495605-b372-4509-b1d6-d696ee6cc1b8'::uuid, '866623d4-2049-4bc3-a81d-1f5d248a9f69'::uuid, '2026-04-25'::date, '귀 AD.jpg', 'endoscopy', NULL, '이미지가 흐리고 조명 번짐이 있어 귀 내부의 명확한 이상 소견 확인이 어렵습니다.',
  'f'::boolean, 'nuel-260427-01_866623d4/2026-04-25/1777693158737_0_13fac9b3.webp', 'image/webp', '8500'::integer, '2026-05-02 03:39:19.168346+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '2752fc07-90c4-435e-a4e7-b1cb7e84229a'::uuid, '9ee98309-dde9-4f96-967f-b7a40f7336de'::uuid, '2026-04-20'::date, '귀 AD.jpg', 'endoscopy', NULL, '귀 내시경(이경) 사진으로 외이도·고막 상태 관찰용 이미지이며 목록에 해당하는 명확한 질환 소견은 보이지 않습니다.',
  'f'::boolean, 'nuel-260422-03_9ee98309/2026-04-20/1777703945041_0_34a0750f.webp', 'image/webp', '11628'::integer, '2026-05-02 06:39:05.49884+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '4a5e3edb-6b0c-4e2f-a4b9-97b95d3e0499'::uuid, '9ee98309-dde9-4f96-967f-b7a40f7336de'::uuid, '2026-04-20'::date, '귀AS.jpg', 'endoscopy', NULL, '외이도 내시경 사진입니다. 현재 이미지에서 명확한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260422-03_9ee98309/2026-04-20/1777703954243_0_3b2dce59.webp', 'image/webp', '19206'::integer, '2026-05-02 06:39:14.778023+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'bd3d5ee1-bdcc-4e79-8180-6caae5051769'::uuid, '9ee98309-dde9-4f96-967f-b7a40f7336de'::uuid, '2026-04-20'::date, '근골격 L.Jpg', 'radiology', 'joint', '왼쪽 앞다리(관절 포함) 방사선 사진으로, AI 평가 목록과 관련된 명확한 이상 소견은 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260422-03_9ee98309/2026-04-20/1777703964484_0_220169e4.webp', 'image/webp', '58220'::integer, '2026-05-02 06:39:25.66111+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '8e75208d-3861-4864-ae73-8a5f363bbaac'::uuid, '9ee98309-dde9-4f96-967f-b7a40f7336de'::uuid, '2026-04-20'::date, '근골격 R.Jpg', 'radiology', 'joint', '우측 앞다리 관절의 방사선 사진이며, 특이 소견은 관찰되지 않습니다.',
  'f'::boolean, 'nuel-260422-03_9ee98309/2026-04-20/1777703975321_0_95bc24c2.webp', 'image/webp', '63352'::integer, '2026-05-02 06:39:35.820579+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '6d96dce8-ab83-4300-b160-8fd13d2ceee9'::uuid, '9ee98309-dde9-4f96-967f-b7a40f7336de'::uuid, '2026-04-20'::date, '근골격 VD.Jpg', 'radiology', 'joint', '골반과 후지의 VD 방사선 사진으로 해부학적 평가용 영상입니다.',
  'f'::boolean, 'nuel-260422-03_9ee98309/2026-04-20/1777703986845_0_538837a9.webp', 'image/webp', '84496'::integer, '2026-05-02 06:39:47.53863+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'bb7ef38b-e155-4ff7-8d07-9fddbefb673a'::uuid, '9ee98309-dde9-4f96-967f-b7a40f7336de'::uuid, '2026-04-20'::date, '눈 OD.jpg', 'slit_lamp', NULL, '슬릿램프(안과) 사진으로 우안(OD)의 전안부를 촬영한 영상입니다.',
  'f'::boolean, 'nuel-260422-03_9ee98309/2026-04-20/1777703999107_0_1d8e2233.webp', 'image/webp', '80782'::integer, '2026-05-02 06:40:00.17734+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '9dea89b1-bcba-4cc2-9fde-85683545cc54'::uuid, '9ee98309-dde9-4f96-967f-b7a40f7336de'::uuid, '2026-04-20'::date, '눈 OS.jpg', 'slit_lamp', NULL, '슬릿램프 검사 사진으로 전안부 관찰용 이미지입니다.',
  'f'::boolean, 'nuel-260422-03_9ee98309/2026-04-20/1777704009098_0_032f63c1.webp', 'image/webp', '87614'::integer, '2026-05-02 06:40:09.770397+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '46a684c3-0038-49c3-af1b-d4a4ca252da3'::uuid, '9ee98309-dde9-4f96-967f-b7a40f7336de'::uuid, '2026-04-20'::date, '복부 LAT.Jpg', 'radiology', 'abdomen', '복부 측면 방사선 검사로 복강 장기와 골격 윤곽을 확인할 수 있습니다.',
  'f'::boolean, 'nuel-260422-03_9ee98309/2026-04-20/1777704018674_0_b29e8278.webp', 'image/webp', '108912'::integer, '2026-05-02 06:40:19.891689+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '9030cad0-7113-4daf-b61e-db8acad14f4a'::uuid, '9ee98309-dde9-4f96-967f-b7a40f7336de'::uuid, '2026-04-20'::date, '복부 VD.Jpg', 'radiology', 'abdomen', '복부 VD 방사선 사진으로 복부 장기와 골격 평가를 위한 영상입니다.',
  'f'::boolean, 'nuel-260422-03_9ee98309/2026-04-20/1777704031609_0_8f04f023.webp', 'image/webp', '100880'::integer, '2026-05-02 06:40:32.499256+00'::timestamptz,
  NULL::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '956ae7ad-aa3f-43f9-a11c-685564d2615f'::uuid, '9ee98309-dde9-4f96-967f-b7a40f7336de'::uuid, '2026-04-20'::date, '요검사.jpg', 'other', NULL, '소변 검사에서 스트루바이트 결정이 관찰되어 요결정뇨(스트루바이트 등)가 의심됩니다.',
  't'::boolean, 'nuel-260422-03_9ee98309/2026-04-20/1777704060930_0_08cb3923.webp', 'image/webp', '28278'::integer, '2026-05-02 06:41:01.391354+00'::timestamptz,
  '[{"r": 8, "cx": 50, "cy": 88}]'::jsonb, 'clear', '요결정뇨 (스트루바이트, 칼슘 옥살레이트)'
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '302de113-3742-4c5b-a3ed-91780b21ac18'::uuid, '37f66a77-7742-40b3-a82a-233237b7475a'::uuid, '2026-04-22'::date, '귀 AS.jpg', 'endoscopy', NULL, '외이도에 다량의 털과 이물질이 관찰되어 귀 청소 및 수의사 진찰이 권장됩니다.',
  't'::boolean, 'nuel-260502-02_37f66a77/2026-04-22/1777709895696_0_f39f2666.webp', 'image/webp', '33264'::integer, '2026-05-02 08:18:16.748265+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 52}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'ac985e31-5201-4f9e-a5b3-92b2920db884'::uuid, '37f66a77-7742-40b3-a82a-233237b7475a'::uuid, '2026-04-22'::date, '귀AD.jpg', 'endoscopy', NULL, '외이도 내부에 털과 이물성 분비물이 관찰되어 추가 검진이 권장됩니다.',
  't'::boolean, 'nuel-260502-02_37f66a77/2026-04-22/1777709907975_0_305eeedd.webp', 'image/webp', '27868'::integer, '2026-05-02 08:18:29.084625+00'::timestamptz,
  '[{"r": 12, "cx": 50, "cy": 50}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'c15eb702-7a9d-4f27-be21-ea3612129035'::uuid, '37f66a77-7742-40b3-a82a-233237b7475a'::uuid, '2026-04-22'::date, '근골격 L.Jpg', 'radiology', 'joint', '좌측 팔꿈치 부위에 금속 고정물(핀/와이어)이 관찰되며 주변 골질 변화가 의심됩니다.',
  't'::boolean, 'nuel-260502-02_37f66a77/2026-04-22/1777709922615_0_773e9010.webp', 'image/webp', '108030'::integer, '2026-05-02 08:18:43.821078+00'::timestamptz,
  '[{"r": 5, "cx": 62, "cy": 74}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'fc1f7bf1-5fbb-4ffe-b5bc-5df1e17d7334'::uuid, '37f66a77-7742-40b3-a82a-233237b7475a'::uuid, '2026-04-22'::date, '근골격 R.Jpg', 'radiology', 'joint', '우측 후지 근위 경골에 핀과 와이어 형태의 정형외과적 고정물이 관찰되며 추가 평가는 수의사가 결정합니다.',
  't'::boolean, 'nuel-260502-02_37f66a77/2026-04-22/1777709938922_0_86735c45.webp', 'image/webp', '104776'::integer, '2026-05-02 08:18:59.905255+00'::timestamptz,
  '[{"r": 6, "cx": 55, "cy": 74}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'f2c1423f-ac27-47af-8aaf-aa4a741d702c'::uuid, '37f66a77-7742-40b3-a82a-233237b7475a'::uuid, '2026-04-22'::date, '근골격 VD.Jpg', 'radiology', 'joint', '양측 슬관절 부위에 수술용 금속물질(와이어/봉합사)이 관찰되며 고관절에서는 약간의 관절면 불일치가 의심됩니다.',
  't'::boolean, 'nuel-260502-02_37f66a77/2026-04-22/1777709960114_0_f4f4d238.webp', 'image/webp', '89018'::integer, '2026-05-02 08:19:21.241699+00'::timestamptz,
  '[{"r": 4, "cx": 35, "cy": 66}, {"r": 4, "cx": 65, "cy": 66}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'ca82e167-8759-43ad-8751-1c7b5c3c1721'::uuid, '37f66a77-7742-40b3-a82a-233237b7475a'::uuid, '2026-04-22'::date, '눈 OD.jpg', 'slit_lamp', NULL, '각막 하부에 작은 불투명 소견이 보여 추가적인 세극등 검사 및 염색 검사가 권장됩니다.',
  't'::boolean, 'nuel-260502-02_37f66a77/2026-04-22/1777709970867_0_0dbd8340.webp', 'image/webp', '82778'::integer, '2026-05-02 08:19:32.45985+00'::timestamptz,
  '[{"r": 4, "cx": 45, "cy": 57}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '3fc1321d-8bbf-4c3a-b3c2-ca8df302175f'::uuid, '37f66a77-7742-40b3-a82a-233237b7475a'::uuid, '2026-04-22'::date, '눈 OS.jpg', 'slit_lamp', NULL, '동공 중앙에 혼탁이 보여 추가 검사와 수의사 확인이 필요합니다.',
  't'::boolean, 'nuel-260502-02_37f66a77/2026-04-22/1777709985555_0_aa5a4a53.webp', 'image/webp', '46866'::integer, '2026-05-02 08:19:46.039505+00'::timestamptz,
  '[{"r": 6, "cx": 40, "cy": 50}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '30dece7d-8d03-4826-a4fe-ec8f7fc64a1c'::uuid, '37f66a77-7742-40b3-a82a-233237b7475a'::uuid, '2026-04-22'::date, '복부 LAT.Jpg', 'radiology', 'abdomen', '요추 부위에 경미한 퇴행성 골성 변화가 관찰되며 수의사의 추가 평가가 필요합니다.',
  't'::boolean, 'nuel-260502-02_37f66a77/2026-04-22/1777709999250_0_a6e95c55.webp', 'image/webp', '107378'::integer, '2026-05-02 08:19:59.946346+00'::timestamptz,
  '[{"r": 5, "cx": 70, "cy": 46}, {"r": 5, "cx": 86, "cy": 34}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '6fe9bc43-1f14-4094-902c-c0b982f03d19'::uuid, '37f66a77-7742-40b3-a82a-233237b7475a'::uuid, '2026-04-22'::date, '복부 VD.Jpg', 'radiology', 'abdomen', '우상복부에 불규칙한 혼탁/고밀도 영역과 가스가 혼재된 소견이 보여 위장 내 이물 또는 내용물 축적의 가능성이 있습니다.',
  't'::boolean, 'nuel-260502-02_37f66a77/2026-04-22/1777710014197_0_ce216abc.webp', 'image/webp', '99074'::integer, '2026-05-02 08:20:15.930249+00'::timestamptz,
  '[{"r": 6, "cx": 68, "cy": 24}]'::jsonb, NULL, NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '9a73e35d-6293-4a90-ab24-11f20266e5e9'::uuid, '37f66a77-7742-40b3-a82a-233237b7475a'::uuid, '2026-04-22'::date, '치아 우측 어금니.jpg', 'other', NULL, '우측 어금니에 치석 침착과 잇몸의 염증 소견이 보입니다.',
  't'::boolean, 'nuel-260502-02_37f66a77/2026-04-22/1777710026293_0_c4187629.webp', 'image/webp', '21758'::integer, '2026-05-02 08:20:27.222284+00'::timestamptz,
  '[{"r": 8, "cx": 48, "cy": 40}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'd747b9d0-85b3-418e-92df-2d6524b9b368'::uuid, '37f66a77-7742-40b3-a82a-233237b7475a'::uuid, '2026-04-22'::date, '치아 정면.jpg', 'other', NULL, '앞니가 겹치고 맞물림이 어긋나 치과적 확인이 필요합니다.',
  't'::boolean, 'nuel-260502-02_37f66a77/2026-04-22/1777710037860_0_fb33f943.webp', 'image/webp', '26242'::integer, '2026-05-02 08:20:38.371336+00'::timestamptz,
  '[{"r": 6, "cx": 50, "cy": 30}, {"r": 7, "cx": 50, "cy": 65}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'ced5746b-71f3-4a78-85d3-964ae2fc14c1'::uuid, '37f66a77-7742-40b3-a82a-233237b7475a'::uuid, '2026-04-22'::date, '치아 좌측 어금니.jpg', 'other', NULL, '왼쪽 어금니에 치석과 경미한 치은 염증 소견이 관찰되어 추가 치과 평가가 권장됩니다.',
  't'::boolean, 'nuel-260502-02_37f66a77/2026-04-22/1777710050095_0_28fe93af.webp', 'image/webp', '28444'::integer, '2026-05-02 08:20:50.609997+00'::timestamptz,
  '[{"r": 6, "cx": 46, "cy": 25}, {"r": 8, "cx": 45, "cy": 60}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  '907d66dd-ee80-4522-8bb8-7fdf79f2ff1e'::uuid, '37f66a77-7742-40b3-a82a-233237b7475a'::uuid, '2026-04-22'::date, '치아 측면 송곳니.jpg', 'other', NULL, '송곳니와 주변 잇몸에 발적과 부종이 보여 국소 염증(치주 질환 가능성)이 의심되며, 최종 평가는 수의사가 합니다.',
  't'::boolean, 'nuel-260502-02_37f66a77/2026-04-22/1777710063406_0_63d5306f.webp', 'image/webp', '25360'::integer, '2026-05-02 08:21:04.352652+00'::timestamptz,
  '[{"r": 8, "cx": 65, "cy": 35}, {"r": 6, "cx": 45, "cy": 35}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'e434919c-3800-47ed-acab-065f4e0b5f79'::uuid, '37f66a77-7742-40b3-a82a-233237b7475a'::uuid, '2026-04-22'::date, '흉부 LAT.Jpg', 'radiology', 'thorax', '경부 배부에 작은 방사선 불투명 이물(금속성)이 관찰됩니다.',
  't'::boolean, 'nuel-260502-02_37f66a77/2026-04-22/1777710074195_0_dbfb2db5.webp', 'image/webp', '115674'::integer, '2026-05-02 08:21:15.400582+00'::timestamptz,
  '[{"r": 3, "cx": 58, "cy": 22}]'::jsonb, 'clear', NULL
);

insert into staging.report_case_images (
  id, parse_run_id, exam_date, file_name, exam_type, radiology_sub, brief_comment,
  has_notable_finding, storage_path, mime_type, byte_size, created_at,
  finding_spots, finding_confidence, related_assessment_condition
) values (
  'a8e7ac63-9453-48c3-ab55-b9c5a3efe236'::uuid, '37f66a77-7742-40b3-a82a-233237b7475a'::uuid, '2026-04-22'::date, '흉부 VD.Jpg', 'radiology', 'thorax', '우측 상부 흉부에 작은 금속성 이물 소견이 관찰되어 추가 평가가 필요합니다.',
  't'::boolean, 'nuel-260502-02_37f66a77/2026-04-22/1777710087848_0_1e1b1de3.webp', 'image/webp', '118788'::integer, '2026-05-02 08:21:29.236199+00'::timestamptz,
  '[{"r": 4, "cx": 62, "cy": 18}]'::jsonb, 'clear', NULL
);
