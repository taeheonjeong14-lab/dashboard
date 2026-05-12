# admin-web「통계」와 dashboard-ui

`apps/dashboard-ui`는 병원 경영 통계용 참조 구현(동일 데이터 소스·UI 패턴)입니다. 운영 admin에서는 **`/admin/performance`** 가 iframe 없이 **admin-web 안에서** 동작합니다.

## 동작 방식

- **병원 선택**: `GET /api/admin/data/hospitals` 로 목록을 읽고, `/admin/performance/[hospitalId]/…` 로 탭·데이터를 나눕니다.
- **집계 데이터**: 브라우저에서 Supabase anon으로 임의 병원을 읽기 어려운 경우가 있어, 서버 라우트 **`/api/admin/stats/*`** (`requireAdminApi` + `hospitalId` 검증 + Service Role 쿼리)를 사용합니다.
- **블로그 미리보기 제목** 등은 기존과 같이 **`NEXT_PUBLIC_DASHBOARD_API_URL`** 의 dashboard-api 엔드포인트를 호출합니다(CORS는 [`dashboard-api/lib/cors.ts`](../dashboard-api/lib/cors.ts) 참고).

## 로컬 개발

1. **admin-web** (기본 포트 **3011**)

   ```bash
   npm run admin-web:dev
   ```

2. 브라우저에서 `http://localhost:3011/admin/performance` — 등록된 첫 병원으로 이동하거나, 사이드 레일에서 병원·탭을 고릅니다.

3. 통계 API와 병원 목록은 **`SUPABASE_SERVICE_ROLE_KEY`** 가 서버에 있어야 합니다.

## 프로덕션

- admin-web(Vercel 등)에 **`SUPABASE_SERVICE_ROLE_KEY`** · **`NEXT_PUBLIC_DASHBOARD_API_URL`**(블로그 미리보기용) 등을 설정합니다.
- **`NEXT_PUBLIC_DASHBOARD_UI_URL`** 은 더 이상 통계 메뉴에 필요하지 않습니다.

## Supabase 리다이렉트

- admin-web이 **같은 Supabase 프로젝트**를 쓰면, Auth **Redirect URLs**에 `http://localhost:3011/**` 및 배포 URL 등을 허용했는지 확인하세요.

## monorepo에서 `npm install`

루트 워크스페이스 설치 후 일부 앱에서 의존성이 빠질 수 있습니다. `apps/dashboard-ui` 단독 작업 시에는 해당 디렉터리에서 한 번 설치할 수 있습니다.

## 팀에 물어보면 좋은 것

- dashboard-api **베이스 URL** (`NEXT_PUBLIC_DASHBOARD_API_URL`)이 admin과 동일한지.
- 통계 읽기 정책(Service Role vs RLS) 운영 기준.
