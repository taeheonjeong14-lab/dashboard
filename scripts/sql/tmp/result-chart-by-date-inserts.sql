insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '9ecb1646-8a9f-4899-8a49-f80e1887d879'::uuid, '33d65cc1-ce7f-4082-b247-7a056bf20a77'::uuid, '2026-02-02 10:34:27', 'Subject
CC : 건강검진(종합)
변식활뇨 양호
지방종이 많이 생기고 커졌음.
담낭슬러지
치아가 많이 안좋아짐.
기침을 많이 함.
사료 : 동결건조사료
간식 : 잘 안먹음.
MED: 간영양제, 유산균
0)
MMC pink, CRT < 1.5s
심폐청진 양호
맥박수 172
혈압 208/141 (163)180
치아 : 치석 중등도
검이경 : 이도 발적, 부종
X-ray : 기관직경 차이 30%
혈구검사 : 양호
혈청검사 : ALKP 경미한 상승
초음파 : 담낭슬러지
A)
경미한 기관허탈 확인됩니다. 아직은 치료가 필요하지 않습니다.
고혈압에 대해 혈압약 복용 추천드립니다.
담낭슬러지와 ALKP 경미한 상승 - 간보호제 복용 유지
외이염이 있어 귀물약 처방드렸습니다.
Object
Result
Part
Title
Sign
남기웅
20260202_110104430_04
20260202_110104430_03
20260202_110104430_02
20260202_110104430_01
KakaoTalk_20260202_110104430
IntoCNS_000002
IntoCNS_000001', '', 'f'::boolean, '0'::integer, '2026-03-29 07:38:44.703522+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '0a1e7099-129b-44bb-92e1-b156b1a10262'::uuid, '69d29be2-0be7-424b-b59b-5226a6010b9d'::uuid, '2025-05-17 13:07:10', 'Subject
CC : 건강검진
귀 앞에 종괴를 발견한지 3~4일되었음.
변식활뇨 양호
병력 없음.
0)
MMC pink, CRT < 1.5s
청진 양호
치아 : 치석 다량, 어금니 치은 퇴축, 송곳니 치은 부종과 송곳니 밀려나옴.
오른쪽 귀 앞쪽 종괴 : 검은색, 지름 1cm미만
안검사 : 안압 15/16, 눈물량 20/18, 검안검사 이상없음
X-ray : 양호
CBC : 양호
CHEMI : 양호
A)
치주염, 피부종괴
피부종괴는 양상이 좋지 않아서 수술 후 조직검사.
Object
Result
Part
Title
Sign
IMG_20250517_133614
남기웅
IMG_20250517_133353
IMG_20250517_133344
IMG_20250517_133339
IMG_20250517_133332
IMG_20250517_133327
IntoCNS_000002
IntoCNS_000001
KakaoTalk_20250517_133317045', '20250517_133317045_01
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00158 검사-혈액-CBC(혈구검사)
1
회
0
0
남기웅
LC-002 검사-혈액(혈청)-Chemistry(술전검사)
1
회
0
0
남기웅
TREATTX-0000-00659 검사-X-ray(흉복부4cut, 10kg 이하)
1
회
0
0
남기웅
EK-005 검사-혈압모니터링(BP)
1
회
0
0
남기웅
TREATTX-0006-00001 검사-검이경검사(otoscope)
1
회
0
0
남기웅
LA-007 검사-안과-눈물분비량검사(STT)
1
회
0
0
남기웅
LA-015 검사-안과-안압검사(IOP)
1
회
0
0
남기웅
TREATTX-0000-00125 검사-안과-직접검안경
1
회
0
0
남기웅
TXTEMP00207 할인
1
0
0
남기웅', 't'::boolean, '2'::integer, '2026-03-30 06:48:11.45389+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '3cf05b87-5d3f-454b-b575-f9d7b8cb9e8d'::uuid, '69d29be2-0be7-424b-b59b-5226a6010b9d'::uuid, '2025-05-23 09:22:00', 'Subject
CC: 스케일링
마취 - propofol
발치 - 104
스케일링 및 귀 종괴 제거
P)
일주일 뒤 조지검사 결과 안내
Object
Result
Part
Title
Sign
20250523_113712147_01
남기웅
KakaoTalk_20250523_113712147
20250523_113712147_02
20250523_121148730_04
2.51
20250523_121148730_03
20250523_121148730_02
20250523_121148730_01', 'KakaoTalk_20250523_121148730
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00109 수술-피부-피부종괴(MASS)제거
1
회
0
0
남기웅
TREATTX-0000-00648 수술-치과-스케일링(10kg 이하)
1
회
0
0
남기웅
TREATTX-0005-00011 의뢰-조직검사(1site)(Domestic,G)
1
회
0
0
남기웅
TREATTX-0006-00002 검사-X-ray(치과)
1
회
0
0
남기웅
FA-003 마취-수면propofol(1-7kg)
1
회
0
0
남기웅
TREATTX-0002-00055 내복약-1일 2회(일반약, 5~10kg)
7
회히
0
0
남기웅
TREATTX-0000-00183 캡슐 조제비(capsule)
7
회
0
0
남기웅
TREATTX-0002-00047 내복약(previcox) 1T
3
개
0
0
남기웅
HA-007 수액-수액처치료A(10Kg미만)
1
회
0
0
남기웅
TREATTX-0000-00575 수액-수액펌프
1
회
0
0
남기웅
TXTEMP00273 할인
1
0
0
남기웅
TREATTX-0000-00672 수술-치과-발치(송곳니)
1
회
0
0
남기웅
TXTEMP00274 발치 할인
1
0
0
남기웅', 't'::boolean, '1'::integer, '2026-03-30 06:48:11.45389+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'ad270c85-84ac-421f-a083-827b727651ac'::uuid, '69d29be2-0be7-424b-b59b-5226a6010b9d'::uuid, '2025-06-07 11:34:15', 'Subject
CC : 발사
술부양호
귀모양 양호.
발사완료
Object
Result
Part
Title
Sign
스크린샷 2025-06-12 163637
남기웅
Plan
יוור
חיוייזר
L', 'Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0001-00021 처치-외과-발사(봉합사 제거) 및 소독
1
회
0
0
남기웅', 't'::boolean, '0'::integer, '2026-03-30 06:48:11.45389+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'a4616e01-d023-48ed-ab99-d60dcffe75f8'::uuid, '8de087ad-075e-4b12-afc9-f96f34c5c598'::uuid, '2026-03-28 19:00:03', 'Subject
CC : 관절 주사 2차 좌측 뒷다리 / 관절약 14일 BID / 조인힐 좌외
많이 호전 보인다고함 / 약먹고 관절 주사맞고 상태 호전된다고함 / 2주뒤 물리치료 재진
Object
Result
Part
Title
Sign
정희원
20260328_103533146_01
KakaoTalk_20260328_103533146
20260328_103522250_03
20260328_103522250_02
20260328_103522250_01', 'KakaoTalk_20260328_103522250
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
AA010
진료비- 예약 할인
1
회
0
0
정희원
DA003
재활 물리치료
1
회
0
0
정희원
BA005
내복약- 1일 2회
14
일
0
0
정희원
TREATTX-0000-00003
주사-피하주사(외래환자)
1
회
0
0
정희원
TEMP00004
관절연골주사
1
회
0
0
정희원
ANI031
Firocoxib Tab.
5
mg/kg
14
28
PO
정희원
ANI052
Misoprostol Tab.
0.005
mg/kg
14
28
PO
정희원
LIV006
Ursodeoxycholic acid(USDA) Tab.
7.5
mg/kg
14
28
PO
정희원
NEU002
Gabapentin Cap.
10
mg/kg
14
28
PO
정희원', 't'::boolean, '0'::integer, '2026-03-31 08:27:58.730374+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'dfd845bb-9781-4522-9071-91eeb68ab867'::uuid, '8de087ad-075e-4b12-afc9-f96f34c5c598'::uuid, '2026-03-18 13:21:07', 'Subject
CC : 좌측 뒷다리를 불편해함 / 관절약 10일 bid / 프레비콕스 sid / 조인힐 좌 외 반만맞춤
먹는 관절 영양제 카톡으로 보내주신다고함. 연락오면 기록해둘것
Object
Result
Part
Title
Sign
정희원
20260318_151505370_01
KakaoTalk_20260318_151505370
20260318_144449004_02
20260318_144449004_01
KakaoTalk_20260318_144449004', 'KakaoTalk_20260318_142815970
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
AA002
진료비
1
회
0
0
정희원
EG011
02.검사-X-ray-단순방사선촬영B(
1
회
0
0
정희원
크기
EG013
04.검사-X-ray-추가
2
회
0
0
정희원
DA003
재활 물리치료
1
회
0
0
정희원
BA005
내복약- 1일 2회
10
일
0
0
정희원
TREATTX-0000-00003
주사-피하주사(외래환자)
1
회
0
0
정희원
TEMP00004
관절연골주사
1
회
0
0
정희원
ANI031
Firocoxib Tab.
5
mg/kg
10
20
PO
정희원
ANI052
Misoprostol Tab.
0.005
mg/kg
10
20
PO
정희원
LIV006
Ursodeoxycholic acid(USDA) Tab.
7.5
mg/kg
10
20
PO
정희원
NEU002
Gabapentin Cap.
10
mg/kg
10
20
PO
정희원', 't'::boolean, '1'::integer, '2026-03-31 08:27:58.730374+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '4cd815f8-0683-4842-9fcb-186bdaca8aa3'::uuid, '3fe8da6f-151b-4366-bfe7-6ec937c43ae0'::uuid, '2026-02-13 14:02:55', 'Subject
CC : 구토, 사상충예방
저녁 먹고 어제 밤부터 계속 구토를 함.
아침까지 구토.
아침 밥은 안 먹고 병원 오기전에 간식, 물 조금 먹었음.
0)
청진 양호
MMC pink, CRT < 1.5
복통없음. 복부팽만
X-ray : 복강내 종괴음영
US: 비장종양, 위 유문부 비후
A) 위장염, 비장종양
비장종양은 상당히 커져있어서 수술추천.
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00015
진료비-재진
1
회
0
0
남기웅
TREATTX-0000-00570
검사-X-ray(복부, 10kg 이하)
1
회
0
0
남기웅
EC-003
검사-초음파-장기
1
회
0
0
남기웅
TREATTX-0003-00002
주사-항구토제(cerenia)-5kg 미만
1
회
0
0
남기웅
TREATTX-0000-00004
내복약-1일 2회(일반약, 5kg이하)
3
회
0
0
남기웅
TREATTX-0002-00052
내복약-omeprazole (1T)
1
개
0
0
남기웅
DIG045
Metoclopramide Tab.
0.2
mg/kg
3
6
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
3
6
PO
남기웅
DIG052
Omeprazole Cap.
0.7
mg/kg
3
3
PO
남기웅
TREATRX-0003-00001
베아제
1
EA
3
6
po
남기웅', 't'::boolean, '5'::integer, '2026-04-01 06:20:49.395421+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '6497293b-7dc7-4955-a32e-c7736003ddf4'::uuid, '3fe8da6f-151b-4366-bfe7-6ec937c43ae0'::uuid, '2025-05-28 18:18:01', 'Subject
CC : 치근단농양
약먹고 가라앉고 터져나옴.
농이 계속 나옴.
0)
fistula, 탈모, 화농성 염증물지
Tx) 세척 및 enro 주입.
p)
내복약 복용 후 염증 완저히 가라앉는지 확인 필요.
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00015
진료비-재진
1
회
0
0
남기웅
TREATTX-0000-00004
내복약-1일 2회(일반약, 5kg이하)
7
회
0
0
남기웅
TREATTX-0002-00047
내복약(firocoxib) 1T
2.5
개
0
0
남기웅
TREATTX-0000-00473
처치-외과-드레싱1
1
회
0
0
남기웅
TREATTX-0000-00054
외용제-소독약(spray)
1
회
0
0
남기웅
ANB006
Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
7
14
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
7
14
PO
남기웅
ANI031
Firocoxib Tab.
5
짝
7
7
PO
남기웅', 't'::boolean, '7'::integer, '2026-04-01 06:20:49.395421+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '6f5462d0-c66b-4654-903d-caef5fe24393'::uuid, '3fe8da6f-151b-4366-bfe7-6ec937c43ae0'::uuid, '2026-03-30 16:57:04', 'Subject
CC : 발사 및 조직검사 결과 안내
발사완료
DIAGNOSIS
Spleen: Complex nodular hyperplasia
GROSS FINDING
Specimen: Other: spleen
Appearance: 단독 single, Size: 5X5X5cm
Operation: 전적출 excisional
Recurrence: N, Lymph: N
COMMENTS
비장 결절성 과증식(splenic nodular hyperplasia)은 비장 실질 내부에 정상적으로 분포하는 세포들이 국소적으로 증식하여 결절을
형성하는
병변으로, 발생 원인은 알려져 있지 않지만 노화와 함께 발생율이 증가하며 임상 증상을 나타내지 않아 우연히 발견되는 증례가 많습
니다.
Complex nodular hyperplasia 또한 이 범주에 속하는 병변으로, 백색수질의 림프 소포와 함께 평활근이나 섬유세포, 조직구, 형질세
포 등의
기질 세포들이 증식하는 것이 특징입니다. 기질 유래의 악성종양(sarcoma)이나 림프종(splenic lymphoma)으로 진행될 가능성도 있
는 병변
이지만, 의뢰된 검체에서는 종양성 변화는 관찰되지 않았습니다.
MICROSCOPIC FINDINGS
정제되어 의뢰된 비장 검체는 한 단면이 두 장의 슬라이드로 제작되었습니다. 실질 내 형성된 한 개의 팽창성 결절입니다. 결절 내부
는 백색수질
의 림프소포가 산재합니다. 림프소포를 구성하는 림프구는 적혈구 크기의 1-1.5배 크기에 해당하는 핵을 가진 잘 분화된 소형 또는 중
형 림프구
로, 중심부로부터 변연부에 이르기까지 정상적인 구조와 극성(antigen-dependent polarity)을 유지합니다. 소포 사이는 방추형 간엽
세포와
형질세포, 적혈구로 채워졌습니다.
임하영, DVM, PhD (수의병리학박사), DKCVP(한국수의 병리전문의)
IMAGE
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0001-00021
처치-외과-발사(봉합사 제거) 및 소독
1
회
0
0
남기웅', 't'::boolean, '0'::integer, '2026-04-01 06:20:49.395421+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '7dcf90f6-f8bb-41a1-bddb-de637aaf084d'::uuid, '3fe8da6f-151b-4366-bfe7-6ec937c43ae0'::uuid, '2024-09-20 18:05:47', 'Subject
CC : 피부진료
피부가 안좋은지 좀 되었음.
집에 있는 소독약으로 소독했는데 나아지지 않음.
○) 전신 구진, 발적
A) 세균성 농피증
Object
Result
Part
Title
Sign', '남기웅
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00015
진료비-재진
1
회
0
0
남기웅
CA-002
주사-피하/근육주사(5kg미만)
1
회
0
0
남기웅
TREATTX-0000-00004
내복약-1일 2회(일반약, 5kg이하)
7
회
0
0
남기웅
ANB006
Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
7
14
PO
남기웅
ANB070
Fluconazole Tab.
2.5
mg/kg
7
14
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
7
14
PO
남기웅
ANI013
Chlorpheniramine Tab.
2
mg/do
7
14
PO
남기웅', 't'::boolean, '10'::integer, '2026-04-01 06:20:49.395421+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '94d37f78-6b9c-41de-979a-77522d7eca35'::uuid, '3fe8da6f-151b-4366-bfe7-6ec937c43ae0'::uuid, '2024-07-30 18:40:59', 'Subject
CC : 설사
오늘 설사를 여러번 해놔서 얼려놨던 약을 먹였더니 구토르 한.
식욕없음.
어제 수박을 조금 먹었음.
0)
양쪽 슬개골 탈구 4
MMC pink, CRT < 1.5
눈주변, 피부전반 발적
복통없음
장운동음 정상
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00670
진료비-초진
1
회
0
0
남기웅
TREATTX-0000-00004
내복약-1일 2회(일반약, 5kg이하)
3
회
0
0
남기웅
CA-002
주사-피하/근육주사(5kg미만)
1
회
0
0
남기웅
TREATTX-0009-00054
내복약(장염, 술후) 1T
3
회
0
0
남기웅
ANB147
Trimethoprim/ sulfamethoxazole Tab.
15
mg/kg
3
6
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
3
6
PO
남기웅
ANE048
Tramadol Tab.
1
mg/kg
3
6
PO
남기웅', 't'::boolean, '11'::integer, '2026-04-01 06:20:49.395421+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '954fa5aa-fdad-42b1-b970-19a4d8666605'::uuid, '3fe8da6f-151b-4366-bfe7-6ec937c43ae0'::uuid, '2026-03-21 11:11:48', 'Subject
CC : 붕대 드레싱
붕대 헐거워짐
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
DD-004
처치-외과-드레싱
1
회
0
0
남기웅', 't'::boolean, '2'::integer, '2026-04-01 06:20:49.395421+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'a463460e-bce3-446a-a7df-5a1371fc4775'::uuid, '3fe8da6f-151b-4366-bfe7-6ec937c43ae0'::uuid, '2026-02-19 14:14:55', 'Subject
CC : 비장종양 수술 상담
Object
Result
Part
Title
Sign', '', 'f'::boolean, '4'::integer, '2026-04-01 06:20:49.395421+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'a6230f1b-4518-4a49-b222-b69e631b8e34'::uuid, '3fe8da6f-151b-4366-bfe7-6ec937c43ae0'::uuid, '2025-11-01 16:32:58', 'Subject
CC : 치근단농양진료
치근단 농양 소독하면서 관리중.
괜찮아지다가 터지고 함.
CE) 수술 추천
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00015
진료비-재진
1
회
0
0
남기웅
TREATTX-0000-00004
내복약-1일 2회(일반약, 5kg이하)
7
회
0
0
남기웅
TREATTX-0002-00047
내복약(firocoxib) 1T
2.5
개
0
0
남기웅
TREATTX-0000-00473
처치-외과-드레싱1
1
회
0
0
남기웅
TREATTX-0000-00054
외용제-소독약(spray)
1
회
0
0
남기웅
ANB006
Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
7
14
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
7
14
PO
남기웅
ANI031
Firocoxib Tab.
5
짝
7
7
PO
남기웅', 't'::boolean, '6'::integer, '2026-04-01 06:20:49.395421+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'ae1ac98e-af22-4295-af16-c24d80243a96'::uuid, '3fe8da6f-151b-4366-bfe7-6ec937c43ae0'::uuid, '2026-03-20 09:23:12', 'Subject
CC : 비장종양 수술
금식확인
O)
심폐청진 양호
X-RAY : 심비대
US: 비장종양 확인, 심초 양호
CBC, chemi 양호
A) 비장종양, 치근단 농양
반대쪽 치아에서도 치근단 농양확인되어 발치.
술전검사에서 심비대 확인되어 심장초음파 진행. 심초 양호
Object
Result
Part
Title
Sign
남기웅
Assessment
Plan
Type
DX
Diagnosis
비장종양
Sign ID
남기웅', 'Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00015
진료비-재진
1
회
0
0
남기웅
GG-004
수술-소화기-비장절제술(splenectomy)
1
회
0
0
남기웅
TREATTX-0007-00004
수술-치과-치근단농양
1
회
0
0
남기웅
TREATTX-0007-00044
수술-치과-발치(2root)
1
회
0
0
남기웅
TXTEMP00068
할인
1
0
0
남기웅
TREATTX-0000-00158
검사-혈액-CBC(혈구검사)
1
회
0
0
남기웅
LC-002
검사-혈액(혈청)-Chemistry(술전검사)
1
회
0
0
남기웅
FA-003
마취-수면propofol(1-7kg)
1
회
0
0
남기웅
FA-007
마취-호흡(4kg이하)
1
회
0
0
남기웅
EG-002
검사-X-ray(흉부, 10kg 이하)
1
회
0
0
남기웅
CD-003
주사-진통소염제(10kg 미만)
1
회
0
0
남기웅
CB-001
주사-정맥주사(10kg미만)
2
회
0
0
남기웅
TREATTX-0000-00004
내복약-1일 2회(일반약, 5kg이하)
7
회
0
0
남기웅
HA-007
수액-수액처치료A(10Kg미만)
1
회
0
0
남기웅
TREATTX-0000-00575
수액-수액펌프
1
회
0
0
남기웅
TREATTX-0000-00571
검사-초음파-심장(Quick)
1
회
0
0
남기웅
TREATTX-0002-00047
내복약(firocoxib) 1T
1
개
0
0
남기웅
TREATTX-0005-00011
의뢰-조직검사(1site)(Domestic,G)
1
회
0
0
남기웅
ANB035
Cephalexin Cap.
25
mg/kg
7
14
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
7
14
PO
남기웅
ANI031
Firocoxib Tab.
5
mg/kg
3
3
PO
남기웅
8806578045632
아네폴주사(프로포폴) (5ml)
5
ml
1
1
iv
남기웅
8806498019225
부토판주사2밀리그람/밀리리터(주석산부토르
1
ml
1
1
남기웅
ר', 't'::boolean, '3'::integer, '2026-04-01 06:20:49.395421+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'bf437704-397a-408e-911b-6fd3d445d4c7'::uuid, '3fe8da6f-151b-4366-bfe7-6ec937c43ae0'::uuid, '2026-03-24 17:08:36', 'Subject
CC : 술부소독
술부양호
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
DD-004
처치-외과-드레싱
1
회
0
0
남기웅
TREATTX-0000-00015
진료비-재진
1
회
0
0
남기웅', 't'::boolean, '1'::integer, '2026-04-01 06:20:49.395421+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'c0bdc104-9478-423d-8a8e-49e408ffd0d3'::uuid, '3fe8da6f-151b-4366-bfe7-6ec937c43ae0'::uuid, '2025-05-10 10:32:03', 'Subject
CC : 눈붓기, 심장사상충 외부기생충
환경이나 먹는 게 바뀐 거 없음
어제 갑자기 오른쪽 눈이 부어오름
0)
우측 눈 아래 부종.
US - 피하 염증
A) 치근단농양
재발시 발치추천
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00004
내복약-1일 2회(일반약, 5kg이하)
7
회
0
0
남기웅
CD-003
주사-진통소염제(10kg 미만)
1
회
0
0
남기웅
CA-002
주사-피하/근육주사(5kg미만)
1
회
0
0
남기웅
TREATTX-0002-00047
내복약(firocoxib) 1T
2.5
개
0
0
남기웅
EC-003
검사-초음파-장기
1
회
0
0
남기웅
ANB006
Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
7
14
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
7
14
PO
남기웅
ANI031
Firocoxib Tab.
5
짝
7
7
PO
남기웅', 't'::boolean, '8'::integer, '2026-04-01 06:20:49.395421+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'e9652812-c8c6-4145-bff0-c7bd51b3da4b'::uuid, '3fe8da6f-151b-4366-bfe7-6ec937c43ae0'::uuid, '2024-10-23 17:01:11', 'Subject
CC : 피부진료
피부가 안좋은지 좀 되었음.
집에 있는 소독약으로 소독했는데 나아지지 않음.
○) 전신 구진, 발적
A) 세균성 농피증
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00015
진료비-재진
1
회
0
0
남기웅
CA-002
주사-피하/근육주사(5kg미만)
1
회
0
0
남기웅
TREATTX-0000-00004
내복약-1일 2회(일반약, 5kg이하)
7
회
0
0
남기웅
ANB006
Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
7
14
PO
남기웅
ANB070
Fluconazole Tab.
2.5
mg/kg
7
14
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
7
14
PO
남기웅
ANB050
Clindamycin Cap.
5
mg/kg
7
14
PO
남기웅', 't'::boolean, '9'::integer, '2026-04-01 06:20:49.395421+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '07a50579-a50f-4818-bca5-cdbb0467eda7'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.06.21 14:16', 'Objective
plusvetm_film_pet_275_20250621_142135_0 plusvetm_gallery_pet_275_20250621_142... plusvetm_gallery_pet_275_20250621_142...
One
끄지 마세
plusvetm_gallery_pet_275_20250621_142... plusvetm_gallery_pet_275_20250621_142... plusvetm_gallery_pet_275_20250621_142...
plusvetm_gallery_pet_275_20250621_142...
Plan
항목 용법 용량 단위 일투 일수 사용량 담당의
검사-혈액(혈청)-Chemistry(간수치 2종) 1 회 1 최경식
진료/진찰비-재진 1 회 1 최경식', '', 'f'::boolean, '2'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '0ad98be5-bb0e-42bd-a3e9-071bd90b8b78'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.06.09 14:06', 'Subjective
CC:
어제랑 오늘 토 안 했음
한번에 15ml씩 하루 총량은
어제는 105ml
오늘 지금 3번까지먹임
현재 기분이 매우 안 좋음
돌아다니는 거는 괜찮음 스크레쳐도
물 마시는거에대해서공포감?
물마시다가 고개 터는거 비위관 전에도 그랬음
5월중순부터 물통을 제때안바꿔줘서?', '', 'f'::boolean, '4'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '0c124e12-3815-4602-85bf-014f5c4c1422'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.06.01 22:44', 'Plan
항목 용법 용량 단위 일투 일수 사용량 담당의
입원-일반-처치비(0~5kg미만) 2 회 2 최경식
입원-일반-주사1회당(0~5kg미만) 2 회 2 최경식
입원-일반-수액. 1 회 1 최경식
입원-일반-입원비(0~5kg미만) 1 회 1 최경식
검사-혈액(혈청)-Chemistry(간수치 4종) 1 회 1 최경식', '', 'f'::boolean, '11'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '0dfe5fca-ce42-4b1e-9c7d-290df0aa6ca2'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.05.27 18:27', '', '', 'f'::boolean, '21'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '193ed199-2af4-4bd7-8a70-59c77d30ad61'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.06.22 20:09', '', '', 'f'::boolean, '0'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '2e453357-9085-499a-8d11-8f51e76788d1'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.05.30 17:32', 'Plan
항목 용법 용량 단위 일투 일수 사용량 담당의
입원-일반-처치비(0~5kg미만) 2 회 2 최경식
입원-일반-주사1회당(0~5kg미만) 2 회 2 최경식
입원-일반-수액. 1 회 1 최경식
입원-일반-입원비(0~5kg미만) 1 회 1 최경식
검사-혈액(혈청)-Chemistry(간수치 4종) 1 회 1 최경식', '', 'f'::boolean, '13'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '35714f83-7976-4c71-bcf8-ad013bdf1f29'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.06.05 11:34', 'Plan
항목 용법 용량 단위 일투 일수 사용량 담당의
검사-혈액(혈청)-Chemistry(간수치 1종) 1 회 1 최경식
입원-일반-처치비(0~5kg미만) 2 회 2 최경식
입원-일반-주사1회당(0~5kg미만) 2 회 2 최경식
입원-일반-수액. 1 회 1 최경식
입원-일반-입원비(0~5kg미만) 1 회 1 최경식
검사-혈액(혈청)-Chemistry(간수치 2종) 1 회 1 최경식
검사-혈액(혈청)-Chemistry(간수치 1종) 1 회 1 최경식', '', 'f'::boolean, '7'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '3794c1b7-b28d-43f3-a205-268a9ec6d118'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.05.25 20:35', 'Plan
항목 용법 용량 단위 일투 일수 사용량 담당의
입원-일반-처치비(0~5kg미만) 2 회 2 최경식
입원-일반-주사1회당(0~5kg미만) 2 회 2 최경식
입원-일반-수액. 1 회 1 최경식
입원-일반-수액-정맥카테터 장착. 1 회 1 최경식
입원-일반-입원비(0~5kg미만) 1 회 1 최경식', '', 'f'::boolean, '18'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '3e06fe53-c9e3-4595-ab32-4a7c32235b69'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.06.02 20:15', 'Objective
plusvetm_gallery_pet_275_20250602_1147... plusvetm_gallery_pet_275_20250602_1147... plusvetm_gallery_pet_275_20250602_182...
plusvetm_gallery_pet_275_20250603_1012...
3
Plan
항목 용법 용량 단위 일투 일수 사용량 담당의
입원-일반-처치비(0~5kg미만) 2 회 2 최경식
입원-일반-주사1회당(0~5kg미만) 2 회 2 최경식
입원-일반-수액. 1 회 1 최경식
입원-일반-입원비(0~5kg미만) 1 회 1 최경식
검사-혈액(혈청)-Chemistry(간수치 1종) 1 회 1 최경식
레포틸 biphenyl-dimethyl-dicarboxylate Tab. PO 0.25 mg 2 7 14 최경식
우루사 UDCA (100mg) PO 15 mg/kg 2 7 12.6 최경식', '', 'f'::boolean, '10'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '42488bf2-7c73-44b8-8b07-e21975a82ac7'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.06.07 10:07', 'Subjective
CC:
P.
간수치 재검
Plan
항목 용법 용량 단위 일투 일수 사용량 담당의
내복약-추가A 3 회 3 최경식
내복약-1일 (1-5kg) 7 일 7 최경식
주사-특수-항구토제(maropitant,0~5kg) 1 회 1 최경식
처치-비위관(콧줄) 장착 1 회 1 최경식
Cerenia (Maropitant) 세레니아 PO 1 mg/kg 1 3 16.8 최경식
레포틸 biphenyl-dimethyl-dicarboxylate Tab. PO 0.25 T 2 7 3.5 최경식
Silymarin(실리마린) PO 10 mg/kg 2 7 784 최경식
우루사 UDCA (100mg) PO 5 mg/kg 2 7 3.92 최경식
Bestase 베스타아제 1 T 1 1 1 최경식
맥페란정(Metoclopramide Tab) PO 0.2 mg/kg 2 7 15.68 최경식
파모티딘(Famotidine tab) PO 0.5 mg/kg 2 7 39.2 최경식', '', 'f'::boolean, '5'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '53c866c7-d21a-4d95-8cf1-f0bc8b62be3b'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.05.25 18:38', '', '', 'f'::boolean, '23'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '55f48dd9-5407-48f4-9a70-700bc822da4b'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.06.05 15:04', 'Plan
항목 용법 용량 단위 일투 일수 사용량 담당의
처치-비위관(콧줄) 장착 1 회 1 최경식
검사-혈액(혈청)-Chemistry(간수치 1종) 1 회 1 최경식', '', 'f'::boolean, '6'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '60e67582-af1c-45c5-a93a-bc8ba63fa323'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.06.22 20:03', 'Subjective
CC:
첫날에 공복토를했음
@왼쪽비강에 비위관
Objective
plusvetm_film_pet_275_20250622_20264...
Plan
항목 용법 용량 단위 일투 일수 사용량 담당의
처치-비위관(콧줄) 장착 1 회 1 최경식
진료/진찰비-재진 1 회 1 최경식', '', 'f'::boolean, '1'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '65df577f-0cc8-4468-b238-06bea270c2b8'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.05.27 12:24', '', '', 'f'::boolean, '22'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '81f5321e-87ba-47ca-9ad6-c0c5a28cc052'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.05.25 11:05', '', '', 'f'::boolean, '24'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '8af98552-c4db-4bf7-9244-c74297bad10e'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.06.06 15:03', '', '', 'f'::boolean, '20'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '98c544e0-1510-4ff7-a041-b66c4ce9e860'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.05.28 13:24', 'Subjective
CC : 입원4일) 간, 전해질, 염증 수치 그냥 재드림
전화통화
T-bil 악화
보호자 분 원내 1주일 입원 원하셨으나
24시 병원 옵션 추천
우선 내일 상태 보고 결정
Objective
plusvetm_gallery_pet_275_20250528_211...
Plan
항목 용법 용량 단위 일투 일수 사용량 담당의
검사-혈액-전해질. 1 회 1 최경식
검사-혈액(혈청)-Chemistry(간수치 4종) 1 회 1 최경식
검사-혈액-FSAA 1 회 1 최경식
입원-일반-처치비(0~5kg미만) 2 회 2 최경식
입원-일반-주사1회당(0~5kg미만) 2 회 2 최경식
입원-일반-수액. 1 회 1 최경식
입원-일반-입원비(0~5kg미만) 1 회 1 최경식', '', 'f'::boolean, '15'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '99a893e7-7a73-431c-a292-a3995492bbe5'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.05.29 07:51', 'Plan
항목 용법 용량 단위 일투 일수 사용량 담당의
입원-일반-처치비(0~5kg미만) 2 회 2 최경식
입원-일반-주사1회당(0~5kg미만) 2 회 2 최경식
입원-일반-수액. 1 회 1 최경식
입원-일반-입원비(0~5kg미만) 1 회 1 최경식
검사-혈액(혈청)-Chemistry(간수치 1종) 1 회 1 최경식', '', 'f'::boolean, '14'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'a894dc92-c693-4553-afd3-01e8ab46266d'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.06.09 14:17', 'Objective
plusvetm_gallery_pet_275_20250609_154...
끄지 마세요
Plan
항목 용법 용량 단위 일투 일수 사용량 담당의
검사-혈액(혈청)-Chemistry(간수치 3종) 1 회 1 최경식
진료/진찰비-재진 1 회 1 최경식', '', 'f'::boolean, '3'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'b00ea07d-0a58-4868-ad09-cb9aeab204a7'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.05.27 12:34', 'Objective
plusvetm_gallery_pet_275_20250527_1418... plusvetm_gallery_pet_275_20250527_1418... plusvetm_gallery_pet_275_20250527_1744...
CAUTION 배변/
Plan
항목 용법 용량 단위 일투 일수 사용량 담당의
입원-일반-처치비(0~5kg미만) 2 회 2 최경식
입원-일반-주사1회당(0~5kg미만) 2 회 2 최경식
입원-일반-수액. 1 회 1 최경식
입원-일반-입원비(0~5kg미만) 1 회 1 최경식
검사-혈액(혈청)-Chemistry(간수치 4종) 1 회 1 최경식
Bestase 베스타아제 1 T 1 1 1 최경식
biphenyl-dimethyl-dicarboxylate Tab. 레포틸 PO 0.25 mg 2 5 2.5 최경식
우루사 UDCA (100mg) PO 15 mg/kg 2 5 9 최경식', '', 'f'::boolean, '16'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'b12c49f3-a5f5-4394-89c6-049f56c90dfb'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.06.04 16:30', 'Plan
항목 용법 용량 단위 일투 일수 사용량 담당의
검사-혈액(혈청)-Chemistry(간수치 1종) 1 회 1 최경식
입원-일반-처치비(0~5kg미만) 2 회 2 최경식
입원-일반-주사1회당(0~5kg미만) 2 회 2 최경식
입원-일반-수액. 1 회 1 최경식
입원-일반-입원비(0~5kg미만) 1 회 1 최경식', '', 'f'::boolean, '8'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'b18412b1-aa97-4dd9-892c-6819d3c7ad22'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.05.26 13:15', 'Objective
plusvetm_gallery_pet_275_20250526_1315... plusvetm_gallery_pet_275_20250526_1319... plusvetm_gallery_pet_275_20250526_1319...
Plan
항목 용법 용량 단위 일투 일수 사용량 담당의
검사-혈액(혈청)-Chemistry(간수치 4종) 1 회 1 최경식', '', 'f'::boolean, '17'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'bf0a45a3-af6e-424e-a57b-a1236b5a12c9'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.05.31 10:04', 'Objective
plusvetm_gallery_pet_275_20250531_100...
Plan
항목 용법 용량 단위 일투 일수 사용량 담당의
검사-혈액-전해질. 1 회 1 최경식
입원-일반-처치비(0~5kg미만) 2 회 2 최경식
입원-일반-주사1회당(0~5kg미만) 2 회 2 최경식
입원-일반-수액. 1 회 1 최경식
입원-일반-입원비(0~5kg미만) 1 회 1 최경식
검사-혈액(혈청)-Chemistry(간수치 4종) 1 회 1 최경식', '', 'f'::boolean, '12'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'e2de881c-1287-42d3-8582-198cf52dd444'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.05.25 09:19', 'Subjective
CC : 입원1일) 지방간, 황달 의심
S.
컨디션 3/10
황달 의심
관련 진료 본 적 없음
이전에 지방간 한달 동안 치료한 적 있음.
pro bnp 약간 높다고 들었음
Ο.
1) BA
-ALKP: >2000
-ALT 556
-GGT 16
-T-Bil 7.5
Tx.
비위관 장착
Rx.
P.
ALT, ALKP, GGT, T-bil 재검
CE.
매일 입원비 10만원대 중후반
검사비용 별도
Objective
plusvetm_gallery_pet_275_20250525_193... plusvetm_gallery_pet_275_20250525_200...
Assessment
지방간
Plan
항목 용법 용량 단위 일투 일수 사용량 담당의
처치-비위관(콧줄) 장착 1 회 1 최경식
복부초음파검사(5~10kg) 1 회 1 최경식
흉부/복부 방사선 검사 (5~10kg). 1 회 1 최경식
검사-혈액-FSAA 1 회 1 최경식
검사-혈액-전해질. 1 회 1 최경식
검사-혈액-정밀-chemistry(17종). 1 회 1 최경식
검사-혈액-전혈구-CBC. 1 회 1 최경식
진료/진찰비-초진 1 회 1 최경식
프리폴-엠시티 (propofol, 12ml)(프로포폴) IV 1 ml/kg 1 1 0.25 최경식
진단 검사 결과
라온동물의료센터
보호자 성함 김소은
충청남도 당진시 수청4길 60, | 041-358-8270
동물 등록 번호 275
동물명 무무
연락처 010-7424-6732
축종/품종 고양이/코리안 숏헤어(코숏)
주소
나이 8Y OM
성별 중성화 암컷
진단 결과 추이
라온동물의료센터
보호자 성함 김소은
충청남도 당진시 수청4길 60, | 041-358-8270
동물 등록 번호 275
동물명 무무
연락처 010-7424-6732
축종/품종 고양이/코리안 숏헤어(코숏)
주소
나이 8Y OM
성별 중성화 암컷
*선택하신 검사 결과 중 최대 20개의 결과를 날짜순으로 나열합니다.
Serum Analysis(혈청 분석) | V200
항목 정상 범위 25.05.28 25.05.27 25.05.25
17:09 18:50 11:50
fSAA 5~5.001 (ug/mL) ↓5 ↓5 ↓5
Biochemical Analysis(생화학 분석) | Catalyst One
항목 정상 범위 25.06.21 25.06.09 25.06.06 25.06.05
14:29 14:25 13:02 11:29
11:00
25.06.04 25.06.03 25.06.02 25.06.01
10:14 13:06 10:10 09:55
25.05.31
11:48
ALB 2.3~3.9 (g/dL)
ALKP 14 ~ 111 (U/L) ↑113 ↑196 ↑ 285 ↑984
ALT 12~130 (U/L) 80 113 ↑188
AMYL 500~1500 (U/L)
BUN 16~36 (mg/dL)
Ca 7.8~11.3 (mg/dL)
CI 112~129 (mmol/L) 115 115
CREA 0.8~2.4 (mg/dL)
GGT 0~4 (U/L) 0 0
GLU 71~159 (mg/dL)
K 3.5~5.8 (mmol/L) ↓3.2 ↓ 2.8
LIPA 100~1400 (U/L)
Na 150~165 (mmol/L) 153 158
PHOS 3.1~7.5 (mg/dL)
TBIL 0~0.9 (mg/dL) 0.9 ↑5 ↑ 7.4 ↑7.2 ↑ 7.4 ↑9 ↑10.1 ↑11.5
TP 5.7~8.9 (g/dL)
TCHO 65~225 (mg/dL)
GLOB 2.8~5.1 (g/dL)
ALB/GLOB 0~0(-)
BUN/CREA 0~0(-)
Na/K 0~0(-) 48 56
Biochemical Analysis(생화학 분석) | Catalyst One
항목 정상 범위 25.05.30 25.05.29 25.05.28
10:06 12:46 11:43 12:51
21:35 21:23
25.05.27 25.05.26 25.05.25
12:33 13:23 11:43
ALB 2.3~3.9 (g/dL) 2.8
ALKP 14~111 (U/L) ↑1267 ↑1281 ↑1848 ↑1576 ↑1864 > 2000
ALT 12~130 (U/L) ↑198 ↑220 ↑ 329 ↑370 ↑549 ↑556
AMYL 500~1500 (U/L) 1384
BUN 16~36 (mg/dL) 17
Ca 7.8~11.3 (mg/dL) 9.3
CI 112~129 (mmol/L) ↓111 119
CREA 0.8~2.4 (mg/dL) 1.2
GGT 0~4 (U/L) 4 ↑5 ↑10 ↑9 ↑8 ↑16
GLU 71~159 (mg/dL) ↑173
K 3.5~5.8 (mmol/L) ↓2.8 4.7
LIPA 100~1400 (U/L) 419
Na 150~165 (mmol/L) ↓ 145 161
PHOS 3.1~7.5 (mg/dL) 4.9
TBIL 0~0.9 (mg/dL) ↑11 ↑10 ↑9.8 ↑10.8 ↑ 8.1 ↑ 7.2 ↑ 7.5
TP 5.7~8.9 (g/dL) 6.9
TCHO 65~225 (mg/dL) 73
GLOB 2.8~5.1 (g/dL) 4.1
ALB/GLOB 0~0(-) 0.7
BUN/CREA 0~0(-) 15
Na/K 0~0(-) 51 34
항목
CBC(전혈구 검사) | ProCyte One
정상 범위
25.05.25
11:11
WBC 2.87 ~ 17.02 (K/μL) ↑19.9
RBC 6.54~12.2 (Μ/μL) 7.71
HGB 9.8~16.2 (g/dL) 10.2
HCT 30.3~52.3 (%) 32.8
MCV 35.9~53.1 (fL) 42.5
MCH 11.8~17.3 (pg) 13.2
MCHC 28.1~35.8 (g/dL) 31
PLT 151 ~ 600 (Κ/μL) 449
PCT 0.17~0.86 (%) 0.58
MPV 11.4~21.6 (fL) 13
RDW 15~27 (%) 22
LYM 0.92 ~ 6.88 (Κ/μL) 2.13
%LYM 0~0(%) 10.7
EOS 0.17 ~ 1.57 (Κ/μL) 0.59
%EOS 0~0(%) 3
BASO 0.01 ~ 0.26 (Κ/μL) 0.03
%BASO 0~0(%) 0.2
ΜΟΝΟ 0.05 ~ 0.67 (Κ/μL) ↑1.57
%ΜΟΝΟ 0~0(%) 7.9
NEU 2.3 ~ 10.29 (Κ/μL) ↑15.57
%NEU 0~0(%) 78.2
RETIC 3 ~ 50 (Κ/μL) ↑ 71.8
%RETIC 0~0(%) 0.9
영상 검사 소견
라온동물의료센터
보호자 성함 김소은
충청남도 당진시 수청4길 60, | 041-358-8270
동물 등록 번호 275
동물명 무무
연락처 010-7424-6732
축종/품종 고양이/코리안 숏헤어(코숏)
주소
나이 8Y OM
성별 중성화 암컷', '', 'f'::boolean, '19'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'efb923e3-26d2-4d14-815e-cf3501f3d699'::uuid, 'c98b037e-b309-436f-ae7f-5a3936d1d3b1'::uuid, '2025.06.03 15:30', 'Plan
항목 용법 용량 단위 일투 일수 사용량 담당의
입원-일반-처치비(0~5kg미만) 2 회 2 최경식
입원-일반-주사1회당(0~5kg미만) 2 회 2 최경식
입원-일반-수액. 1 회 1 최경식
입원-일반-입원비(0~5kg미만) 1 회 1 최경식
검사-혈액-전해질. 1 회 1 최경식
검사-혈액(혈청)-Chemistry(간수치 1종) 1 회 1 최경식', '', 'f'::boolean, '9'::integer, '2026-04-01 08:27:24.031376+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '160ffb5d-5526-4e30-a9ae-4859e2adb343'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2023-11-06 14:07:17', 'Subject
CC : 기침, 켁켁거림 f/u
실내환기자주, 약5, 기침영상, 금재
약 먹고 호흡기 증상 약간 개선 - 10~20% 증상 개선
1주 전부터 기침 켁켁거림, 점점 심해지는 양상 숨차보임
활식변뇨 특이사항 없음
어릴 때 가정분양, 동거견 2마리(다른방에서 지냄, 6개월 전부터 - 10살 이상)
Vx. 오래됨, HWP 1~2년 전
구취 심한 편
MMC pink, CRT 1s
moderate tartar
tracheal reflex pos
HW kit neg.
Rx)
doxy 5, brom 0.5, famo 0.5, cpa 0.1 bid for 5days (캡슐: 150)
brom SC
CE)
기관지염에 준하여 약 처방 - 개선 안될 경우 추가검시 필요함 고지
사상충예방 필요성 안내
건강검진/스케일링 권장', '', 'f'::boolean, '4'::integer, '2026-04-06 04:54:12.091406+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '265299ba-6afa-47bb-b1df-15601289160e'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-09 18:48:11', 'Subject
CC : 기침
기침영상, 금-치과방사선/치료
켁켁거림이 오늘 좀 있어서 내원
활식변뇨 특이사항 없음
올 3월 쯤 왼쪽 눈 아래 물주머니 같이 부풀어오름 - 타 병원에서 연고/약 사용후 가라앉음
7월부터 증상 재발 - 다시 약 먹고 가라앉음
10월 다시 증상 재발
어릴 때 가정분양, 동거견 2마리(다른방에서 지냄, 6개월 전부터 - 10살 이상)
Vx. 오래됨, HWP 1~2년 전
구취 심한 편
MMC pink, CRT 1s
moderate tartar
tracheal reflex pos
Rx)
metro 12, clinda 7.5, famo 0.5 bid for 5days
CE)
네불 처치 후 귀가 - 기침 개선 없으면 기존 처방약 추가 처방 고려, 네뷸 처치 권고
금요일 치첨 농양 수술 예정', '', 'f'::boolean, '2'::integer, '2026-04-06 04:54:12.091406+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '55cd53b5-db0b-4e13-8375-c24c99d172a1'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2023-11-04 11:22:43', 'Subject
CC : 기침, 켁켁거림
약3, 기침영상, 월재
1주 전부터 기침 켁켁거림, 점점 심해지는 양상 숨차보임
활식변뇨 특이사항 없음
어릴 때 가정분양, 동거견 2마리(다른방에서 지냄, 6개월 전부터 - 10살 이상)
Vx. 오래됨, HWP 1~2년 전
구취 심한 편
MMC pink, CRT 1s
moderate tartar
tracheal reflex pos
HW kit neg.
Rx)
doxy 5, brom 0.5, famo 0.5 bid for 3days
brom SC
CE)
기관지염에 준하여 약 처방 - 개선 안될 경우 추가검시 필요함 고지
사상충예방 필요성 안내
건강검진/스케일링 권장', '', 'f'::boolean, '5'::integer, '2026-04-06 04:54:12.091406+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'b5c829bf-6dce-4358-8279-9ef6c243cdfb'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-13 11:59:58', 'Subject
CC : 치첨농양, 구강이물 Sx.
마취후안내/양치내일부터, 1주재, 약7
기침은 약간 줄어듬, 하기는 할
염증약 잘 먹었음
활식변뇨 특이사항 없음. 씹을 때 약간 불편해보임
을 3월 쯤 왼쪽 눈 아래 물주머니 같이 부풀어오름 - 타 병원에서 연고/약 사용후 가라앉음
7월부터 증상 재발 - 다시 약 먹고 가라앉음
어릴 때 가정분양, 동거견 2마리(다른방에서 지냄, 6개월 전부터 - 10살 이상)
Vx. 오래됨, HWP 1-2년 전
구취 심한 편
MMC pink, CRT 1s
moderate tartar
tracheal reflex pos
Sx)
입천장에 나무 이물 확인 -> 제거
108,208 발치. 106 치근 흡수 발치
Rx) 200cap
metro 12, clinda 7.5, famo 0.5 bid for 7days
CE)
입천장 잘 아무는지 관찰 요망', '', 'f'::boolean, '1'::integer, '2026-04-06 04:54:12.091406+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'e5dd86e4-6f4e-47fb-b08c-3d4064796f6d'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-07 11:04:43', 'Subject
CC : 치첨농양susp.
약5(공캡슐), 기침영상, 금-치과방사선/치료
올 3월 쯤 왼쪽 눈 아래 물주머니 같이 부풀어오름 - 타 병원에서 연고/약 사용후 가라앉음
7월부터 증상 재발 - 다시 약 먹고 가라앉음
10월 다시 증상 재발
약 먹고 호흡기 증상 약간 개선 - 10~20% 증상 개선
1주 전부터 기침 켁켁거림, 점점 심해지는 양상 숨차보임
활식변뇨 특이사항 없음
어릴 때 가정분양, 동거견 2마리(다른방에서 지냄, 6개월 전부터 - 10살 이상)
Vx. 오래됨, HWP 1~2년 전
구취 심한 편
MMC pink, CRT 1s
moderate tartar
tracheal reflex pos
Rx)
metro 12, clinda 7.5, famo 0.5 bid for 5days
CE)
기관지염에 준하여 약 처방 - 개선 안될 경우 추가검시 필요함 고지
사상충예방 필요성 안내
건강검진/스케일링 권장', '', 'f'::boolean, '3'::integer, '2026-04-06 04:54:12.091406+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'ed1561ec-6f01-46e0-ac0c-647c67ad96a7'::uuid, 'a9a7feff-86ea-438b-a99b-df57a1801fe0'::uuid, '2024-12-20 15:55:21', 'Subject
CC : 치첨농양, 구강이물 f/u
양치잘하기, 사상충전종일정잡기, 1주재, 약7
약 잘 먹었음
활식변뇨 특이사항 없음. 씹을 때 약간 불편해보임
no vdsc
을 3월 쯤 왼쪽 눈 아래 물주머니 같이 부풀어오름 - 타 병원에서 연고/약 사용후 가라앉음
7월부터 증상 재발 - 다시 약 먹고 가라앉음
어릴 때 가정분양, 동거견 2마리(다른방에서 지냄, 6개월 전부터 - 10살 이상)
Vx. 오래됨, HWP 1-2년 전
구취 심한 편
MMC pink, CRT 1s
moderate tartar
tracheal reflex pos
Sx)
입천장에 나무 이물 확인 -> 제거
108,208 발치. 106 치근 흡수 발치
Rx) 200cap 공캡슐 챙기기
metro 12, clinda 7.5, famo 0.5 bid for 7days
CE)
발치부위 상태 양호, 입천장 부위 천천히 아무는 중. 1주재', '', 'f'::boolean, '0'::integer, '2026-04-06 04:54:12.091406+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '6c36b4b3-274c-49e8-b7be-2d98b82f6e30'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-03-12 10:09:17', 'Subject
CC : 발치수술
O)
술전검사 양호
심폐청진 양호
마취 - DTZ
수술 - 발치(송곳니2, 3root 1개, 2root 4개, 앞니 2개), 플랩 봉합
A) 발치
흡수성봉합사라서 발사일정 잡지않음.
봉합사때문에 불편감을 느낀다면 내원요청드림
Object
Result Part Title Sign
20260312_113620632_04 남기웅
20260312_113620632_03', '20260312_113620632_02 20260312_113620632_01
KakaoTalk_20260312_113620632
Plan
Code Treatment/Prescription Qty Unit Day Total Route Sign ID
FA-007 마취-호흡(4kg이하) 1 회 0 0 남기웅
CD-003 주사-진통소염제(10kg 미만) 1 회 0 0 남기웅
CB-001 주사-정맥주사(10kg미만) 2 회 0 0 남기웅
TREATTX-0000-00004 내복약-1일 2회(일반약, 5kg이하) 7 회 0 0 남기웅
HA-007 수액-수액처치료A(10Kg미만) 1 회 0 0 남기웅
TREATTX-0000-00575 수액-수액펌프 1 회 0 0 남기웅
TREATTX-0006-00002 검사-X-ray(치과) 1 회 0 0 남기웅
TREATTX-0000-00177 수술-치과-발치(영구치) 2 회 0 0 남기웅
TREATTX-0000-00672 수술-치과-발치(송곳니) 2 회 0 0 남기웅
TREATTX-0007-00044 수술-치과-발치(2root) 4 회 0 0 남기웅
TREATTX-0000-00152 수술-치과-3root or 수술적발치 1 회 0 0 남기웅
TREATTX-0000-00460 수술-치과-스케일링(5kg 이하) 1 회 0 0 남기웅
TXTEMP00369 스케일링 할인 1 0 0 남기웅
TXTEMP00370 발치 할인 1 0 0 남기웅
TREATTX-0002-00047 내복약(firocoxib) 1T 1 개 0 0 남기웅
ANB035 Cephalexin Cap. 25 mg/kg 7 14 PO 남기웅
DIG022 Famotidine Tab. 0.5 mg/kg 7 14 PO 남기웅
ANI031 Firocoxib Tab. 5 mg/kg 3 3 PO 남기웅', 't'::boolean, '0'::integer, '2026-04-06 06:27:40.019068+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'ebfbf0fe-5617-44da-94f5-f4bf2b30e95e'::uuid, 'ff18168c-9a3d-43d2-920f-39f59e329d71'::uuid, '2026-02-23 09:58:34', 'Subject
CC : 건강검진 (종합)
변식활뇨 양호.
병력 : 없음.
MED: 관절영양제, 기관지영양제.
O)
MMC pink, CRT < 1.5s
심폐청진 양호
복부청진 양호
슬개골탈구 2단계
혈압 : 150
혈구검사 : 양호
혈청검사 : 양호
X-ray: VLAS 2, 기관허탈
US: 담낭슬러지, 신장
A) 건강검진
심한 치주염, 치은퇴축이 있습니다. 치과방사선과 발치 추천드립니다.
초음파검사에서 담낭슬러지 확인되어 간영양제 복용 추천드립니다.
기관허탈이 있습니다. 기관지영양제 유지해주세요.
Object
Result Part Title Sign
IMG_20260223_101512 남기웅
IMG_20260223_101505
IMG_20260223_101500
IMG_20260223_101450
IMG_20260223_101432
IMG_20260223_101420
IMG_20260223_101415 20260223_101332
20260223_101307 IntoCNS_000002
141310
Enter', 'IntoCNS_000001
R
Plan
Code Treatment/Prescription Qty Unit Day Total Route Sign ID
TREATTX-0000-00158 검사-혈액-CBC(혈구검사) 1 회 0 0 남기웅
LC-010 검사-혈액(혈청)-Chemistry(17종검사) 1 회 0 0 남기웅
LE-001 검사-혈액-전해질 1 회 0 0 남기웅
TREATTX-0000-00659 검사-X-ray(흉복부4cut, 10kg 이하) 1 회 0 0 남기웅
EC-004 검사-초음파-복부 1 회 0 0 남기웅
EK-005 검사-혈압모니터링(BP) 1 회 0 0 남기웅
TREATTX-0006-00001 검사-검이경검사(otoscope) 1 회 0 0 남기웅
TREATTX-0000-00125 검사-안과-직접검안경 1 회 0 0 남기웅
LA-015 검사-안과-안압검사(IOP) 1 회 0 0 남기웅
LA-007 검사-안과-눈물분비량검사(STT) 1 회 0 0 남기웅
TREATTX-0005-00026 검사-SDMA(건강검진) 1 회 0 0 남기웅
TREATTX-0009-00039 건강검진 시-추가(proBNP) 1 회 0 0 남기웅
LF-010 검사-혈액(갑상선호르몬)-T4 1 회 0 0 남기웅
TXTEMP00242 할인 1 0 0 남기웅', 't'::boolean, '1'::integer, '2026-04-06 06:27:40.019068+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '15c55280-b82a-4244-a73d-f07a2e25111a'::uuid, '31d00338-48d1-4e53-806b-f21427dab9b6'::uuid, '2026-03-05 17:09:29', 'Subject
CC : 술부체크 및 드레싱교체
Object
Result
Part
Title
Sign
백동기', '', 'f'::boolean, '4'::integer, '2026-04-06 09:07:28.091369+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '161249cd-1b38-4c24-85ad-6b2aa84aef61'::uuid, '31d00338-48d1-4e53-806b-f21427dab9b6'::uuid, '2026-02-18 15:55:06', 'Subject
CC : 왼쪽 귀 부음
이개혈종
1. 기저원인 교정
2. 배액
1) 주사기로 뽑음
2) 절개면 만듬
3) FM 적인 수술
Rx)
cepha 2T
itra 1T sid eve
famo 1T
pds 1.5T
udca 2T
Object
Result
Part
Title
Sign
백동기', '', 'f'::boolean, '9'::integer, '2026-04-06 09:07:28.091369+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '340c2656-e715-41c9-9848-972cc31b5c0e'::uuid, '31d00338-48d1-4e53-806b-f21427dab9b6'::uuid, '2026-03-02 10:54:08', 'Subject
CC : OP)이개혈종
PLT(sample clogging)
퇴원 상담
1. 마취 회복
- 완전 회복 24시간 소요
- 저녁 10시까지 아무것도 주지 않으시다가 10시에 물주신후 기침/구토 없으면 평소 1/2 수준으로 식사 제공 및 내복약 제공
:: 혹시 10시에 물먹은후에 기침/구토 있으면 내일부터 일상생활
2. 술부 관리
- 3일뒤 드레싱 교체 및 소독
- 드레싱 잘 유지되지 않는 경우 소독 관리 안내(소독솜)
- 쿠션형 깔대기 넥카라 적용 권장
3. 기저원인 관리
- 귀세정/연고 적용 관리 안내
- 내복약 관리 안내
Object
Result
Part
Title
Sign
백동기', '', 'f'::boolean, '5'::integer, '2026-04-06 09:07:28.091369+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '73f90157-4fb9-4085-8f1e-b7575f1d9a82'::uuid, '31d00338-48d1-4e53-806b-f21427dab9b6'::uuid, '2026-03-07 14:18:40', 'Subject
CC : 이개혈종 드레싱
Object
Result
Part
Title
Sign', '', 'f'::boolean, '3'::integer, '2026-04-06 09:07:28.091369+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '7c727fa1-8f2e-422f-afdf-7d19a3c6dfce'::uuid, '31d00338-48d1-4e53-806b-f21427dab9b6'::uuid, '2026-03-17 18:34:07', 'Subject
CC : 이개혈종 실밥제거
S)
HPI
:
Object
Result
Part
Title
Sign
백동굴의료센
터
20260317_184646905_01
KakaoTalk_20260317_184646905
IntoCNS_000004
IntoCNS_000003
IntoCNS_000002
IntoCNS_000001
IntoCNS_000002
IntoCNS_000001', '', 'f'::boolean, '0'::integer, '2026-04-06 09:07:28.091369+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '82752543-e4a9-4daa-95f0-2c87f13cf8b4'::uuid, '31d00338-48d1-4e53-806b-f21427dab9b6'::uuid, '2026-03-13 19:00:29', 'Subject
CC : 이개혈종 드레싱, 하트가드, 프론트라인
Object
Result
Part
Title
Sign', '', 'f'::boolean, '1'::integer, '2026-04-06 09:07:28.091369+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'b86f9f87-9fa4-4e2c-bd15-a8264cb6d090'::uuid, '31d00338-48d1-4e53-806b-f21427dab9b6'::uuid, '2026-02-23 18:23:54', 'Subject
CC : 전화문의
이개혈종 수술 후 다시 불어서 재수술 문의 하심
이틀뒤 재진날에 진료 보러오시는 게 좋으실 것 같다고 안내드림
Object
Result
Part
Title
Sign', '', 'f'::boolean, '7'::integer, '2026-04-06 09:07:28.091369+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'd901ee19-f8e0-4085-b0e4-7a82161136c4'::uuid, '31d00338-48d1-4e53-806b-f21427dab9b6'::uuid, '2026-02-19 19:15:56', 'Subject
CC : 이개혈종 재진
0)
다시 차오름
Tx)
부분 마취 후 2cm 정도 절개
혈액 배액 및 드레싱
Rx)
none
CE. P)
- 귀색이 변하는 경우 드레싱 즉시 제거
- 구멍이 막히지 않도록 수시로 체크 권장(그래도 막힐수는 있음;;)
- 이번에도 실패하면 수술적 교정 필요할 수 있음안내
Object
Result
Part
Title
Sign', '', 'f'::boolean, '8'::integer, '2026-04-06 09:07:28.091369+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'da08aaa9-73fe-4017-9d10-c346cbbcf2c5'::uuid, '31d00338-48d1-4e53-806b-f21427dab9b6'::uuid, '2026-02-25 18:47:17', 'Subject
CC:
Object
Result
Part
Title
Sign
백동기', '', 'f'::boolean, '6'::integer, '2026-04-06 09:07:28.091369+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'dc6d6fd6-7b29-4054-9228-aa25f431816b'::uuid, '31d00338-48d1-4e53-806b-f21427dab9b6'::uuid, '2026-03-10 19:45:30', 'Subject
CC : 이개혈종 드레싱
Object
Result
Part
Title
Sign', '', 'f'::boolean, '2'::integer, '2026-04-06 09:07:28.091369+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '01e2bf98-0191-4dc1-8574-8ca18abd494d'::uuid, '936450a1-deeb-43ed-91a4-7e8a8ad15977'::uuid, '2026.01.06 11:10', 'Subjective
CC : 양안 질적 건성안, 좌안 안검샘염
menace: 양안 양호
PLR: +/+
Dazzle: +/+
- 안구 : 양안 양호
안검: 우안 양호, 좌안 상안검 종괴(염증 추정)
결막: 양안 양호
각막: 양안 각막 경미한 표층 혼탁
전안방: 양안 양호
홍채: 양안 양호
- 수정체: 우안 양호, 좌안 피칠 백내장 초기 병변
망막: 시신경, 혈관, 반사도 양호
- STT (17,18), IOPVetplus 2.0 (20,17)
A.
양안) 질적 건성안
좌안) 안검샘 염증 (눈물샘)
Rx.
좌안 포러스 연고 (2~3)
양안 안찜질 (가능 시..)
Objective
폴더 미지정
IMG_1588
IMG_1592
IMG_1596
IMG_1602
IMG_1603
IMG_1606
IMG_1609
IMG_1611
IMG_1616
IMG_1617
IMG_1619
IMG_1623
IMG_1630
IMG_1632
IMG_1633
IMG_1637', '', 'f'::boolean, '3'::integer, '2026-04-07 07:10:07.847622+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '050db9c7-ae77-40f9-91ff-a18917c25392'::uuid, '936450a1-deeb-43ed-91a4-7e8a8ad15977'::uuid, '2026.02.12 09:47', 'Subjective
CC: 방광결석 제거
OP) 26. 02.12 방광결석 제거술
: 방광절개후 결석 스푼으로 제거 시도
요도 통해 5Fr feeding tube로 NS 세척 실시하면서 추가 결석 제거함
요도 개통성 확인되나 좁은 양상 - 5Fr 으로도 빡빡한편
4-0 PDS 로 폐복 실시함, 4-0 nylon 피부봉합, 리도카인 주사 실시
크라이오펜 카트리지 1개 사용
Rx)
1) 내복약 7일치 (기존 간약 포함)
Cepha 22, Famo 0.5, Gaba 5, UDCA 10, Sily 7.5, Lefotil 0.25T BID
2) 소독솜 : 1일 2회
Objective
폴더 미지정
plusvetm_gallery_pet_8094_20260212_094... plusvetm_gallery_pet_8094_20260212_094... plusvetm_gallery_pet_8094_20260212_152...
plusvetm_gallery_pet_8094_20260212_152... plusvetm_gallery_pet_8094_20260212_152... plusvetm_gallery_pet_8094_20260212_152...
plusvetm_gallery_pet_8094_20260212_152... plusvetm_gallery_pet_8094_20260212_152... plusvetm_gallery_pet_8094_20260212_152...
plusvetm_gallery_pet_8094_20260212_175...
나치로
Ceft asine
Burto Oind
손사랑♡
방광결석
4.6 kg
Plan
항목 경로 Qty 단위 일투 일수 사용량 담당의
수액-정맥카테터장착비 1 회 1 박성원
주사-정맥주사(10kg이하) 2 회 2 박성원
향정-butorphanol 1vial 1 EA 1 박성원
수액-HS 1 회 1 박성원
향정-propofol 1 회 1 박성원
마취-호흡(5kg이하) 1 회 1 박성원
수술-비뇨기-방광결석(다량) 1 회 1 박성원
KVL - 결석 분석 (Stone analysis) 1 회 1 박성원
마취-국소마취 1 회 1 박현지
소모품-크라이오 카트리지 (개당) 1 회 1 박현지
내복약-1일(10Kg이하) 7 회 7 박현지
(직원용) 마이너스 1 회 1 김도희
새 그룹
Cephalexin Cap. PO 22 mg/kg 2 7 2.834 박현지
Famotidine Tab. PO 0.5 mg/kg 2 7 3.25 박현지
Gabapentin Cap. PO 5 mg/kg 2 7 3.5 박현지
Silymarin Cap. (실리마린,실리로) PO 7.5 mg/kg 2 7 3.5 박현지
UDCA Tab. PO 10 mg/kg 2 7 3.25 박현지
Lefotil Tab. PO 0.5 T/day 2 7 3.5 박현지
소독제-소독솜(클로르헥시딘,chlorhexidine) Skin 1 EA 1 1 1 박현지
처방-안약(연고)-포러스 Eye 1 drop 1 1 1 박현지', '', 'f'::boolean, '1'::integer, '2026-04-07 07:10:07.847622+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '37dd4ed7-5e20-40c0-976b-4a5723a71be0'::uuid, '936450a1-deeb-43ed-91a4-7e8a8ad15977'::uuid, '2026.01.06 09:30', 'Subjective
CC : 건강검진 premium + SDMA
진정제 효과 없음
Hx)
닥터독) 엑스레이상 심장 큼, 잡음 들림 → 심장초음파 봤는데 흥분도 높아서 제대로 못 봄
정창수, 토론토) 잡음 안 들림, 심장이 약간 크긴 함
건강검진) 정창수에서 2년 전 안검 종괴 제거 위한 술전검사 (전해질, 15종)
그 이후 건강검진 없음
체중) 항상 비슷
다음다뇨) 물 많이 마시는 거 같진 않음, 소변 쏘쏘
식욕,활력) 특이사항 없음
배뇨) 어제 공원 3바퀴 돌고 소변 보니까 혈뇨 있었음
아침에 일어나서 본 거랑 비교해보니 괜찮음
보통 밖에서 싸면 혈뇨 나옴
귀) 긁음, 이전에 약 먹은 적들 있음
간식) 따로 주는 것 같음
근골격계) 다리 수술해야한다 들었음, 왼쪽이 더 안 좋음
기침, 재채기) 가끔 컥컥거림, 자기 전 - 빈도 잦아지진 않음 - 요새 거의 안함
닥터독에서 기관협착 있다고 들었음, 호흡 가빠지거나 힘든 것 없음
0)
1. 신체검사
청진 양호 (매번 올 때마다 청진해봐야할듯)
혈압 양호 (Rt fore, #3)
좌측 사타구니 mass : 지방종 추정
슬개골 탈구 (좌2~3, 우2)
양측 귓바퀴 발적
- 눈 주변, 코 주변 발적
·좌안 상안검 mass, 우안 상안검??
지간 착색 미약
- 그 외 피부 양호
2. 혈액검사
1) CBC
2) Chem15: ALKP 상승 (12/2, 12/16 접종 - 넥스가드는 2달 정도 전부터 안 먹음)
3) SDMA: 11
4) 4Dx: negative
3. 영상검사
1) 방사선 : VHS 10.5, 간비대, 신장 결석
2) 초음파 : 간비대, 간 음영 양호, 담낭 양호 (슬러지 소량?), 위 양호, 비장 고에코 결절
양측 신장 피질 에코 상승 및 미네랄화, 양측 신장 결석, 좌측 부신 크기 양호
방광벽 비후, 방광 슬러지 소량, 방광 결석 다수
(좌측 신장 cyst? 자꾸 헥헥거려서 잘 확인 안됨)
4. 소변검사
- 잠혈, 방광염
A) 신장결석, 방광결석, 방광염, 양측 슬개골 내측 탈구, 비장 결절, 신장 노화
ddx) 간담도계 질환, 만성 신부전
Tx) 귀 에피오틱 세정 후 오토맥스
Rx)
내복약 28일치
Sily 5, UDCA 7.5 BID
P) 4주 후 간수치 (간수치 상승했을 시 간담도계 초음파 및 우측 부신 확인)
C/E)
- 6개월 단위 신장 검사 권장 (신장 4종, SDMA, 신장초음파 (이때 비장 노듈도 같이)
*ALKP상승 관련된 원인 확인 필요
Objective
폴더 미지정
plusvetm_gallery_pet_8094_20260106_100... plusvetm_gallery_pet_8094_20260106_100... plusvetm_gallery_pet_8094_20260106_100...
TEMPERATURE COMPENSATED
URINE SIG
DOG CAT
1.000 14
LARGE AVAMALS 1.060 13
1050 12
1.050 11
1.040 10
1.040 9
1000 8
1.030 7
1000 6
1.020 5
1010 4
1010 3
1.000 SERIM 2
1.000 OH PLALAIA 1
PROTEIN
Pabert Tame
MIOMARK
Cardell Insight
160/134
(144) 162
영동제작
140
plusvetm_gallery_pet_8094_20260106_100... plusvetm_gallery_pet_8094_20260106_100... plusvetm_gallery_pet_8094_20260106_110...
Petart Tane
MIOMARK
Cardell Insight
134/81
(117) 80
사랑
Plan
항목 경로 Qty 단위 일투 일수 사용량 담당의
건강검진-Premium 1 회 1 박현지
IDEXX-SDMA 1 회 1 박현지
내복약-1일(10Kg이하) 28 회 28 박현지
1번 그룹
Silymarin Cap. (실리마린, 실리로) PO 5 mg/kg 2 28 8.5 박현지
UDCA Tab. PO 7.5 mg/kg 2 28 9.5 박현지
진단 검사 결과
일산 클래식 동물병원
보호자 성함 이은서
경기도 고양시 일산동구 중앙로 1124, 이마트 1층 전용관(백석동, 흰돌마을 1단지) | 031-902-1375
동물 등록 번호 8094
동물명 사랑이
연락처 010-2450-9336
축종/품종 개/말티즈
주소 경기도 고양시 일산서구 중앙로1542
나이 14Y 7M
성별 중성화 수컷
진단 결과 추이
일산 클래식 동물병원
보호자 성함 이은서
경기도 고양시 일산동구 중앙로 1124, 이마트 1층 전용관(백석동, 흰돌마을 1단지) | 031-902-1375
동물 등록 번호 8094
동물명 사랑이
연락처 010-2450-9336
축종/품종 개/말티즈
주소 경기도 고양시 일산서구 중앙로1542
나이 14Y 7M
성별 중성화 수컷
*선택하신 검사 결과 중 최대 20개의 결과를 날짜순으로 나열합니다.
Biochemical Analysis(생화학 분석) | Catalyst One
항목 정상 범위 26.02.10 09:44
ALKP 23~212 (U/L) ↑ 1374
ALT 10~125 (U/L) 73
AST 0~50 (U/L) 33
GGT 0~11 (U/L) 4
CBC(전혈구 검사) | HORIBA LC662G
항목 정상 범위 26.01.06 09:44
WBC 6~12 (10×9/L) 9.1
RBC 5.5~8.5 (10×12/L) 7.47
HGB 12~18 (g/dL) 15.2
HCT 37~55 (%) 48.8
MCV 60~77 (fL) 65.3
MCH 17~23 (pg) 20.4
MCHC 32~36 (g/dL) ↓ 31.2
RDW 14~17 (%) 14.2
PLT 200~500 (10×3/μL) ↑ 564
MPV 6.7~11.1 (fL) 8.9
PCT 0~2.9 (%) 0.504
PDW 0~50 (%) 15.9
LYM (#) 1~4.8 (10×9/L) 1.7
LYM (%) 12~100 (%) 18.3
MON (#) 0.15~1.35 (10×9/L) 0.4
MON (%) 3~100 (%) 4.7
GRA (#) 3~10 (10×9/L) 7
GRA (%) 60~100 (%) 77
EOS (#) 1~12.5 (10×10/L) ↓ 0.3
EOS (%) 2~100 (%) 2.9
Kit(키트 검사) | SNAP Pro
항목 정상 범위 26.01.06 09:55
AP_spp 0~0(-) NEG(2)
EC-EE 0~0(-) NEG(2)
HW 0~0(-) NEG(2)
Lyme 0~0(-) NEG(2)', '', 'f'::boolean, '4'::integer, '2026-04-07 07:10:07.847622+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '4190cb0d-998c-4838-ab86-f1012facdeed'::uuid, '936450a1-deeb-43ed-91a4-7e8a8ad15977'::uuid, '2026.02.13 09:54', 'Subjective
CC: kvl검사결과
칼옥스 처방 1T/day
Objective
폴더 미지정
kvl검사결과_-_사랑이1 plusvetm_gallery_pet_8094_20260213_101... plusvetm_gallery_pet_8094_20260213_1011...
AKVL
일산클래식동물병원(고양시)
Urinalysis
Plan
항목 경로 Qty 단위 일투 일수 사용량 담당의
(직원용) 마이너스 1 회 1 김도희
새 그룹
벳앤펫 결석케어 칼옥스 PO 1 EA 1 1 1 박성원', '', 'f'::boolean, '0'::integer, '2026-04-07 07:10:07.847622+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '4f5ff467-b0a5-47e4-8a26-c900f30acb9c'::uuid, '936450a1-deeb-43ed-91a4-7e8a8ad15977'::uuid, '2026.02.10 09:51', 'Subjective
CC: 간수치재진
Hx)
○)
청진 양호
혈압 양호 (Rt fore, #3)
좌측 사타구니 mass : 지방종 추정
·슬개골 탈구 (좌2~3, 우2)
양측 귓바퀴 발적
- 눈 주변, 코 주변 발적
·좌안 상안검 mass, 우안 상안검??
- 지간 착색 미약
- 그 외 피부 양호
방사선 : VHS 10.5, 간비대, 신장 결석
- 초음파 : 간비대, 간 음영 양호, 담낭 양호 (슬러지소량?), 위 양호, 비장 고에코 결절
양측 신장 피질 에코 상승 및 미네랄화, 양측 신장 결석, 좌측 부신 크기 양호
방광벽 비후, 방광 슬러지 소량, 방광 결석 다수
26/2/10 확인시 우측 부신 크기 5~6mm)
(좌측 신장 cyst? 자꾸 헥헥거려서 잘 확인 안됨)
A) 신장결석, 방광결석, 방광염, 양측 슬개골 내측 탈구, 비장 결절, 신장 노화
ddx) 간담도계 질환, 만성 신부전
Tx) 귀 에피오틱 세정 후 오토맥스
Rx)
내복약 2일치
Sily 5→7.5, UDCA 7.5→10, Lefotil 0.25T BID
P) 수술 이후 간수치 확인 일정 결정 (2주 정도 내외로)
수술 당일에 간에 좋은 것들 수액에 타야함
C/E)
- 6개월 단위 신장 검사 권장 (신장 4종, SDMA, 신장초음파 (이때 비장 노듈도 같이)
*ALKP상승 관련된 원인 확인 필요
Objective
폴더 미지정
plusvetm_gallery_pet_8094_20260210_101...
Plan
처치실
항목 경로 Qty 단위 일투 일수 사용량 담당의
혈액검사-간 1 회 1 박현지
내복약-1일(10Kg이하) 2 회 2 박현지
(직원용) 마이너스 1 회 1 김도희
1번 그룹
Silymarin Cap. (실리마린, 실리로) PO 7.5 mg/kg 2 2 1 박현지
UDCA Tab. PO 10 mg/kg 2 2 1 박현지
Lefotil Tab. PO 0.5 T/day 2 2 1 박현지', '', 'f'::boolean, '2'::integer, '2026-04-07 07:10:07.847622+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '42846d4a-dc96-4a01-b2a4-358f9ab0c9b2'::uuid, '41f0abe5-0d6c-41d9-aef0-0c984673cc32'::uuid, '2026-03-16 14:14:33', 'Subject
CC : 검진결과
사료(식이섬유)/유산균/오메가3, 6월-수치재검(CK,CBC)
배변을 할때 배변이 딱딱하고 토끼똥으로 나옴.
사냥놀이 뛰어놀고 난 후 헐떡임, 개구호흡 증상,
-평소에 숨 쉴때 가파른 호흡을 보일때가 있음.
-애기때 귀가 안좋다고 하셨어서 바르는 약 1달정도 바른적이 있었음. 눈도 마찬가지(뿌리는안약 1-2달사용)
개구호흡을 하는 경우가 간혹 있음
활식변뇨 특이사항 없음, 변이 딱딱한 편
- 음식 섭취: 하루에 평균 35g먹다가 최근 몇일 16-28g 섭취중, 조금씩 천천히 나눠먹는편
,
어릴 때 샵에서 입양, alone
- 사료: 일반 사료(힐스 퍼펙트 다이제스천 치킨& 힐스 어덜트 유리너리헤어볼 습식: 퓨리나 펜시피스트 연어, 쉬바 참치맛)
- 간식 : 일반 시중 간식(이나바 종류별로,닥터펠리스, 프로젝트21 간식, 페스룸 등등), 영양제(묘견서오메가3 미니, 버디부 케어샷(구강)
프로젝트21 하루채움 츄르, 비오덴트 오랄케어, 인트라젠 플러스(장), 닥터펠리스 데일리솔류션 가루형(기호성X 라 요즘은 중단), 퓨리
나 유산균, 하이드라케어(음수량))
- 알레르기 없음
- 수술 경험: 없음
- 만성질환 여부: 없음
- 복용하는 약:
aus NRF
mild tartar, 부정교합
OU NRF, 결막부종 미약한 정도
AU 귀지 ++
x-ray - 요척골만곡심한편
CE)
개구호흡 관련 폐 특이소견 없음, BNP 정상
관절-유전적 요인 주의, 1년에 1번 다리 x-ray 체크 권고
변비-혈검결과 이상 없으면 유산균/식이관리 고려
cbc, CK 수치 재검 - 특이사항 없으면 3개월 뒤
Object
Result
Part
Title
Sign', '', 'f'::boolean, '0'::integer, '2026-04-07 07:26:50.033218+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'e687a35f-25a2-4cd2-8a03-3040b00f7137'::uuid, '41f0abe5-0d6c-41d9-aef0-0c984673cc32'::uuid, '2026-03-06 17:25:21', 'Subject
CC : 건강검진 - 기본
결과상담
배변을 할때 배변이 딱딱하고 토끼똥으로 나옴.
사냥놀이 뛰어놀고 난 후 헐떡임, 개구호흡 증상,
-평소에 숨 쉴때 가파른 호흡을 보일때가 있음.
-애기때 귀가 안좋다고 하셨어서 바르는 약 1달정도 바른적이 있었음. 눈도 마찬가지(뿌리는안약 1-2달사용)
개구호흡을 하는 경우가 간혹 있음
활식변뇨 특이사항 없음, 변이 딱딱한 편
- 음식 섭취 : 하루에 평균 35g먹다가 최근 몇일 16-28g 섭취중, 조금씩 천천히 나눠먹는 편
어릴 때 샵에서 입양, alone
- 사료: 일반 사료(힐스 퍼펙트 다이제스천 치킨& 힐스 어덜트 유리너리헤어볼 습식: 퓨리나 펜시피스트 연어, 쉬바 참치맛)
· 간식: 일반 시중 간식(이나바 종류별로,닥터펠리스, 프로젝트21 간식, 페스룸 등등), 영양제(묘견서오메가3 미니, 버디부 케어샷(구강)
, 프로젝트21 하루채움 츄르, 비오덴트 오랄케어, 인트라젠 플러스(장), 닥터펠리스 데일리솔류션 가루형(기호성X 라 요즘은 중단), 퓨리
나 유산균, 하이드라케어(음수량))
- 알레르기 없음
- 수술 경험: 없음
- 만성질환 여부: 없음
- 복용하는 약:
aus NRF
mild tartar, 부정교합
OU NRF, 결막부종 미약한 정도
AU 귀지 ++
x-ray - 요척골만곡심한편
CE)
개구호흡 관련 폐 특이소견 없음, BNP 결과에 따라 심장체크
관절-유전적 요인 주의, 1년에 1번 다리 x-ray 체크 권고
변비-혈검결과 이상 없으면 유산균/식이관리 고려
26.3
간, 신장 수치 등 전반적인 혈액검사 결과가 정상범위로 확인됩니다.
심장 관련 BNP 수치, 신장의 이상을 조기에 확인하는 SDMA 수치, 췌장효소수치(fPL), 갑상선 수치(T4)도 정상 범위로 확인됩니다.
Object치 감소
경도의 치석과 부정교합이 관찰됩니다.
요척골 만곡
Result
Part
Title
Sign
진료수의사
No. R1L1503/06
19:15
e', '', 'f'::boolean, '1'::integer, '2026-04-07 07:26:50.033218+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '08e1dcd6-a461-45ba-ba8f-204725bb70ab'::uuid, '812e7fa9-b307-4df6-a11a-df0f7d1cee33'::uuid, '2026-03-14 09:10:37', 'Subject
CC : 중성화수술 상담 / 수컷으로 확인됨 / 스트레스완화제 가바100mg 캡슐째로 4개 / 2개더 선물 총 6T
성격이 조금 생겼다고함. 많이 울고 스트레스를 심하게 받는다고함
스트레스완화제
내원 전까지 하루한개 급여 안내
수첩은 두고 오셔서 다음에 적어드리기로
Object
Result
Part
Title', 'Plan
Sign
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
AA010
진료비 - 예약 할인
1
회
0
0
Sign ID
정희원
TXTEMP03513
스트레스완화제
4
0
0
정희원', 't'::boolean, '3'::integer, '2026-04-07 08:30:00.193425+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '0b4bb371-a0e3-4a16-b21c-307fe4fbaccf'::uuid, '812e7fa9-b307-4df6-a11a-df0f7d1cee33'::uuid, '2026-04-04 10:33:33', 'Subject
CC : 3차접종 중성화수술 상태 체크 -> 우는 증상 호전 보였다고함, 스트레스도 덜 받는다고함
수첩놓고오셔서 다음에진행
A/A 먹으면서 접종 아주 잘함
Object
Result
Part
Title
Sign
KakaoTalk_20260404_140858055
정희원
KakaoTalk_20260404_140852875', '', 'f'::boolean, '0'::integer, '2026-04-07 08:30:00.193425+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '11872a5a-8046-461d-846e-b7f15351d961'::uuid, '812e7fa9-b307-4df6-a11a-df0f7d1cee33'::uuid, '2026-03-21 08:49:36', 'Subject
CC : 드레싱 상태양호 심장사상충 기생충 예방
Object
Result
Part
Title
Sign', '', 'f'::boolean, '1'::integer, '2026-04-07 08:30:00.193425+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '15b49cc1-6a7e-4b7a-bc4a-584adf7de233'::uuid, '812e7fa9-b307-4df6-a11a-df0f7d1cee33'::uuid, '2026-02-20 16:38:11', 'Subject
CC : 기본진료 / 접종은 다음에. 애드보킷. 수첩만들어드림
새벽이는 철원 부대에서 구조되어 보호자가 처음 입양한 반려동물임. 현재 건강 상태는 양호해 보이며, 기생충 예방을 위해 외부기생충 약을
등 부위에 도포함. 이동 스트레스를 고려해 접종은 다음 주에 시행하기로 계획함. 보호자는 반려동물 양육 경험이 없으며, 귀 청소 등 기본
관리 방법은 추후 안내 예정임-
(s.
주호소: 새벽이를 구조하여 처음 데려왔음.
증상 발현 시점 및 빈도: 방금 데려옴.
과거 병력: 이전에 키워본 경험 없음.
투약 및 예방 이력: 접종 및 기생충 예방 모두 하지 않음.
생활 환경 및 동거 동물: 철원 부대에서 구조, 어미와 형제들이 있었으나 모두 분양됨.
기타: 보호자는 반려동물 양육 경험이 없으며, 오늘 처음 새벽이를 만남.
(0.
- Skin/Ear
- 귀 상태 확인함(특이 소견 언급 없음)
- UnclassifiedFindings
- 건강 상태는 괜찮은 것으로 보임
• P)
[치료 계획]: 외부 및 내부 기생충 예방을 위해 등에 바르는 약을 도포함.
[고객 교육]: 이동으로 인한 스트레스가 있을 수 있으므로 오늘은 접종을 하지 않고 다음 주에 접종하는 것이 좋음. 집에서 변 상태를 잘 관찰
해야 하며, 이상이 있으면 연락해야 함. 내부 기생충 예방 약을 도포한 후 회충 등이 나올 수 있으니 너무 놀라지 않아도 됨. 추후 귀 청소 등
관리 방법을 안내할 예정임.
Object
Result
Part
Title
Sign
정희원', '', 'f'::boolean, '6'::integer, '2026-04-07 08:30:00.193425+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '3cfd15fb-6889-4e2f-b04a-60c88bf98bd1'::uuid, '812e7fa9-b307-4df6-a11a-df0f7d1cee33'::uuid, '2026-03-17 19:28:51', 'Subject
CC : 중성화수술 / fsaa 만원에 진행 / FIV FeLV 무료 / 넥카라, 젤리믹스 선물
염증수치 상승, 담낭수치 상승
FIV / FeLV 음성
Object
Result
Part
Title
Sign
정희원
Assessment
Plan
FINA
OS
새벽
OT
S
Type
Diagnosis
DX
중성화 수술
Sign ID
정희원', 'Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
GF015
수술-산과-중성화수술(Male)
1
회
0
0
정희원
HA021
수액-일반3
1
회
0
0
정희원
CA003
지속형 염증주사제(키로그람당)
3
회
0
0
정희원
EAB002
검사-혈액(혈청)-Chemistry(기본혈액검사)
1
회
0
0
정희원
EAA003
검사-혈액(혈구)-CBC2
1
회
0
0
정희원
TREATTX-0000-00046
심장병인자검사
1
회
0
0
정희원
3
검사- 급성염증인자측정
1
회
0
0
정희원
EG011
02.검사-X-ray-단순방사선촬영B(
1
회
0
0
정희원
니
EG013
04.검사-X-ray-추가
1
0
0
정희원
FA011
마취-호흡(5kg 이하)
1
회
0
0
정희원
8806498019225
부토판주사2밀리그람/밀리리터(주석산부토르
1
EA
1
1
IM
정희원
8806718050854
프리폴-엠시티주(프로포폴) (20ml)
0
ml
1
1
IV
정희원', 't'::boolean, '2'::integer, '2026-04-07 08:30:00.193425+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '517c54bd-1b2b-4445-949b-d275eb13e718'::uuid, '812e7fa9-b307-4df6-a11a-df0f7d1cee33'::uuid, '2026-02-28 14:55:01', 'Sign
Subject
CC : 1차접종 / 귀청소 방법 / 발톱 깎는 방법 알려드림
컨디션 양호
중성화 시기 여쭤보셔서 접종 끝나고 상태체크 권장드림
Object
Result
Part
Title
Sign
정희원', '', 'f'::boolean, '5'::integer, '2026-04-07 08:30:00.193425+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '69beeb82-40fa-4062-88a1-50bb68862962'::uuid, '812e7fa9-b307-4df6-a11a-df0f7d1cee33'::uuid, '2026-02-28 15:20:55', 'Subject
CC : 다음에 오시면 성별 확인
Object
Result
Part
Title', '', 'f'::boolean, '4'::integer, '2026-04-07 08:30:00.193425+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '1e0d837a-38d3-407b-8ace-42c74f300a39'::uuid, '161b389e-faae-429e-b821-15d65fc6ec70'::uuid, '2026-03-06 16:17:37', 'Subject
CC : 건강검진-기본, 항체검사
양치(교육)/이물주의/다음주결과상담/접종일정
이물섭취 이력 있음, 며칠 전에도 물티슈 뜯어먹었다가 토했음
안약, 눈세정제 사용 중, 눈, 귀상태 약 사용후 개선
활식변뇨 특이사항 없음
no vdsc
어릴 때 펫샵 입양, alone
식이 : 디어니스트키친, 간식 여러가지
- 산책 횟수: 주 6~7회
HWP NG 먹이는 중
aus NRF
mild-moderate tartar
OU 결막상태 개선
MMC pink, CRT 1s
AU NRF
Rx)
ear oint sid
tobra OD tid
CE)
눈/귀 상태 모두 개선
올해말 스케일링 고려
항체검사 결과 기관지염 제외 나머지 접종 순차적으로 진행
Object
Result
Part
Title
Sign
진료수의사
33번 Multi-Antibodies 키트
마루의 검사 결과
Enter
2026년 3월 6일
하연 레포트 PDF
Canine 항제가 검사 6종
검사항목
Antibody Titer
결과
Parvovirus
25
약양성
Distempervirus
3.0
덕양성
Coronavirus
1.6
덕양성
Adenovirus
2.6
약양성
Influenzavirus
1.6
역양성
B. Bronchiseptica
양성
결과해석
Titer <10
음성
10 Titer <3.0
약양성
해당 병원체에 대한 항체 보유량이 부족하므로 예방접종이 지
시됩니다.
30 Titer <5.0
영성
해당 병원체에 대한 항체가 약양성으로 확인되었으며, 일정
수준의 항체를 보유하고 있는 것으로 판단됩니다.
505 Titer
강양성
해당 병원체에 대해 충분한 양의 항체를 보유하고 있습니다.
해당 병원체에 대한 항체 반응이 매우 강합니다.
No. R19L1/03/06
12 1918:15', '', 'f'::boolean, '1'::integer, '2026-04-08 01:19:47.242759+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'b903ad15-02e1-4f20-acb9-a00d80f5e8db'::uuid, '161b389e-faae-429e-b821-15d65fc6ec70'::uuid, '2026-03-10 17:44:10', 'Subject
CC : 결과상담, 접종
양치(교육)/이물주의/접종안내/접종일정
5월-수치재검(간/심장/CBC)
활식변뇨 특이사항 없음
no vdsc
어릴 때 펫샵 입양, alone
식이 : 디어니스트키친, 간식 여러가지
- 산책 횟수: 주 6~7회
HWP NG 먹이는 중
aus NRF
mild-moderate tartar
OU 결막상태 개선
MMC pink, CRT 1s
AU NRF
CE)
눈/귀 상태 모두 개선
올해말 스케일링 고려
cbc/간/심장수치 등 추후 재검 - 5월
항체검사 결과 기관지염 제외 나머지 접종 순차적으로 진행
26.3
신장 수치와 SDMA(조기신장마커), 췌장효소수치(CPL), 갑상선 수치(T4)도 정상 범위로 확인됩니다.
심장 관련 BNP 수치의 경도 상승이 관찰됩니다. 심장초음파 검사가 추천되며 향후 재검이 권장됩니다.
일부 간수치의 상승이 관찰됩니다. 간보조제가 권장되며 향후 재검이 추천됩니다.
양측 눈에서 경도의 결막 충혈이 관찰되나 지난 검진시보다 개선된 것으로 확인됩니다. 눈곱이 끼거나 눈 충혈이 심해지지 않는지 모니터링
해 주시고 증상이 있는 경우 내원해 주세요.
중등도의 치석이 관찰됩니다. 양치질과 주기적인 스케일링으로 치아를 관리해 주세요.
Object
Result
Part
Title
Sign', '', 'f'::boolean, '0'::integer, '2026-04-08 01:19:47.242759+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'b13d4c86-b69d-4d30-a449-950111654748'::uuid, '875632e0-b225-49c2-ad2c-5a32122d1e6f'::uuid, '2026-04-01 16:50:56', 'Subject
CC : 건강검진-기본
1주재-결과상담/사상충
활식변뇨 양호
보호소에서 입양 당시 링웜있어 치료 받은 내역있음. 이후 아픈 적 없었음.
양치는 잘 못 해 주심.
한달에 한두번 간혹 털 섞인 구토.
접종은 어릴 때 이후 못해주심 사상충 예방도 못해주심.
aus NRF
OU 수정체 혼탁
AD 귀지 +
mmc pink CRT 1s
중등도 치석, 치은염
CE)
결과상담
접종/사상충 안내
▶ 입양경로: 보호소
- 사료: 일반 사료(로얄캐닌 덴탈)
- 간식: 일반 시중 간식(템테이션츄르)
- 산책 횟수: 거의 나가지 않음
- 산책 경로:, 기타(없음 산책안함)
- 2년 내 예방 접종: 접종 안 함
- 3개월 내 기생충 구충 예방 안 함
Object
Result
Part
Title
Sign
김혜정
IntoCNS_000027
IntoCNS_000026
IntoCNS_000025
IntoCNS_000024
IntoCNS_000023
IntoCNS_000022
IntoCNS_000021
IntoCNS_000020
IntoCNS_000019
IntoCNS_000018
IntoCNS_000017
IntoCNS_000016
IntoCNS_000015
IntoCNS_000014
IntoCNS_000013
IntoCNS_000012
IntoCNS_000011
IntoCNS_000010
IntoCNS_000009
IntoCNS_000008
IntoCNS_000007
IntoCNS_000006
IntoCNS_000005
IntoCNS_000004
IntoCNS_000003
IntoCNS_000002
IntoCNS_000001
No. R17L1[04/01
1016:51
IntoCNS_000004
IntoCNS_000005
IntoCNS_000003
IntoCNS_000002', 'IntoCNS_000001
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0016-00002 건강검진 - 기본
1
회
0
0
전수민', 't'::boolean, '0'::integer, '2026-04-08 02:15:56.522046+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '04085a42-edd5-4476-a7ce-7d340bcffdcb'::uuid, '4ddf80b9-78ec-4eb4-8966-747ace19d079'::uuid, '2026-04-04 10:21:09', 'Subject
CC : 건강검진-종합, 뒷다리
호흡수체크/심장안내, 결과상담/약처방/스케일링
식이/변상태관찰/사진
약먹는동안 활식변뇨 특이사항없었음 약먹은 직후에 쩝쩝거리는 행동
활식변뇨 특이사항 없음 - 어제 연변, 오늘은 정상변
no vdsc
물잘 마시는 편
사료: 생식본능, 간식 캔
케이지무게 1.85
Vx. 최근X, HWP 주로여름에만
aus murmur
moderate tartar, gingivitis (21년도 스케일링)
OU NRF
AU 갈색귀지 +
피부 특이사항 없음
US 방광슬러지, 비장일부고에코부분
echo 심근비대, mild MR, LVOT
Rx) 캡슐 200
methimazole 1.1mg/cat(12T-5mg), sily 3(6T), udca 5(6T) bid for 28days
CE)
혈액검사 전반적으로 양호하나 BNP 수치 다시 오름. 호흡수 등 잘 체크하고 상태 양호하면 4월 종합검진 때 체크. 특이사항 있으면 검사 당
겨서
특이사항 없으면 3~4개월 단위 체크하기(CBC, T4, 간/산장수치, SDMA 등)
심장 잘 유지되는지 6개월 단위 관찰 권장
P
- 구토, 유연, 식욕부진, 호흡수, 황달 등 모니터링
- 내복약에 의한 피부 문제(탈모, 가려움증 등) 일어날 수 있으니 지속적인 모니터링
내복약에 의한 가장 치명적일 수 있는 혈구감소증(백혈구, 적혈구, 혈소판 등)을 모니터링 하기 위해 2주마다 CBC 체크
: 1달가량 수치 이상 없이 괜찮다면 한달로 검사연장
: 안정화되면 검사주기 3달
Object
Result
Part
Title
Sign
김혜정
1904구름
20260404_123011_지원_구름
신재검사 진단표 고
20260404_165737_수민_사진설명없음
20260404_165728_수민_사진설명없음
20260404_165730_수민_사진설명없음
IntoCNS_000027
IntoCNS_000026
IntoCNS_000025
IntoCNS_000024
IntoCNS_000023
IntoCNS_000022
IntoCNS_000021
IntoCNS_000020
IntoCNS_000019
IntoCNS_000018
IntoCNS_000017
IntoCNS_000016
IntoCNS_000015
IntoCNS_000014
IntoCNS_000013
IntoCNS_000012
IntoCNS_000011
IntoCNS_000010
IntoCNS_000009
IntoCNS_000008
IntoCNS_000007
IntoCNS_000006
IntoCNS_000005
IntoCNS_000004
IntoCNS_000003
IntoCNS_000002
IntoCNS_000001
IntoCNS_000001
No. R1L1704/04
11:04
IntoCNS_000004
IntoCNS_000003
IntoCNS_000002', 'IntoCNS_000001
Plan
Code
Treatment/Prescription
Qty
Unit
Day Total Route
Sign ID
TREATTX-0016-00003
건강검진 - 종합
1
회
0
0
김수빈
TREATTX-0000-00548
검사-X-ray(근골격 10kg 이하)
1
회
0
0
김수빈
TREATTX-0000-00700
수액 - 영양수액(5kg이하)
1
회
0
0
김수빈', 't'::boolean, '0'::integer, '2026-04-08 02:39:31.72066+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '7996543c-b2e8-41da-8216-019f465a1e7f'::uuid, 'ff350571-1c93-4fae-b24f-a11e26de124c'::uuid, '2026-03-28 10:24:28', 'Subject
CC : 건강검진-기본, 코막힘
안정제(2회분)/물많이, 체중관리/운동/유산균, 안연고ODsid, 피부소독-배/발꿈치
스케일링/코체크, 요검사(튜브)
코막힘이 자주 있음
혈뇨 없었음, 배뇨 원활, 물 잘 마셨음
활식변뇨 특이사항 없음
월 2회 내외 사료토, 헤어볼토 한번씩. 습식 늘리고선 변상태 개선됨
차타면 많이 불안해하고 야옹거리는 편 - 약 1알 사용시 뚜렷하게 개선됨
PHI: 허피스 감염이력
식이 힐스 어덜트 건사료, 쉬바 파우치, 과자 간식
어릴 때 길고양이 구조됨, 12월에 현 보호자분이 입양, alone
BCS 7/9
aus NRF
tracheal reflex neg
skin turgur normal
AU nrf
OU 유루증, 안검부종
양측 비공 충혈 및 코막힘
- FDT: 재채기하며 좌측비공 분비물 및 개통성 확인, 우측비공 확인X
MMC pale pink, CRT 1sec
moderate tartar
우측 입술 종괴(2mm)
하복부 유두 부근 피지
양측후지 정강이 탈모
Rx)
gaba 100 2회분
1.tobra, 2.ocuflox oint. OU tid
CE)
양측 비강점막 비후로 인한 코막힘 susp, 이로 인한 눈물량 증가 폴립 등 물리적폐색 배제불가
코막힘 심할 경우 단기간 스테로이드 내복약 사용 고려
올해 중 스케일링 권장 스케일링 시 비강 내부도 함께 체크 고려
양측 정강이 탈모, 하복부 피지 - 체중증가 원인 가능성 체중관리.
차량 이동시 스트레스 심한 편. 멀미약(gaba 100mg) 미리 챙겨가기로 함
Object
Result
Part
Title
Sign
이대호
1871 미우
تعليم
신사 전문 고양
IntoCNS_000008
IntoCNS_000007
IntoCNS_000006
IntoCNS_000005
IntoCNS_000004
IntoCNS_000003
IntoCNS_000002
20260328_122409_수민_사진설명없음
20260328_122410_수민_사진설명없음
20260328_122412_수민_사진설명없음
20260328_122414_수민_사진설명없음
20260328_122415_수민_사진설명없음
20260328_122417_수민_사진설명없음
20260328_122418_수민_사진설명없음
20260328_122420_수민_사진설명없음
20260328_122421_수민_사진설명없음
20260328_122423_수민_사진설명없음
20260328_122406_수민_사진설명없음
IntoCNS_000021
IntoCNS_000020
IntoCNS_000019
IntoCNS_000018
IntoCNS_000017
IntoCNS_000015
IntoCNS_000016
IntoCNS_000014
IntoCNS_000013
IntoCNS_000012
IntoCNS_000011
IntoCNS_000010
IntoCNS_000009
IntoCNS_000008
IntoCNS_000007
IntoCNS_000006
IntoCNS_000005
IntoCNS_000004
IntoCNS_000003
IntoCNS_000002
IntoCNS_000001
No. R1
10:40
IntoCNS_000006
IntoCNS_000005
IntoCNS_000004
IntoCNS_000003
IntoCNS_000002', 'IntoCNS_000001
Plan
Code
Treatment/Prescription
Qty
Unit
Day Total
Route
Sign ID
TREATTX-0016-00002
건강검진 - 기본
1
회
0
0
김수빈
EC-004
검사-초음파-복부
1
회
0
0
김수빈
TREATTX-0006-00003
검사-X-ray 기본2컷(10kg 이하)
1
회
0
0
김수빈
TREATTX-0000-00534
내복약(특수1)
1
회
0
0
김수빈', 't'::boolean, '1'::integer, '2026-04-08 03:03:17.642868+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'c9b04b48-9218-4bfe-89e5-3d1a41896994'::uuid, 'ff350571-1c93-4fae-b24f-a11e26de124c'::uuid, '2026-04-04 12:12:32', 'Subject
CC : 결과상담
안정제(2회분)/물많이, 체중관리/운동/유산균, 안연고ODsid, 피부소독-배/발꿈치
스케일링/코체크, 요검사(튜브)
코막힘이 자주 있음
혈뇨 없었음, 배뇨 원활, 물 잘 마셨음
활식변뇨 특이사항 없음
월 2회 내외 사료토, 헤어볼토 한번씩. 습식 늘리고선 변상태 개선됨
차타면 많이 불안해하고 야옹거리는 편 - 약 1알 사용시 뚜렷하게 개선됨
PHI : 허피스 감염이력
식이: 힐스 어덜트 건사료, 쉬바 파우치, 과자 간식
어릴 때 길고양이 구조됨, 12월에 현 보호자분이 입양, alone
BCS 7/9
aus NRF
tracheal reflex neg
skin turgur normal
AU nrf
OU 유루증, 안검부종
양측 비공 충혈 및 코막힘
- FDT: 재채기하며 좌측비공 분비물 및 개통성 확인, 우측비공 확인X
MMC pale pink, CRT 1sec
moderate tartar
우측 입술 종괴(2mm)
하복부 유두 부근 피지
양측후지 정강이 탈모
Rx)
gaba 100 2회분
1.tobra, 2.ocuflox oint. OU tid
CE)
양측 비강점막 비후로 인한 코막힘 susp, 이로 인한 눈물량 증가 폴립 등 물리적폐색 배제불가
코막힘 심할 경우 단기간 스테로이드 내복약 사용 고려
올해 중 스케일링 권장 스케일링 시 비강 내부도 함께 체크 고려
양측 정강이 탈모, 하복부 피지 - 체중증가 원인 가능성 체중관리-
차량 이동시 스트레스 심한 편. 멀미약(gaba 100mg) 미리 챙겨가기로 함
26.4
혈구검사, 간, 신장 수치 등 전반적인 혈액검사 결과가 정상범위로 확인됩니다.
심장 관련 BNP 수치, 신장의 이상을 조기에 확인하는 SDMA 수치, 췌장효소수치(fPL), 갑상선 수치(T4)도 정상 범위로 확인됩니다.
양측눈에서 유루증과 안검부종이 관찰됩니다. 처방된 안연고를 꾸준히 점안해 주세요.
콧물과 코막힘이 확인됩니다. 온습도 관리에 유의하여 주시고 증상이 심해지는 경우 내복약 처방이 필요합니다.
중등도 치석이 관찰됩니다. 양치질과 주기적인 스케일링으로 치아를 관리해 주세요.
아래턱 입술점막에서 종괴가 관찰됩니다. 종괴의 사이즈가 커지거나 불편해하지 않는지 모니터링 해 주세요.
하복부에서 피지 축적이 관찰됩니다. 소독 등 적합한 방법으로 피부를 관리해 주세요.
양측 뒷다리 정강이쪽에서 탈모가 관찰됩니다. 탈모부가 넓어지거나 피부염이 발생하지 않는지 지켜봐 주세요. 체중 조절이 권장됩니다.
Object
Result
Part
Title
Sign
김수빈
20260404_170316_지수_사진설명없음
20260404_170317_지수_사진설명없음
20260404_170311_지수_사진설명없음
20260404_170313_지수_사진설명없음
20260404_170314_지수_사진설명없음', '', 'f'::boolean, '0'::integer, '2026-04-08 03:03:17.642868+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'd7703ad6-d380-4b12-9bdc-db4da97c5aed'::uuid, '9ed65e47-b711-4aed-a34a-42db249e57ca'::uuid, '2026-03-09', 'O)
- P/E
: no murmur, no lung sound
: BP190 ( #2)
: 치아 심한 치석
: 눈검사 - IOP(11,11) STT(19,19) , FDT(-,-) , 양안 핵경화 및 미약한 백내장

- 혈액검사
1) CBC
: mild anemia

2) Chem 15
: NRF

3) SDMA 
: 16

4) cPL 
: 377

- 뇨검사
1) 비중;1.015
2) 뇨스틱; NRF

- 방사선
: VHS 9.5 
: 양측 무릎 심한 관절염, 좌측 고관절 DJD 
: 간종대

- 초음파
-간 내 다수의 nodule 확인됨 /담낭슬러지/비장 특이소견없음
-양쪽 신장 ckd/방광 특이소견없음
-위장관 / 주위림프절 특이소견없음

P)
- 특이사항 있을 시 내원 예정  

CE)
- 아이 간내 종괴 확인되고 있어서 악성일 시 에는 기대수명 3-6개월 안내, 만약 양성일 시 생존기간 더 늘수 있음 안내
- 다리 불편감 있을때 내복약 처방 받으러 내원 안내', '', 'f'::boolean, '0'::integer, '2026-04-11 04:25:15.255332+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '80282ec5-be54-4059-88e8-265a8d80351d'::uuid, 'cf41a4eb-05d4-41a1-b412-7013f2defdfb'::uuid, '2026-01-23 08:53:07', 'Subject
CC : 심장진료-폐수종
심장안내/호흡수/물충분히, 응급안내, 약7bid(식전), 1주재-심장초음파
24년도에 건강검진 - 심장병 주의
켁켁거림이 최근 있는 편, 추위 많이 타는 편
활식변뇨 특이사항 없음
no vds
지인으로부터 입양, alone
Vx. HWP doing(먹는약)
- 사료, 조제 화식(골고루)
- 간식: 처방 간식(후코이단)
- 산책 횟수: 주 3~5회
- 산책 경로: 풀이 거의 없는 인도, 집 주변
- 유치원 방문 등: 방문하지 않음"
- 알레르기 없음
- 수술 경험: 없음
- 만성질환 여부: 없음
- 복용하는 약
aus murmur
severe tartar
tracheal reflex pos
MMC pink, CRT 1sec
원내 점액변 수회
Tx)
Furo 2mg/kg IV 2회, butor IV
Furo 2amp + N/S 36ml CRI 2.7ml/hr (= 1mg/kg/hr CRI) 1시간30분
-> 소변 다량1회, 체중 200mg 감소. 1.4ml/hr로 감량 30분
-> 중단
포타겔 PO
Rx)
pimo 0.4, furo 2, spiro 1.5 bid for 7days
CE)
심원성 폐수종에 준하여 이뇨제 처치 및 내복약 처방. 다음주 심장초음파
호흡수 체크, 물 충분히 급여 및 응급실 안내드림', '', 'f'::boolean, '3'::integer, '2026-04-13 06:38:26.930134+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '82e66339-16d8-437e-ae43-01a1f91d7fef'::uuid, 'cf41a4eb-05d4-41a1-b412-7013f2defdfb'::uuid, '2026-01-29 10:22:39', 'Subject
CC : 심장약처방
심장안내/호흡수/물충분히, 응급안내, 약7bid(식전), 1주재-심장초음파
아이 안데리고 오심, 약 짧게 추가처방 및 빠른시일내에 초음파 예약 요청하심
호흡수 20회 내외, 활력 개선됨
no vds
24년도에 건강검진 - 심장병 주의
켁켁거림이 최근 있는 편, 추위 많이 타는 편
활식변뇨 특이사항 없음
no vds
지인으로부터 입양, alone
Vx. HWP doing(먹는약)
- 사료, 조제 화식(골고루)
- 간식:, 처방 간식(후코이단)
- 산책 횟수: 주 3~5회
- 산책 경로: 풀이 거의 없는 인도, 집 주변
- 유치원 방문 등: 방문하지 않음"
- 알레르기 없음
- 수술 경험: 없음
- 만성질환 여부: 없음
- 복용하는 약
aus murmur
severe tartar
tracheal reflex pos
MMC pink, CRT 1sec
원내 점액변 수회
Tx)
Furo 2mg/kg IV 2회, butor IV
Furo 2amp + N/S 36ml CRI 2.7ml/hr (= 1mg/kg/hr CRI) 1시간30분
-> 소변 다량1회, 체중 200mg 감소. 1.4ml/hr로 감량 30분
-> 중단
포타겔 PO
Rx)
pimo 0.4, furo 2, spiro 1.5 bid for 7days
CE)
심원성 폐수종에 준하여 이뇨제 처치 및 내복약 처방. 다음주 심장초음파
호흡수 체크, 물 충분히 급여 및 응급실 안내드림', '', 'f'::boolean, '2'::integer, '2026-04-13 06:38:26.930134+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'e6fa2aff-0c16-499c-b81d-379aa4ef7c57'::uuid, 'cf41a4eb-05d4-41a1-b412-7013f2defdfb'::uuid, '2026-02-06 10:57:11', 'Subject
CC : 심장약처방-심초
심장안내/호흡수/물충분히, 응급안내, 약30bid(식전), 1달재
약 잘 먹고 컨디션 괜찮았음
1주 전 쯤 구토 한번
그외 활식변뇨 특이사항 없음, 음수량 160ml 정도?
지인으로부터 입양, alone
Vx. HWP doing(먹는약)
- 사료, 조제 화식(골고루)
- 간식:, 처방 간식(후코이단)
aus murmur
severe tartar
tracheal reflex pos
MMC pink, CRT 1sec
Rx)
pimo 0.4(15t), furo 2(9t), spiro 2(7t) bid for 30days
CE)
심원성 폐수종에 준하여 이뇨제 처치 및 내복약 처방
호흡수 체크, 물 충분히 급여 및 응급실 안내드림', '', 'f'::boolean, '1'::integer, '2026-04-13 06:38:26.930134+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'ea8ac0c6-7f2e-4571-916b-1ba6c8a90872'::uuid, 'cf41a4eb-05d4-41a1-b412-7013f2defdfb'::uuid, '2026-03-09 10:57:36', 'Subject
CC : 심장약처방
심장안내/호흡수/물충분히, 응급안내, 약30bid(식전), 1달재-4월혈검
5월심초
약 잘 먹고 컨디션 괜찮았음, SRR 13~14
최근 콧물, 켁하는 기침이 조금더 생겼음
활식변뇨 특이사항 없음, 음수량 160ml 정도?
지인으로부터 입양, alone
Vx. HWP doing(먹는약)
- 사료, 조제 화식(골고루)
- 간식:, 처방 간식(후코이단)
aus murmur
tracheal reflex pos
AU nrf
OU nrf
MMC pink, CRT 1sec
severe tartar
사지 지간발적
Rx)
pimo 0.4(15t), furo 2(9t), spiro 2(7t) bid for 30days
CE)
심원성 폐수종에 준하여 이뇨제 처치 및 내복약 처방
호흡수 체크, 물 충분히 급여 및 응급실 안내드림', '', 'f'::boolean, '0'::integer, '2026-04-13 06:38:26.930134+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '2e6a3fb4-b528-4e78-8751-82a8e114c159'::uuid, '96b9a12b-3bb2-49cc-93f0-82d77d7b854b'::uuid, '2026-03-13 14:26:55', 'Subject
CC : 켁켁거림, 거위소리
S)
HPI
: 한달정도 전부터
: 최근에 심해지고
: 흥분하면 심해지고
이런적이 처음
자고있을때도 숨이 좀 빠르고, 호흡음도 큼
GE : 식욕 활력 양호
GI: 구토 설사 업승ㅁ
UR: 음수 배뇨 정상
O)
AUS systolic murmur
VHS 13.2
폐침윤
Tx)
furo 3 times
Rx)
pimo
bena
furo 2
spiro
1 days
CE. P)
- 내일 심초 후 확진 예정
Object
Result
Part
Title
Sign', '', 'f'::boolean, '1'::integer, '2026-04-14 04:34:27.045388+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '72094631-f6e8-4b66-bc52-2b7e5ab3724f'::uuid, '96b9a12b-3bb2-49cc-93f0-82d77d7b854b'::uuid, '2026-03-14 16:48:58', 'Subject
CC : 심장초음파 검사결과 상담
0)
BW 2.9
severe MR
MVD
moderate TR
no AR, PR
LVIDdn 2.28
FS 587%
LA/Ao ratio 2.2
MPA/Ao ratio 0.9
PV max 78.4 cm/s
MRVmax 574 cm/s
E-peak 152 cm/s
A-peak 68.2 cm/s
TRVmax 324 cm/s
AVmax 73.5 cm/s
A)
MMVD C
low possibility PH
Tx)
none
Rx)
pimo
furo 2
bena
spiro
28 days
Ce. P)
-4주뒤 RC
: MINE score 12점 -> severe C -> 388 days
Object
Result
Part
Title
Sign', '', 'f'::boolean, '0'::integer, '2026-04-14 04:34:27.045388+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '24665d9c-6f0a-4510-a5e2-5a3812256585'::uuid, 'c9d466b7-1d1e-4fec-a7d6-39efa3be2d60'::uuid, '2026-02-07 14:41:07', 'Subject
CC : 피부병
타 병원에서 링엄진단 받고 6주정도 내복약 복용
차도 없음.
처음에는 원형으로 빠졌었는데 점점 번지면서 커짐.
많이 핥음.
사상충은 얼마전에 집에서 하심. 인터넷 구매제품.
0)
앞발~가슴까지 탈모, 발적, 진물
피부 괴사되어 딱딱하게 굳어있음.
우드램프 음성
A) 알러지성 피부염. 자창
ddx) chemical burn
괴사된 부위는 탈락 후 2기 유합으로 진행될 것으로 말씀드림.
Object
Result
Part
Title
Sign', '남기웅
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0001-00039
진료비-초진(Cat)
1
회
0
0
남기웅
TREATTX-0000-00054
외용제-소독약(spray)
1
회
0
0
남기웅
TREATTX-0000-00580
검사-피부검사 및 검경(피부)
1
회
0
0
남기웅
TREATTX-0000-00066
검사-피부-우드램프
1
회
0
0
남기웅
TREATTX-0000-00004
내복약-1일 2회(일반약, 5kg이하)
7
회
0
0
남기웅
ANB006
Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
7
14
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
7
14
PO
남기웅
ANI060
Prednisolone, prednisone (PDS) Tab.
0.5
mg/kg
7
14
PO
남기웅', 't'::boolean, '5'::integer, '2026-04-14 06:50:23.547848+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '455863d2-3d85-4861-8678-0d78d9191f5e'::uuid, 'c9d466b7-1d1e-4fec-a7d6-39efa3be2d60'::uuid, '2026-04-11 09:57:56', 'Subject
CC : 접종
P) PRD 후 간수치검사
Object
Result
Part
Title
Sign', '', 'f'::boolean, '0'::integer, '2026-04-14 06:50:23.547848+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '5b1134f2-e086-49c0-a61a-c6f37116c15e'::uuid, 'c9d466b7-1d1e-4fec-a7d6-39efa3be2d60'::uuid, '2026-03-21 10:30:42', 'Subject
CC : 피부약 2주치처방, 상담
약 용량 조절해서 받아가신다고 하심
P) PRD 후 간수치검사
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0002-00015
내복약-1일1회
14
회
0
0
남기웅
ANB006
Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
14
14
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
14
14
PO
남기웅
ANI060
Prednisolone, prednisone (PDS) Tab.
0.5
mg/kg
14
14
PO
남기웅', 't'::boolean, '1'::integer, '2026-04-14 06:50:23.547848+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'b2dfb835-d0e6-463c-b7fa-7cb69375155f'::uuid, 'c9d466b7-1d1e-4fec-a7d6-39efa3be2d60'::uuid, '2026-02-14 13:33:52', 'Subject
CC : 알러지성 피부염
간지러워하는 증상 감소.
변식활뇨 양호
사상충은 얼마전에 집에서 하심. 인터넷 구매제품.
0)
앞발~가슴까지 탈모, 발적, 진물
피부 erosion
주변부 피부괴사
A) 알러지성 피부염. 자창
피부괴사부분은 벗겨질 것으로 예상됨.
궤양부위는 중앙부터 피부 재생중
Object
Result
Part
Title
Sign', '남기웅
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00015
진료비-재진
1
회
0
0
남기웅
TREATTX-0000-00004
내복약-1일 2회(일반약, 5kg이하)
7
회
0
0
남기웅
ANB006
Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
7
14
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
7
14
PO
남기웅
ANI060
Prednisolone, prednisone (PDS) Tab.
0.5
mg/kg
7
14
PO
남기웅', 't'::boolean, '4'::integer, '2026-04-14 06:50:23.547848+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'd16968f1-a12a-40c4-84be-44de22939ec6'::uuid, 'c9d466b7-1d1e-4fec-a7d6-39efa3be2d60'::uuid, '2026-02-21 10:10:11', 'Subject
CC : 피부진료
간지러움증 아직 조금 있음.
0)
피부 많이 재생되었음.
CE) 2주정도면 완치될 것으로 보임
2주후 내원하여 tapering
Object
Result
Part
Title
Sign', '남기웅
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00015
진료비-재진
1
회
0
0
남기웅
TREATTX-0000-00004
내복약-1일 2회(일반약, 5kg이하)
14
회
0
0
남기웅
ANB006
Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
14
28
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
14
28
PO
남기웅
ANI060
Prednisolone, prednisone (PDS) Tab.
0.5
mg/kg
14
28
PO
남기웅', 't'::boolean, '3'::integer, '2026-04-14 06:50:23.547848+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'dec576fb-2174-468f-af27-8ee3f35acfe0'::uuid, 'c9d466b7-1d1e-4fec-a7d6-39efa3be2d60'::uuid, '2026-03-07 09:59:16', 'Subject
CC : 피부진료, 사상충
변식활뇨 양호.
피부재생 많이 진행되었음.
3cm정도 재생되지 않은 부분 남아있음
P) 2주후에는 PRD로 처방
2주 뒤 간수치검사.
소양감 재발시 cyclosporin고려
Object
Result
Part
Title
Sign', '남기웅
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00015
진료비-재진
1
회
0
0
남기웅
TREATTX-0002-00015
내복약-1일1회
14
회
0
0
남기웅
ANB006
Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
14
14
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
14
14
PO
남기웅
ANI060
Prednisolone, prednisone (PDS) Tab.
0.5
mg/kg
14
14
PO
남기웅', 't'::boolean, '2'::integer, '2026-04-14 06:50:23.547848+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '26ba0f51-88d5-4f7f-8ec4-1ff0f8aa1e17'::uuid, '8abba15f-12e2-4487-b374-616d7193c9e8'::uuid, '2026.02.05 15:24', 'Subjective
CC: 양안 백내장 수술 재진
OP) 26.02.04 양안 백내장 수술
S.
식욕 활력 양호
넥칼라 너무 큼
눈 불편증상 없었음.
Ο.
청진 양호 (양측 양호)
BCS 7/9
B/A: T4, crp 양호
DR; VHS 10.5
ERG; 양안 파형 양호 (우안은 파형 간섭 있었음)
menace: 양안 양호
PLR: +/+
Dazzle: +/+
안구 : 양안 양호
안검: 양안 양호
결막: 양안 양호
각막: 양안 양호
전안방: 양안 3+. 우안 피브린 형성 (낭내)
홍채: 양안 양호
수정체: 양안 IOL 유지중
망막: 양안 시신경, 혈관 반사도 양호
- 초음파: 양안 수정체 두께 양호, 유리체 양호
A.
STT (19,17), IOPVetplus2.0 (24-28,18-24)
양안) 미성숙/유전성 백내장
우안) 유리체 탈출증 ddx. 우안 수정체 아탈구
Rx. 레보스타 (6), 맥시트롤 (6), 프레드포르테 (6), 트루솝 (4)
CE.
술 후 관리 엄격히 하셔야 함.
안압 지속 상승 시 tPA 주사 가능성. 안압약 천천히 tapering 필요함. 증상 지속 시 녹내장 가능성
P.
- 토요일 재진
Objective
폴더 미지정
IMG_1018
IMG_1021
IMG_1022
IMG_1029
IMG_1033
IMG_1034
IMG_1039
IMG_1041
IMG_1043
IMG_1047
IMG_1051
IMG_1054
Plan
항목
경로
Qty
단위
일투
일수
사용량
담당의
진료비-재진료
1
회
1
박상은
안과신경검사
1
회
1
박상은
안과-안압검사 (재진)
1
회
1
박상은
안과-형광염색검사
1
회
1
박상은
안과(Slit Lamp검사)-재진
1
회
1
박상은
안과-안저검사
1
회
1
박상은', '', 'f'::boolean, '4'::integer, '2026-04-15 09:16:38.557552+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '4fb51db4-aa32-4b6c-bd86-b4a4a4e471db'::uuid, '8abba15f-12e2-4487-b374-616d7193c9e8'::uuid, '2026.01.29 19:08', 'Subjective
CC: 양안 백내장 재진, 술전 검사, ERG - 고양FM
HPI)
- 금식 완료
시력잇기는 함. 부딪히지는 않음
- 더잘 안보이는 것 같아서 수술 결정. 불편 증상은 없었음.
PHI)
-MED: x
-SUR: 중성화
-VAC: boosting (+), HWP (+)
-ENV: 실내, 단독
-Diet: x
- 3~4개월에 1회 경련 → MRI까지 촬영 하였으나 원인 확인인 되지 않음.
- 건강 검진 하신지 2달 정도 됨.
Ο.
청진 양호 (양측 양호)
BCS 7/9
B/A: T4, crp 양호
DR; VHS 10.5
ERG; 양안 파형 양호 (우안은 파형 간섭 있었음)
menace: 양안 양호
PLR: +/+
Dazzle: +/+
안구 : 양안 양호
안검: 양안 양호
결막: 양안 양호
각막: 양안 양호
전안방: 양안 플레어 없음. 우안 6시방향 유리체 탈출 소량
홍채: 양안 양호
- 수정체: 우안 미성숙 좌안 성숙 백내장
망막: 우안 초점 흐림, 좌안 관찰 불가
- 초음파: 양안 수정체 두께 양호, 유리체 양호
A.
STT (19,17), IOPVetplus2.0 (15,11)
양안) 미성숙/유전성 백내장
우안) 유리체 탈출증 ddx. 우안 수정체 아탈구
Rx.프레드포르테 (1)
CE.
백내장 안내문/ 우안 필요시 ctr 장착 가능성.
P.
2월 4일 금식 후 내원
Objective
폴더 미지정
IMG_0132
IMG_0133
IMG_0136
IMG_0139
IMG_0146
IMG_0147
IMG_0151
IMG_0153
IMG_0158
8469 토니
환자 보니 8469
테스트 시작: 2026년 1월 30일 오후 2:28
RETever
일번호:R001628
테스트 프로토: Scotopic 10 cd-s/m² Bright Flash
시작: 모후 2:49. 지속시간 시간 분
산클레식
환자 정보
생년월일: 2021년 11월 11일
보고서 생성: 2026년 1월 30일 오후 2:54
장치 정보
제조업체: LKC Technologies, Inc.
케어 버전: 2.10.2 기준 데이터: 2020.07 52e1a6e
전국: ERG-J
어동 적용
주연: 0.9cd/m²
-s/m² 0.33 0.33) 3:0.0 cd/m²
오른쪽 눈
왼족 눈
따
b
지
W
ms
W
12.2
-112
31.3
108
10.0
253
90.5
292
150
Plan
항목
경로
Qty
단위
일투
일수
사용량
담당의
진료비-재진료
1
회
1
박상은
안과신경검사
1
회
1
박상은
안과-안압검사 (재진)
1
회
1
박상은
안과-형광염색검사
1
회
1
박상은
안과(Slit Lamp검사)-재진
1
회
1
박상은
안과-안저검사
1
회
1
박상은
방사선 VD/LT (5kg~10kg)
2
회
2
박상은
혈액검사-처치-채혈
1
회
1
박상은
혈액검사-CBC
1
회
1
박상은
혈액검사-Catalyst(Chem15)
1
회
1
박상은
혈액검사-Catalyst(Lyte4전해질)
1
회
1
박상은
혈액검사-TT4
1
회
1
박상은
혈액검사-CRP
1
회
1
박상은
안과 - ERG (백내장 술전)
1
회
1
박상은
내복약-1일(10Kg이하)
3
회
3
박상은
안과 수술 예약금
1
회
1
박상은
술전검사 예약금(차감용)
1
회
1
박상은
1번 그룹
Cephalexin Cap.
PO
22
mg/kg
2
3
1.927
박상은
Prednisolone Tab. (PDS)
PO
0.25
mg/kg
2
3
2.19
박상은
Famotidine Tab.
PO
0.5
mg/kg
2
3
2.19
박상은
Gabapentin Cap.
PO
5
mg/kg
2
3
2.5
박상은
2번 그룹
처방-안약-프레드포르테(프레드니솔론, pred
Eye
1
drop
1
1
1
박상은
forte)', '', 'f'::boolean, '6'::integer, '2026-04-15 09:16:38.557552+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '68e5ed6e-d2ed-4d5a-9b86-776e339113ec'::uuid, '8abba15f-12e2-4487-b374-616d7193c9e8'::uuid, '2025.11.12 17:48', 'Subjective
CC: 양안 미성숙 백내장
S.
- 눈 3~4달 사이에 뿌얘짐.
- 눈 불편증상 없었음.
HPI)
PHI)
-MED: x
-SUR: 중성화
-VAC: boosting (+), HWP (+)
-ENV: 실내, 단독
-Diet: x
- 3~4개월에 1회 경련 → MRI까지 촬영 하였으나 원인 확인인 되지 않음.
건강 검진 하신지 2달 정도 됨.
menace: 양안 양호
- PLR: +/+
Dazzle: +/+
안구 : 양안 양호
안검: 양안 양호
결막: 양안 양호
각막: 양안 양호
전안방: 양안 플레어 없음. 우인 6시방향 유리체 탈출 소량
홍채: 양안 양호
수정체: 양안 미성숙 백내장 (우안<좌안)
망막: 우안 시신경, 반사도 양호해 보임. 좌안 초점 흐림
- 초음파: 양안 수정체 두께 양호, 유리체 양호
- STT (19,17), IOPVetplus2.0 (13,15)
A.
양안) 미성숙/유전성 백내장
우안) 유리체 탈출증 ddx. 우안 수정체 아탈구
Rx.
양안) 브로낙 (1)
CE.
백내장 안내문
백내장 진행 → 시력소실/염증 유발 가능성 안내드림.
- 수술 적극 권장 드렸음.
P.
- 수술 결정 시 금식 후 내원.
1달뒤 재진: 백내장 진행성 평가
- 충혈, 눈곱, 불편감 증상 시 당겨서 내원
Objective
폴더 미지정
IMG_4460
IMG_4470
IMG_4472
IMG_4478
IMG_4480
IMG_4488
.
IMG_4489
IMG_4497
IMG_4500
IMG_4503
IMG_4507
IMG_4511
IMG_4519
IMG_4522
IMG_4527
IMG_4576
IMG_4575
IMG_4547
IMG_4550
IMG_4553
IMG_4562
IMG_4563
Plan
항목
경로
Qty
단위
일투
일수
사용량
담당의
진료비-초진료
1
회
1
박상은
안과신경검사
1
회
1
박상은
안과-형광염색검사
1
회
1
박상은
안과-눈물분비량검사(schirmer tear
2
회
2
박상은
test[STT])
안과-안압검사-Tonovet
1
회
1
박상은
안과(Slit Lamp검사)-초진
1
회
1
박상은
안과(Slit Lamp검사)-처치후재검
1
회
1
박상은
안과-산동처치
1
회
1
박상은
안과-안저검사
1
회
1
박상은
안과-점안마취(알콘)
1
회
1
박상은
초음파-안과
1
회
1
박상은
초진 예약금(차감용)
1
회
1
박상은
1번 그룹
처방-안약-브로낙(bronuck, 브롬페낙나트륨수화
Eye
1
drop
1
1
1
박상은
물, NSAID)
진단 검사 결과
일산 클래식 동물병원
경기도 고양시 일산동구 중앙로 1124, 이마트 1층 전용관(백석동, 흰돌마을 1단지) | 031-902-1375
보호자 성함
전순이
동물명
토니
동물 등록 번호
8469
축종/품종
개/미니어처 푸들
연락처
010-4904-0827
나이
4Y 5M
주소
경기 고양시 덕양구 중앙로558번길 57 (햇빛마을18단지아파트)
성별
중성화 수컷', '', 'f'::boolean, '7'::integer, '2026-04-15 09:16:38.557552+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '6d5e577a-a216-4489-ab4d-1d0b5c32c21f'::uuid, '8abba15f-12e2-4487-b374-616d7193c9e8'::uuid, '2026.02.28 14:57', 'Subjective
CC: 양안 백내장 수술 재진 - FM고양AH
OP) 26.02.04 양안 백내장 수술
S.
활력 양호 불편증상 없었음.
Ο.
청진 양호 (양측 양호)
BCS 7/9
menace: 양안 양호
PLR: +/+
Dazzle: +/+
안구 : 양안 양호
안검: 양안 양호
결막: 양안 양호
각막: 양안 양호
전안방: 양안 플레어 trace+. 우안 cells 1+, 좌안 cells 2+ - 감소, 우안 피브린 흡수됨
홍채: 양안 양호
수정체: 양안 IOL유지중
망막: 양안 양호
- 초음파: 양안 수정체 두께 양호, 유리체 양호
A.
STT (19,17), IOPVetplus2.0 (14,11)
양안) 미성숙/유전성 백내장
우안) 유리체 탈출증 ddx. 우안 수정체 아탈구
Rx. 맥시트롤 (2)
CE.
백내장 안내문/ 우안 필요시 ctr 장착 가능성.
술 후 관리 엄격히 하셔야 함.
P.
- 1달 뒤 재진
Objective
폴더 미지정
IMG_1568
IMG_1571
IMG_1574
IMG_1581
IMG_1585
IMG_1593
IMG_1595
IMG_1599
Plan
항목
경로
Qty
단위
일투
일수
사용량
담당의
진료비-재진료
1
회
1
박상은
안과신경검사
1
회
1
박상은
안과-안압검사 (재진)
1
회
1
박상은
안과-형광염색검사
1
회
1
박상은
안과(Slit Lamp검사)-재진
1
회
1
박상은
안과-안저검사
1
회
1
박상은
새 그룹
처방-안약-맥시트롤(덱사+네오마이신+폴리믹신
Eye
1
drop
1
1
1
박상은
B)', '', 'f'::boolean, '1'::integer, '2026-04-15 09:16:38.557552+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '766d2414-5a62-42c0-81c5-3f1134d55a1c'::uuid, '8abba15f-12e2-4487-b374-616d7193c9e8'::uuid, '2026.03.28 09:52', 'Subjective
CC: 양안 백내장 수술 재진 - FM고양AH
OP) 26.02.04 양안 백내장 수술
S.
활력 양호 불편증상 없었음.
Ο.
청진 양호 (양측 양호)
BCS 7/9
menace: 양안 양호
- PLR: +/+
Dazzle: +/+
안구 : 양안 양호
안검: 양안 양호
결막: 양안 양호
각막: 양안 양호
전안방: 양안 플레어 없음, 좌안 플레어 trace cells 1+ - 감소
홍채: 양안 양호
수정체: 양안 IOL유지중
망막: 양안 양호
- 초음파: 양안 수정체 두께 양호, 유리체 양호
A.
STT (19,17), IOPVetplus2.0 (16,12)
양안) 미성숙/유전성 백내장 수술
우안) 유리체 탈출증 ddx. 우안 수정체 아탈구
Rx. 브로낙 (1)
CE.
백내장 안내문/ 우안 필요시 ctr 장착 가능성.
- 술 후 관리 엄격히 하셔야 함.
P.
- 2달 뒤 재진
Objective
폴더 미지정
IMG_0045
IMG_0048
IMG_0050
IMG_0054
IMG_0062
IMG_0063
IMG_0069
IMG_0071
Plan
항목
경로
Qty
단위
일투
일수
사용량
담당의
진료비-재진료
1
회
1
박상은
안과신경검사
1
회
1
박상은
안과-안압검사 (재진)
1
회
1
박상은
안과-형광염색검사
1
회
1
박상은
안과(Slit Lamp검사)-재진
1
회
1
박상은
안과-안저검사
1
회
1
박상은
새 그룹
처방-안약-브로낙(bronuck, 브롬페낙나트륨수화
Eye
2
drop
1
1
2
박상은
물,NSAID)', '', 'f'::boolean, '0'::integer, '2026-04-15 09:16:38.557552+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'd9f49103-7c46-4285-80a5-22b402ec766c'::uuid, '8abba15f-12e2-4487-b374-616d7193c9e8'::uuid, '2026.02.07 11:29', 'Subjective
CC: 양안 백내장 수술 재진
OP) 26.02.04 양안 백내장 수술
S.
활력 양호 불편증상 없었음.
Ο.
청진 양호 (양측 양호)
BCS 7/9
B/A: T4, crp 양호
DR; VHS 10.5
menace: 양안 양호
PLR: +/+
Dazzle: +/+
안구 : 양안 양호
안검: 양안 양호
결막: 양안 양호
각막: 양안 양호
전안방: 양안 플레어 2+. cells 2+ - 감소, 우안 피브린 유사
- 홍채: 양안 양호
수정체: 양안 IOL유지중
망막: 양안 양호
- 초음파: 양안 수정체 두께 양호, 유리체 양호
A.
STT (19,17), IOPVetplus2.0 (18,16)
양안) 미성숙/유전성 백내장
우안) 유리체 탈출증 ddx. 우안 수정체 아탈구
Rx. 레보스타 (6), 맥시트롤 (4), 프레드포르테 (4), 트루솝 (2)
CE.
백내장 안내문/ 우안 필요시 ctr 장착 가능성.
술 후 관리 엄격히 하셔야 함.
내복약 연장
P.
- 1주뒤 재진; 내복약 단약 고려
Objective
폴더 미지정
IMG_1996
IMG_1999
IMG_2007
IMG_2012
IMG_2019
IMG_2021
IMG_2025
IMG_2027
IMG_2031
IMG_2034
IMG_2037
Plan
항목
경로
Qty
단위
일투
일수
사용량
담당의
진료비-재진료
1
회
1
박상은
안과신경검사
1
회
1
박상은
안과-안압검사 (재진)
1
회
1
박상은
안과-형광염색검사
1
회
1
박상은
안과(Slit Lamp검사)-재진
1
회
1
박상은
안과-안저검사
1
회
1
박상은
내복약-1일(10Kg이하)
3
회
3
박상은
1번 그룹
Cephalexin Cap.
PO
22
mg/kg
2
3
2.086
박상은
Prednisolone Tab. (PDS)
PO
0.25
mg/kg
2
3
2.37
박상은
Famotidine Tab.
PO
0.5
mg/kg
2
3
2.37
박상은
Gabapentin Cap.
PO
5
mg/kg
2
3
2.5
박상은', '', 'f'::boolean, '3'::integer, '2026-04-15 09:16:38.557552+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'e60f1890-70d1-451e-93e3-ed7f8e416070'::uuid, '8abba15f-12e2-4487-b374-616d7193c9e8'::uuid, '2026.02.04 10:23', 'Subjective
CC: 양안 백내장 내원
OP) 26.02.04 양안 백내장 수술
: 양안 외안각 절개 후 진행, 좌안부터 진행
CCC 실시 후 phaco 실시함 (sculp-seg)
좌안 후낭 일부 파열 관찰됨, 우안 후낭파열 없음
IOL- (anieye 13'') 적용
안내 Dexa, 결막내 triam 주사 실시
양안 모두 수정체 motility 증가함 (우안이 좀더 심함)
안검봉합 1 knot 실시함
A.
양안) 미성숙/유전성 백내장
우안) 유리체 탈출증 ddx. 우안 수정체 아탈구
Rx. 레보스타 (6), 맥시트롤 (6), 프레드포르테 (6), 트루솝 (4)
CE.
백내장 안내문/ 우안 필요시 ctr 장착 가능성.
술 후 관리 엄격히 하셔야 함.
P.
- 1일뒤 재진
Objective
폴더 미지정
2026020413595885
2026020414001614
2026020414002421
2026020414004183
2026020414010694
2026020414011644
2026020414012036
2026020414013100
2026020414013377
2026020414015520
2026020414021789
2026020414024362
00
C
2026020414031920
2026020414035657
2026020414041263
8
2026020414043320
2026020414060028
2026020414062215
2026020414065710
2026020414072573
2026020414074617
2026020414074904
2026020414092205
2026020414093881
2026020414100575
2026020414112784
2026020414113640
8
8
2026020414114200
2026020414114687
2026020414114950
2026020414115538
2026020414115881
2026020414122397
2026020414123791
2026020414141492
2026020414163206
2026020414174016
2026020414180390
2026020414185941
2026020414214781
2026020414311995
2026020414315353
2026020414320076
2026020414322228
2026020414330802
2026020414334796
2026020414335574
2026020414341276
2026020414343524
2026020414344496
2026020414345157
2026020414351830
2026020414360463
2026020414371114
2026020414372430
2026020414381747
2026020414383584
2026020414385706
2026020414390790
2026020414401115
2026020414403470
2026020414413663
2026020414413809
2026020414414374
2026020414414524
2026020414414809
واه
2026020414415528
2026020414422532
2026020414423973
2026020414441419
2026020414461188
2026020414464697
2026020414480276
2026020414483407
2026020414510543
plusvetm_gallery_pet_8469_20260204_164...
plusvetm_gallery_pet_8469_20260204_164...
plusvetm_gallery_pet_8469_20260204_164...
로니♡♡
ky
2/4
수
입원 환자 관리표
백내장(0)
Ceferatin d
V
2개
付
29
박상은
자란 미성숙 백내장
약간 장 수술 이용수정해 상업B
원작과 주안의 내부학) 인어 위생관리 (4X)
기습니다.
습니다
습니
따줘 전 성명 및 동의 사람
위 내용에 대하여
들었으며,
이후 발생하는 추가적인 비용은 보호자 합니다.
2020년
그
7
스자전
Plan
항목
경로
Qty
단위
일투
일수
사용량
담당의
진료비-재진료
1
회
1
박상은
수액-정맥카테터장착비
1
회
1
박상은
수액-HS
1
회
1
박상은
주사-정맥주사(10kg이하)
3
회
3
박상은
향정-propofol
1
회
1
박상은
마취-호흡(5~10kg)
1
회
1
박상은
호흡마취 추가
1
회
1
박상은
마취-모니터링
1
회
1
박상은
수술-안과 백내장수술 (양안)
1
회
1
박성원
수술-안과-백내장수술 (인공렌즈삽입)
2
개
2
박성원
결막하주사
2
회
2
박성원
안과 수술 예약금(차감용)
1
회
1
박상은
수술-안과-안검봉합
2
회
2
박성원
내복약-1일(10Kg이하)
7
회
7
박상은
1번 그룹
Cephalexin Cap.
PO
22
mg/kg
2
7
4.805
박상은
Prednisolone Tab. (PDS)
PO
0.25
mg/kg
2
7
5.46
박상은
Famotidine Tab.
PO
0.5
mg/kg
2
7
5.46
박상은
Gabapentin Cap.
PO
5
mg/kg
2
7
6
박상은
2번 그룹
처방-안약-레보스타(levosta, levofloxacin, 레보
Eye
1
drop
1
1
1
박상은
플록사신, 항생제)
처방-안약-맥시트롤(덱사+네오마이신+폴리믹신
Eye
1
drop
1
1
1
박상은
B)
처방-안약-트루솝(trusopt, 도르졸라미드염산
Eye
1
drop
1
1
1
박상은
염, dorzolamide, 녹내장)
처방-안약-히아레인 0.3% (5ml)
Eye
1
drop
1
1
1
박상은
NeckCollar 넥칼라-20cm(보라)
1
EA
1
1
1
박상은', '', 'f'::boolean, '5'::integer, '2026-04-15 09:16:38.557552+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'fd9dd033-fad5-4c74-8847-34934023405a'::uuid, '8abba15f-12e2-4487-b374-616d7193c9e8'::uuid, '2026.02.14 11:12', 'Subjective
CC: 양안 백내장 수술 재진 - FM고양AH
OP) 26.02.04 양안 백내장 수술
S.
활력 양호 불편증상 없었음.
Ο.
청진 양호 (양측 양호)
BCS 7/9
menace: 양안 양호
PLR: +/+
Dazzle: +/+
안구 : 양안 양호
안검: 양안 양호
결막: 양안 양호
각막: 양안 양호
전안방: 양안 플레어 trace+. 우안 cells 1+, 좌안 cells 2+ - 감소, 우안 피브린 흡수됨
홍채: 양안 양호
수정체: 양안 IOL유지중
망막: 양안 양호
- 초음파: 양안 수정체 두께 양호, 유리체 양호
A.
STT (19,17), IOPVetplus2.0 (17,18)
양안) 미성숙/유전성 백내장
우안) 유리체 탈출증 ddx. 우안 수정체 아탈구
Tx.안검 봉합 발사
Rx. 레보스타 (4), 맥시트롤 (2), 프레드포르테 (2)
CE.
백내장 안내문/ 우안 필요시 ctr 장착 가능성.
술 후 관리 엄격히 하셔야 함.
P.
- 2주뒤 재진, 충혈, 눈곱 시 당겨서 내원
Objective
폴더 미지정
IMG_1714
IMG_1718
IMG_1720
IMG_1730
IMG_1733
IMG_1755
IMG_1760
IMG_1764
Plan
항목
경로
Qty
단위
일투
일수
사용량
담당의
진료비-재진료
1
회
1
박상은
안과신경검사
1
회
1
박상은
안과-안압검사 (재진)
1
회
1
박상은
안과-형광염색검사
1
회
1
박상은
안과(Slit Lamp검사)-재진
1
회
1
박상은
안과-안저검사
1
회
1
박상은
새 그룹
처방-안약-레보스타(levosta, levofloxacin, 레보
Eye
1
drop
1
1
1
박상은
플록사신, 항생제)
처방-안약-맥시트롤(덱사+네오마이신+폴리믹신
Eye
1
drop
1
1
1
박상은
B)
처방-안약-프레드포르테(프레드니솔론, pred
Eye
1
drop
1
1
1
박상은
forte)', '', 'f'::boolean, '2'::integer, '2026-04-15 09:16:38.557552+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '4498d974-30e7-4638-b387-b4dedb6e0770'::uuid, 'c97030ba-443b-4fe8-a4d0-952f93f599db'::uuid, '2026-04-11', 'Date: 2026-04-11
Purpose of visit: 초진-건강검진
Record User: 2
S.E
Date
Contents
2026-04-11 S)
- 뒷다리를 끌면서 걷는다고 함, 발견한건 어제라고 함, 잘 못걷는건 아닌데 잘 돌아다니다가 한번씩 끈
다고 함, 뒷다리를 드는 증상이 있음, 어제부터 시작됐음, 오늘은 잘 걸었다고 함, 난리를 쳐서 발톱을
못깎고 있다고 함
0)
- P/E
: no murmur, no lung sound
: BP100 (#3)
: 검이경 - 양측 특이사항 없음
: 미약한 치석, 치은염
: 다리 특이사항 없음, 좌측 다리 불편감 있어보임
- 혈액검사
1) CBC
: NRF
2) Chem 10
: NRF
- 방사선
: VHS 7,7
: 다리 특이사항 없음
- 초음파
-간/담낭/비장 특이소견없음
-양쪽 신장/방광 특이소견없음
-위장관/주위림프절 특이소견없음
P)
- 특이사항 있을 시 내원 예정
CE)
- 마이 치은염, 다리쪽 염좌로 생각되어 필요시 약처방 받으시러 오시라고 안내드림
O.E
Date
Findings
Contents
이비인후
2026-04-11
Normal
OE Chart Description
Value
Memo', 'Plan
Date
Description
Kg Dose t/d Day Qty Unit
Amount Doctor
2026-04-11 건강검진A - 기본(1-3세추천)
1 1 11 1
270,000원 김전모
2026-04-11
Catalyst_DX
0
1 1 1
1
0원 김전모
2026-04-11
단순방사선촬영 - 흡/복부4cut (~1
1
111
1
78,000원 김전모
2026-04-11 초음파검사- 복부(~10kg)
1
11 1
1
67,000원 김전모
2026-04-11 혈액검사 - Procyte One CBC
0
1 1 1
1
38,000원 김전모
2026-04-11 이나바 챠오츄르 가다랑어
0
2
1
1
2
8,000원 테크니션
Radiology Result
Client: 남혜린
Patient: 콩
202600172
Date: 2026-04-11
Purpose of visit: 초진-건강검진
Record User: 2
Radiology Date: 2026-04-11
Plan:
단순방사선촬영 - 흉/복부4cut (~10kg)
초음파검사-복부(~10kg)', 't'::boolean, '0'::integer, '2026-04-18 07:42:28.529861+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '2778e559-2174-4318-8336-0569fa6a77d7'::uuid, '0c2e3bf0-2ff1-4292-9e97-fd457326609a'::uuid, '2026.02.14 10:29', 'Subjective
CC : 리브레, 귀, 피부 확인
설 연휴 동안 보호자님 카톡 와있으면 저 알려주세요
Hx)
아직도 밥 잘 안 먹으려해서 닭가슴살 섞어주고 있음
밥만 주면 쳐다봄
넥카라로 어딘가 부비긴 함, 넥카라해도 뒷다리가 닿음 → 넥카라 17.5에서 20으로 변경
간이혈당기 구매함, 쓸 자신 없음
닥터힐메딕스 덴탈껌이랑 보조제 1개 (가져오셔서 성분 함량 확인함) 먹고 있음
O) 노란 귀지 소량, 얼굴 주변 피부 양호한편
Tx) 귀 에피오틱 세정
Rx) 휴물린 N, BD 주사기 : 아침 2.5, 저녁 3으로 변경
P) 안과 재진 보러 올 때마다 상태 확인
퇴근 전 연락 (아침 2.5, 저녁 3으로 변경할까 생각중) - 오후5시 연락 완료
C/E)
60아래로 떴을 때 간이혈당기 확인해보셔야함, 55아래면 먹을 것 소량 급여 후 30분 후 재측정, 괜찮을시 리브레 확인, 낮을시 먹을 것 추가 급여
- 그정도는 먹이셔도됨
Objective
폴더 미지정
clipboard
clipboard
plusvetm_gallery_pet_8678_20260214_105...
2월10일
수 2월11일
파
442 301
2월10일
215
2
242 217 288 213 254 347 336 336 204 250 231 134 115 110 91 54 142 162
2월11일 134
223
1
181 162 224 383 204 205 206 254 172 162 244 5500
2월12일
350
2월12일
233 204 295 345 30030603252073 2743 342 377 387 378 24
285 233 257 333 308 344 18 308 311400483300251 254 253 252 251 291 328 348 371 308 314
2월13일
31 308 384 382 13432534334304 340 251 306 200 292 294 300 231 254 242
282 283 214 322 254 207 304 305 371 305 254 246 241 275 257 252 215 215 242
2월14일
2
Plan
328 264 275 363 232 227 366 368 370 272 418
253 254 253 204 206
항목 경로 Qty 단위 일투 일수 사용량 담당의
귀-드레싱(일반, 한쪽당) 1 회 1 박현지', '', 'f'::boolean, '7'::integer, '2026-04-20 04:47:15.786646+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '32b44a0c-392b-44d8-8c98-dcc6e48198c5'::uuid, '0c2e3bf0-2ff1-4292-9e97-fd457326609a'::uuid, '2026.02.07 09:32', 'Subjective
CC: 양안 당뇨성 백내장
S.
HPI)
4-5일 전부터 잘 걸어다니지도 못함. 백내장은 9월정도 부터 진행됨.
체리아이 수술 하려고 했다가 당뇨가 온것을 암.
- 작년 4월정도부터 당뇨 관리.
PHI)
-MED: 인슐린 주사기로 3.1칸 주고 계심_ (humulin 주사기, 인슐린 종류는 모르심)
-SUR : 중성화, 왼쪽 체리아이 수술 진행함. 오른쪽눈 해야 함.
-VAC: boosting (+) HWP (+)
-ENV: 실내 단독,
-Diet: 저지방 사료 50g 아침 저녁 먹고 잇음. 식욕 덜어질 대는 닭가슴살 먹음.
- 다음다뇨; 3~4일 전부터 오히려 적게먹음.
O.
식욕은 아주 좋음.
청진: 양호
BCS; 6/9
GC: BAR
B/A: BG 40, Fru 336, ALT 181, ALP 258, T4 0.9
menace: 양안 확인됨
- PLR: +/+
Dazzle: +/+
안구 : 양안 양호
안검: 양안 양호
결막: 우안 체리아이, 양안 안충 없음
각막: 우안 양호, 좌안 표층 각막 혼탁
전안방: 양안 양호
홍채: 양안 양호
- 수정체: 양안 성숙 백내장
유리체: 양안 확인 불가
망막: 양안 초점 흐림
초음파: 양안 경미한 수정체 팽대, 우안 유리체 양호, 좌안 경미한 유리체 변성
- STT (23,20), IOPVet(21,23)
A.
양안) 당뇨성 백내장
Rx.
양안 프레드포르테 (2)
CE.
리브레 가능한 빨리 장착 하실 것. (어려우실 경우 가져 오실 것)
- 갑상선 수치., 간수치 추후 재검 필요 함.
P
금식 후 수요일 내원 - 양안 백내장 수술
Objective
폴더 미지정
plusvetm_gallery_pet_8678_20260207_104... IMG_1839
IMG_1844
0.2
09:49
IMG_1851
IMG_1853
IMG_1858
IMG_1860
IMG_1863
IMG_1867
IMG_1877
IMG_1880
IMG_1885
IMG_1886
IMG_1927
IMG_1931
IMG_1933
IMG_1937
IMG_1947
IMG_1950
IMG_1955
Plan
항목 경로 Qty 단위 일투 일수 사용량 담당의
진료비-초진료 1 회 1 박상은
안과신경검사 1 회 1 박상은
안과-형광염색검사 1 회 1 박상은
안과-눈물분비량검사(schirmer tear 2 회 2 박상은
test[STT])
안과-안압검사-Tonovet 1 회 1 박상은
안과(Slit Lamp검사)-초진 1 회 1 박상은
안과(Slit Lamp검사)-처치후재검 1 회 1 박상은
안과-산동처치 1 회 1 박상은
안과-안저검사 1 회 1 박상은
안과-점안마취(알콘) 1 회 1 박상은
초음파-안과 1 회 1 박상은
초진 예약금(차감용) 1 회 1 박상은
방사선 VD/LT (5kg~10kg) 2 회 2 박상은
혈액검사-처치-채혈 1 회 1 박상은
혈액검사-CBC 1 회 1 박상은
혈액검사-Catalyst (Chem15) 1 회 1 박상은
혈액검사-Catalyst(Lyte4전해질) 1 회 1 박상은
IDEXX-SDMA 1 회 1 박상은
혈액검사-TT4 1 회 1 박상은
혈액검사-CRP 1 회 1 박상은
혈액검사-Idexx (Fructosamine) 1 회 1 박상은
케톤 측정 1 회 1 박상은
내복약-1일(10Kg이하) 5 회 5 박상은
안과 수술 예약금 1 회 1 박상은
1번 그룹
처방-안약-프레드포르테(프레드니솔론, pred Eye 1 drop 1 1 1 박상은
forte)
Cephalexin Cap. PO 22 mg/kg 2 5 2.332 박상은
Misoprostol Tab. PO 5 µg/kg 2 5 1.325 박상은
Gabapentin Cap. PO 9 mg/kg 2 5 5 박상은
Carprofen Tab. (75mg) PO 2.2 mg/kg 2 5 1.5 박상은
Lefotil Tab. PO 1 T/day 2 5 5 박상은
UDCA Tab. PO 5 mg/kg 2 5 1.325 박상은
Silymarin Cap. (실리마린, 실리로) PO 5 mg/kg 2 5 2 박상은', '', 'f'::boolean, '11'::integer, '2026-04-20 04:47:15.786646+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '3f70df46-c034-4dca-b0c6-d0bc4f09d8b8'::uuid, '0c2e3bf0-2ff1-4292-9e97-fd457326609a'::uuid, '2026.03.07 10:48', 'Subjective
CC : 양안 백내장 수술, 우안 체리아이 수술 재진
OP) 26.02.11 양안 백내장 수술, 우안 체리아이 수술
S.
- 식욕 양호
- 눈 불편 증상 없었음.
O.
청진: 양호
BCS; 6/9
GC: BAR
menace: 양안 양호
PLR: +/+
Dazzle: +/+
안구 : 양안 양호
안검: 양안 양호
결막: 우안 삼안검 양호 (체리아이 수술), 양안 안충 없음
각막: 양안 양호
전안방: 우안 플레어 없음, 좌안 플레어 trace, cells 1+ - 감소
홍채: 양안 양호
수정체: 양안
망막: 양안
-STT (23,20), IOPVetplus 2.0 (16,23)
A.
양안) 당뇨성 백내장
우안) 체리아이
Rx.
양안) 브로낙 (2)
CE>
눈 건조. 각막 궤양 주의.
환자 흥분하는 경향 - 짖는 것, 뛰는 것 주의
우안 궤양 가능성: 넥칼라 유지, 눈비비지 않도록 주의
P.
- 1달 뒤 재진
Objective
폴더 미지정
IMG_3602
IMG_3642
IMG_3603
IMG_3610
IMG_3615
IMG_3623
IMG_3645
IMG_3625
IMG_3631
IMG_3636
Plan
항목 경로 Qty 단위 일투 일수 사용량 담당의
진료비-재진료 1 회 1 박상은
안과신경검사 1 회 1 박상은
안과-안압검사 (재진) 1 회 1 박상은
안과-형광염색검사 1 회 1 박상은
안과(Slit Lamp검사)-재진 1 회 1 박상은
안과-안저검사 1 회 1 박상은
새 그룹
처방-안약-브로낙(bronuck,브롬페낙나트륨수화 Eye 2 drop 1 1 2 박상은
물,NSAID)', '', 'f'::boolean, '2'::integer, '2026-04-20 04:47:15.786646+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '4b8040b5-5a2f-496f-920b-36ab5b8532f9'::uuid, '0c2e3bf0-2ff1-4292-9e97-fd457326609a'::uuid, '2026.02.11 15:00', 'Subjective
CC : 문진, 리브레연결
Hx)
당뇨관리) 한동안 2주 간격, 3달정도 전부터 한달 간격
진단시점) 25년 4월
진단CC) 소변 못 가리고 물 많이 마신게 2~3일 정도 돼서 병원 갔음 - 그때 고혈당 확인
먹는 약으로 하다가 안 돼서 인슐린으로 변경
귀,피부) 귀 안 좋아서 처방 받은 연고 넣어줌 - 먹는 약이나 스테로이드 안 먹음
췌장) 특이사하 없음
구토) 딱 1번, 닭가슴살 말린 거 섞어 줬더니 가루때문인지 구토함
당뇨 걸리기 전에 밥 불규칙적으로 먹을 때는 노란 구토 정도 자주
식욕) 당뇨 걸리고 너무 안 먹어서 습식 섞어주고 닭가슴살 주고 그랬음
혈당 관리 잘 되고 잘 먹어서 안 섞어줌
배변) 양호
케톤) 높았어서 인슐린 조절하고 그랬었음
다음다뇨) 요며칠 동안은 소변 노랗게 봄 - 이전에는 거의 하얗게 보였음
인슐린종류이름)??
인슐린주사기) 주황색 뚜껑 주사기
간이혈당기) 없음
식이) 사료 : 저지방 사료 - 추천 받았음, 당뇨 사료 아님
간식 : 닭가슴살 삶은 거 간혹 (식욕 떨어질 때나 볼일 봤을 때), 가수분해 껌 (가끔)
사료급여량) 사료 50g씩
급여시간) 7시마다 (아침, 저녁)
주사시간) 10시마다
보관, 주사방법) 냉장, 세워서 보관, 문지르지 않음, 이전에는 몰라서 문지름
체중변화) 최고 몸무게는 5.8kg이었으나 5.2~5.3kg 유지했음
당뇨 걸리고 4.7까지 빠졌다가 5.4kg
보조제, 영양제) 관절영양제 (아이튼튼)
기저질환) 없음, 귀가 자주 문제가 됐음
저번 진료 이후 저혈당 떠서 병원 연락했음 - 인슐린 조절함 - 3.1에서 2.5
인슐린 줄이고 컨디션 좋아짐
O) 4일 전 원내 술전검사
- glu 40 (입원장 30분 넘게 긁었다고 함), fruc 336
- ALKP 258, ALT 181, T4 0.9
- 퇴원전 간이 혈당 86
P) 특이사항 있을 때 진료나 검사한다고 말씀드려놓음 (중간 중간 리브레, 귀 확인)
C/E) 병원 카톡으로 연락 예정 (혈당 모니터링비 안 받음)
- 카톡으로 벳메이드 구매 URL, 간이혈당 측정법 보내드림
인슐린 종류 뭔지 알려주셔야함
- 눈 안정화되는 동안 혈당 본원에서 확인 - 필요시 중간에 검사 있을 수 있음 - 이후 원래 다니던 병원에서 관리하시면 됨
- 귀, 피부 나빠지지 않는지 확인 필요
- 오늘 저녁 평소처럼 밥, 인슐린 주실 것 - 급하게 먹지 않게 주의
Objective
폴더 미지정
plusvetm_gallery_pet_8678_20260211_1613...
VETMATE
86
VETMATE
S
20', '', 'f'::boolean, '9'::integer, '2026-04-20 04:47:15.786646+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '57bdb4f3-da19-45d7-aeb3-3926e3571aa8'::uuid, '0c2e3bf0-2ff1-4292-9e97-fd457326609a'::uuid, '2026.02.11 09:49', 'Subjective
CC: 양안 백내장 수술 내원
S,.
금식 완
좀전 BG 190대
활력, 식욕 좋았음.
OP) 26.02.11 양안 백내장 수술
: 좌안부터 진행함, 외안각 절개 후 진행
양안 CCC 실시 후 phaco 실시(sculp-seg)
캡슐 파열 없음
IOL- (anieye13'')적용
안내 Dexa, 결막내 triam 주사 실시함
우안 체리아이 수술 (매몰법 - 6-0vicryl)
안검봉합 1knot 실시
Tx.
퇴원전 안압 40,54 → 천자후 안압 5,5 → 1시간 뒤 IOP 양안 50대 → 재천자 IOP 7,7
Rx.
레보스타 (6), 맥시트롤 (4), 프레드포르테 (4), 트루솝 (4), 히아레인 (수시로 점안)
CE>
눈 건조. 각막 궤양 주의.
환자 흥분하는 경향 - 짖는 것, 뛰는 것 주의
P.
목, 토 재진
Objective
폴더 미지정
plusvetm_gallery_pet_8678_20260211_105... plusvetm_gallery_pet_8678_20260211_105... 2026021112080997
여성 전설 및 동의 사항
이후 발생하는 추가적인 비용은 보호자 부담합니다.
2026년2월
프랑스유자 등
김성화
효니다.
2026021112083580
2026021112084119
2026021112085009
2026021112091568
2026021112093059
2026021112100296
2026021112110180
2026021112121981
2026021112124387
2026021112130123
2026021112131991
2026021112134884
2026021112141875
2026021112150169
2026021112164155
2026021112164572
2026021112164969
2026021112165396
2026021112165865
2026021112171366
2026021112181527
2026021112201448
2026021112210407
2026021112215298
2026021112221609
2026021112240681
2026021112244778
2026021112245784
2026021112310310
2026021112313519
2026021112313977
2026021112314730
2026021112321223
2026021112323182
2026021112325100
2026021112332885
2026021112335157
2026021112343315
2026021112353867
2026021112360295
2026021112363822
2026021112371932
2026021112401997
2026021112402328
2026021112402744
2026021112403685
2026021112405957
2026021112415853
2026021112433250
2026021112444967
2026021112453367
2026021112455541
2026021112480719
2026021112483529
2026021112485360
2026021112492124
2026021112500068
STAINLESS
STAINLESS
2026021112505675
2026021112510877
2026021112515517
2026021112542660
2026021112550828
2026021112582749
2026021112593217
2026021113003697
2026021113030688
2026021113032008
2026021113035852
2026021113051295
plusvetm_gallery_pet_8678_20260211_154... plusvetm_gallery_pet_8678_20260211_154...
원주
Plan
항목 경로 Qty 단위 일투 일수 사용량 담당의
진료비-재진료 1 회 1 박상은
수액-정맥카테터장착비 1 회 1 박상은
수액-HS 1 회 1 박상은
주사-정맥주사(10kg이하) 3 회 3 박상은
향정-propofol 1 회 1 박상은
향정-butorphanol 1vial 2 EA 2 박상은
마취-호흡(5~10kg) 1 회 1 박상은
마취-모니터링 1 회 1 박상은
호흡마취 추가 1 회 1 박상은
수술-안과-백내장수술 (양안) 1 회 1 박성원
수술-안과-백내장수술 (인공렌즈삽입) 2 개 2 박성원
수술-안과-안검봉합 2 회 2 박성원
안과 수술 예약금(차감용) 1 회 1 박상은
수술-안과-체리아이(Cherry eye)-매몰 1 회 1 박성원
간이혈당측정 9 회 9 박상은
주사-정맥주사(10kg이하) 1 회 1 박상은
1번 그룹
처방-안약-히아레인 0.3% (5ml) Eye 1 drop 1 1 1 박상은', '', 'f'::boolean, '10'::integer, '2026-04-20 04:47:15.786646+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '6ab06cfb-bfb6-4862-b45e-17480979ae01'::uuid, '0c2e3bf0-2ff1-4292-9e97-fd457326609a'::uuid, '2026.03.21 12:06', 'Subjective
CC: 혈당확인
CC) 리브레 조기 종료, 혈당 400~500에서 안 떨어짐
초진 내원시 인슐린 3칸으로 저혈당 확인된 친구, 관리 병원에서 2.5칸으로 줄임 → 술 후 4칸까지 올리고 스테로이드 포함되지 않은 안약으로 바꿈 →저혈당 떴다
고 하셔서 (?-병원에서 리브레 차트 봤을 때 확인 안됨) 3칸으로 줄인 상태 → 혈당 안 떨어져서 운동 시켜달라고했는데 운동 못 시키셔서 인슐린 3.5칸으로 바꾸심
Hx)
6~7일 전부터 400~500에서 안 내려오고 있음
그제부터 3.5로 주고있음
운동) 못 시켰음, 나가는 거 싫어하는 친구
인슐린) 새로 받았음, 그때그때 뽑아서 쓰고 있음, 2주치씩 받아오고 있음, 혈당 잘 안 떨어지면 다른 인슐린으로 바꿔보자고 들었음
식이) 변화 없음, 밥 급여량도 같음, 저번에 보여준 껌 반쪽 주는 정도, 밥 잘 안 먹을 때 닭가슴살 조금 주는 정도
저혈당) 그때 알람이 울렸는데 얼마였는지 기억이 안남, 저혈당인지 아닌지 모르겠음, 혈당이 떨어지고 있긴했음
O) 보통 7시 밥, 인슐린
체중 동일
케톤 0.2
혈당 (카탈리스트) 417 (간이혈당기 오류 떠서 카탈로 돌림)
귓바퀴 습한 갈색 귀지
리브레 제거 부위 피부 간지러워함
Tx) 리브레 제거 후 소독, 휴물린 R 1IU SC, 귀 에피오틱 세정 후 이소틱
C/E)
- 오늘 저녁부터 4칸
혈당 떨어지는 양상 아니면 캐닌슐린이나 란투스로 변경
이전에 리브레 부착했던 털 적은 부위에 주사바늘 잘 들어가는지 보고 주사하고 1초 있다가 바늘 빼실 것
간이 혈당 측정안되므로 리브레 주문해서 부착하실 것
리브레 부착 전까지 컨디션 봤을 때 이전처럼 쳐진 상태면 간이혈당...꼭 해보셔야함 (무시무시하게 생겨서 아플 것 같다고 하심)
용량 조절 어려우시면 휴물린 펜타입?
Objective
폴더 미지정
plusvetm_gallery_pet_8678_20260321_121... plusvetm_gallery_pet_8678_20260321_122...
Plan
항목 경로 Qty 단위 일투 일수 사용량 담당의
진료비-재진료 1 회 1 박현지
혈액검사-Catalyst(항목당) 1 회 1 박현지
케톤 측정 1 회 1 박현지
귀-드레싱(일반, 한쪽당) 2 회 2 박현지
주사-인슐린-(10kg이하)휴물린N,NPH,휴물린R, 1 회 1 박현지
글라진,란투스', '', 'f'::boolean, '1'::integer, '2026-04-20 04:47:15.786646+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '73b73d20-0a59-41a1-a099-28230c732f84'::uuid, '0c2e3bf0-2ff1-4292-9e97-fd457326609a'::uuid, '2026.02.12 11:21', 'Subjective
CC: 양안 백내장 수술 내원
OP) 26.02.11 양안 백내장 수술
S.
- 식욕 양호
- 오늘 아침에 밥을 안먹으려 해서 닭가슴살 조금 섞어주니 잘 먹음. 변 잘봄.
O.
청진: 양호
BCS; 6/9
GC: BAR
menace: 양안 확인됨
PLR: +/+
Dazzle: +/+
안구 : 양안 양호
안검: 양안 양호
결막: 우안 삼안검 양호 (체리아이 수술), 양안 안충 없음
각막: 양안 각막 부종
전안방: 양안 플레어 3+ (우안<좌안)
홍채: 양안 양호
수정체: 양안
망막: 양안
초음파: 양안 경미한 수정체 팽대, 우안 유리체 양호, 좌안 경미한 유리체 변성
- STT (23,20), IOPVet(25-33-38,22-26)
Rx.
레보스타 (6), 맥시트롤 (4), 프레드포르테 (4), 트루솝 (4), 히아레인 (수시로 점안)
CE>
눈 건조. 각막 궤양 주의.
환자 흥분하는 경향 - 짖는 것, 뛰는 것 주의
P.
목, 토 재진
- 눈 못뜨면 다음날도 내원.
Objective
폴더 미지정
IMG_0799
IMG_0804
IMG_0809
IMG_0811
IMG_0816
IMG_0822
IMG_0828
IMG_0830
IMG_0836
IMG_0841
Plan
항목 경로 Qty 단위 일투 일수 사용량 담당의
진료비-재진료 1 회 1 박상은
안과신경검사 1 회 1 박상은
안과-안압검사 (재진) 1 회 1 박상은
안과-형광염색검사 1 회 1 박상은
안과(Slit Lamp검사)-재진 1 회 1 박상은
안과-안저검사 1 회 1 박상은
1번 그룹
처방-안약-히아레인 0.3% (5ml) Eye 1 drop 1 1 1 박상은', '', 'f'::boolean, '8'::integer, '2026-04-20 04:47:15.786646+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '7662f8bb-2dc9-4fd5-ab65-d33a3e8f4a31'::uuid, '0c2e3bf0-2ff1-4292-9e97-fd457326609a'::uuid, '2026.02.21 14:14', 'Subjective
CC : 양안 백내장 수술, 우안 체리아이 수술 재진
OP) 26.02.11 양안 백내장 수술, 우안 체리아이 수술
S.
- 식욕 양호
-눈 비비려고 함.
O.
청진: 양호
BCS; 6/9
GC: BAR
menace: 양안 양호
PLR: +/+
Dazzle: +/+
안구 : 양안 양호
안검: 양안 양호
결막: 우안 삼안검 양호 (체리아이 수술), 양안 안충 없음
각막: 우안 봉합 부위 궤양 가능성.
전안방: 우안 플레어 1+ (우안<좌안), 좌안 피브린 흡수됨
홍채: 양안 양호
수정체: 양안
망막: 양안
-STT (23,20), IOPVetplus 2.0 (15,15)
A.
양안) 당뇨성 백내장
우안) 체리아이
Tx.
양안 안검 봉합 발사
Rx.
레보스타 (4), 맥시트롤 (2), 프레드포르테 (2)
히아레인 (4)
CE>
눈 건조. 각막 궤양 주의.
환자 흥분하는 경향 - 짖는 것, 뛰는 것 주의
우안 궤양 가능성: 넥칼라 유지, 눈비비지 않도록 주의
P.
- 2주뒤 재진
Objective
폴더 미지정
IMG_0244
IMG_0249
IMG_0252
IMG_0256
IMG_0260
IMG_0269
IMG_0275
IMG_0277
Plan
항목 경로 Qty 단위 일투 일수 사용량 담당의
진료비-재진료 1 회 1 박상은
안과신경검사 1 회 1 박상은
안과-안압검사 (재진) 1 회 1 박상은
안과-형광염색검사 1 회 1 박상은
안과(Slit Lamp검사)-재진 1 회 1 박상은
안과-안저검사 1 회 1 박상은
새 그룹
처방-안약-히아레인 0.3% (5ml) Eye 1 drop 1 1 1 박상은', '', 'f'::boolean, '4'::integer, '2026-04-20 04:47:15.786646+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '76d5988c-9fb9-44a5-bb32-65e4658aac5b'::uuid, '0c2e3bf0-2ff1-4292-9e97-fd457326609a'::uuid, '2026.03.28 16:08', 'Subjective
CC: 양안 백내장 수술, 우안 체리아이 수술 재진
OP) 26.02.11 양안 백내장 수술, 우안 체리아이 수술
S.
- 식욕 양호
- 눈 불편 증상 없엇음.
O.
청진: 양호
BCS; 6/9
GC: BAR
menace: 양안 양호
PLR: +/+
Dazzle: +/+
안구 : 양안 양호
안검: 양안 양호
결막: 우안 삼안검 양호 (체리아이 수술), 양안 안충 없음
각막: 양안 양호
전안방: 우안 플레어 없음, 좌안 플레어 trace, cells 1+ - 감소
홍채: 양안 양호
수정체: 양안
망막: 양안
--STT (23,20), IOPVetplus 2.0 (20,21)
A.
양안) 당뇨성 백내장
우안) 체리아이
Rx.
양안) 브로낙 (1)
CE>
눈 건조. 각막 궤양 주의.
환자 흥분하는 경향 - 짖는 것, 뛰는 것 주의
우안 궤양 가능성: 넥칼라 유지, 눈비비지 않도록 주의
P.
- 2달 뒤 재진
Objective
폴더 미지정
IMG_0454
IMG_0459
IMG_0463
IMG_0465
IMG_0467
IMG_0471
IMG_0475
IMG_0482
IMG_0485
Plan
항목 경로 Qty 단위 일투 일수 사용량 담당의
진료비-재진료 1 회 1 박상은
안과신경검사 1 회 1 박상은
안과-안압검사 (재진) 1 회 1 박상은
안과-형광염색검사 1 회 1 박상은
안과(Slit Lamp검사)-재진 1 회 1 박상은
안과-안저검사 1 회 1 박상은', '', 'f'::boolean, '0'::integer, '2026-04-20 04:47:15.786646+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '77a6c348-4165-4841-880c-a5370e09d69e'::uuid, '0c2e3bf0-2ff1-4292-9e97-fd457326609a'::uuid, '2026.03.07 10:45', 'Subjective
CC : 리브레, 귀, 피부 확인
▶ 인슐린 변경 및 안내드린 내용
Hx)
밥급여량)
주사용량)
주사시간)
O)
- 5.3 5.1→5kg
- 귀, 피부 양호
- 이전 리브레 부착부위 염증
- 오전 11시 간이혈당 428
Tx) R 1IU SC / 귀 에피오틱 세정 / 기본 관리 / 좌측 등 피부 소독
Rx) 밥 급여 7시, 주사 10시로 하고 계심 → 3/2부터 밥, 주사 모두 7시로 변경
1) 휴물린 N, BD 주사기
2) 간이혈당기
3) 저지방 사료
4) 덴탈껌 (닥터힐메딕스or페스룸), 보조제 1개 (가져오셔서 성분 확인함)
5) 안약 (양) : 브로낙 (2)
P) 다음 안과 재진 때 같이 볼 예정 - 리브레 연장시 근처 병원에서 진행
C/E) 주의사항 써서드림
중간에 혈당 높을 때 움직이게 할 것 - 눈 조심해서 산책 잠깐씩 시켜주실 것
일단 인슐린 3.5로 유지 - 비스테로이드성 안약으로 변경 예정
월요일에도 피부 상처 있으면 에스로반 발라주실 것
Objective
폴더 미지정
plusvetm_gallery_pet_8678_20260307_105... plusvetm_gallery_pet_8678_20260307_105... plusvetm_gallery_pet_8678_20260307_105...
plusvetm_gallery_pet_8678_20260307_105... plusvetm_gallery_pet_8678_20260307_105...
사용후지지
VETMATE
428
Plan
항목 경로 Qty 단위 일투 일수 사용량 담당의
주사-인슐린-(10kg이하)휴물린N,NPH,휴물린R, 1 회 1 박현지
글라진,란투스
귀-드레싱(일반, 한쪽당) 1 회 1 박현지
간이혈당측정 1 회 1 박현지', '', 'f'::boolean, '3'::integer, '2026-04-20 04:47:15.786646+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '9d79a59c-148f-4f8a-9042-4c94d1a6f980'::uuid, '0c2e3bf0-2ff1-4292-9e97-fd457326609a'::uuid, '2026.02.21 13:45', 'Subjective
CC : 리브레, 귀, 피부 확인
▶ 인슐린 변경 및 안내드린 내용
Hx) 혈당 괜찮다가 어제부터 혈당 조금 오르는 추세
식욕) 잘 먹음, 닭가슴살 안 섞어줘도 잘 먹음
소양감) 안약 넣고 비비는 정도
O)
- 5.3 5.1kg
- 귀, 피부 양호
Tx) 귓바퀴 간단 세정
Rx) 밥 급여 7시, 주사 10시로 하고 계심
1) 휴물린 N, BD 주사기
2) 간이혈당기
3) 저지방 사료
4) 덴탈껌 (닥터힐메딕스or페스룸), 보조제 1개 (가져오셔서 성분 확인함)
5) 안약 (양) : 레보스타 (4), 맥시트롤 (2), 프레드포르테 (2), 히아레인 (4)
P) 내일 아침 주사 전 연락드리겠음
리브레 종료되면 구매해서 오실 것 - 연장 예정
C/E)', '', 'f'::boolean, '5'::integer, '2026-04-20 04:47:15.786646+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'de386b0e-38ee-4524-a68b-0899fabaf556'::uuid, '0c2e3bf0-2ff1-4292-9e97-fd457326609a'::uuid, '2026.02.14 10:41', 'Subjective
CC : 양안 백내장 수술, 우안 체리아이 수술 재진
OP) 26.02.11 양안 백내장 수술, 우안 체리아이 수술
S.
- 식욕 양호
- 오늘 아침에 밥을 안먹으려 해서 닭가슴살 조금 섞어주니 잘 먹음. 변 잘봄.
O.
청진: 양호
BCS; 6/9
GC: BAR
menace: 양안 확인됨
PLR: +/+
Dazzle: +/+
안구 : 양안 양호
안검: 양안 양호
결막: 우안 삼안검 양호 (체리아이 수술), 양안 안충 없음
각막: 양안 각막 부종
전안방: 우안 플레어 1+, 좌안 플레어 2+ (우안<좌안), 좌안 피브린 감소중
홍채: 양안 양호
수정체: 양안
망막: 양안
초음파: 양안 경미한 수정체 팽대, 우안 유리체 양호, 좌안 경미한 유리체 변성
-STT (23,20), IOPVet(19,19)
Rx.
레보스타 (6), 맥시트롤 (4), 프레드포르테 (4), 트루솝 (2), 히아레인 (4)
CE>
눈 건조. 각막 궤양 주의.
환자 흥분하는 경향 - 짖는 것, 뛰는 것 주의
P.
- 1주뒤 재진
Objective
폴더 미지정
IMG_1669
IMG_1678
IMG_1682
IMG_1687
IMG_1696
IMG_1704
IMG_1707
IMG_1710
Plan
항목 경로 Qty 단위 일투 일수 사용량 담당의
진료비-재진료 1 회 1 박상은
안과신경검사 1 회 1 박상은
안과-안압검사 (재진) 1 회 1 박상은
안과-형광염색검사 1 회 1 박상은
안과(Slit Lamp검사)-재진 1 회 1 박상은
안과-안저검사 1 회 1 박상은
새 그룹
처방-안약-레보스타(levosta, levofloxacin, 레보 Eye 1 drop 1 1 1 박상은
플록사신, 항생제)
처방-안약-프레드포르테(프레드니솔론, pred Eye 1 drop 1 1 1 박상은
forte)
처방-안약-맥시트롤(덱사+네오마이신+폴리믹신 Eye 1 drop 1 1 1 박상은
B)
NeckCollar 넥칼라-20cm(보라) 1 EA 1 1 1 박상은
NeckCollar 넥칼라-17.5cm(노랑) 1 EA -1 1 -1 박상은', '', 'f'::boolean, '6'::integer, '2026-04-20 04:47:15.786646+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '99293c8a-61b7-42d8-a9cd-582824c62b19'::uuid, 'a44fb2a0-9092-4512-b184-6483c06c327a'::uuid, '2026-03-21', 'Date: 2026-03-21
Purpose of visit: 초진-건강검진
Record User: 2
S.E
Date
Contents
2026-03-21 S)
모자라서 급해서 산것도 있고 습식이 안좋은거라서 주식캔 여러개 보셨다고 함
습식캔은 계속주고 건식은 40g정도 주심, 건식은 반정도 먹음
- 비만세포종이 있다고 하심, 생긴지 1년 정도 됐다고 함(눈바로 옆쪽이랑 귀족에 상처가 안낫고 있다
가 오늘좀 괜찮아짐)
- 귀를 긁는게 세포종인지 귀족 문제가 있는건지도 궁금하심
- 구토가 월 2회정도 있음, 작년에는 일주일 동안 3번정도 토했다고 함 안정제도 처방을 원한다고 하심
O)
- P/E
: no murmur, no lung sound
: BP180 (#2)
: 검이경 - 양측 특이사항 없음
: 치마 특이사항 없음
- 혈액검사
1) CBC
: NRF
2) Chem 15
: increased AST 85
: increased ALT 136
3) SDMA
: 10
- 방사선
: VHS 7,5
- 초음파
-간/담낭/비장 특이소견없음
-양쪽 신장/방광 특이소견없음
-위장관/주위림프절 특이소견없음
P)
- 특이사항 있을 시 내원 예정
CE)
- 아이 간수치 높은 부분 간보호제 필요하며 약 안먹으면 6개월 뒤에 수치재검 한번더 하실것 권장드림
Ο.Ε
Date
Findings
Contents
이비인후
2026-03-21 Normal
OE Chart Description
Value
Memo', 'Plan
Date
Description
Kg Dose t/d Day Qty Unit
Amount Doctor
2026-03-21 건강검진B - 종합(4-7세 추천)
1
1 1 1 1
370,000원 김전모
2026-03-21 단순방사선촬영 - 흉/복부4cut (~1
1
1 1 1 1
78,000원 김전모
2026-03-21 초음파검사- 복부(~10kg)
1
1 11
1
67,000원 김전모
2026-03-21 혈액검사 - Procyte One CBC
0
111
1
38,000원 김전모
2026-03-21 Catalyst_DX
0
11 1
1
0원 김전모
2026-03-21 내복약 - 진정제/멀미약
0
114
4
20,000원 김전모
Radiology Result
Client: 박소라
Patient: 슈가
202600119
Date: 2026-03-21
Purpose of visit: 초진-건강검진
Record User: 2
Radiology Date: 2026-03-21
Plan:
단순방사선촬영 - 흉/복부4cut (~10kg)
초음파검사-복부(~10kg)', 't'::boolean, '0'::integer, '2026-04-20 05:49:46.442959+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '18c27d6c-63fc-4b58-be93-5cec849dd46b'::uuid, 'ec9d2ad1-d11a-4a11-8cff-dabe6ef8c11b'::uuid, '2026.02.20 17:35', 'Subjective
CC: 양안 백내장 수술 재진-김포한강동물AH
OP) 26.02.11 양안 백내장 수술
S.
- 식욕, 활력 양호. 눈불편증상 없었음.
- 오른쪽눈 충혈 있기도 했음. 현재는 없음.
Ο.
청진: 양호
GC; BAR
BCS: 6/9
- menace: 양안 양호
- PLR: +/+ 양안 산동 풀림
- Dazzle: +/+
- 안구 : 양안 양호
안검: 양안 양호
결막: 양안 경미한 충혈, 좌안 안충없음
각막: 양안 양호
전안방: 양안 플레어 1+. (우안<좌안) - 감소세 좌안 피브린 끈 흡수됨
홍채: 우안 dyscoria, 홍채 후방 재유착 의심, 좌안 양호
수정체: 양안 IOL유지중
- 망막: 양안 시신경, 혈관, 반사도 양호
A.
STT (14,12), IOPVetplus 2.0 (13,16)
양안) 유전성 백내장 수술, 우안 수정체 유착
Tx.
우안 atropine 1drop
Rx.
양안) 레보스타 (4), 맥시트롤 (2), 프레드포르테 (2)
우안) 산동제 (4)
* 10시후 점안 불가.
CE.
- 술후 관리 주의
- 내복약 짧게 ; 염증, 진정제 용량 조절 필요.
- PA주사 가능성, 불편 증상 시 당겨서 내원
P.
-2주뒤 재진
Objective
폴더 미지정
IMG_0833
IMG_0836
IMG_0841
IMG_0843
IMG_0850
IMG_0851
IMG_0858
IMG_0862
IMG_0866
で
IMG_0870
Plan
항목 경로 Qty 단위 일투 일수 사용량 담당의
진료비-재진료 1 회 1 박상은
안과신경검사 1 회 1 박상은
안과-안압검사 (재진) 1 회 1 박상은
안과-형광염색검사 1 회 1 박상은
안과(Slit Lamp검사)-재진 1 회히 1 박상은
안과-안저검사 1 회 1 박상은
새 그룹
처방-안약-레보스타(levosta, levofloxacin, 레보 Eye 1 drop 1 1 1 박상은
플록사신, 항생제)', '', 'f'::boolean, '1'::integer, '2026-04-20 06:25:18.064506+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '38bd3cc7-1529-419e-9b04-fffe48de47b6'::uuid, 'ec9d2ad1-d11a-4a11-8cff-dabe6ef8c11b'::uuid, '2026.02.12 11:23', 'Subjective
CC: 양안 백내장 수술 재진
OP) 26.02.11 양안 백내장 수술
S.
잠을 잘 못잠.
O.
청진: 양호
GC; BAR
BCS: 6/9
menace: 양안 양호
PLR: 경미한 산동/+
Dazzle: +/+
* 우안 촉진 시 통증 심함.
안구 : 양안 양호
안검: 양안 양호
결막: 양안 경미한 충혈, 좌안 안충없음
각막: 양안 양호
전안방: 양안 플레어 3+
- 홍채: 우안 dyscoria, 좌안 양호
수정체: 양안 IOL유지중
망막: 우안 양호, 좌안 초점 흐림. 시신경, 혈관은 양호해보임. (축동)
A.
STT (14,12), IOPVetplus 2.0 (11,17)
양안) 유전성 백내장, 우안 포도막염
Rx.
우안) 레보스타 (6), 맥시트롤 (6), 프레드포르테 (6), 트루솝 (2), 산동제 (2)
좌안) 레보스타 (6), 맥시트롤 (6), 프레드포르테 (6), 트루솝 (2)
CE.
- 술후 관리 주의
- 내복약 짧게 ; 염증, 진정제 용량 조절 필요.
P.
- 목, 토 재진
Objective
폴더 미지정
IMG_0991
IMG_0997
IMG_1001
IMG_1005
IMG_1007
IMG_1014
IMG_1017
IMG_1021
Plan
항목 경로 Qty 단위 일투 일수 사용량 담당의
진료비-재진료 1 회 1 박상은
안과신경검사 1 회 1 박상은
안과-안압검사 (재진) 1 회 1 박상은
안과-형광염색검사 1 회 1 박상은
안과(Slit Lamp검사)-재진 1 회 1 박상은
안과-안저검사 1 회 1 박상은
[시그니처바이] P/a 2 개 2 처치실', '', 'f'::boolean, '3'::integer, '2026-04-20 06:25:18.064506+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '66018c6e-75ba-408b-9fe8-5259efd2ae81'::uuid, 'ec9d2ad1-d11a-4a11-8cff-dabe6ef8c11b'::uuid, '2026.02.10 15:27', 'Subjective
CC: 양안 유전성 백내장 - 한강동물메디컬AH
HPI)
- 오른쪽눈 하얘짐. LAH 1~2달 전부터 살짝 하얘보임.
- 결막염 → 눈 좋아짐
PHI)
-MED: x
-SUR: 중성화, 다리수술 이력 있음 (편측)
-VAC: boosting (+), HWP (+)
-ENV: 실내, 동거견 (1)
-Diet: 일반 사료.
- 중성화 전 검사 특이사항 없었음.
O.
청진: 양호
GC; BAR
BCS: 6/9
DR: VSH 9.4, 복부 간 살짝 작음, 좌측 고관절 수술흔적
- B/A; HCT 50.7, crp; normal
menace: 양안 양호
PLR: +/+ (우안 산동지연)
Dazzle: +/+
* 우안 촉진 시 통증 심함.
안구 : 양안 양호
안검: 양안 양호
결막: 양안 양호, 좌안 안충없음
각막: 양안 양호
전안방: 우안 플레어 1+, cells 2+이상, 전안방 살짝 깊어보임, 좌안 양호
홍채: 우안 dyscoria, 일부 후방유착 의심, 좌안 양호
수정체: 우안 성숙 백내장, 좌안 미성숙 백내장
유리체: 양안 양호
망막: 우안 관찰불가, 좌안 초점 흐림. 시신경, 혈관은 양호해보임..
- 초음파: 우안 유리체 변성 or 렌즈 물질 추정, 좌안 양호
- STT (14,12), IOPVetplus 2.0 (9,18)
A.
양안) 유전성 백내장, 우안 포도막염 ddx, 우안 렌즈 파열
Rx.
우안)프레드포르테 (4), 산동제 (4)
좌안)프레드포르테 (2)
CE.
- 술후 관리 주의
- 우안 파열 가능성
P.
- 1일 뒤 금식 후 내원
Objective
폴더 미지정
IMG_0219
IMG_0221
IMG_0225
IMG_0236
IMG_0238
IMG_0245
IMG_0248
IMG_0253
IMG_0256
IMG_0261
IMG_0265
IMG_0266
IMG_0274
IMG_0280
IMG_0285
IMG_0288
IMG_0292
IMG_0295
IMG_0296
Plan
항목 경로 Qty 단위 일투 일수 사용량 담당의
진료비-초진료 1 회 1 박상은
안과신경검사 1 회 1 박상은
안과-형광염색검사 1 회 1 박상은
안과-눈물분비량검사(schirmer tear 2 회 2 박상은
test[STT])
안과-안압검사-Tonovet 1 회 1 박상은
안과(Slit Lamp검사)-초진 1 회 1 박상은
안과(Slit Lamp검사)-처치후재검 1 회 1 박상은
안과-산동처치 1 회 1 박상은
안과-안저검사 1 회 1 박상은
안과-점안마취(알콘) 1 회 1 박상은
초음파-안과 1 회 1 박상은
초진 예약금(차감용) 1 회 1 박상은
혈액검사-CRP 1 회 1 박상은
혈액검사-CBC 1 회 1 박상은
방사선 VD/LT (5kg이하) 2 회 2 박상은
혈액검사-Catalyst(Lyte4전해질) 1 회 1 박상은
내복약-1일(10Kg이하) 1 회 1 박상은
안과 수술 예약금 1 회 1 박상은
1번 그룹
Cephalexin Cap. PO 22 mg/kg 2 1 0.378 박상은
Prednisolone Tab. (PDS) PO 0.5 mg/kg 2 1 0.86 박상은
Famotidine Tab. PO 0.5 mg/kg 2 1 0.43 박상은
Gabapentin Cap. PO 5 mg/kg 2 1 0.5 박상은
UDCA Tab. PO 5 mg/kg 2 1 0.215 박상은
처방-안약-프레드포르테(프레드니솔론, pred Eye 1 drop 1 1 1 박상은
forte)
처방-안약-미드리아실소분-트로피카마이드 Eye 1 drop 1 1 1 박상은
(Tropicamide, trop, 산동제)
진단 검사 결과
보호자 성함 김유미
일산 클래식 동물병원
경기도 고양시 일산동구 중앙로 1124, 이마트 1층 전용관(백석동, 흰돌마을 1단지) | 031-902-1375
동물 등록 번호 8669
동물명 솜이
연락처 010-6213-0207
축종/품종 개/비숑 프리제
주소 경기 김포시 양촌읍 석모로5번길 106
나이 2Y 10M
성별 중성화 암컷', '', 'f'::boolean, '5'::integer, '2026-04-20 06:25:18.064506+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '7765b9cc-4677-408f-9a69-f8a5c1b96280'::uuid, 'ec9d2ad1-d11a-4a11-8cff-dabe6ef8c11b'::uuid, '2026.02.11 10:54', 'Subjective
CC: 양안 백내장 수술 내원
S.
금식 완. 밤중 불편증상 없었음.
OP) 26.02.11 양안 백내장 수술
: 좌안부터 진행, 양안 외안각 절개 후 진행
좌안: CCC 후 Phaco 실시 (sculp-seg)
수정체 캡슐 파열 없음
우안: CCC 실시 후 Phaco 실시(seg)- 초음파 사용거의 없음
6시부위 홍채-수정체 유착확인- 유착분리 및 물질 제거
수정체 캡슐 파열 없음
안내 Dexa, 결막내 triam 주사 실시함
안검봉합 1knot 실시
A.
양안) 유전성 백내장, 우안 포도막염 ddx, 우안 렌즈 파열
Rx.
우안) 레보스타 (6), 맥시트롤 (6), 프레드포르테 (6), 트루솝 (4), 산동제 (4)
좌안) 레보스타 (6), 맥시트롤 (6), 프레드포르테 (6), 트루솝 (4)
CE.
- 술후 관리 주의
- 내복약 짧게 ; 염증, 진정제 용량 조절 필요.
P.
- 목, 토 재진
Objective
폴더 미지정
2026021115540977
2026021115541221
2026021115545990
2026021115551053
2026021115552415
2026021115560217
2026021115572159
2026021115584086
2026021115584498
2026021115585206
2026021115590086
2026021115591991
2026021116000365
2026021116004400
2026021116010426
2026021116014007
2026021116015909
2026021116020158
2026021116020740
2026021116022348
2026021116035268
2
2026021116055225
2026021116075059
2026021116075241
2026021116075507
2026021116075827
2026021116080406
2026021116082781
2026021116083819
2026021116153466
2026021116184796
2026021116282262
2026021116293398
2026021116294187
2026021116295654
2026021116303395
2026021116310997
2026021116313919
2026021116315546
2026021116322212
2026021116322739
2026021116323348
2026021116323684
10
2026021116324095
2026021116324944
2026021116325523
2026021116333581
2026021116335601
2026021116340955
2026021116344922
2026021116352124
2026021116362403
2026021116381548
2026021116384037
2026021116384265
2026021116384911
2026021116385155
2026021116385518
2026021116385926
2026021116391210
2026021116391774
2026021116394762
2026021116461787
2026021116490412
plusvetm_gallery_pet_8669_20260212_092...
솜이♡
900
백내장 (0)
입원 환자 관리표
Plan
항목 경로 Qty 단위 일투 일수 사용량 담당의
진료비-재진료 1 회 1 박상은
수액-정맥카테터장착비 1 회 1 박상은
수액-HS 1 회 1 박상은
주사-정맥주사(10kg이하) 3 회 3 박상은
향정-propofol 1 회 1 박상은
마취-호흡(5kg이하) 1 회 1 박성원
호흡마취 추가 1 회 1 박성원
마취-모니터링 1 회 1 박성원
수술-안과-백내장수술 (양안) 1 회 1 박성원
수술-안과-백내장수술 (인공렌즈삽입) 2 개 2 박성원
수술-홍채유착분리 1 회 1 박성원
결막하주사 2 회 2 박성원
수술-안과-안검봉합 2 회 2 박성원
안과 수술 예약금(차감용) 1 회 1 박상은
내복약-1일(10Kg이하) 3 회 3 박상은
[시그니처바이] P/a 1 개 1 김도희
1번 그룹
Cephalexin Cap. PO 22 mg/kg 2 3 1.082 박상은
Prednisolone Tab. (PDS) PO 0.3 mg/kg 2 3 1.476 박상은
Famotidine Tab. PO 0.5 mg/kg 2 3 1.23 박상은
Gabapentin Cap. PO 10 mg/kg 2 3 2.5 박상은
Trazodone Tab. PO 4 mg/kg 2 3 4 박상은
2번 그룹
NeckCollar 넥칼라-15cm(하늘) 1 EA 1 1 1 박상은
처방-안약-레보스타(levosta, levofloxacin, 레보 Eye 1 drop 1 1 1 박상은
플록사신, 항생제)
처방-안약-맥시트롤(덱사+네오마이신+폴리믹신 Eye 1 drop 1 1 1 박상은
B)
처방-안약-트루솝(trusopt, 도르졸라미드염산 Eye 1 drop 1 1 1 박상은
염, dorzolamide, 녹내장)
처방-안약-미드리아실소분-트로피카마이드 Eye 1 drop 1 1 1 박상은
(Tropicamide, trop,산동제)', '', 'f'::boolean, '4'::integer, '2026-04-20 06:25:18.064506+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '9584d35f-6ee8-4f4a-9a09-3f0fbc5a7594'::uuid, 'ec9d2ad1-d11a-4a11-8cff-dabe6ef8c11b'::uuid, '2026.02.14 16:32', 'Subjective
CC: 양안 백내장 수술 재진
OP) 26.02.11 양안 백내장 수술
S.
- 식욕, 활력 양호. 눈불편증상 없었음.
Ο.
청진: 양호
GC; BAR
BCS: 6/9
menace: 양안 양호
PLR: 경미한 산동+/+
Dazzle: +/+
* 우안 촉진 시 통증 심함.
안구 : 양안 양호
안검: 양안 양호
결막: 양안 경미한 충혈, 좌안 안충없음
각막: 양안 양호
전안방: 양안 플레어 2+. (우안<좌안) - 감소세 좌안 피브린 끈 형성
- 홍채: 우안 dyscoria, 좌안 양호
A.
수정체: 양안 IOL유지중
망막: 양안 양호
STT (14,12), IOPVetplus 2.0 (12,15)
양안) 유전성 백내장, 우안 포도막염
Rx.
양안) 레보스타 (6), 맥시트롤 (4), 프레드포르테 (4), 산동제 (2)
CE.
술후 관리 주의
내복약 짧게 ; 염증, 진정제 용량 조절 필요.
tPA주사 가능성, 불편 증상 시 당겨서 내원
P.
-1주뒤 재진
Objective
폴더 미지정
IMG_1965
IMG_1968
IMG_1971
IMG_1978
IMG_1983
IMG_1988
IMG_1991
IMG_1993
Plan
항목 경로 Qty 단위 일투 일수 사용량 담당의
진료비-재진료 1 회 1 박상은
안과신경검사 1 회 1 박상은
안과-안압검사 (재진) 1 회 1 박상은
안과-형광염색검사 1 회 1 박상은
안과(Slit Lamp검사)-재진 1 회 1 박상은
안과-안저검사 1 회 1 박상은
내복약-1일(10Kg이하) 7 회 7 박상은
1번 그룹
Cephalexin Cap. PO 22 mg/kg 2 7 2.649 박상은
Prednisolone Tab. (PDS) PO 0.3 mg/kg 2 7 3.612 박상은
Famotidine Tab. PO 0.5 mg/kg 2 7 3.01 박상은
Gabapentin Cap. PO 10 mg/kg 2 7 6 박상은
Trazodone Tab. PO 4 mg/kg 2 7 10 박상은
2번 그룹
처방-안약-레보스타(levosta, levofloxacin, 레보 Eye 1 drop 1 1 1 박상은
플록사신, 항생제)
처방-안약-맥시트롤(덱사+네오마이신+폴리믹신 Eye 1 drop 1 1 1 박상은
B)
처방-안약-프레드포르테(프레드니솔론, pred Eye 1 drop 1 1 1 박상은
forte)', '', 'f'::boolean, '2'::integer, '2026-04-20 06:25:18.064506+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'ac925b0b-7a61-4df7-a154-753ccd005a24'::uuid, 'ec9d2ad1-d11a-4a11-8cff-dabe6ef8c11b'::uuid, '2026.03.06 16:44', 'Subjective
CC: 양안 백내장 수술 재진-김포한강동물AH
OP) 26.02.11 양안 백내장 수술
S.
- 식욕, 활력 양호. 눈불편증상 없었음.
Ο.
청진: 양호
GC; BAR
BCS: 6/9
- menace: 양안 양호
- PLR: +/+ 양안 산동 풀림
- Dazzle: +/+
- 안구 : 양안 양호
- 안검: 양안 양호
- 결막: 양안 경미한 충혈, 좌안 안충없음
- 각막: 양안 양호
- 전안방: 양안 플레어 1+. (우안<좌안) - 감소세 좌안 피브린 끈 흡수됨
- 홍채: 우안 dyscoria, 홍채 후방 재유착 의심, 좌안 양호
- 수정체: 양안 IOL유지중
- 망막: 양안 시신경, 혈관, 반사도 양호
-STT (14,12), IOPVetplus 2.0 (7,12)
A.
양안) 유전성 백내장 수술, 우안 수정체 유착
Rx.
양안) 맥시트롤 (2)
* 10시후 점안 불가.
CE.
- 술후 관리 주의
- 내복약 짧게 ; 염증, 진정제 용량 조절 필요.
-tPA주사 가능성, 불편 증상 시 당겨서 내원
P.
-2주뒤 재진
Objective
폴더 미지정
IMG_3537
IMG_3539
IMG_3544
IMG_3549
IMG_3553
IMG_3554
IMG_3560
IMG_3562
Plan
항목 경로 Qty 단위 일투 일수 사용량 담당의
진료비-재진료 1 회 1 박상은
안과신경검사 1 회 1 박상은
안과-안압검사 (재진) 1 회 1 박상은
안과-형광염색검사 1 회 1 박상은
안과(Slit Lamp검사)-재진 1 회 1 박상은
안과-안저검사 1 회 1 박상은
새 그룹
처방-안약-맥시트롤(덱사+네오마이신+폴리믹신 Eye 1 drop 1 1 1 박상은
B)', '', 'f'::boolean, '0'::integer, '2026-04-20 06:25:18.064506+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '025e63bd-5a4b-4b89-b69f-915dfa2d6455'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2026-03-26 10:13:26', 'Subject
CC : 재진
CE) 다음주 리브레 장착.
리브레 구매하여 가져오시도록 안내드림.
500캡 한면 꾹눌러서+뚜껑조금(위장약)
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0009-00053
리브레장착비용
1
회
0
0
남기웅', 't'::boolean, '5'::integer, '2026-04-20 08:50:30.494677+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '0b44977f-f2e8-413f-91c2-dbd833980ba2'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2025-12-18 15:17:49', 'Subject
CC : 혈액검사, 잇몸진료
만성 췌장염, 당뇨, 케톤산증있어음.
당뇨는 지금 괜찮아져서 인슐린 안맞은지 1년정도 되었음.
최근에 환경이 변화가 있었음.
췌장수치, 신장수치가 안좋아서 영양제 먹고있음.
3개월전 혈액검사에서 췌장수치는 안좋은 상태에서 크게 변화가 없고 신장승치는 초기 신부전 의심.
구토는 하루 이틀에 한번씩 구토증상이 있음.
식욕, 활력, 변, 소변은 양호함.
영양제 : 뉴트라렌, 프로엔조프
in door, alone.
0)
청진 양호
MMC pink, CRT < 1.5s
치석 경도, 108 치아재흡수성병변.
A) 치아재흡수성병변
구토에 관련해서는 복부초음파검사 추천.
발치와 함께 치과x-ray, 복부초음파 추천.
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0001-00039
진료비-초진(Cat)
1
회
0
0
남기웅
TREATTX-0000-00249
검사-SDMA(조기신장마커)
1
회
0
0
남기웅
TREATTX-0000-00324
검사-혈액(혈청)-Chemistry(신장수치)
1
회
0
0
남기웅
TREATTX-0000-00085
검사-혈액-fPL(췌장염진단)
1
회
0
0
남기웅', 't'::boolean, '16'::integer, '2026-04-20 08:50:30.494677+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '0c3cade1-dbfa-4515-a473-3a968977adbb'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2026-01-19 14:55:25', 'Subject
CC : 초음파진료
구토가 잦음
스테로이드 먹을때는 구토가 줄었었는데 약을 끊으니 다시 구토가 심해짐.
밥 양이 줄어들음.
0)
복통없음
치은 양호, 치은 유합 완료 봉합사 남음.
A) IBD
스테로이드 일주일 복용 후 30일간 bosod로 관리.
basod로 잘 관리가 되면 유산균만 복용하면서 유지.
basod만 복용할 때 구토가 다시 심해지면 스테로이드 장기복용 고려.
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00015
진료비-재진
1
회
0
0
남기웅
TREATTX-0002-00055
내복약-1일 2회(일반약, 5~10kg)
7
회
0
0
남기웅
TREATTX-0009-00051
바쏘드BASOD 1T
30
회
0
0
남기웅
TREATTX-0000-00183
캡슐 조제비(capsule)
7
회
0
0
남기웅
ANI060
Prednisolone, prednisone (PDS) Tab.
0.5
mg/kg
7
14
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
7
14
PO
남기웅
ANB006
Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
7
14
PO
남기웅', 't'::boolean, '14'::integer, '2026-04-20 08:50:30.494677+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '13198bdc-91a0-412f-9c29-72f2d9865088'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2026-03-31 17:58:43', 'Subject
CC : 인슐린주사기 10개
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0009-00016
인슐린주사기(10ea)
1
개
0
0
남기웅', 't'::boolean, '1'::integer, '2026-04-20 08:50:30.494677+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '280755f6-e15f-4546-8553-88053b8f08e3'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2026-03-24 15:25:58', 'Subject
CC : 췌장염
식욕, 활력 양호.
2~3일에 한번 구토.
수액은 거부를 해서 못해주셨음.
0)
MMC pink, CRT < 1.5s
혈당550
fructrosamine 259
A)췌장염, 췌장염으로 인한 당뇨
CE) 다음주 리브레 장착.
췌장염치료 유지.
췌장염으로 인해 당뇨 발생하여 란투스 1IU BID 주사 시작.
당뇨관리 방법 보호자분께 안내드림.
리브레 구매하여 가져오시도록 안내드림.
500캡 한면 꾹눌러서+뚜껑조금(위장약)
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00585
진료비-재진(Cat)
1
회
0
0
남기웅
TREATTX-0000-00342
검사- fsaa(고양이염증수치)
1
회
0
0
남기웅
TREATTX-0005-00015
검사-혈액(혈청)-chemistry(기본항목당)
1
회
0
0
남기웅
TREATTX-0002-00055
내복약-1일 2회(일반약, 5~10kg)
7
회
0
0
남기웅
TREATTX-0000-00183
캡슐 조제비(capsule)
7
회
0
0
남기웅
TREATTX-0000-00625
인슐린-란투스(펜)
1
개
0
0
남기웅
TREATTX-0009-00016
인슐린주사기(10ea)
1
개
0
0
남기웅
ANB006
Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
7
14
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
7
14
PO
남기웅
TREATRX-0003-00003
camostat tab
10
mg/kg
7
14
10
남기웅
NEU002
Gabapentin Cap.
5
mg/kg
7
14
PO
남기웅
TREATRX-0003-00001
베아제
1
EA
7
14
po
남기웅', 't'::boolean, '6'::integer, '2026-04-20 08:50:30.494677+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '6f4894c3-721a-4bfc-b72f-8f348dffcfdf'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2026-03-12 14:21:51', 'Subject
CC : 예약
밥을 스스로 먹는데 어제밤부터 밥을 먹었다가 뱉었다가 함.
MMC pink,
CRT < 1.5s
복압 높음.
청진 양호
A) 췌장염
염증수치 감소 중으로 치료유지
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00585
진료비-재진(Cat)
1
회
0
0
남기웅
TREATTX-0000-00342
검사- fsaa(고양이염증수치)
1
회
0
0
남기웅
TREATTX-0002-00055
내복약-1일 2회(일반약, 5~10kg)
7
회
0
0
남기웅
TREATTX-0000-00289
소모품(NS500, 나비침 5ea)
4
개
0
0
남기웅
TREATTX-0000-00183
캡슐 조제비(capsule)
7
회
0
0
남기웅
TREATTX-0009-00068
주사기
14
회
0
0
남기웅
ANB006
Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
7
14
PO
남기웅
ANB095
Metronidazole Tab.
10
mg/kg
7
14
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
7
14
PO
남기웅
AN1060
Prednisolone, prednisone (PDS) Tab.
0.5
mg/kg
7
7
PO
남기웅
NEU002
Gabapentin Cap.
5
mg/kg
7
14
PO
남기웅', 't'::boolean, '8'::integer, '2026-04-20 08:50:30.494677+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '71e29f27-3112-4e3e-9f01-c1e07a7060ef'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2026-02-09 12:56:19', 'Subject
CC : 구토
약 먹고 상태가 많이 좋아짐.
CE) 영양제 다 끊고 스테로이드만 복용해보기로.
약먹고 괜찮으면 다음주에 재처방 후 테이퍼링
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0002-00055
내복약-1일 2회(일반약, 5~10kg)
14
회
0
0
남기웅
TREATTX-0000-00183
캡슐 조제비(capsule)
14
회
0
0
남기웅
ANI060
Prednisolone, prednisone (PDS) Tab.
0.5
mg/kg
14
28
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
14
28
PO
남기웅
ANB006
Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
14
28
PO
남기웅', 't'::boolean, '12'::integer, '2026-04-20 08:50:30.494677+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '7a2c99c7-e246-4606-8d63-e449b407c6a5'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2026-03-09 14:26:28', 'Subject
CC : 췌장염, 염증 검사
보호자분이 2시간 간격으로 급이하고있는데 기력은 여전히 없음.
많이 먹으면 토함.
피하수액 잘해주고 계심.
MMC pink,
CRT < 1.5s
체온 38.8
복압 높음.
초음파 : 췌장 좌측 전반적이 에코상승과 저에코성 결절 확인. 소장 양호
A) 췌장염
결절크기 지난번과 비슷. 종양가능성 있으나 3개월전 초음파에서 췌장 양호하여 가능성 적음
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00015
진료비-재진
1
회
0
0
남기웅
TREATTX-0005-00015
검사-혈액(혈청)-chemistry(기본항목당)
1
회
0
0
남기웅
TREATTX-0000-00342
검사- fsaa(고양이염증수치)
1
회
0
0
남기웅
TREATTX-0000-00065
검사-혈액-Fructosamine검사
1
회
0
0
남기웅
TREATTX-0002-00055
내복약-1일 2회(일반약, 5~10kg)
3
회
0
0
남기웅
TREATTX-0000-00289
소모품(NS500, 나비침 5ea)
2
개
0
0
남기웅
TREATTX-0000-00183
캡슐 조제비(capsule)
3
회
0
0
남기웅
NEU002
Gabapentin Cap.
5
mg/kg
3
6
PO
남기웅', 't'::boolean, '9'::integer, '2026-04-20 08:50:30.494677+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '7d0065d0-8e6e-44ce-b088-6e2185f39c27'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2026-03-28 14:05:03', 'Subject
CC : 전화상담
인슐린 처치 후에도 당이 안 떨어지고 종일 안 먹음
->
Object
Result
Part
Title
Sign', '', 'f'::boolean, '4'::integer, '2026-04-20 08:50:30.494677+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '89361738-cd68-4623-8294-4835e290468f'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2025-12-30 09:24:02', 'Subject
CC : 스케일링 발치 예약
전날 오후 11시부터 금식금수
지난번 발치가 2년, 그전이 3년정도 되었었음.
0)
US: 장근층 비후
A) IBD
약물에 대한 반응 확인
Object
Result
Part
Title
Sign
남기웅
Assessment
Plan
Type
Diagnosis
Sign ID
DDX
발치
남기웅', 'Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00158
검사-혈액-CBC(혈구검사)
1
회
0
0
남기웅
LC-002
검사-혈액(혈청)-Chemistry(술전검사)
1
회
0
0
남기웅
EG-002
검사-X-ray(흉부, 10kg 이하)
1
회
0
0
남기웅
TXTEMP00078
할인
1
0
0
남기웅
FA-010
마취-호흡(7kg이하)
1
회
0
0
남기웅
TREATTX-0000-00648
수술-치과-스케일링(10kg 이하)
1
회
0
0
남기웅
EC-004
검사-초음파-복부
1
회
0
0
남기웅
TREATTX-0006-00002
검사-X-ray(치과)
1
회
0
0
남기웅
TREATTX-0000-00152
수술-치과-3root or 수술적발치
1
회
0
0
남기웅
FA-003
마취-수면propofol(1-7kg)
1
회
0
0
남기웅
TREATTX-0009-00051
바쏘드BASOD 1T
7
외회
0
0
남기웅
TREATTX-0002-00055
내복약-1일 2회(일반약, 5~10kg)
7
회
0
0
남기웅
TREATTX-0000-00183
캡슐 조제비(capsule)
7
회
0
0
남기웅
ANB006
Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
7
14
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
7
14
PO
남기웅
ANI060
Prednisolone, prednisone (PDS) Tab.
0.5
mg/kg
7
14
PO
남기웅
8806718050755
프리폴-엠시티주(프로포폴) (12ml)
6
ml
1
1
남기웅
8806498019225
부토판주사2밀리그람/밀리리터(주석산부토르
2
ml
1
1
남기웅
8806478007631
잠친디아제팜주 (10mg)
1
ml
1
1
남기웅', 't'::boolean, '15'::integer, '2026-04-20 08:50:30.494677+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'a35f7768-a4e9-4b6f-ac43-edd8c7133f2a'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2026-02-24 15:23:59', 'Subject
CC : 구토진료
열흘에 한번씩 구토하다가 오늘은 4일만에 구토를 함.
약을 먹기전에는 소화가 안된 건조한 사료토를 했는데 요즘은 반쯤소화된 사료를 물이랑 분수처럼 구토함.
CE)
이번까지 BID 유지
열흘에 한번정도 구토가 유지된다면 초음파에서 이상이 없다면 tapering
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0002-00055
내복약-1일 2회(일반약, 5~10kg)
14
회
0
0
남기웅
TREATTX-0000-00183
캡슐 조제비(capsule)
14
회
0
0
남기웅
TREATTX-0002-00055
내복약-1일 2회(일반약, 5~10kg)
7
회
0
0
남기웅
TREATTX-0000-00183
캡슐 조제비(capsule)
7
회
0
0
남기웅
TREATTX-0005-00036
캡슐200
1
회
0
0
남기웅
ANI060
Prednisolone, prednisone (PDS) Tab.
0.5
mg/kg
14
28
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
14
28
PO
남기웅
ANB006
Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
14
28
PO
남기웅', 't'::boolean, '11'::integer, '2026-04-20 08:50:30.494677+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'c1a15f48-b768-4f80-8d36-7675a78e265e'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2026-03-31 13:48:55', 'Subject
CC : 전화상담
오늘 아침 주사기 다른걸로 인슐린 주셔서 용량이 많이 들어감
저혈당까지는 안왔는데 수치가 많이 내려갔대요
저녁 주사 놔줘야하는 문의 주셨어요
Object
Result
Part
Title
Sign', '', 'f'::boolean, '2'::integer, '2026-04-20 08:50:30.494677+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'c41c1b6c-1fe4-48aa-8947-afb125287287'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2026-03-30 14:14:27', 'Subject
CC : 췌장염 내복약 처방
캡슐 크기 작은걸로
200 한면 평평하게 (9.5정도)
마로피턴트5.5개 추가결제됨
다음 진료 시 차감
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0002-00055
내복약-1일 2회(일반약, 5~10kg)
7
회
0
0
남기웅
TREATTX-0002-00051
내복약-항구토제(maropitant 16mg)
7
개
0
0
남기웅
TREATTX-0000-00183
캡슐 조제비(capsule)
7
회
0
0
남기웅
ANB006
Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
7
14
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
7
14
PO
남기웅
TREATRX-0003-00003
camostat tab
10
mg/kg
7
14
10
남기웅
NEU002
Gabapentin Cap.
5
mg/kg
7
14
PO
남기웅
TREATRX-0003-00001
베아제
1
EA
7
14
po
남기웅', 't'::boolean, '3'::integer, '2026-04-20 08:50:30.494677+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'ddf943b8-d0c9-4d44-ae99-6f32a7baf324'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2026-02-03 15:46:27', 'Subject
CC : 구토
초음파진료 이후에도 계속 구토 지속 - 보호자분만 오심
영양제를 안먹으니까 괜찮아졌다가
3일전부터 구토를 함. 그제는 3번까지하고 어제오늘 한번씩 구토를 함.
CE) 영양제 다 끊고 스테로이드만 복용해보기로.
약먹고 괜찮으면 다음주에 재처방 후 테이퍼링
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0002-00055
내복약-1일 2회(일반약, 5~10kg)
7
회
0
0
남기웅
TREATTX-0000-00183
캡슐 조제비(capsule)
7
회
0
0
남기웅
ANI060
Prednisolone, prednisone (PDS) Tab.
0.5
mg/kg
7
14
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
7
14
PO
남기웅
ANB006
Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
7
14
PO
남기웅', 't'::boolean, '13'::integer, '2026-04-20 08:50:30.494677+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'e4d87887-db00-4580-9233-82084ada39b9'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2026-03-05 10:29:12', 'Subject
CC : 초음파 진료
식욕부진으로 내원.
MMC pink, CRT < 1.5s
체온 39.4
복압 높음.
초음파 : 췌장 좌측 전반적이 에코상승과 저에코성 결절 확인. 소장 양호
CBC : 양호
Chemi: 혈당수치 상승, chol, lapase상승.
FSAA상승, FPL 정상
A) 췌장염
보호자분 입원치료 원하지 않으셔서 피하수액 및 통원치료로 치료해보기로함.
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00015
진료비-재진
1
회
0
0
남기웅
TREATTX-0000-00158
검사-혈액-CBC(혈구검사)
1
회
0
0
남기웅
LC-010
검사-혈액(혈청)-Chemistry(17종검사)
1
회
0
0
남기웅
TREATTX-0000-00342
검사- fsaa(고양이염증수치)
1
회
0
0
남기웅
TREATTX-0000-00085
검사-혈액-fPL(췌장염진단)
1
회
0
0
남기웅
EC-003
검사-초음파-장기
1
회
0
0
남기웅
TREATTX-0014-00014
단순입원(F9, <5kg,주간)
1
회
0
0
남기웅
HA-007
수액-수액처치료A(10Kg미만)
1
회
0
0
남기웅
TREATTX-0000-00575
수액-수액펌프
1
회
0
0
남기웅
CB-001
주사-정맥주사(10kg미만)
1
회
0
0
남기웅
TREATTX-0000-00537
정맥주사 CRI (10kg미만)
1
회
0
0
남기웅
TREATTX-0002-00055
내복약-1일 2회(일반약, 5~10kg)
7
회
0
0
남기웅
TREATTX-0000-00183
캡슐 조제비(capsule)
7
회
0
0
남기웅
TREATTX-0005-00036
캡슐200
1
회
0
0
남기웅
TREATTX-0003-00022
피하수액 - 주사기+나비침
4
회
0
0
남기웅
TREATTX-0000-00601
피하수액 - NS
1
회
0
0
남기웅
ANI060
Prednisolone, prednisone (PDS) Tab.
0.5
홀
7
7
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
7
14
PO
남기웅
ANB006
Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
7
14
PO
남기웅
ANB095
Metronidazole Tab.
10
mg/kg
7
14
PO
남기웅', 't'::boolean, '10'::integer, '2026-04-20 08:50:30.494677+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'e9533401-bcea-464f-ab16-d00e61dd8523'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2026-03-19 14:53:50', 'Subject
CC : 췌장염
밥 먹고 물도 잘먹어서 수액을 줄였음.
수액을 줄였더니 구토를 함
0)
초음파 : 췌장 결절 크기 감소, 소장 양호, 위 양호
A) 췌장염
아직 초음파에서 염증소견 확인되어 수액 유지.
수액은 4시간간격에서 하루 2번으로 횟수 조절.
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00585
진료비-재진(Cat)
1
회
0
0
남기웅
TREATTX-0002-00055
내복약-1일 2회(일반약, 5~10kg)
7
회
0
0
남기웅
EC-003
검사-초음파-장기
1
회
0
0
남기웅
TREATTX-0000-00183
캡슐 조제비(capsule)
7
회
0
0
남기웅
ANB006
Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
7
14
PO
남기웅
DIG022
Famotidine Tab.
0.5
mg/kg
7
14
PO
남기웅
TREATRX-0003-00003
camostat tab
10
mg/kg
7
14
10
남기웅
NEU002
Gabapentin Cap.
5
mg/kg
7
14
PO
남기웅
TREATRX-0003-00001
베아제
1
EA
7
14
po
남기웅', 't'::boolean, '7'::integer, '2026-04-20 08:50:30.494677+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'e99fe704-07ac-479d-ab6c-6b2258c6cf93'::uuid, 'ba6e2344-9d70-4f30-836f-51a64178c8b4'::uuid, '2026-04-06 14:57:42', 'Subject
CC : 재진
컨디션 양호
리브레는 금요일>토요일 넘어가는 새벽에 떨어짐
4월 2일부터 인슐린 주사하지 않으셨음.
0)
fsaa 정상
혈당 경미한 상승
A) 당뇨 및 췌장염 치료종료
인슐린 투약하지 않아도 4월 1일 이후 리브레혈당그래프 정상혈당이어서 당뇨 치료종료.
영양제는 다 끊고 코발라플렉스 추천드림.
Object
Result
Part
Title
Sign
남기웅', '무늬김_2026-04-07
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00585
진료비-재진(Cat)
1
회
0
0
남기웅
TREATTX-0000-00342
검사- fsaa(고양이염증수치)
1
회
0
0
남기웅
TREATTX-0005-00015
검사-혈액(혈청)-chemistry(기본항목당)
1
회
0
0
남기웅', 't'::boolean, '0'::integer, '2026-04-20 08:50:30.494677+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '8175912c-c2b6-41c9-a5e0-339532d60d20'::uuid, 'b39a7ebc-dcd8-488d-a0e1-01e7ecfad96f'::uuid, '2026-04-18 13:01:59', 'Subject
CC : 건강검진-기본,근골격
관절주의/오메가, 안약bidOU(교육), 다음주 결과상담
접종일정
활식변뇨 특이사항 없음
no dsc, 한달에 한두번 밥 안먹고 공복토
우측 후지 오래 걷거나, 누워있다가 일어날 때 불편한 것 있음
HWP 집에서 먹는약,
8월에 입양, alone
- 사료: 일반 사료(밸릭서)
- 간식: 일반 시중 간식(녹각, 연어 등등), 영양제(칼슘, 비타민d)
aus NRF
mild tartar
AU 이개부발적, 귀지 +
OU 소포성결막염
108 치아 모양 이상
치아상태 양호 (25.02 스케일링/발치)
양측 고관절 신전시 통증반응
무릎 촉진시 싫어함
CE)
경도 소포성 결막염 - 안약으로 관리.
좌측 고관절염 관절 보조제 권장
간보조제, 식이주의 - 특이사항 없으면 6달 뒤 수치재검하기, 구토설사 등 이상시내원 필요
고관절 문제 가능성 의심', '', 'f'::boolean, '0'::integer, '2026-04-22 03:22:09.214192+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '6fa4784a-ca1a-48bb-9d1a-776259d84288'::uuid, 'def92dd9-8572-48a3-bfed-3c2a1708678b'::uuid, '2026-04-18 12:36:13', 'Subject
CC : 검진결과, 관절주사
양치, 관절주의/보조제, 1달 치아/관절주사
마취 깨고 컨디션 괜찮았음
약 먹고 설사가 있어서, 약 중단하니까 바로 괜찮았음
맑은 콧물, 코막힌 소리가 자주 있음
활식변뇨 특이사항 없음
no vdsc
그루밍을 안하는 편
식이:RC라이트앤웨이트
샵에서 어릴 때 입양, 동거묘 1마리
Vx 유년기 완료
aus NRF
26.4 스케일링
AU 갈색귀지소량
OU 경도결막충혈
우측 코 콧물
양측 고관절 관절염, 아탈구
고관절 신전 및 운동시 통증 반응
CE)
마취후안내 양치내일부터
26.4
혈구검사, 간, 신장 수치 등 전반적인 혈액검사 결과가 정상범위로 확인됩니다.
심장 관련 BNP 수치, 신장의 이상을 조기에 확인하는 SDMA 수치, 췌장효소수치(fPL), 갑상선 수치(T4)도 정상 범위로 확인됩니다.
방사선에서 양측 고관절 관절염 소견이 관찰됩니다. 체중 조절과 관절보조제가 권장되며 가정에서 보행, 점프시 어려움이 없는지 관찰해 주
세요.
양측 눈에서 경도의 결막충혈이 관찰됩니다. 눈곱이 끼거나 눈을 불편해하지 않는지 모니터링 해 주세요.
양측 귀에서 갈색 귀지가 소량 관찰됩니다. 주기적인 귀세정이 권장됩니다.
우측 비공에서 콧물이 확인됩니다. 지속적인 콧물이나 기침 등이 발생하지 않는지 모니터링 해 주세요. 증상이 있는 경우 진료가 필요합니다', '', 'f'::boolean, '0'::integer, '2026-04-22 03:59:23.400382+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'f1e8fb94-e485-4d30-8885-da7ad2ef4b70'::uuid, '9ee98309-dde9-4f96-967f-b7a40f7336de'::uuid, '2026-04-20 14:55:22', 'Subject
CC : 혈변 / 건강검진-종합,근골격
소변받아오기/결과상담일정/1주재-혈변, 지알디아
변구토사진/식이주의/물충분히 관절주의
어제 점심부터 설사, 혈변/점액변 시작. 어제 아침 구토 1번
설사 이후 기력감소, 저녁에 복명음/방귀냄새 심함. 식욕은 괜찮았음
최근 계란 먹은 것 외에 특이사항 없음
활식배뇨 특이사항 없음
발가끔 핥는 편, 오른쪽 앞발 굳은살
유선 혹 만져지는 것 없음
2년 전 스케일링
7살 때 중성화 수술, 출산이력 없음
어릴 때 입양, alone
PHI:
Vx. 최근 x, HWP 먹는약
BCS 5/9, BP 160(#2)
AUS nrf
AU nrf
OU 홍책위축, 핵경화증, 부분백내장
MMC pink, CRT 1sec
moderate tartar, mild gingivitis
bi MPL(g1)
사지 지간염
유선종양 술부 nrf
Giardia kit: weak pos / 분변도말 nrf
신경계검사 nrf
X-ray: nrf
US: 양측 신장에코상승, 췌장주위 에코상승
Echo: MMVD B1~2. moderate MR, no TR
Tx)
Fluids: N/S + vit.B,C + tau
킹벨린 SC
Rx)
metro 12, bestase bid for 7days
CE)
지알디아 감염에 준하여 내복약 처치. 1주일 후 재진
초음파 상 양측 신장 에코상승 원내 신장수치 정상
MMVD B1~2.3~6개월 단위 심장체크
유선종양 수술 이후 새로운 종괴 없음. 모니터링 지속
검진소견
간, 신장, 췌장 등 전반적인 혈액검사 수치가 양호한 편입니다.
양측 눈에 수정체 혼탁과 홍채위축 등 노령성 변화가 관찰됩니다. 현재 시력에 문제 없으나 잘 관찰해주세요.
중등도의 치석과 잇몸염증이 확인됩니다. 양치질과 주기적인 스케일링으로 치아를 관리해주세요.
양측 슬개골 탈구가 있습니다. 체중관리와 관절보조제 복용이 권장되며 무리한 운동을 피해주세요.
종양표지자가 증가되어 있으며 우측 겨드랑이와 유선 주위 종괴가 관찰됩니다. 외과적인 제거와 조직검사를 추천합니다.
고지혈증이 있어 체중관리와 식단관리가 권장됩니다. 이후 3개월 뒤 재검을 권장합니다.
심장바이오마커 수치가 정상보다 높게 측정되었고 심장초음파상 이첨판의 경미한 변성이 관찰됩니다. 주기적인 검사를 통한 심장질환 진행
상태 확인이 필요합니다.
소변 검사 결과 요비중이 높고 스트루바이트(struvite)와 칼슘 옥살레이트(calcium oxalate) 성분의 결정이 검출되었습니다. 평소 충분한
물을 섭취하도록 하여 결석을 예방해주세요.', '', 'f'::boolean, '0'::integer, '2026-04-22 06:35:52.754452+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '400933b9-4add-4966-97b6-9d93eab6f485'::uuid, '3a6dff31-2ad2-4e3c-8b07-9ad9566de248'::uuid, '2026-04-20 18:17:51', 'Subject
CC : 피부종괴-턱, 발톱외상-LtHL, 검진결과
다음주-수술/스케일링/발톱체크, 넥칼라, 약5bid(식후)
접종/검사이력
СВРІ 42/100 (04.18)
HCPI 15/52 (04.18)
턱 아래 종괴, 1년정도, 서서히 커짐,
1주 전 쯤 우측 가슴 쪽에 있던 종괴 타 병원에서 부분 마취 후 제거 이력
활식변뇨 특이사항 없음
no vds. 마른기침하는 경우 있음
- 보행: 뒷다리 힘이 점점 빠져 발을 끌고다닐때가 있습니다
펫샵 입양, alone
Vx. 최근 x, HWP NG 먹임
- 사료: 일반 사료(로얄캐닌 미니독 시니어), 조제 화식(브로콜리, 당근, 양배추, 닭가슴살, 돼지목살)
- 간식: 일반 시중 간식(쉐프스키친)
- 산책 횟수: 주 1~2회
- 산책 경로:, 풀숲과 그 근처 길
- 유치원 방문 등: 방문하지 않음"
aus NRF
mmc pink, CRT 1s
severe tartar, gingivitis, 일부치아소실
AU 이도내발적, 귀지 +
OU 수정체혼탁, 홍채위축 OU 부분백내장 의심
PLR, dazzle, palpe, manance pos
턱아래 피하종괴 15mm X 15mm, 턱아래 피부종괴 2mm x 3mm(입술경계부)
목아래 각질 - 발사 완료된 술부로 확인됨
US 담낭슬러지, 전립선비대, 췌장에코상승
왼쪽 뒷발 발톱 잘라내고 드레싱
echo mild MR, NO TR
Rx)
cepha 25, metacam 0.05, famo 0.5 bid for 5days (식후)
CE)
BNP 상승이 확인됩니다.
영상검사상 기관허탈, 기관 휘어짐
복부 초음파에서 담낭슬러지가 관찰됩니다. 주기적인 모니터링이 권장됩니다.
전립선 비대소견이 관찰됩니다. 평소 배뇨 배변시 힘들어하지 않는지 모니터링 해 주세요. 중성화 수술이 권장됩니다.
췌장수치와 고지혈증 수치의 상승이 관찰되며 췌장 에코의 상승이 관찰됩니다
흉요추부에서 퇴행성 척추증이 관찰되며 양측 슬개골 탈구가 확인됩니다.
양측 눈에서 수정체혼탁과 홍채위축 등 노령성 변화가 관찰되며 우측 눈에서 부분 백내장 의심 소견이 관찰됩니다. 주기적인 모니터링이 권
장됩니다.
심한 치석과 치주염이 관찰되며 일부 치아의 소실이 확인됩니다.
턱아래 출혈 동반한 피하종괴와 피부 종괴, 콧잔등 종괴가 관찰됩니다.
허리, 무릎 등 관절 통증 가능성 고려 - 혈액검사 결과 이상 없으면 진통제 사용 고려', '', 'f'::boolean, '0'::integer, '2026-04-22 07:36:21.566537+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'e2e1f872-18b3-4bf8-918a-0a79cc5d265f'::uuid, '3a6dff31-2ad2-4e3c-8b07-9ad9566de248'::uuid, '2026-04-18 14:03:09', 'Subject
CC : 피부종괴-턱, 건강검진-종합,근골격,두부X-ray
결과상담/수술일정, 접종/검사이력
СВРІ 42/100 (04.18)
HCPI 15/52 (04.18)
턱 아래 종괴, 1년정도, 서서히 커짐,
1주 전 쯤 우측 가슴 쪽에 있던 종괴 타 병원에서 부분 마취 후 제거 이력
활식변뇨 특이사항 없음
no vds. 마른기침하는 경우 있음
- 보행: 뒷다리 힘이 점점 빠져 발을 끌고다닐때가 있습니다
펫샵 입양, alone
Vx. 최근 x, HWP NG 먹임
- 사료: 일반 사료(로얄캐닌 미니독 시니어), 조제 화식(브로콜리, 당근, 양배추, 닭가슴살, 돼지목살)
- 간식: 일반 시중 간식(쉐프스키친)
- 산책 횟수: 주 1~2회
- 산책 경로:, 풀숲과 그 근처 길
- 유치원 방문 등: 방문하지 않음"
aus NRF
mmc pink, CRT 1s
severe tartar, gingivitis, 일부치아소실
AU 이도내발적, 귀지 +
OU 수정체혼탁, 홍채위축 OD 부분백내장 의심
턱아래 피하종괴 15mm X 15mm, 턱아래 피부종괴 2mm x 3mm(입술경계부)
목아래 각질 - 발사 완료된 술부로 확인됨
US 담낭슬러지, 전립선비대, 췌장에코상승
echo mild MR, NO TR
CE)
BNP 상승이 확인됩니다.
영상검사상 기관허탈, 기관 휘어짐
복부 초음파에서 담낭슬러지가 관찰됩니다. 주기적인 모니터링이 권장됩니다.
전립선 비대소견이 관찰됩니다. 평소 배뇨 배변시 힘들어하지 않는지 모니터링 해 주세요. 중성화 수술이 권장됩니다.
췌장수치와 고지혈증 수치의 상승이 관찰되며 췌장 에코의 상승이 관찰됩니다
흉요추부에서 퇴행성 척추증이 관찰되며 양측 슬개골 탈구가 확인됩니다.
양측 눈에서 수정체혼탁과 홍채위축 등 노령성 변화가 관찰되며 우측 눈에서 부분 백내장 의심 소견이 관찰됩니다. 주기적인 모니터링이 권
장됩니다.
심한 치석과 치주염이 관찰되며 일부 치아의 소실이 확인됩니다.
턱아래 출혈 동반한 피하종괴와 피부 종괴, 콧잔등 종괴가 관찰됩니다.
허리, 무릎 등 관절 통증 가능성 고려 - 혈액검사 결과 이상 없으면 진통제 사용 고려', '', 'f'::boolean, '1'::integer, '2026-04-22 07:36:21.566537+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '520bc35f-766e-4ff2-9538-f9a937b180f0'::uuid, '5c809db0-0075-42ba-b535-304a933e666e'::uuid, '2026-04-15 15:23:46', 'Subject
CC: CIE 재진
S)
HPI
;
활력 0
식욕 0
구토 1
배변 1
: 배변성상 1
체중감소 0
CCECAI score 10 -> 3', 'CE.P)
- 1주뒤 단백질, 간수치, 초음파 체크 예정
Plan
Code Treatment/Prescription Qty Unit Day Total Route Sign ID
TREATTX-7000-00004 진료비(재진) 1 회 0 0 백동기
BA-001 내복약-1일 2회(5kg미만) 7 일 0 0 백동기
TREATTX-0000-00018 특수내복약(omeprazole) 1T당 3.5 회 0 0 백동기
TREATTX-0000-00289 특수내복약(silybin) 1T 당 5.5 회 0 0 백동기
TREATTX-0000-00014 특수내복약(SAMe) 1T당 3.5 회 0 0 백동기
TREATRX-0019-00001 내복약-하루2회 0 mg 7 7 백동기
ANB095 Metronidazole Tab.(메트로니다졸) 15 mg/kg 7 14 PO 백동기
DIG022 Famotidine Tab.(파모티딘) 0.5 mg/kg 7 14 PO 백동기
ANI060 Prednisolone (PDS) Tab.(프레드니솔론) 1 mg/kg 7 14 PO 백동기
DIG052 Omeprazole Tab.(오메프라졸) 0.5 mg/kg 7 14 PO 백동기
LIV006 Ursodeoxycholic acid(UDCA) Tab.(우루사) 7.5 mg/kg 7 14 PO 백동기
LIV001 biphenyl-dimethyl-dicarboxylate 1.5 mg/kg 7 14 PO 백동기
TREATRX-0009-00001 silybin tab.(실리빈) 5 mg/kg 7 14 PO 백동기
LIV003 S-adenosyl methionine Tab.(사데닌) 10 mg/kg 7 14 PO 백동기', 't'::boolean, '0'::integer, '2026-04-23 06:52:59.438316+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'b2479e9c-821b-45f9-ba36-0819b99c398a'::uuid, '5c809db0-0075-42ba-b535-304a933e666e'::uuid, '2026-04-07 17:14:51', 'Subject
CC: 혈변, IBD
S)
HPI
; 2주간 지속
: 묽은변, 설사와 같이 나타남
GE : 평소먹는양의 반절정도 먹고, 오늘은 아예 안먹음, 맛있는것도 안먹음, 활력은 평소와 동일
GI: 구토 하루 1회정도(일주일에 2회, 2주정도 지속됨), 혈변은 12월부터 간헐적으로 지속되고 있음
RES: 기침 콧물 재채기 호흡곤란 없음
UR: 음수 배뇨 정상
PHI: none
SUR: 중성화 수술
MED: 최근 2주이내 혈변약 제외하고는 없음
DIET
: 치아때문에 식욕이 좋지 않음
: 식이적인 요인 없음
VAC: none
DW: 12월~1월 (구충제)
O)
분변검사
설사
1. 식이성 스트레스성
2. 감염성(바이러스성/세균성/기생충) - 분변검사, 키트
3. 대사성(전신질환) - 혈액검사, 영상검사
4. 종양성 - 영상검사
IBD(면역매개 질환)
질병의 위험성 <---> 약물의 위험성
PDS 1(고용량) -> 간수치 상승, 위장관 자극(구토)
famo
ome
udca
leoftil
silybin
same
IBD', '분변이식, 줄기세포치료
캡슐: 500mg (꽉참)/캡슐조제비용 다음조제시 발생가능성 안내.
Plan
Code Treatment/Prescription Qty Unit Day Total Route Sign ID
TREATTX-7000-00004 진료비(재진) 1 회 0 0 백동기
EH-004 검사-분변검사-도말법 1 회 0 0 백동기
ED-020 검사-키트-파보+코로나+지알디아(CPV+CCV 1 회 0 0 백동기
LB-002 검사-혈액(혈구)-CBC 1 회 0 0 백동기
LC-001 검사-혈액(혈청)-Chemistry 1항목 9 회 0 0 백동기
TREATTX-0005-00007 검사-혈액(혈청)-Chemistry(CRP) 1 회 0 0 백동기
LD-004 검사-혈액(전해질)-Na,K,CI 1 회 0 0 백동기
ED-026 검사-키트-cPL(Canine Pancreas-specific 1 회 0 0 백동기
TREATTX-0006-00004 검사-X-ray(복부) 2컷(10kg미만) 1 회 0 0 백동기
EC-003 검사-복부정밀초음파 1 회 0 0 백동기
BA-001 내복약-1일 2회(5kg미만) 7 일 0 0 백동기
TREATTX-0000-00025 특수내복약(cerenia) 1T당 2 회 0 0 백동기
TREATTX-0000-00018 특수내복약(omeprazole) 1T당 3 회 0 0 백동기
TREATTX-0000-00289 특수내복약(silybin) 1T 당 5 회 0 0 백동기
TREATTX-0000-00014 특수내복약(SAMe) 1T당 3 회 0 0 백동기
TREATRX-0019-00001 내복약-하루2회 0 mg 7 7 백동기
ANB095 Metronidazole Tab.(메트로니다졸) 15 mg/kg 7 14 PO 백동기
DIG022 Famotidine Tab.(파모티딘) 0.5 mg/kg 7 14 PO 백동기
ANI060 Prednisolone(PDS) Tab.(프레드니솔론) 1 mg/kg 7 14 PO 백동기
DIG052 Omeprazole Tab.(오메프라졸) 0.5 mg/kg 7 14 PO 백동기
LIV006 Ursodeoxycholic acid(UDCA) Tab.(우루사) 7.5 mg/kg 7 14 PO 백동기
LIV001 biphenyl-dimethyl-dicarboxylate 1.5 mg/kg 7 14 PO 백동기
TREATRX-0009-00001 silybin tab.(실리빈) 5 mg/kg 7 14 PO 백동기
LIV003 S-adenosyl methionine Tab.(사데닌) 10 mg/kg 7 14 PO 백동기
DIG040 Maropitant Tab.(마로피턴트) 1 mg/kg 7 7 PO 백동기', 't'::boolean, '1'::integer, '2026-04-23 06:52:59.438316+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '16bf2dde-cb66-464c-a12b-7355388459ec'::uuid, '03d77abb-cdd5-46c3-b963-7d604fd3dd27'::uuid, '2026-04-13 10:08:23', 'Subject
CC: OP)방광결석
S)
걸을때 뒷다리 꼬리를 말고 있음
다리를 절거나 들지 않음
거의 안움직임
배변 하루에 겨우겨우
아직 오줌은 시원하게 하고 있음', '기침 등은 잘 유지되는 느낌
금식 금수 양호
Plan
Code Treatment/Prescription Qty Unit Day Total Route Sign ID
LB-002 검사-혈액(혈구)-CBC 1 회 0 0 백동기
LC-001 검사-혈액(혈청)-Chemistry 1항목 8 회 0 0 백동기
LD-004 검사-혈액(전해질)-Na,K,CI 1 회 0 0 백동기
EC-002 검사-심장초음파(재진) 1 회 0 0 백동기
EG-001 검사-X-ray(흉부) 2컷(10kg미만) 2 회 0 0 백동기
TREATTX-0006-00004 검사-X-ray(복부) 2컷(10kg미만) 2 회 0 0 백동기
TREATTX-0000-00189 검사-초음파(비뇨기계) 1 회 0 0 백동기
TREATTX-7002-00001 처치-입원비-5kg미만(1일 기준) 2 회 0 0 백동기
TREATTX-0000-00067 수액-일반(5kg미만) 1일 기준 2 회 0 0 백동기
TREATTX-0000-00158 수액-추가-진통수액(TLK) 2 회 0 0 백동기
TREATTX-0000-00075 수액-인퓨전펌프 1일 기준 2 회 0 0 백동기
TREATTX-0000-00074 수액-소모품-나비침 1 회 0 0 백동기
TREATTX-0000-00072 수액-소모품-수액세트 1 회 0 0 백동기
TREATTX-0000-00073 수액-소모품-수액연장선 1 회 0 0 백동기
CB-001 주사-정맥 주사(5kg 미만) 8 회 0 0 백동기
TREATTX-0000-00288 추가 주사제-Amoxicillin/Clavulanic 2 회 0 0 백동기
IB-003 의료소모품-정맥카테터 1 EA 0 0 백동기
TREATTX-0000-00076 처치-정맥카테터설치 1 회 0 0 백동기
TREATTX-0000-00066 마취-호흡-유도(propofol) 1 회 0 0 백동기
FA-006 마취-호흡-전처치 1 회 0 0 백동기
FA-001 마취-호흡-모니터링 1 회 0 0 백동기
TREATTX-0007-00001 마취-호흡-체온유지장치 1 회 0 0 백동기
FA-011 마취-호흡(5kg 이하) 1 회 0 0 백동기
TREATTX-0007-00015 수술-수술소모품(1회용) 1 회 0 0 백동기
GE-001 수술-비뇨기-방광결석 1 회 0 0 백동기
EB-001 검사-요검사-결석성분 분석(의뢰) 1 회 0 0 백동기
TREATTX-0000-00184 처치-요도카테터(수컷) 1 회 0 0 백동기
TREATTX-0000-00082 처치-요도카테터 유지(1일) 2 회 0 0 백동기
TREATTX-0000-00032 수액-승압제(Dopamin, Dobutamin)e) 1 회 0 0 백동기
TREATTX-0000-00049 주사(응급)-atropine 1 회 0 0 관리자
TREATTX-0000-00169 주사(응급)-glycopylorrate 1 회 0 0 관리자
8806498017429 미다컴주5밀리그람(미다졸람) (5mg) 0 1 1 백동기
8806498019126 부토판주사1밀리그람/밀리리터(주석산부토르 0 ml 1 1 IV 백동기
8806674008425 비브라운프로포폴-리푸로1%주 (20ml) 0 ml 1 1 백동기', 't'::boolean, '1'::integer, '2026-04-23 06:54:34.70477+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'a028510b-3707-4041-acc6-568eee410e51'::uuid, '03d77abb-cdd5-46c3-b963-7d604fd3dd27'::uuid, '2026-04-16 11:07:49', 'Subject
CC : 퇴원)방광결석
0)
방광결석 성분검사 - CaOx
Tx)
none
Rx)
pimo
code
theo
amc
famo
7 days', 'CE. P)
실밥제거 하면서 심장체크 계획
Plan
Code Treatment/Prescription Qty Unit Day Total Route Sign ID
TREATTX-0000-00161 심장약-1일 2회(5kg미만) 7 회 0 0 백동기
TREATTX-0000-00022 특수내복약(pimobendan) 1T당 0.5 회 0 0 백동기
IB-007 의료소모품-Neck Collar(12.5cm) 1 EA 0 0 백동물의료센
TREATRX-0019-00001 내복약-하루2회 0 mg 7 7 백동기
CAR059 Pimobendan Cap.(피모벤단) 0.25 mg/kg 1 2 PO 백동기
RES011 Codeine Tab.(하이드로코돈) 0.3 mg/kg 7 14 PO 백동기
RES026 Theophylline Tab.(테오필린) 11 mg/kg 7 14 PO 백동기
TREATRX-0001-00001 Amoxicillin-clavulate(아모크라, AMC) 12.5 mg/kg 7 14 po 백동기
DIG022 Famotidine Tab.(파모티딘) 0.5 mg/kg 7 14 PO 백동기
ANI015 Chymotrypsin Tab.(키모트립신) 0.05 mg/kg 7 14 PO 백동기
RXTEMP000757 뱃엔팻 칼옥스 처방 0 1 1 백동기
RXTEMP000758 s/o 처방 0 1 1 백동기', 't'::boolean, '0'::integer, '2026-04-23 06:54:34.70477+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'b9aa49fe-f791-4d05-a2cd-e46506ee32fc'::uuid, 'e772dce9-4819-4b47-b8f2-6744696ecbd5'::uuid, '2025.05.29 19:58', 'Subjective
CC: 직장탈
S
애기 데려오신지는 어제 데려오심
길냥이 출신
낮에 병원 갔다가 직장탈 넣어주셨음
: 색은 갈색이고 살짝 묶었음, 기다란 무언가가 나왔음
직장탈 원인은 따로 체크 안하셨음
배가 좀 빵빵한건 느끼셨음
Ο
AUS NRF
AU 검은색 귀지
OU NRF
양측 앞발, 발목 발적
직장 탈
Tx)
chmber 마취 후 purse string suture
5% DS
CE
10일뒤 발사
그 전까지 내복약 및 물약 복용 당부
변 보는지 확인 필수
팔 및 귀 등은 그때 오시면 같이 봐주기로함
넥카라 당부
Objective
plusvetm_gallery_pet_67_20250529_21001... plusvetm_gallery_pet_67_20250529_21001... plusvetm_gallery_pet_67_20250529_21001...
plusvetm_gallery_pet_67_20250529_21001... plusvetm_gallery_pet_67_20250529_21001... plusvetm_gallery_pet_67_20250529_21001...
plusvetm_gallery_pet_67_20250529_21001... plusvetm_gallery_pet_67_20250529_21471... plusvetm_gallery_pet_67_20250529_21471...
plusvetm_gallery_pet_67_20250529_21471... plusvetm_gallery_pet_67_20250529_21471... plusvetm_gallery_pet_67_20250529_21471...
plusvetm_gallery_pet_67_20250529_21471... plusvetm_gallery_pet_67_20250529_21471... plusvetm_gallery_pet_67_20250529_21471...
CT
FPV Ag
Giardia Ag
저요
5129
전
CT
5
C21
C2
plusvetm_gallery_pet_67_20250529_22215... plusvetm_gallery_pet_67_20250529_22215... plusvetm_gallery_pet_67_20250529_22215...
plusvetm_gallery_pet_67_20250529_22215... plusvetm_gallery_pet_67_20250529_22215...
FPV Ag
Giardia Ag
저요
전통
5/29
CT
C21
CT
C21
Plan
항목 용법 용량 단위 일투 일수 사용량 담당의
내복약-물약(30ml) 1 일 1 허브 데스크
내복약-1일 2회(~5kg) 10 일 10 허브 데스크
의료소모품-Neck Collar(7.5cm) 1 EA 1 허브 데스크
의료소모품-IV Catheter(정맥카테터) 1 EA 1 허브 데스크
수술-소화기-직장탈교정술(rectal prolapse)-환납 1 회 1 허브 데스크
처치-Rectal prolapse 환납(50%dex, GEL포함) 1 회 1 허브 데스크
마취-호흡(~5kg) 1 회 1 허브 데스크
처치-수액-IV Catheter 장착 1 회 1 허브 데스크
검사-X-ray(기본) 2cut 1 회 1 김성준
수액-일반수액(10kg미만) 1 회 1 허브 데스크
검사-키트-고양이-지알디아(Giardia Ag test) 1 회 1 김성준
검사-키트-고양이-FPV(범백)검사 1 회 1 김성준
진료비-기본 1 회 1 김성준
lactulose(락툴로오즈-물약) PO 0 ml 1 1 0 허브 데스크
Metronidazole(메트로니다졸) PO 12 mg/kg 2 10 0.221 허브 데스크
Famotidine(파모티딘) PO 0.5 mg/kg 2 10 0.115 허브 데스크
Cephalexin(세팔렉신) PO 22 mg/kg 2 10 0.202 허브 데스크', '', 'f'::boolean, '0'::integer, '2026-04-23 08:20:26.150682+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '09d17139-b04f-4055-bf3f-d0bfa5602991'::uuid, 'b6511faa-f537-4214-b427-e4ff5fd4cba7'::uuid, '2026-04-24', 'Date: 2026-04-24
Purpose of visit: 건강검진
Record User: 2
S.E
Date
Contents
2026-04-24
s)
- 가끔 헥헥거림, 자주 있다고 함, 보통 자기 전에 그런다고 함, 물 많이 먹음
- 장판 켜서 그런가 했는데 계속 헥헥댄다고 함
- 다리/등 털에 빠진다고 함
- 앞다리 절음, (자고 일어나면)
- 눈이좀 하얀게 있음
- 뾰루지 난거 터트리고 싶다고 하심(왼쪽 목), 오른쪽 등쪽
0)
- P/E
: no murmur, no lung sound
: BP120 (#3)
: 검이경 - 양측 특이사항 없음
: 양안 핵경화
- 혈액검사
1) CBC
: NRF
2) Chem 15
: NRF
3) SDMA
: 14
- 방사선
: VHS 9,5
: L1-2, T12-13 spondylosis deformans
- 초음파
-간/비장 특이소견없음, 담낭 슬러지 다량 확인
-양쪽 신장/방광 특이소견없음
-위장관/주위림프절 특이소견없음
Rx)
- 로와콜 1t sid for 60 days
P)
- 특이사항 있을 시 내원 예정
CE)
- 마이 검진상 특이소견 없지만 쿠싱증후군 감별이 아직 완벽히 되진 않아서 몇달정도 후에
혈액검사로 진행해보실것 권장드렸음
- 담낭 슬러지 관련해서도 지속적인 관리 필요성 안내
- 털빠지는 원인 쿠싱 아니라면 일단 아포퀠 시도해보실것 권장드림
O.E
Date
Findings Contents
이비인후
2026-04-24 Normal
OE Chart Description
Value
Memo', 'Plan
Date
Description
Kg Dose t/d Day Qty Unit
Amount Doctor
2026-04-24 건강검진C - 정밀(7세이상 추천)
1 1 1 1 1
435,000원 김전모
2026-04-24 혈액검사-강아지 췌장염수치 CPL
0 1 1 1 1
56,000원 김전모
2026-04-24 혈액검사 - Procyte One CBC
0 1 1 1 1
38,000원 김전모
2026-04-24 단순방사선촬영 - 흉/복부4cut (~1
1 1 11 1
78,000원 김전모
2026-04-24 초음파검사- 복부(~10kg)
1 1 11 1
67,000원 김전모
2026-04-24 Catalyst_DX
0 1 1 1 1
0원 김전모
2026-04-24 담낭보조제-1T당
0 1 1 60 60
210,000원 김전모
Radiology Result
Client: 노하진
Patient: 밤이
202500235
Date: 2026-04-24
Purpose of visit: 건강검진
Record User: 2
Radiology Date: 2026-04-24
Plan:
단순방사선촬영 - 흉/복부4cut (~10kg)
초음파검사-복부(~10kg)', 't'::boolean, '0'::integer, '2026-04-27 00:52:28.273738+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '819ed47c-558b-4ac7-a3bd-9d410192a2be'::uuid, '62069645-b4bd-4fe1-af9a-36b0171d2750'::uuid, '2026-04-20', 'Date: 2026-04-20
Purpose of visit: 건강검진 기본: 보고서 pdf로 보내드리기
Record User: 1
S.E
Date
Contents
2026-04-20
따로 질환은 없음.
좌측 슬개골 탈구 2기
밥을 좀 안 먹는 스타일 - 보호자님께
가끔 숨 불편해하는 경우 있음 -
침뱉듯이 카악하면서 숨쉬기 힘들어하는 경우가 있음.
1번하면 1분 정도. cyanosis는 아님
산책 시에도 goosehunking 있음. 멈춰서 계속 하기도 함.
찬바람일때 더 많이 보임.
DDx
RS, TC. OW
RS(역재채기) 가능성이 제일 높음!
그때그때 관리 잘 하기.
VHS 9.4
양측 MPL2기(우측이 더 잘 빠짐, 좌측이 더 확확 빠짐)
기침반사 X
XR:
TC x
BCS 5-6 정도.
B/A:
고지혈증 -TG 측정불가.
담낭 양호. 간수치 앙호.
GLOB는 기계 내에서 정상!
1달 뒤에 아침 아예 금식 후, 고지혈증 다시 체크.
지속 시에는 내북악보다는 저지방식이/보조제?
RS, MPL, 고지혈증 등을 봤을 때 BCS를 조금 마르게 (4-4.5) 유지하는 것도 한 가지 방법.
O.E
Date
Findings
Contents
치과
2026-04-20
Abnormal
* Abnormal
주요병력:
발병시기:
현재급여중인 사료:
최근 식이번화 및 환경변화:
* 검사항목
구강검사
스켈링 실시(잔존유치 및 손상된 치아 확인)
플리싱 실시여부확인
* 스켈링후 숙주 교육사항
치은염/치주염 치료
치아손상이 심한경우 치료
양치질 요령설명
치아관리 프로그램 설명
치아관리용품 설명
건
ΑΪÝ»6ΑΑ 2026-04-20 Abnormal
* Abnormal
발병시기:
내/외부 기생충 예방현황:
현재급여중인 사료:
최근 식이번화 및 환경변화:
* 검사항목
기본 신체검사
내부기생충 검사
외부기생충 검사
심장사상충 검사
OE Chart Description
Value
Memo
이비인후 2026-04-20 Abnormal
* Abnormal
주요병력:
발병시기:
현재급여중인 사료:
최근 식이번화 및 환경변화:
* 검사항목
미생물 검사
비전 검사
외부기생충 검사
도말검사
OE Chart Description
Value
Memo
건
3¼È°ú
2026-04-20 Abnormal
* Abnormal
주요병력:
발병시기:
현재급여중인 사료:
최근 식이번화 및 환경변화:
* 검사항목
간접검안경 검사
검이경 검사
눈물분비랑 검사
안압검사
안저검사
우드램프 검사
OE Chart Description
Value
Memo', 'Plan
Date
Description
Kg Dose t/d Day Qty Unit
Amount Doctor
2026-04-20 신체검사
1 1 1 1 1
9,900원 김준
2026-04-20 본원혈액검사-CBC
1
1 1 1 1
30,000원 김준
2026-04-20 본원혈액검사 - chemistry [기본]
1
11 1 1
60,000원 김준
2026-04-20 본원혈액검사 - chemistry [종합]
1
11 1 1
60,000원 김준
2026-04-20 안양혈액검사 - electrolyte(전해
1
1 1 1
1
30,000원 김준
2026-04-20 안양혈액검사- CRP(특수 혈청검사)
1
1 1 1
1
45,000원 김준
건
2026-04-20 방사선촬영 (Digital X-ray) - 10
1
31
1
3
120,000원 김준
2026-04-20 초음파검사 - 복부
1
11
1
1
66,000원 김준
건
Radiology Result
Client: 정종욱
Patient: 쿠로미
202400024
Date: 2026-04-20
Purpose of visit:
건강검진 기본: 보고서 pdf로 보내드리기
Plan:
Record User: 1
Radiology Date: 2026-04-20
방사선촬영 (Digital X-ray) - 10kg 미만
초음파검사 - 복부
건', 't'::boolean, '0'::integer, '2026-04-27 06:10:34.369891+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '7069298e-71de-4d03-82a9-003c08aa00e3'::uuid, '772c5004-f552-4589-9e99-4e7da28b1972'::uuid, '2026-04-27 09:59:27', 'Subject
CC : 발사
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0001-00021
처치-외과-발사(봉합사 제거) 및 소독
1
회
0
0
남기웅', 't'::boolean, '0'::integer, '2026-04-27 07:33:36.665969+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '93f150a5-15d2-42ec-aba4-4b274c4116d6'::uuid, '772c5004-f552-4589-9e99-4e7da28b1972'::uuid, '2026-04-02 15:22:42', 'Subject
CC : 중성화상담
잠복고환이어서 수술을 안했었음.
O)
우측 고환 생식기와 사타구니 사이에서 촉진.
피하잠복고환.
A) 잠복고환
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00670
진료비-초진
1
회
0
0
남기웅', 't'::boolean, '3'::integer, '2026-04-27 07:33:36.665969+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'd4f420d7-b431-4a3d-8880-8996a246af0b'::uuid, '772c5004-f552-4589-9e99-4e7da28b1972'::uuid, '2026-04-20 09:58:53', 'Subject
CC : 술부소독
Object
Result
Part
Title', 'Sign
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00015
진료비-재진
1
회
0
0
남기웅', 't'::boolean, '1'::integer, '2026-04-27 07:33:36.665969+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'ed00eafc-ca66-414b-8a1b-18e026e089f1'::uuid, '772c5004-f552-4589-9e99-4e7da28b1972'::uuid, '2026-04-16 09:37:07', 'Subject
CC : 건강검진(미니), 피하잠복중성화, 스케일링
금식확인.
컨디션 양호,
밥을 안먹어서 삐진 것 같음.
O)
MMC pink, CRT < 1.5s
심폐청진 양호
체표림프절 양호
치아 : 치석 중등도
검이경 : 양호
안검사: 눈물량, 안압, 검안양호
잠복고환 촉진됨.
혈구검사 : 양호
혈청검사 : ALT 경미한 상승
엑스레이 : 불규칙한 기관직경
초음파 : 담낭슬러지, 간실질 에코 상승
마취전주사 : cefa, famo
진정 : medetomidine, butophanol
마취 : propofol
유지: Isoflurane
수술 : 중성화수술(잠복고환, 절개창 1개), 스케일링
A) 건강검진
지방간, 기관협착이 있어서 다이어트를 추천드립니다.
Object
Result
Part
Title
Sign
남기웅
No. R16 1504/18
Assessment
Plan
Type
DX
Diagnosis
중성화 수술
MEDIANA
&
77
98
148/104
(1181-
82
Sign ID
남기웅', 'Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
GF-015
수술-산과-중성화수술(Castration-성견,성묘)
1
회
0
0
남기웅
GF-008
수술-산과-잠복고환제거술(피하)-추가
1
회
0
0
남기웅
TREATTX-0000-00158
검사-혈액-CBC(혈구검사)
1
회
0
0
남기웅
LC-002
검사-혈액(혈청)-Chemistry(술전검사)
1
회
0
0
남기웅
TREATTX-0000-00659
검사-X-ray(흉복부4cut, 10kg 이하)
1
회
0
0
남기웅
EK-005
검사-혈압모니터링(BP)
1
회
0
0
남기웅
TREATTX-0006-00001
검사-검이경검사(otoscope)
1
회
0
0
남기웅
LA-007
검사-안과-눈물분비량검사(STT)
1
회
0
0
남기웅
LA-015
검사-안과-안압검사(IOP)
1
회
0
0
남기웅
TREATTX-0000-00125
검사-안과-직접검안경
1
회
0
0
남기웅
TXTEMP00207
할인
1
0
0
남기웅
TREATTX-0000-00460
수술-치과-스케일링(5kg 이하)
1
회
0
0
남기웅
FA-007
마취-호흡(4kg이하)
1
회
0
0
남기웅
TXTEMP00089
할인
1
0
0
남기웅
FA-003
마취-수면propofol(1-7kg)
1
회
0
0
남기웅
EC-004
검사-초음파-복부
1
회
0
0
남기웅
8806578045632
아네폴주사(프로포폴) (5ml)
5
ml
1
1
iv
남기웅
8806498019225
부토판주사2밀리그람/밀리리터(주석산부토르
1
ml
1
1
남기웅', 't'::boolean, '2'::integer, '2026-04-27 07:33:36.665969+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '532eac7f-f6ce-489c-a6a8-c4d9f4652a60'::uuid, '242be746-e93c-4197-be9c-3d672191434e'::uuid, '2026-04-25', 'Date: 2026-04-25
Purpose of visit: 건강검진
Record User: 5
S.E
Date
Contents
2026-04-25 S)
- 앞다리 쪽을 씹는다고 함, 뒷다리쪽도 있고 사타구니 항문쪽도 핥는다고 함
0)
- P/E
: no murmur, no lung sound
: BP150 (#2)
: 검이경 - 양측 특이사항 없음
: 중등도 치석
- 혈액검사
1) CBC
: NRF
2) Chem 15
: NRF
- 방사선
: VHS 10
- 초음파
-간/비장 특이소견없음, 마주 미세한 담낭 슬러지
-양쪽 신장/방광 특이소견없음
-위장관/주위림프절 특이소견없음
P)
- 특이사항 있을 시 내원 예정
CE)
- 아이 아주 미세한 담낭 슬러지 있어 1년뒤 초음파 리첵 필요성 안내드림
- 다른 특이사항은 없어서 주기적으로 건강검진 시켜주실것 권장드림
O.E
Date
Findings
Contents
이비인후
2026-04-25 Normal
OF Chart Description
Value
Memo', 'Plan
Date
Description
Kg Dose t/d Day Qty Unit
Amount Doctor
2026-04-25 건강검진A - 기본(1-3세추천)
1 1 1 1 1
270,000원 김전모
2026-04-25 Catalyst_DX
0 1 1 1 1
0원 김전모
2026-04-25 단순방사선촬영 - 흉/복부4cut (~1
1 1 1 1 1
78,000원 김전모
2026-04-25 초음파검사- 복부(~10kg)
1 1 1 1 1
67,000원 김전모
2026-04-25 혈액검사 - Procyte One CBC
0 1 1 1 1
38,000원 김전모
2026-04-25 단순방사선촬영- 1부위당(앞다리/
1 1 1 1 1
45,000원 김전모
2026-04-25 프루너스 세라마이드 앤 오메가3
0 1 1 1 1
2,800원 테크니션
2026-04-25 프루너스 닥터 조인트케어 낱개
0 1 1 1 1
3,000원 테크니션
Radiology Result
Client: 김경화
Patient: 토리
202300718
Date: 2026-04-25
Purpose of visit: 건강검진
Record User: 5
Radiology Date: 2026-04-25
Plan:
단순방사선촬영 - 흉/복부4cut (~10kg)
초음파검사-복부(~10kg)
단순방사선촬영- 1부위당(앞다리/뒷다리/머리/척추) (~10kg)', 't'::boolean, '0'::integer, '2026-04-27 08:47:17.322134+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '34b37580-67db-42d1-b68a-e6689890c3c8'::uuid, '866623d4-2049-4bc3-a81d-1f5d248a9f69'::uuid, '2026-04-25 14:04:19', 'Subject
CC : 건강검진-미니
접종이력, 관절안내
활식변뇨 특이사항 없음
no vdsc
어릴 때 입양, alone
BCS 5/9
aus nrf
AU nrf
OU nrf
MMC pink, CRT <1sec
mild tartar
bi MPL(L: g2, R: g1)
사지 지간염. 입가 발적
26.4', '', 'f'::boolean, '0'::integer, '2026-04-27 09:08:49.132463+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '85b24b22-fa59-48a8-8a2b-3fcc67a0b45c'::uuid, '069d2c39-08be-4e4f-872a-86f392a9a94b'::uuid, '2026-04-20', 'Date: 2026-04-20
Purpose of visit: 건강검진 기본: 보고서 pdf로 보내드리기
Record User: 1
S.E
Date
Contents
2026-04-20
따로 질환은 없음.
좌측 슬개골 탈구 2기
밥을 좀 안 먹는 스타일 - 보호자님께
가끔 숨 불편해하는 경우 있음 -
침뱉듯이 카악하면서 숨쉬기 힘들어하는 경우가 있음.
1번하면 1분 정도. cyanosis는 아님
산책 시에도 goosehunking 있음. 멈춰서 계속 하기도 함.
찬바람일때 더 많이 보임.
DDx
RS, TC. OW
RS(역재채기) 가능성이 제일 높음!
그때그때 관리 잘 하기.
VHS 9.4
양측 MPL2기(우측이 더 잘 빠짐, 좌측이 더 확확 빠짐)
기침반사 X
XR:
TC x
BCS 5-6 정도.
B/A:
고지혈증 -TG 측정불가.
담낭 양호. 간수치 앙호.
GLOB는 기계 내에서 정상!
1달 뒤에 아침 아예 금식 후, 고지혈증 다시 체크.
지속 시에는 내북악보다는 저지방식이/보조제?
RS, MPL, 고지혈증 등을 봤을 때 BCS를 조금 마르게 (4-4.5) 유지하는 것도 한 가지 방법.
O.E
Date
Findings
Contents
치과
2026-04-20
Abnormal
* Abnormal
주요병력:
발병시기:
현재급여중인 사료:
최근 식이번화 및 환경변화:
* 검사항목
구강검사
스켈링 실시(잔존유치 및 손상된 치아 확인)
플리싱 실시여부확인
* 스켈링후 숙주 교육사항
치은염/치주염 치료
치아손상이 심한경우 치료
양치질 요령설명
치아관리 프로그램 설명
치아관리용품 설명
건
ΑΪÝ»6ΑΑ 2026-04-20 Abnormal
* Abnormal
발병시기:
내/외부 기생충 예방현황:
현재급여중인 사료:
최근 식이번화 및 환경변화:
* 검사항목
기본 신체검사
내부기생충 검사
외부기생충 검사
심장사상충 검사
OE Chart Description
Value
Memo
이비인후 2026-04-20 Abnormal
* Abnormal
주요병력:
발병시기:
현재급여중인 사료:
최근 식이번화 및 환경변화:
* 검사항목
미생물 검사
비전 검사
외부기생충 검사
도말검사
OE Chart Description
Value
Memo
건
3¼È°ú
2026-04-20 Abnormal
* Abnormal
주요병력:
발병시기:
현재급여중인 사료:
최근 식이번화 및 환경변화:
* 검사항목
간접검안경 검사
검이경 검사
눈물분비량 검사
안압검사
안저검사
우드램프 검사
OE Chart Description
Value
Memo', 'Plan
Date
Description
Kg Dose t/d Day Qty Unit
Amount Doctor
2026-04-20 신체검사
1 1 1 1 1
9,900원 김준
2026-04-20 본원혈액검사-CBC
1 1 1 1 1
30,000원 김준
2026-04-20 본원혈액검사 - chemistry [기본]
1 11 1 1
60,000원 김준
2026-04-20 본원혈액검사 - chemistry [종합]
1 11 1 1
60,000원 김준
2026-04-20 안양혈액검사 - electrolyte(전해
1 1 1 1 1
30,000원 김준
2026-04-20 안양혈액검사- CRP(특수 혈청검사)
1 1 1 1 1
45,000원 김준
건
2026-04-20 방사선촬영 (Digital X-ray) - 10
1 31 1 3
120,000원 김준
2026-04-20 초음파검사 - 복부
1 11 1 1
66,000원 김준
건
Radiology Result
Client: 정종욱
Patient: 쿠로미
202400024
Date: 2026-04-20
Purpose of visit:
건강검진 기본: 보고서 pdf로 보내드리기
Plan:
Record User: 1
Radiology Date: 2026-04-20
방사선촬영 (Digital X-ray) - 10kg 미만
초음파검사 - 복부
건', 't'::boolean, '0'::integer, '2026-04-27 10:24:23.381585+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '71e08370-cfed-4fea-94c3-4e1d699d568b'::uuid, '17dd0380-5a7d-4e92-850a-0b7511cf2422'::uuid, '2026-02-02 10:34:27', 'Subject
CC : 건강검진(종합)
변식활뇨 양호
지방종이 많이 생기고 커졌음.
담낭슬러지
치아가 많이 안좋아짐.
기침을 많이 함.
사료 : 동결건조사료
간식 : 잘 안먹음.
MED: 간영양제, 유산균
0)
MMC pink, CRT < 1.5s
심폐청진 양호
맥박수 172
혈압 208/141 (163)180
치아 : 치석 중등도
검이경 : 이도 발적, 부종
X-ray : 기관직경 차이 30%
혈구검사 : 양호
혈청검사 : ALKP 경미한 상승
초음파 : 담낭슬러지
A)
경미한 기관허탈 확인됩니다. 아직은 치료가 필요하지 않습니다.
고혈압에 대해 혈압약 복용 추천드립니다.
담낭슬러지와 ALKP 경미한 상승 - 간보호제 복용 유지
외이염이 있어 귀물약 처방드렸습니다.
Object
Result
Part
Title
Sign
남기웅
20260202_110104430_04
20260202_110104430_03
20260202_110104430_02
20260202_110104430_01
KakaoTalk_20260202_110104430
IntoCNS_000002
IntoCNS_000001', '', 'f'::boolean, '0'::integer, '2026-04-27 15:32:58.439649+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '02ee1cc1-7e64-4deb-b2f7-b3e0b2d9d38a'::uuid, '89a167a0-78f9-4c13-82ef-fd0d42fc9670'::uuid, '2026-04-21 17:44:34', 'Subject
CC : 피부, 눈진료, 귀진료재진
간지러워하는 건 많이 줄어들었음.
원래는 안절부절하고 누워만 있었는데 이제는 깡총깡총 뛰어다님.
O)
전신적인 탈모, 부스럼, 각질
자창 없음.
진물 없음.
A) 모낭충증
지금은 감염으로 인한 각질과 부스럼등이 아직 남아있는 상태
Object
Result
Part
Title
Sign', '남기웅
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00015 진료비-재진
1
회
0
0
남기웅
TREATTX-0000-00004 내복약-1일 2회(일반약, 5kg이하)
7
회
0
0
남기웅
TREATTX-0000-00079 내복약(진통소염/진균제 추가, 5kg미만)
7
회
0
0
남기웅
ANB006 Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
7
14
PO
남기웅
DIG022 Famotidine Tab.
0.5
mg/kg
7
14
PO
남기웅
ANB070 Fluconazole Tab.
2.5
mg/kg
7
14
PO
남기웅
LIV006 Ursodeoxycholic acid(USDA)(UDCA) Tab.
10
mg/kg
7
14
PO
남기웅', 't'::boolean, '0'::integer, '2026-04-28 04:52:54.913024+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '81f7b4fe-bf55-403f-86bb-ad5022fe93e3'::uuid, '89a167a0-78f9-4c13-82ef-fd0d42fc9670'::uuid, '2026-04-13 18:02:15', 'Subject
CC : 피부, 눈진료, 귀진료
원래부터 피부가 안 좋았는데 일주일 전부터 심해짐
분홍 소독약과 내복약 복용 후 상태가 더 심해진 것 같음
(이후로 다른 병원 진료는 나이가 많다고 거부당하여 별도의 진료 및 처치 없음)
세파, 메트로, 파모, 베스타제 처방/헥시딘 소독약
눈이 하얘지기 시작한 지 좀 되었음
누워만 있고 잠을 잘 못잠.
사상충 예방 : 인터넷에서 구매해서 하심.
0)
눈꼽다량
전신적인 탈모, 심한 각질, 부스럼, 자창으로인한 상처, 각질
hair flucking - 모낭충
A) 모낭충증
브라벡토 투약.
감염관리 시작.
피부 감염과 진물이 너무 심하여 어느정도 피부가 치료되고 혈액검사 해보기로 함.
Object
Result
Part
Title
Sign
남기웅
Assessment
Type
DX
Diagnosis
Sign ID
모낭충증(개 모낭충증)', '남기웅
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00670 진료비-초진
1
회
0
0
남기웅
TREATTX-0000-00004 내복약-1일 2회(일반약, 5kg이하)
7
회
0
0
남기웅
EF-004 검사-피부-피부소파검사(skin scraping)
1
회
0
0
남기웅
TREATTX-0000-00079 내복약(진통소염/진균제 추가, 5kg미만)
7
회
0
0
남기웅
ANB006 Amoxicillin/clavulanic acid Tab.
12.5
mg/kg
7
14
PO
남기웅
DIG022 Famotidine Tab.
0.5
mg/kg
7
14
PO
남기웅
ANB070 Fluconazole Tab.
2.5
mg/kg
7
14
PO
남기웅
LIV006 Ursodeoxycholic acid(USDA)(UDCA) Tab.
10
mg/kg
7
14
PO
남기웅', 't'::boolean, '1'::integer, '2026-04-28 04:52:54.913024+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '0f04d6d3-f920-4a4e-b675-5add83753a72'::uuid, 'ed165c35-fe27-40d4-8d9c-9155365af95c'::uuid, '2026.03.03 09:24', 'Subjective
CC: 발사/방광초음파
사랑이는 처치하기 전에 오자마자 청진
Hx)
1주 전부터 밥 좀 덜 먹음
어제 얼갈이배추랑 배 먹고 오늘 설사함
O)
- 청진 양호 (좌측 미약?)
- 4.5kg
- 우측 뒷발바닥 발적, 노란 각질 많이 낌 (여기는 천넥카라 써도 닿는 듯)
- 좌측 귓바퀴 갈색 귀지, 발적, 부종 → 이도쪽 양호, 우측 귀 양호
- 수술 부위 양호
- 방광슬러지, 방광벽 비후, 담낭 슬러지 미약, 담낭벽 양호, 총담관 양호, 췌장 에코
- ALKP 미약한 감소, qPL 정상
Tx) 발사, 귀 세정, 발 소독
Rx)
1) 내복약 30일치
Sily 5→7.5, UDCA 7.5→10, Lefotil 0.25T, Same 0.5T (3/3추) BID
2) Urinary S/o 습식 : 수분 섭취량 증가시킬 용
P) 2개월 내로 간수치 (수치 확인 후 간보조제 증량 고려)
8월 혈액검사, 초음파 - 방광, 비장, 신장, 담낭 등등
C/E)
- 간수치 안 떨어지면 SAMe나 UDCA 추가 증량
- 우측 뒷발바닥, 좌측 귀 주의
- 음수량 증가, 소변 자주 싸러 나가기
- 오늘, 내일 밥 소량만 먹고 다른 거 주지 말아볼 것
Objective
폴더 미지정
plusvetm_gallery_pet_8094_20260303_09... plusvetm_gallery_pet_8094_20260303_09... plusvetm_gallery_pet_8094_20260303_09...
Plan
항목
경로
Qty
단위
일투
일수
사용량
담당의
외과-발사
1
회
1
박현지
초음파-방광
1
회
1
박현지
내복약-1일(10Kg이하)
30
회
30
박현지
Cytopoint-10mg(2.3~4.5kg)
1
회
1
박현지
혈액검사-QPL
1
회
1
박현지
혈액검사-간
1
회
1
박현지
로얄캐닌처방식 URINARY S/O(유리너리)캔
1
1
박현지
새 그룹
Silymarin Cap. (실리마린,실리로)
PO
7.5
mg/kg
2
30
13.5
박현지
UDCA Tab.
PO
10
mg/kg
2
30
13.5
박현지
Lefotil Tab.
PO
0.5
T/day
2
30
15
박현지
SAMe
PO
0.5
T
2
30
30
박현지', '', 'f'::boolean, '0'::integer, '2026-04-28 08:21:46.797307+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '4a76e886-7f75-44c4-91a1-967e46164e9d'::uuid, 'ed165c35-fe27-40d4-8d9c-9155365af95c'::uuid, '2026.01.06 09:30', 'Subjective
CC : 건강검진 premium + SDMA
진정제 효과 없음
Hx)
닥터독) 엑스레이상 심장 큼, 잡음 들림 → 심장초음파 봤는데 흥분도 높아서 제대로 못 봄
정창수, 토론토) 잡음 안 들림, 심장이 약간 크긴 함
건강검진) 정창수에서 2년 전 안검 종괴 제거 위한 술전검사 (전해질, 15종)
그 이후 건강검진 없음
체중) 항상 비슷
다음다뇨) 물 많이 마시는 거 같진 않음, 소변 쏘쏘
식욕,활력) 특이사항 없음
배뇨) 어제 공원 3바퀴 돌고 소변 보니까 혈뇨 있었음
아침에 일어나서 본 거랑 비교해보니 괜찮음
보통 밖에서 싸면 혈뇨 나옴
귀) 긁음, 이전에 약 먹은 적들 있음
간식) 따로 주는 것 같음
근골격계) 다리 수술해야한다 들었음, 왼쪽이 더 안 좋음
기침, 재채기) 가끔 컥컥거림, 자기 전 - 빈도 잦아지진 않음 - 요새 거의 안함
닥터독에서 기관협착 있다고 들었음, 호흡 가빠지거나 힘든 것 없음
O)
1. 신체검사
청진 양호 (매번 올 때마다 청진해봐야할듯)
혈압 양호 (Rt fore, #3)
좌측 사타구니 mass : 지방종 추정
슬개골 탈구 (좌2~3, 우2)
양측 귓바퀴 발적
- 눈 주변, 코 주변 발적
·좌안 상안검 mass, 우안 상안검??
지간 착색 미약
- 그 외 피부 양호
2. 혈액검사
1) CBC
2) Chem15: ALKP 상승 (12/2, 12/16 접종 - 넥스가드는 2달 정도 전부터 안 먹음)
3) SDMA: 11
4) 4Dx: negative
3. 영상검사
1) 방사선 : VHS 10.5, 간비대, 신장 결석
2) 초음파 : 간비대, 간 음영 양호, 담낭 양호 (슬러지 소량?), 위 양호, 비장 고에코 결절
양측 신장 피질 에코 상승 및 미네랄화, 양측 신장 결석, 좌측 부신 크기 양호
방광벽 비후, 방광 슬러지 소량, 방광 결석 다수
(좌측 신장 cyst? 자꾸 헥헥거려서 잘 확인 안됨)
4. 소변검사
- 잠혈, 방광염
A) 신장결석, 방광결석, 방광염, 양측 슬개골 내측 탈구, 비장 결절, 신장 노화
ddx) 간담도계 질환, 만성 신부전
Tx) 귀 에피오틱 세정 후 오토맥스
Rx)
내복약 28일치
Sily 5, UDCA 7.5 BID
P) 4주 후 간수치 (간수치 상승했을 시 간담도계 초음파 및 우측 부신 확인)
C/E)
- 6개월 단위 신장 검사 권장 (신장 4종, SDMA, 신장초음파 (이때 비장 노듈도 같이)
*ALKP상승 관련된 원인 확인 필요
Objective
폴더 미지정
plusvetm_gallery_pet_8094_20260106_100... plusvetm_gallery_pet_8094_20260106_100... plusvetm_gallery_pet_8094_20260106_100...
TEMPERATURE COMPENSATED
URINE SIG
DOG
CAT
14
LARGE AVAMALS
1.000
13
12
1.060
71
1050
1.050
1040
1.040
1000
1.030
098765432
1000
10
1.020
1010
1010
1.000
1.000
SERIM
OH PLALAIA
PROTEIN
Pubert Tame
MIOMARK
Cardell Insight
160/134
162
(144)
영동제작
140
plusvetm_gallery_pet_8094_20260106_100... plusvetm_gallery_pet_8094_20260106_100... plusvetm_gallery_pet_8094_20260106_110...
MIOMARK
Cardell Insight
6
CONT
134/81
(117)
80
Plan
항목
사랑
경로
Qty
단위
일투
일수
사용량
담당의
건강검진-Premium
1
회
1
박현지
IDEXX-SDMA
1
회
1
박현지
내복약-1일(10Kg이하)
28
회
28
박현지
1번 그룹
Silymarin Cap. (실리마린, 실리로)
PO
5
mg/kg
2
28
8.5
박현지
UDCA Tab.
PO
7.5
mg/kg
2
28
9.5
박현지', '', 'f'::boolean, '2'::integer, '2026-04-28 08:21:46.797307+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'ad73c34e-3b6c-4dd1-96b4-0da86732e784'::uuid, 'ed165c35-fe27-40d4-8d9c-9155365af95c'::uuid, '2026.02.12 09:47', 'Subjective
CC: 방광결석 제거
OP) 26. 02.12 방광결석 제거술
: 방광절개후 결석 스푼으로 제거 시도
요도 통해 5Fr feeding tube로 NS 세척 실시하면서 추가 결석 제거함
요도 개통성 확인되나 좁은 양상 - 5Fr 으로도 빡빡한편
4-0 PDS 로 폐복 실시함, 4-0 nylon 피부봉합, 리도카인 주사 실시
크라이오펜 카트리지 1개 사용
Rx)
1) 내복약 7일치 (기존 간약 포함)
Cepha 22, Famo 0.5, Gaba 5, UDCA 10, Sily 7.5, Lefotil 0.25T BID
2) 소독솜 : 1일 2회
Objective
폴더 미지정
plusvetm_gallery_pet_8094_20260212_094... plusvetm_gallery_pet_8094_20260212_094... plusvetm_gallery_pet_8094_20260212_152...
plusvetm_gallery_pet_8094_20260212_152... plusvetm_gallery_pet_8094_20260212_152... plusvetm_gallery_pet_8094_20260212_152...
plusvetm_gallery_pet_8094_20260212_152... plusvetm_gallery_pet_8094_20260212_152... plusvetm_gallery_pet_8094_20260212_152...
plusvetm_gallery_pet_8094_20260212_175...
なちろん
Ceft asine
Burto Oind
손사랑♡
방광결석
4.6 kg
Plan
항목
경로
Qty
단위
일투
일수
사용량
담당의
수액-정맥카테터장착비
1
회
1
박성원
주사-정맥주사(10kg이하)
2
회
2
박성원
향정-butorphanol 1vial
1
EA
1
박성원
수액-HS
1
회
1
박성원
향정-propofol
1
회
1
박성원
마취-호흡(5kg이하)
1
회
1
박성원
수술-비뇨기-방광결석(다량)
1
회
1
박성원
KVL - 결석 분석 (Stone analysis)
1
회
1
박성원
마취-국소마취
1
회
1
박현지
소모품-크라이오 카트리지 (개당)
1
회
1
박현지
내복약-1일(10Kg이하)
7
회
7
박현지
새 그룹
Cephalexin Cap.
PO
22
mg/kg
2
7
2.834
박현지
Famotidine Tab.
PO
0.5
mg/kg
2
7
3.25
박현지
Gabapentin Cap.
PO
5
mg/kg
2
7
3.5
박현지
Silymarin Cap. (실리마린, 실리로)
PO
7.5
mg/kg
2
7
3.5
박현지
UDCA Tab.
PO
10
mg/kg
2
7
3.25
박현지
Lefotil Tab.
PO
0.5
T/day
2
7
3.5
박현지
소독제-소독솜(클로르헥시딘,chlorhexidine)
Skin
1
EA
1
1
1
박현지
처방-안약(연고)-포러스
Eye
1
drop
1
1
1
박현지', '', 'f'::boolean, '1'::integer, '2026-04-28 08:21:46.797307+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '8d87c365-ebe3-4283-84d3-46933c087945'::uuid, '2b1b8190-3cf4-41c1-8b43-90cf13497d38'::uuid, '2026-04-15 11:09:51', 'Subject
CC : 건강검진(스탠다드)
S)
입냄새
0)
BCS 5.5/9
MMC pink
CRT < 1.5
skin tugor NRF
EENT
eye : NRF
ear: NRF
nose: NRF
tooth mild to moderate calculus
skin
: 우측 팔꿈치 skin tag
: 배쪽 피부 얇음
AUS no murmur
MPL
Lt G 1
Rt G 2
B/A)
CBC: NRF
Chemistry: NRF
전해질 : NRF
X-ray)
흉부 : VHS 9.5. 기관/폐 특이소견 관찰되지 않음
복부 : 특이소견 관찰되지 않음
US) - 빈호흡으로 영상이 전반적으로 흔들릴 수 있음
간담도계 : 담낭슬러지 제외 특이소견 관찰되지 않음
비뇨기계 : 약간은 콩팥 석회화를 제외하고 특이소견 관찰되지 않음
소화기계 : 특이소견 관찰되지 않음
Ddx)
1. 치석
2. 슬개골탈구
3. 담낭슬러지
4. 콩팥 석회화
P)
1. 구내염 내복약 및 양치관리 강화. 조절되지 않는 경우 스케일링 계획
2. 슬개골 탈구 임상증상에 따라 계획 -> 생활관리 안내
3. 문제를 유발하지 않음 3개월뒤 RC - 양호하면 재진간격 늘려갈것
4. 문제를 유발하지 않음 3개월뒤 RC - 양호하면 재진간격 늘려갈것
Object
Result
Part
Title
Sign
백동기
20260415_111134936_12
20260415_111134936_11
20260415_111134936_10
20260415_111134936_09
20260415_111134936_08
20260415_111134936_07
20260415_111134936_06
20260415_111134936_05
20260415_111134936_04
20260415_111134936_03
20260415_111134936_02
20260415_111134936_01
KakaoTalk_20260415_111134936
16362_64897_16362_64895_Into
16362_64900_16362_64894_Into
16362_64899_16362_64893_Into', '16362_64898_16362_64896_Into
Plan
Code
Treatment/Prescription
Qty Unit
Day Total Route
Sign ID
TREATTX-0000-00310 검사-건강검진(스탠다드)
1 회
0 0
백동기', 't'::boolean, '0'::integer, '2026-04-29 01:01:33.406184+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '1bda4072-c6cc-4784-b61d-984f9117192d'::uuid, '9cf6b567-f2d5-4cb0-872b-a46fcbd21c46'::uuid, '2026-04-15 11:09:51', 'Subject
CC : 건강검진(스탠다드)
S)
임냄새
O)
BCS 5.5/9
MMC pink
CRT < 1.5
skin tugor NRF
EENT
eye : NRF
ear: NRF
nose: NRF
tooth mild to moderate calculus
skin
: 우측 팔꿈치 skin tag
: 배쪽 피부 얇음
AUS no murmur
MPL
Lt G 1
Rt G 2
B/A)
CBC: NRF
Chemistry: NRF
전해질 : NRF
X-ray)
흉부 : VHS 9.5. 기관/폐 특이소견 관찰되지 않음
복부 : 특이소견 관찰되지 않음
US) - 빈호흡으로 영상이 전반적으로 흔들릴 수 있음
간담도계 : 담낭슬러지 제외 특이소견 관찰되지 않음
비뇨기계 : 약간은 콩팥 석회화를 제외하고 특이소견 관찰되지 않음
소화기계 : 특이소견 관찰되지 않음
Ddx)
1. 치석
2. 슬개골탈구
3. 담낭슬러지
4. 콩팥 석회화
P)
1. 구내염 내복약 및 양치관리 강화. 조절되지 않는 경우 스케일링 계획
2. 슬개골 탈구 임상증상에 따라 계획 -> 생활관리 안내
3. 문제를 유발하지 않음 3개월뒤 RC - 양호하면 재진간격 늘려갈것
4. 문제를 유발하지 않음 3개월뒤 RC - 양호하면 재진간격 늘려갈것
Object
Result
Part
Title
Sign
백동기
20260415_111134936_12
20260415_111134936_11
20260415_111134936_10
20260415_111134936_09
20260415_111134936_08
20260415_111134936_07
20260415_111134936_06
20260415_111134936_05
20260415_111134936_04
20260415_111134936_03
20260415_111134936_02
20260415_111134936_01
KakaoTalk_20260415_111134936
16362_64897_16362_64895_Into
16362_64900_16362_64894_Into
16362_64899_16362_64893_Into', '16362_64898_16362_64896_Into
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00310 검사-건강검진(스탠다드)
1
회
0
0
백동기', 't'::boolean, '0'::integer, '2026-04-29 01:40:20.748512+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'c4c9df86-aa67-4418-8d59-3997ad96d7c7'::uuid, '586ef493-66af-4526-ad9c-e33c64594cb8'::uuid, '2026-04-15 11:09:51', 'Subject
CC : 건강검진(스탠다드)
S)
임냄새
0)
BCS 5.5/9
MMC pink
CRT < 1.5
skin tugor NRF
EENT
eye : NRF
ear: NRF
nose: NRF
tooth mild to moderate calculus
skin
: 우측 팔꿈치 skin tag
: 배쪽 피부 얇음
AUS no murmur
MPL
Lt G 1
Rt G 2
B/A)
CBC: NRF
Chemistry: NRF
전해질 : NRF
X-ray)
흉부 : VHS 9.5. 기관/폐 특이소견 관찰되지 않음
복부 : 특이소견 관찰되지 않음
US) - 빈호흡으로 영상이 전반적으로 흔들릴 수 있음
간담도계 : 담낭슬러지 제외 특이소견 관찰되지 않음
비뇨기계 : 약간은 콩팥 석회화를 제외하고 특이소견 관찰되지 않음
소화기계 : 특이소견 관찰되지 않음
Ddx)
1. 치석
2. 슬개골탈구
3. 담낭슬러지
4. 콩팥 석회화
P)
1. 구내염 내복약 및 양치관리 강화. 조절되지 않는 경우 스케일링 계획
2. 슬개골 탈구 임상증상에 따라 계획 -> 생활관리 안내
3. 문제를 유발하지 않음 3개월뒤 RC - 양호하면 재진간격 늘려갈것
4. 문제를 유발하지 않음 3개월뒤 RC - 양호하면 재진간격 늘려갈것
Object
Result
Part
Title
Sign
백동기
20260415_111134936_12
20260415_111134936_11
20260415_111134936_10
20260415_111134936_09
20260415_111134936_08
20260415_111134936_07
20260415_111134936_06
20260415_111134936_05
20260415_111134936_04
20260415_111134936_03
20260415_111134936_02
20260415_111134936_01
KakaoTalk_20260415_111134936
16362_64897_16362_64895_Into
16362_64900_16362_64894_Into
16362_64899_16362_64893_Into', '16362_64898_16362_64896_Into
Plan
Code
Treatment/Prescription
Qty Unit Day Total Route
Sign ID
TREATTX-0000-00310 검사-건강검진(스탠다드)
1 회 0 0
백동기', 't'::boolean, '0'::integer, '2026-04-29 01:53:23.149867+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '7d73ef40-3569-4190-a49e-0ca2886d5e9e'::uuid, 'f7ed0496-dd4a-428e-82ac-9b186eee6537'::uuid, '2026-04-15 11:09:51', 'Subject
CC : 건강검진(스탠다드)
S)
임냄새
O)
BCS 5.5/9
MMC pink
CRT < 1.5
skin tugor NRF
EENT
eye : NRF
ear: NRF
nose: NRF
tooth mild to moderate calculus
skin
: 우측 팔꿈치 skin tag
: 배쪽 피부 얇음
AUS no murmur
MPL
Lt G 1
Rt G 2
B/A)
CBC: NRF
Chemistry: NRF
전해질 : NRF
X-ray)
흉부 : VHS 9.5. 기관/폐 특이소견 관찰되지 않음
복부 : 특이소견 관찰되지 않음
US) - 빈호흡으로 영상이 전반적으로 흔들릴 수 있음
간담도계 : 담낭슬러지 제외 특이소견 관찰되지 않음
비뇨기계 : 약간은 콩팥 석회화를 제외하고 특이소견 관찰되지 않음
소화기계 : 특이소견 관찰되지 않음
Ddx)
1. 치석
2. 슬개골탈구
3. 담낭슬러지
4. 콩팥 석회화
P)
1. 구내염 내복약 및 양치관리 강화. 조절되지 않는 경우 스케일링 계획
2. 슬개골 탈구 임상증상에 따라 계획 -> 생활관리 안내
3. 문제를 유발하지 않음 3개월뒤 RC - 양호하면 재진간격 늘려갈것
4. 문제를 유발하지 않음 3개월뒤 RC - 양호하면 재진간격 늘려갈것
Object
Result
Part
Title
Sign
백동기
20260415_111134936_12
20260415_111134936_11
20260415_111134936_10
20260415_111134936_09
20260415_111134936_08
20260415_111134936_07
20260415_111134936_06
20260415_111134936_05
20260415_111134936_04
20260415_111134936_03
20260415_111134936_02
20260415_111134936_01
KakaoTalk_20260415_111134936
16362_64897_16362_64895_Into
16362_64900_16362_64894_Into
16362_64899_16362_64893_Into', '16362_64898_16362_64896_Into
Plan
Code
Treatment/Prescription
Qty
Unit
Day
Total
Route
Sign ID
TREATTX-0000-00310 검사-건강검진(스탠다드)
1
회
0
0
백동기', 't'::boolean, '0'::integer, '2026-04-29 02:00:44.761594+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'ec815b4b-69bf-4a79-ad5a-dabfe61d032a'::uuid, '8e318390-c9ed-419a-97b8-5667d7996924'::uuid, '2026-04-15 11:09:51', 'Subject
CC : 건강검진(스탠다드)
S)
임냄새
O)
BCS 5.5/9
MMC pink
CRT < 1.5
skin tugor NRF
EENT
eye : NRF
ear: NRF
nose: NRF
tooth mild to moderate calculus
skin
: 우측 팔꿈치 skin tag
: 배쪽 피부 얇음
AUS no murmur
MPL
Lt G 1
Rt G 2
B/A)
CBC: NRF
Chemistry: NRF
전해질 : NRF
X-ray)
흉부 : VHS 9.5. 기관/폐 특이소견 관찰되지 않음
복부 : 특이소견 관찰되지 않음
US) - 빈호흡으로 영상이 전반적으로 흔들릴 수 있음
간담도계 : 담낭슬러지 제외 특이소견 관찰되지 않음
비뇨기계 : 약간은 콩팥 석회화를 제외하고 특이소견 관찰되지 않음
소화기계 : 특이소견 관찰되지 않음
Ddx)
1. 치석
2. 슬개골탈구
3. 담낭슬러지
4. 콩팥 석회화
P)
1. 구내염 내복약 및 양치관리 강화. 조절되지 않는 경우 스케일링 계획
2. 슬개골 탈구 임상증상에 따라 계획 -> 생활관리 안내
3. 문제를 유발하지 않음 3개월뒤 RC - 양호하면 재진간격 늘려갈것
4. 문제를 유발하지 않음 3개월뒤 RC - 양호하면 재진간격 늘려갈것
Object
Result
Part
Title
Sign
20260415_111134936_12
백동기
20260415_111134936_11
20260415_111134936_10
20260415_111134936_09
20260415_111134936_08
20260415_111134936_07
20260415_111134936_06
20260415_111134936_05
20260415_111134936_04
20260415_111134936_03
20260415_111134936_02
20260415_111134936_01
KakaoTalk_20260415_111134936
16362_64897_16362_64895_Into
16362_64900_16362_64894_Into
16362_64899_16362_64893_Into', '16362_64898_16362_64896_Into
Plan
Code
Treatment/Prescription
Qty Unit
Day Total Route
Sign ID
TREATTX-0000-00310 검사-건강검진(스탠다드)
1
회
0
0
백동기', 't'::boolean, '0'::integer, '2026-04-29 02:05:50.329272+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  '3b64cc92-c44e-45ae-860c-dd1c4db4b1ec'::uuid, '93130b68-93f4-4e63-9593-e3aeea157b03'::uuid, '2026-04-21 11:16:29', 'Subject
CC : 미용후 피부진료 / 건강검진-기본
오메가3/유산균, 보습샴푸/보습제, 피부소독/연고sid/넥칼라, 결과상담/피부체크
음수량체크
눈가, 등, 엉덩이, 왼쪽 앞발 발등 - 피부 올라와서 연고 발랐음
피부 각질 전반적으로 많은 편. 가려움은 없음
활식변뇨 특이사항 없음
no vdsc
프루너스 아토고하이포샴푸, 에센스팩린스
NG 어제 집에서 먹이심.
식이 - 로얄캐닌 스타터 + 퍼피 + 올바른끼니 관절건강 + carna4 동결건조 사료(간식처럼 하루3개)
- 흑염소간식+사료 - 19g-15g먹여주심, 껌 먹은 날엔 가늘은 변.
9월에 입양, alone
BCS 5/9
aus NRF
tracheal reflex neg
OU 결막염
AU 이개발적
MMC pink, CRT <1sec
mild tartar, gingivitis
Rt MPL(g2)
피부 전반적으로 건조, 피부염 및 각질
사지 지간발적
신경계검사 nrf
Rx)
chx 소독약, NY연고
CE)
피부염 개선양상. 처방샴푸/보습제 추천드림
피부 증상 나았다 다시 재발 반복 - 간호르몬 수치 포함된 검진 권고
오메가3, 유산균제 권고', '', 'f'::boolean, '0'::integer, '2026-05-02 01:19:01.16338+00'::timestamptz
);

insert into staging.result_chart_by_date (
  id, parse_run_id, date_time, body_text, plan_text, plan_detected, row_order, created_at
) values (
  'f155b3e4-7317-4cb1-b8e5-a5dba9191f76'::uuid, '37f66a77-7742-40b3-a82a-233237b7475a'::uuid, '2026-04-22 14:05:29', 'Subject
CC : 검진-기본,근골격,사상충키트, 항체가검사
검진결과일잡기, 소독sid-지간, 알러지주의
최근 컨디션 양호. 스케일링 전 건강검진 요청하심.
활식변뇨 특이사항 없음.
no vdsc
보행은 전반적으로 양호한 편
식이: 지위픽, 아투 건사료 섞어서, 동결건조 연어
2개월 때 샵에서 입양, alone
Vx. HWP doing
PHI: 접종 과민반응, 1살 때 슬개골 양측 수술
aus NRF
moderate tartar, 치은염
OU 안검 경도 발적, 경도 결막 충혈 외 특이사항 없음
bi MPL - 7월 수술 완료
지간염
왼쪽 등 켈로이드성 병변 확인 >> 확인되지 않음(4/22)
신경계 검사상 특이소견 없음.
사상충 키트 음성
CE)
항체가 검사상 켄넬코프 제외 항체가 부족 - 나머지 백신 접종 한 개씩 진행하실 것(접종 전 항히스타민 주사)
결과상담재 - 컨디션 괜찮으면 접종 진행
스케일링 권고', '', 'f'::boolean, '0'::integer, '2026-05-02 08:17:36.442725+00'::timestamptz
);
