# chart-api

진료 차트 PDF·건강검진·케이스 이미지 등 **vet-report 정의문과 동일한 경로·메서드**를 노출하는 전용 Next.js 앱입니다.  
**`ddx-api`와 분리**되어 있으며, 동일 Supabase DB의 `chart_pdf`, `health_report`, `core` 스키마와 Storage 버킷을 사용합니다.

## 파트너 인수인계 체크리스트

1. **배포 URL** (예: Vercel 프로젝트 root = `chart-api`)
2. 파트너에게 안내할 문서: 저장소 **`PARTNER_REVIEW.md`** (연동·프록시·PDF·스모크·피드백 포맷), 배포 **`/`** (동일 요약 + 엔드포인트 표), **`/api/openapi`** (OpenAPI 3 JSON — Postman 가져오기·코드젠)
3. 서버 환경 변수 (아래 `.env.example` 참고), 특히 **`CHART_APP_API_KEY`** 를 Bearer 로 전달
4. Supabase Storage: 대시보드 **Storage**에서 **`pdf-uploads`** 버킷 생성(또는 `SUPABASE_PDF_UPLOADS_BUCKET`로 실제 버킷명). **`case-image`**(기본·`SUPABASE_IMAGE_CASE_BUCKET`로 오버라이드), **`hospital-assets`** + 필요 시 CORS
5. **PDF 바이너리** (`/api/report/…/export` 등): vet-report 와 같이 **`playwright-core` + `@sparticuz/chromium`** 으로 API 라우트 안에서 PDF 생성합니다. (선택) **`PLAYWRIGHT_PDF_SERVICE_URL`** 이 있으면 원격 워커를 우선 호출합니다. 인쇄 페이지 공개 URL은 **`HEALTH_CHECKUP_PRINT_URL_TEMPLATE`** 등 또는 요청 `printUrl`. 로컬 개발은 **`PLAYWRIGHT_CHROMIUM_EXECUTABLE_PATH`**(시스템 Chrome) 권장.
6. **범용 OCR** (`POST /api/ocr`)는 별도 연동 시 확장(선택). 참고문헌·텍스트 버킷팅은 **Gemini** + `pdf-uploads` PDF 텍스트 추출로 동작합니다.

## Storage 규약 · TTL · 선택 환경 변수

파트너 이관 문서(vet-report 서버 기준)와 맞춘 값입니다.

| 항목 | 값 |
|------|-----|
| PDF 업로드 객체 경로 | `extract-uploads/YYYY-MM-DD/{uuid}-{파일명}.pdf` · 버킷 `pdf-uploads` |
| 케이스 이미지 미리보기 `createSignedUrl` | **7일** |
| 병원 로고·직인 업로드 후 서명 URL | **1년** |
| 건강검진 외부 검토 공유 링크 DB 만료 | 발급 시점부터 **7일** |

선택 env (`.env.example` 참고):

- **`SUPABASE_IMAGE_CASE_BUCKET`** — 케이스 이미지 버킷명 (미설정 시 `case-image`)
- **`IMAGE_CASE_MAX_EDGE`** — WebP 리사이즈 최대 변(px), 기본 **2048**
- **`IMAGE_CASE_WEBP_QUALITY`** — WebP 품질 1–100, 기본 **82**

## Run

```bash
cd chart-api
cp .env.example .env.local
npm install
npm run dev                  # http://localhost:3003
```

`npm run build` 에 **`DATABASE_URL`** 필요.

## 인증

대부분의 라우트: **`Authorization: Bearer <CHART_APP_API_KEY>`**

예외(공개):

- `GET /api/content/health-checkup/review-share?token=` — 리뷰 토큰
- `PATCH /api/content/health-checkup/review-share` — 토큰으로 페이로드 수정
- `POST /api/report/health-checkup/export-by-share` — 토큰 검증 후 PDF(PLAYWRIGHT·인쇄 URL 동일)

크론: `GET|POST /api/cron/recompute-basic-info-ages` — `CRON_SECRET` 설정 시 **`Authorization: Bearer <CRON_SECRET>`** 필요.

## 구현 상태 요약

| 구역 | 상태 |
|------|------|
| 스토리지 서명 업로드·케이스 이미지 CRUD·추출 PATCH·히스토리·콘텐츠 CRUD·관리자 병원·나이 크론 | 동작 (DB + Storage) |
| AI 소견·콘텐츠·리포트 생성·건강상식 HTML 등 | **Gemini** (`GEMINI_API_KEY`) 있으면 동작, 없으면 **503** |
| 텍스트 버킷팅 (`POST /api/text-bucketing`) | **multipart 권장**(JSON은 Storage 경로만) · 필수 **`chartType`** · 병원 UUID는 **`hospitalId` 또는 `hospital_id`** · `file` 또는 **`storageBucket`+`storagePath`**(`pdf-uploads`·`extract-uploads/`) · 선택 `chartPasteText`·`efriendsChartBlocksJson` · 최대 30MB · LLM 미설정 **400** · `runId`·`friendlyId` · 스캔 전용 PDF **422** |
| 참고문헌 추출 (`POST /api/content/reference-extract`) | **`multipart/form-data` `file=`** 우선 · 응답 **`fileName`·`mimeType`·`fullText`·`rows`** · JSON 경로도 지원 |
| PDF 바이너리 export (`…/export`, 건강검진 포함) | **인프로세스 Playwright** · 원격만 쓸 때 `PLAYWRIGHT_PDF_SERVICE_URL` · 인쇄 URL 템플릿/`printUrl` 없으면 **503** |
| 범용 OCR (`POST /api/ocr`) | 미연동 시 **503** (선택 확장) |

루트 경로(`/`)·`/api/openapi`·`lib/chart-app/api-catalog.ts` 가 동일 카탈로그를 공유합니다.

## 기술 메모

- DB: **`pg` Pool** + 스키마 한정 SQL (`chart_pdf.*`, `health_report.*`, `core.*`)
- Storage: **`SUPABASE_SERVICE_ROLE_KEY`**

## Deploy (Vercel)

1. Vercel에서 새 프로젝트를 추가하고 **Root Directory** 를 **`chart-api`** 로 지정합니다 (모노레포인 경우 필수).
2. **Environment Variables** 에 아래를 넣습니다 (값은 `.env.example` 참고).
   - 필수: `DATABASE_URL`, `NEXT_PUBLIC_SUPABASE_URL`, `SUPABASE_SERVICE_ROLE_KEY`, `CHART_APP_API_KEY`
   - 선택: `GEMINI_API_KEY`, `GEMINI_MODEL`, `PLAYWRIGHT_CHROMIUM_EXECUTABLE_PATH`(로컬 PDF), `PLAYWRIGHT_PDF_SERVICE_URL`, `PLAYWRIGHT_PDF_SERVICE_SECRET`(원격 PDF 우선), `HEALTH_CHECKUP_PRINT_URL_TEMPLATE`·`HEALTH_CHECKUP_SHARE_PRINT_URL_TEMPLATE`, `HEALTH_CHECKUP_PRINT_BASE_URL`, `VET_REPORT_PUBLIC_ORIGIN`(및 선택 `VET_REPORT_HEALTH_PRINT_SUBPATH`·`VET_REPORT_HEALTH_SHARE_PRINT_SUBPATH`), `CHART_APP_SHARE_PUBLIC_BASE_URL`, `CRON_SECRET`, `SUPABASE_IMAGE_CASE_BUCKET`, `IMAGE_CASE_MAX_EDGE`, `IMAGE_CASE_WEBP_QUALITY`
3. 빌드는 저장소 루트가 아니라 `chart-api` 기준으로 `npm install` → `npm run build` 가 실행되도록 합니다.
4. **`vercel.json`** 에 크론 `/api/cron/recompute-basic-info-ages` 가 정의되어 있습니다. Pro 플랜 등 크론이 활성화된 프로젝트에서만 동작합니다. `CRON_SECRET` 을 쓰는 경우 Vercel Cron 기본 요청에는 `Authorization` 헤더가 없으므로, 시크릿 검증 방식을 크론 호환에 맞게 조정하거나 별도 스케줄러를 사용해야 할 수 있습니다.
5. 배포가 끝나면 파트너에게 **`https://<프로젝트>/`** 와 **`https://<프로젝트>/api/openapi`** 링크를 전달합니다.
