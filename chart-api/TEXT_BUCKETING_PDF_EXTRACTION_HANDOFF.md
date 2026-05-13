# chart-api `POST /api/text-bucketing` — PDF 텍스트 추출 구현 상세 (외부 검토용)

**대상 독자:** 배포·연동 측에서 “현재 구현으로 PDF 추출이 충분한지” 판단해야 하는 엔지니어  
**제품:** `chart-api` (Next.js App Router, Node 런타임)  
**엔드포인트:** `POST /api/text-bucketing`  
**작성 목적:** 본 문서만으로 **추출 계층이 무엇을 하고·하지 않는지**를 명확히 공유하고, vet-report 쪽 파이프라인 스펙과의 **차이**를 구분할 수 있게 함.

---

## 1. 한 줄 요약

현재 chart-api에서는 PDF 바이너리에서 본문을 얻는 방법이 **`pdf-parse` 라이브러리 한 번 호출**뿐이다.  
**읽기 순서 보존 줄 단위 추출**, **스캔 PDF OCR**, **멀티모달 LLM 기반 순서 줄 추출** 등은 **이 라우트에 포함되어 있지 않다.**

그 다음 단계로 **Gemini**는 추출된 **평문 문자열**을 받아 의미 단위 **버킷 JSON**을 생성한다. 이는 “추출”이 아니라 **후처리·분류**에 가깝다.

---

## 2. 호출 전제 (추출과 직접 관련 없는 부분은 요약)

- **인증:** `Authorization: Bearer <CHART_APP_API_KEY>`
- **LLM:** `GEMINI_API_KEY` 또는 `NEXT_PUBLIC_GEMINI_API_KEY` 없으면 요청은 **400**으로 종료 (추출 전에 막힘).
- **바디 형식**
  - **multipart/form-data** 권장  
    - 필수: `chartType`, `hospitalId`  
    - PDF 소스: **`file`** 이거나 **`storageBucket` + `storagePath`**
  - **JSON** (Storage만): `chartType`, `hospitalId`, `storagePath` 등 필수 — 직접 `file` 업로드는 multipart만.
- **파일 제한:** 최대 **30MB**, MIME **`application/pdf`**.
- **Storage 경로:** 버킷은 환경변수 `SUPABASE_PDF_UPLOADS_BUCKET`(미설정 시 `pdf-uploads`). 객체 키는 **`extract-uploads/`** 접두사 필수 (`upload-path.ts`).
- **병원:** `hospitalId`는 UUID 형식 검증 후 `core.hospitals` 또는 `core.hospital_pdf_merge_map` 존재 여부 확인.
- **타임아웃:** 라우트 `maxDuration = 120` 초 (Vercel 등 배포 설정과 연동).

위 조건을 통과한 뒤에야 아래 **추출**이 실행된다.

---

## 3. PDF 바이너리 확보 (추출 직전)

경로에 따라 `Buffer` 하나가 만들어진다.

| 경로 | 동작 | 코드 위치 |
|------|------|-----------|
| multipart `file` | `File.arrayBuffer()` → `Buffer` | `app/api/text-bucketing/route.ts` (`parseMultipart`) |
| Storage | Supabase Storage `download` → `Buffer` | `lib/chart-app/storage-object.ts` (`downloadStorageObject`) |

실패 시 Storage 쪽은 메시지에 따라 **404/500** 등으로 응답한다.

---

## 4. 핵심: PDF → 문자열 추출 (`pdf-parse`)

### 4.1 구현

```typescript
// lib/chart-app/extract-pdf-text.ts
import pdfParse from 'pdf-parse';

export async function extractPdfText(buffer: Buffer): Promise<{ text: string; numPages: number }> {
  const data = await pdfParse(buffer);
  const text = typeof data.text === 'string' ? data.text.trim() : '';
  return { text, numPages: data.numpages };
}
```

- **입력:** 위에서 만든 PDF 전체 `Buffer`
- **출력:**
  - **`text`:** 라이브러리가 복원한 **단일 문자열** (앞뒤 trim). 페이지 구분 정보는 별도 필드로 반환하지 않음.
  - **`numPages`:** 총 페이지 수.

### 4.2 이 단계에서 보장되는 것 / 보장되지 않는 것

**보장에 가까운 것**

- PDF에 **텍스트 레이어**(복사 가능한 텍스트)가 있으면, 그 내용이 대부분 `text`로 들어온다.
- 구현이 단순해 동작이 예측 가능하고, 외부 네트워크 호출이 없다.

**보장하기 어렵거나 없는 것**

- **읽기 순서:** 인쇄 순서·좌우 단·표·플로팅 박스가 섞인 레이아웃에서 **사람이 읽는 순서와 동일한 줄 순서**를 유지한다고 보장하지 않는다. `pdf-parse`는 내부적으로 PDF 연산자 순서에 따른 텍스트 추출에 의존한다.
- **좌표·폰트·블록 구조:** 줄 단위 `{ page, text }[]` 구조를 만들지 않는다. **페이지별 텍스트 분리**도 현재 코드에서는 하지 않는다.
- **스캔 PDF / 이미지 전용 PDF:** 텍스트 레이어가 없으면 `text`가 비거나 매우 짧을 수 있다 → 아래 5절.
- **암호화·손상 PDF:** 라이브러리/파서 예외는 상위에서 일반 **500** 처리될 수 있다 (세분화된 에러 코드 없음).

---

## 5. 추출 실패로 간주하는 경우 (422)

`extractPdfText` 이후:

```text
if (!text) → 422
메시지: "No extractable text in PDF (may be scan-only). Use OCR flow or a text-based PDF."
```

즉 **“텍스트가 한 글자도 안 나왔다”**면 스캔본 가능성을 안내하고 끝낸다.  
chart-api **동일 라우트 안에는 OCR 폴백이 없다.** (별도 `/api/ocr` 등 다른 기능과 연계 여부는 연동 측 정책.)

---

## 6. 이프렌즈 붙여넣기 (`chartPasteText`)와 추출의 결합

- 조건: **`chartType === 'efriends'`** 이고 `chartPasteText`가 비어 있지 않을 때.
- 동작: PDF에서 나온 **전체 문자열 앞에** 붙여넣기 내용을 두고, 중간에 구분용 리터럴 `\n\n--- PDF 추출 ---\n\n` 을 넣어 **하나의 문자열**로 만든다.
- 의미: vet-report 스펙의 “page 0 줄 배열 앞에 붙임”과 **유사한 목적**이지만, 구현은 **줄 단위가 아닌 단순 문자열 결합**이다.

---

## 7. LLM 단계 (추출이 아님 — 분류)

- 상수 **`MAX_TEXT_FOR_MODEL = 120_000`** 자까지만 잘라 **Gemini**에 넣는다.
- 프롬프트는 추출 문자열을 “PDF 텍스트”로 간주하고, 고정 snake_case 키들로 **`{"buckets": { ... }}`** 형태 JSON을 요청한다 (`bucketingPrompt` in `route.ts`).
- 파싱 실패·모델 오류는 상황에 따라 **500** 등.

**중요:** 여기서 LLM은 **PDF 파일을 직접 읽지 않는다**(현재 chart-api 이 플로우 한정). 입력은 **이미 추출된 문자열**뿐이다.

---

## 8. DB에 남는 것 (추출 품질 검증 시 참고)

성공 시 대략 다음이 저장된다.

- `chart_pdf.documents`: `file_name`, `file_hash`(PDF 바이트 SHA-256), `chart_type`
- `chart_pdf.parse_runs`: `hospital_id`, `status = 'success'`, `raw_payload`(스토리지 경로, 버킷, `chartType`, 붙여넣기/블록 일부, **`buckets`**, `numPages`, `textLength`, `truncated` 등)
- `chart_pdf.result_basic_info`: **빈 행만 생성** (추출 결과로 필드를 채우지 않음)

vet-report 스펙에 있는 **`result_chart_by_date`, `result_lab_items`** 등 **구조화 자식 테이블 채우기는 이 라우트에서 수행하지 않는다.**

---

## 9. 참조 스펙과의 차이 (판단 시 필수)

귀사에서 참고 중인 **vet-report `text-bucketing-pipeline-spec.md`** 에는 대략 다음이 포함된다.

- **`extractOrderedLinesFromPdf`:** LLM 멀티모달 등으로 **`{ page, text }[]`** 순서 줄 확보
- **`runGoogleVisionOcr`:** OCR 행 → 버킷 배정 보조 등
- **`assignLinesToBuckets` 등:** 차트 종류별 상태 기계로 섹션 분리
- **`saveParseRun`:** 다수의 **`result_*`** 테이블에 방문별·항목별 저장

**현재 chart-api `POST /api/text-bucketing`은 위 계열을 구현하지 않았다.**  
구현 범위는 **§2 HTTP 계약 일부 + `pdf-parse` 단일 추출 + Gemini 버킷 JSON + 최소 DB 행**이다.

---

## 10. 검토 요청 시 귀측에서 확인하면 좋은 체크리스트

아래를 **“충분함 / 불충분함”** 으로 답해 주시면 협의가 빠르다.

1. **표본 PDF**가 텍스트 레이어 기반인가, 스캔 비중은 얼마나 되는가?
2. **읽기 순서·표 구조**가 잘못 잘리면 비즈니스에 치명적인가?
3. **페이지 단위·줄 단위** 후속 로직이 필요한가? (현재는 페이지 정보를 추출 문자열에 녹이지 않음)
4. 스캔 PDF는 **별도 OCR API**로 처리할지, **동일 라우트 내 폴백**을 요구하는지?
5. 성공 정의가 **“run 생성”** 인지, **`result_chart_by_date` 등 자식 행이 채워진 상태**인지?
6. vet-report와 **동일 품질**을 기대하는지, 아니면 **경량 MVP**로 분리하는지?

---

## 11. 관련 소스 파일 목록

| 파일 | 역할 |
|------|------|
| `app/api/text-bucketing/route.ts` | HTTP 계약, 크기/버킷 검증, 붙여넣기 결합, Gemini, 트랜잭션 진입 |
| `lib/chart-app/extract-pdf-text.ts` | **`pdf-parse` 호출 — 추출 핵심** |
| `lib/chart-app/storage-object.ts` | Storage에서 PDF 다운로드 |
| `lib/chart-app/bucketing-run.ts` | DB 삽입 (`documents`, `parse_runs`, 빈 `result_basic_info`) |
| `lib/chart-app/gemini.ts` | Gemini 텍스트 호출 |
| `lib/chart-app/upload-path.ts` | `extract-uploads/` 허용 규칙 |
| `package.json` | `pdf-parse` 의존성 버전 확인 |

---

## 12. 문서 버전 · 배포 기록

- 저장소: `dashboard-data` / `chart-api`
- 내용은 코드 기준으로 작성되었으며, 배포 브랜치와 커밋이 다르면 실제 동작과 차이가 날 수 있으므로 **배포 시점의 `route.ts` / `extract-pdf-text.ts`** 와 함께 전달하는 것을 권장한다.

### 2026-05-05 프로덕션 배포 (참고)

| 항목 | 값 |
|------|-----|
| 프로덕션 URL | https://chart-api-five.vercel.app |
| 이번 빌드 배포 URL | https://chart-70s4u31kq-taeheon-jeongs-projects.vercel.app |
| Vercel deployment id | `dpl_CkjDzbNeYv6W9zumZLD41DXUfCzW` |
| 배포 직전 로컬 `git rev-parse --short HEAD` | `8cef49f` |

### 2026-05-05 프로덕션 재배포

| 항목 | 값 |
|------|-----|
| 프로덕션 URL | https://chart-api-five.vercel.app |
| 이번 빌드 배포 URL | https://chart-8aooxuivs-taeheon-jeongs-projects.vercel.app |
| Vercel deployment id | `dpl_4vWQrRVDoh6yEh8SarhuBjt2noHp` |

Vercel은 워킹 트리 파일을 업로드하므로, 위 커밋과 다르게 **미커밋 변경이 배포에 포함**되었을 수 있다. 정확히 맞추려면 같은 커밋을 체크아웃한 뒤 재배포하거나 CI에서 태그를 붙인다.
