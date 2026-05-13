# chart-api — 파트너(vet-report) 연동·리뷰 가이드

배포 후 **베이스 URL 한 줄**과 함께 이 문서와 루트 **`/`** 페이지, **`/api/openapi`** 를 공유하면 연동 검토에 필요한 정보가 모두 있습니다.

---

## 1. 배포 후 전달하면 좋은 것

| 항목 | 설명 |
|------|------|
| **프로덕션 베이스 URL** | 예: `https://chart-api-xxxxx.vercel.app` |
| **루트 문서** | `{BASE}/` — 엔드포인트 표·인증·환경 변수·PDF 안내 |
| **OpenAPI 3 JSON** | `{BASE}/api/openapi` — Postman 가져오기·코드젠 |
| **(선택) Staging URL** | 동일 스펙으로 스모크 테스트용 |

---

## 2. 인증 규칙 (프록시와 반드시 맞출 것)

| 구분 | 규칙 |
|------|------|
| **대부분의 `/api/*`** | 클라이언트가 `Authorization` 을 안 보내도, **서버(프록시)가 `Authorization: Bearer <CHART_APP_API_KEY>` 를 붙여** Chart API로 전달하는 전제입니다. |
| **Chart API 환경 변수** | `CHART_APP_API_KEY` 값이 위 Bearer 값과 **동일**해야 합니다. |
| **Bearer를 붙이면 안 되는 요청** | 공개 동작만 토큰 검증: `GET`/`PATCH /api/content/health-checkup/review-share`, `POST /api/report/health-checkup/export-by-share` (바디 `token`). 프록시가 여기에 차트 키를 넣으면 안 됩니다. |
| **발급은 인증 필요** | `POST /api/content/health-checkup/review-share` (`{ runId }`) 는 **Bearer 필요** — 리뷰 링크 발급. |

---

## 3. 환경 변수 (Vercel / 서버)

### 필수에 가까움

| 변수 | 역할 |
|------|------|
| `DATABASE_URL` | Postgres (Pooling URL 권장) |
| `NEXT_PUBLIC_SUPABASE_URL` | Supabase 프로젝트 URL |
| `SUPABASE_SERVICE_ROLE_KEY` | Storage·서버 API |
| `CHART_APP_API_KEY` | Bearer 키 (vet-report 프록시와 동일) |
| `GEMINI_API_KEY` | LLM 라우트 (assessment, 콘텐츠 생성, text-bucketing, reference-extract 등). 없으면 해당 POST가 503일 수 있음. |

### PDF (건강검진 export 등)

| 변수 | 역할 |
|------|------|
| **인쇄 URL (run / 로그인 export)** | vet-report: `…/runs/<runId>/report/print`. `HEALTH_CHECKUP_PRINT_URL_TEMPLATE` (`{runId}`), 또는 `VET_REPORT_PUBLIC_ORIGIN` 만 있으면 기본으로 동일 패턴 조합. |
| **인쇄 URL (공유 export-by-share)** | vet-report: `…/review/health-checkup/<token>/print` (**runId 아님**). `HEALTH_CHECKUP_SHARE_PRINT_URL_TEMPLATE` (`{token}`), 또는 `VET_REPORT_PUBLIC_ORIGIN` + 기본 `review/health-checkup/…/print`. |
| **요청 바디** | 양쪽 모두 `printUrl` 을 넣으면 env 없이 동작 가능. |
| **렌더 방식** | 기본은 **인프로세스** `playwright-core` + `@sparticuz/chromium`. |
| `PLAYWRIGHT_PDF_SERVICE_URL` | (선택) 설정 시 **원격 PDF 서비스가 우선** 호출됨. |
| `PLAYWRIGHT_PDF_SERVICE_SECRET` | (선택) 원격 서비스가 Bearer 요구할 때. |
| `PLAYWRIGHT_CHROMIUM_EXECUTABLE_PATH` | **로컬 개발** 시 시스템 Chrome 경로. Vercel에서는 보통 비움. |

### 기타

| 변수 | 역할 |
|------|------|
| `GEMINI_MODEL` | (선택) 기본 `gemini-2.0-flash` |
| `CHART_APP_SHARE_PUBLIC_BASE_URL` | 리뷰 `shareUrl` 조합 (선택) |
| `SUPABASE_IMAGE_CASE_BUCKET` 등 | 케이스 이미지 버킷·리사이즈 (선택) |
| `CRON_SECRET` | 크론 보호 (선택). Vercel Cron은 Authorization 없음 이슈 주의. |

전체 예시는 저장소 **`chart-api/.env.example`** 참고.

---

## 4. PDF 동작 요약

1. API 라우트가 **인쇄용 페이지의 전체 URL**을 정합니다 (템플릿·베이스·`VET_REPORT_PUBLIC_ORIGIN` 또는 요청 `printUrl`).
2. 기본 경로: 같은 프로세스에서 **Chromium**으로 해당 URL을 열고 **PDF 바이트**를 반환합니다.
3. 인쇄 페이지는 **워커(Chromium)가 네트워크에서 열 수 있어야** 하므로, **공개 URL**이어야 합니다 (인증이 필요한 페이지면 PDF 실패 가능).
4. `PLAYWRIGHT_PDF_SERVICE_URL` 이 설정되어 있으면 **원격으로 위임** (레거시·특수 환경).

---

## 5. DB·Supabase 정합

- Chart API는 **`chart_pdf`**, **`health_report`**, **`core`** 스키마와 Storage 버킷 **`pdf-uploads`** 등을 사용합니다.
- vet-report 인쇄 UI가 **Supabase를 직접** 조회하는 경우, **동일 Supabase 프로젝트·동일 데이터**를 보도록 맞추지 않으면 `runId`·내용이 어긋날 수 있습니다. (정책은 팀 간 합의.)

---

## 6. 주요 엔드포인트·계약 (검토용)

스펙의 단일 소스는 **`/`** 및 **`/api/openapi`** 입니다. vet-report에서 호출하는 경로는 동일 경로·메서드를 전제로 합니다.

- **텍스트 버킷팅:** `POST /api/text-bucketing/upload-url` (JSON), `POST /api/text-bucketing` (FormData 또는 JSON, 응답 `runId`·`friendlyId`).
- **추출·히스토리:** `PATCH /api/runs/{runId}/extraction`, `GET/DELETE /api/history` 등.
- **PDF:** `POST /api/report/health-checkup/export`, `POST /api/report/export`, `POST /api/report/health-checkup/export-by-share`.
- **참고 추출:** `POST /api/content/reference-extract` (multipart `file` 또는 JSON).

에러 시 대체로 JSON `{ "error": "…" }` 형태를 기대할 수 있습니다.

---

## 7. 스모크 테스트 (파트너 측에서 제안)

1. `GET $BASE/api/openapi` → 200, JSON.
2. `CHART_APP_API_KEY` 로 `GET $BASE/api/history` → 200 (DB 연결 확인).
3. (Gemini 필요 시) 대표 LLM POST 한 건.
4. PDF: 인쇄 URL이 정해진 상태에서 `POST .../health-checkup/export` 또는 `printUrl` 포함 요청 → `Content-Type: application/pdf`.

---

## 8. 운영 한도·주의

- **Vercel:** 함수 **실행 시간**(`maxDuration` 일부 라우트 120초), **메모리**, **요청 본문 크기** 한도. 대용량 multipart 시 플랫폼·게이트웨이 제한을 문서화하는 것이 좋습니다.
- **프록시 `redirect: manual`:** 3xx 가 많으면 클라이언트·PDF 워커 동선과 맞는지 확인.

---

## 9. 피드백 주실 때 도움이 되는 것

- 재현에 쓴 **베이스 URL**, **요청 Method·Path**, **요청 헤더(키 값은 가림)** , **응답 상태 코드·본문 일부**.
- Chart API 쪽 **Vercel 환경 변수 설정 여부**(키 이름만: 예: 인쇄 URL 템플릿 유무).
- vet-report **프록시 설정**에서 Bearer 주입 예외가 위 표와 일치하는지.

---

이 파일은 저장소에 포함되며, 배포물 자체는 **`/`** 가 동일 계열 정보를 브라우저에서 제공합니다.
