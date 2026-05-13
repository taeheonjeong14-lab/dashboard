import type { CSSProperties } from 'react';

import {
  CHART_API_ENDPOINTS,
  CHART_API_GROUPS,
  authLabelKo,
  availabilityLabelKo,
  type AvailabilityKind,
  type ChartApiEndpoint,
} from '@/lib/chart-app/api-catalog';

function badgeStyle(kind: AvailabilityKind): CSSProperties {
  const base: CSSProperties = {
    display: 'inline-block',
    padding: '2px 8px',
    borderRadius: 4,
    fontSize: 11,
    fontWeight: 600,
    whiteSpace: 'nowrap',
  };
  switch (kind) {
    case 'live':
      return { ...base, background: '#dcfce7', color: '#166534' };
    case 'requires_gemini':
      return { ...base, background: '#fef9c3', color: '#854d0e' };
    case 'not_implemented_503':
      return { ...base, background: '#fee2e2', color: '#991b1b' };
    case 'mixed':
      return { ...base, background: '#e0f2fe', color: '#0369a1' };
    default:
      return { ...base, background: '#f3f4f6', color: '#374151' };
  }
}

function EndpointTable({ rows }: { rows: ChartApiEndpoint[] }) {
  return (
    <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: 13 }}>
      <thead>
        <tr style={{ borderBottom: '2px solid #ccc', textAlign: 'left' }}>
          <th style={{ padding: 8 }}>상태</th>
          <th style={{ padding: 8 }}>Method</th>
          <th style={{ padding: 8 }}>Path</th>
          <th style={{ padding: 8 }}>설명</th>
          <th style={{ padding: 8 }}>인증</th>
        </tr>
      </thead>
      <tbody>
        {rows.map((r) => (
          <tr key={r.path + r.methods.join()} style={{ borderBottom: '1px solid #eee', verticalAlign: 'top' }}>
            <td style={{ padding: 8 }}>
              <span style={badgeStyle(r.availability)}>{availabilityLabelKo(r.availability)}</span>
            </td>
            <td style={{ padding: 8, whiteSpace: 'nowrap' }}>{r.methods.join(', ')}</td>
            <td style={{ padding: 8 }}>
              <code>{r.path}</code>
            </td>
            <td style={{ padding: 8 }}>
              {r.summaryKo}
              {r.detailKo ? (
                <span style={{ display: 'block', color: '#64748b', fontSize: 12, marginTop: 4 }}>{r.detailKo}</span>
              ) : null}
            </td>
            <td style={{ padding: 8, fontSize: 12 }}>{authLabelKo(r.auth)}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
}

export default function Home() {
  return (
    <main style={{ maxWidth: 980, margin: '0 auto', padding: '24px 16px 48px', lineHeight: 1.55 }}>
      <h1 style={{ marginTop: 0 }}>chart-api</h1>
      <p style={{ fontSize: 15 }}>
        vet-report 스펙과 동일한 HTTP API입니다. 파트너 연동·리뷰용 상세 문서는 저장소{' '}
        <strong>PARTNER_REVIEW.md</strong> 를 참고하고, 이 페이지와{' '}
        <a href="/api/openapi">
          <code>/api/openapi</code>
        </a>{' '}
        (OpenAPI 3 JSON)로 동일 계약을 기계가 읽을 수 있습니다.
      </p>
      <aside
        style={{
          marginTop: 16,
          padding: 16,
          background: '#eff6ff',
          border: '1px solid #bfdbfe',
          borderRadius: 8,
          fontSize: 14,
        }}
      >
        <strong>배포 후 파트너에게 전달 추천:</strong> 프로덕션 베이스 URL · 이 페이지 URL ·{' '}
        <code>/api/openapi</code> · (선택) Staging URL · 저장소의 <strong>PARTNER_REVIEW.md</strong>
      </aside>

      <nav
        style={{
          margin: '20px 0',
          padding: 16,
          background: '#f8fafc',
          borderRadius: 8,
          border: '1px solid #e2e8f0',
        }}
      >
        <strong style={{ display: 'block', marginBottom: 8 }}>바로가기</strong>
        <ul style={{ margin: 0, paddingLeft: 20 }}>
          <li>
            <a href="#auth">인증 · 공개 예외</a>
          </li>
          <li>
            <a href="#errors">오류 · 503</a>
          </li>
          <li>
            <a href="#storage">Supabase Storage</a>
          </li>
          <li>
            <a href="#ttl">서명·공유 TTL</a>
          </li>
          <li>
            <a href="#curl">curl 예시</a>
          </li>
          <li>
            <a href="#env">환경 변수</a>
          </li>
          <li>
            <a href="#partner">파트너 체크리스트 · 프록시</a>
          </li>
          <li>
            <a href="#pdf">PDF (건강검진 export)</a>
          </li>
          {CHART_API_GROUPS.map((g) => (
            <li key={g.id}>
              <a href={`#group-${g.id}`}>{g.titleKo}</a>
            </li>
          ))}
        </ul>
      </nav>

      <h2 id="auth" style={{ fontSize: '1.15rem', marginTop: 28 }}>
        인증
      </h2>
      <p>
        대부분: <code style={{ fontSize: 13 }}>Authorization: Bearer &lt;CHART_APP_API_KEY&gt;</code>
      </p>
      <ul>
        <li>
          <strong>공개</strong>: <code>GET/PATCH …/review-share</code> — 리뷰 토큰만 검증 (차트 앱 키 불필요).
        </li>
        <li>
          <strong>공유 PDF</strong>: <code>POST …/export-by-share</code> — 바디 <code>token</code> 만 (Bearer 금지). 인쇄
          페이지 URL이 서버에서 만들어지지 않으면 <strong>503</strong> (<code>MISSING_PRINT_URL</code>).
        </li>
        <li>
          <strong>크론</strong>: <code>CRON_SECRET</code> 이 설정된 경우{' '}
          <code>Authorization: Bearer &lt;CRON_SECRET&gt;</code>. Vercel Cron은 기본 헤더가 없으므로 호출 방식을 맞추거나
          시크릿 없이 운영하지 않도록 설정해야 합니다.
        </li>
      </ul>

      <h2 id="errors" style={{ fontSize: '1.15rem', marginTop: 28 }}>
        오류 응답
      </h2>
      <p>
        클라이언트 오류는 <strong>4xx</strong>, 서버·미구현·키 누락은 보통 <strong>503</strong> 과 JSON 안내 메시지입니다.
        연동 시에는 <code>503</code> 본문을 로깅해 두면 포팅 일정 공유에 도움이 됩니다.
      </p>

      <h2 id="storage" style={{ fontSize: '1.15rem', marginTop: 28 }}>
        Storage 버킷
      </h2>
      <p>
        <strong>고정:</strong> PDF <code>pdf-uploads</code>, 병원 에셋 <code>hospital-assets</code>. PDF 객체 경로는{' '}
        <code>extract-uploads/YYYY-MM-DD/&lt;uuid&gt;-&lt;파일명&gt;.pdf</code> 형태입니다.
      </p>
      <p>
        <strong>케이스 이미지:</strong> 기본 버킷명 <code>case-image</code> — 통합 인프라에서 이름을 바꿀 때는 환경 변수{' '}
        <code>SUPABASE_IMAGE_CASE_BUCKET</code> 로 맞춥니다. 브라우저에서 서명 URL로 직접 PUT 하는 경우 Supabase{' '}
        <strong>CORS</strong> 설정이 필요할 수 있습니다.
      </p>

      <h3 id="ttl" style={{ fontSize: '1.05rem', marginTop: 20 }}>
        서명·공유 TTL (현재 구현)
      </h3>
      <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: 13, marginTop: 8 }}>
        <thead>
          <tr style={{ borderBottom: '2px solid #ccc', textAlign: 'left' }}>
            <th style={{ padding: 8 }}>용도</th>
            <th style={{ padding: 8 }}>TTL</th>
          </tr>
        </thead>
        <tbody>
          <tr style={{ borderBottom: '1px solid #eee' }}>
            <td style={{ padding: 8 }}>케이스 이미지 미리보기 서명 URL</td>
            <td style={{ padding: 8 }}>7일</td>
          </tr>
          <tr style={{ borderBottom: '1px solid #eee' }}>
            <td style={{ padding: 8 }}>병원 로고·직인 업로드 후 서명 URL</td>
            <td style={{ padding: 8 }}>1년</td>
          </tr>
          <tr style={{ borderBottom: '1px solid #eee' }}>
            <td style={{ padding: 8 }}>건강검진 리뷰 공유 링크(토큰 만료)</td>
            <td style={{ padding: 8 }}>발급 후 7일</td>
          </tr>
          <tr style={{ borderBottom: '1px solid #eee' }}>
            <td style={{ padding: 8 }}>PDF 업로드 서명 URL</td>
            <td style={{ padding: 8 }}>Supabase 제품 정책(별도 상한 합의 권장)</td>
          </tr>
        </tbody>
      </table>

      <h2 id="curl" style={{ fontSize: '1.15rem', marginTop: 28 }}>
        curl 예시
      </h2>
      <p style={{ fontSize: 13, color: '#475569' }}>
        <code>$BASE</code>를 배포 URL(예: <code>https://your-app.vercel.app</code>)로 바꿉니다.
      </p>
      <pre
        style={{
          background: '#0f172a',
          color: '#e2e8f0',
          padding: 16,
          borderRadius: 8,
          overflow: 'auto',
          fontSize: 12,
        }}
      >
        {`# OpenAPI 스펙 받기 (인증 불필요)
curl -s "$BASE/api/openapi" | jq .

# 인증 필요 예시 (헬스성 목록 — 실제 파라미터는 스펙·구현 참고)
curl -sS -H "Authorization: Bearer YOUR_CHART_APP_API_KEY" "$BASE/api/history"`}
      </pre>

      <h2 id="env" style={{ fontSize: '1.15rem', marginTop: 28 }}>
        서버 환경 변수 요약
      </h2>
      <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: 13 }}>
        <thead>
          <tr style={{ borderBottom: '2px solid #ccc', textAlign: 'left' }}>
            <th style={{ padding: 8 }}>변수</th>
            <th style={{ padding: 8 }}>역할</th>
          </tr>
        </thead>
        <tbody>
          {[
            ['DATABASE_URL', 'Postgres (Pooling URL 권장)'],
            ['NEXT_PUBLIC_SUPABASE_URL', 'Supabase 프로젝트 URL'],
            ['SUPABASE_SERVICE_ROLE_KEY', 'Storage·서버측 Supabase API'],
            ['SUPABASE_PDF_UPLOADS_BUCKET', 'PDF 업로드 Storage 버킷명 (기본 pdf-uploads, 대시보드에서 생성)'],
            ['CHART_APP_API_KEY', '파트너 Bearer 토큰과 동일하게 설정'],
            ['GEMINI_API_KEY', 'LLM 라우트 (없으면 해당 POST 503)'],
            ['GEMINI_MODEL', 'Gemini 모델 ID (선택, 기본 gemini-2.0-flash)'],
            ['HEALTH_CHECKUP_PRINT_URL_TEMPLATE', 'run 인쇄 URL ({runId}) — 예: …/runs/{runId}/report/print'],
            ['HEALTH_CHECKUP_PRINT_BASE_URL', 'run 인쇄 베이스 + /runId'],
            ['HEALTH_CHECKUP_SHARE_PRINT_URL_TEMPLATE', '공유 PDF ({token}) — export-by-share, runId와 별도'],
            ['VET_REPORT_PUBLIC_ORIGIN', 'run: …/runs/…/report/print, share: …/review/health-checkup/…/print 기본 조합'],
            ['VET_REPORT_HEALTH_PRINT_SUBPATH', '선택, run 경로 오리진+sub 오버라이드'],
            ['VET_REPORT_HEALTH_SHARE_PRINT_SUBPATH', '선택, 기본 review/health-checkup (share)'],
            ['PLAYWRIGHT_PDF_SERVICE_URL', '선택, 있으면 원격 PDF 우선 (미설정 시 인프로세스 Chromium)'],
            ['PLAYWRIGHT_PDF_SERVICE_SECRET', '선택, 원격 PDF Bearer'],
            ['PLAYWRIGHT_CHROMIUM_EXECUTABLE_PATH', '로컬 개발용 시스템 Chrome 경로 (Vercel은 보통 비움)'],
            ['CHART_APP_SHARE_PUBLIC_BASE_URL', '리뷰 공유 URL 접두사 (선택)'],
            ['SUPABASE_IMAGE_CASE_BUCKET', '케이스 이미지 버킷명 (선택, 기본 case-image)'],
            ['IMAGE_CASE_MAX_EDGE', '케이스 WebP 리사이즈 최대 변 px (선택, 기본 2048)'],
            ['IMAGE_CASE_WEBP_QUALITY', '케이스 WebP 품질 1–100 (선택, 기본 82)'],
            ['CRON_SECRET', '크론 라우트 보호 (선택)'],
            ['CHART_APP_DEBUG_RAW_PAYLOAD', '히스토리 디버그 (선택, 1 또는 true)'],
          ].map(([k, v]) => (
            <tr key={k} style={{ borderBottom: '1px solid #eee' }}>
              <td style={{ padding: 8 }}>
                <code>{k}</code>
              </td>
              <td style={{ padding: 8 }}>{v}</td>
            </tr>
          ))}
        </tbody>
      </table>

      <h2 id="partner" style={{ fontSize: '1.15rem', marginTop: 28 }}>
        파트너 체크리스트 · 프록시 (vet-report)
      </h2>
      <ul style={{ fontSize: 14 }}>
        <li>
          <strong>동일 키:</strong> Chart API <code>CHART_APP_API_KEY</code> = vet-report 프록시가 붙이는 Bearer 값.
        </li>
        <li>
          <strong>예외:</strong> 리뷰 공개 <code>GET/PATCH …/review-share</code>, 공유 PDF{' '}
          <code>POST …/export-by-share</code> 는 <strong>Bearer를 붙이지 않음</strong> (토큰만).
        </li>
        <li>
          <strong>리뷰 링크 발급</strong> <code>POST …/review-share</code> 는 Bearer <strong>필요</strong>.
        </li>
        <li>
          <strong>DB·Supabase:</strong> 동일 프로젝트/데이터를 보도록 맞추지 않으면 <code>runId</code>·화면이 어긋날 수
          있음 (인쇄 페이지가 Supabase 직접 조회인 경우 특히 합의).
        </li>
        <li>
          상세 표·스모크 아이디어는 저장소 <strong>PARTNER_REVIEW.md</strong> 참고.
        </li>
      </ul>

      <h2 id="pdf" style={{ fontSize: '1.15rem', marginTop: 28 }}>
        PDF (건강검진 export)
      </h2>
      <ul style={{ fontSize: 14 }}>
        <li>
          기본: API 라우트 안에서 <strong>playwright-core + @sparticuz/chromium</strong> 으로 인쇄 URL을 열어 PDF 생성 (
          <code>runtime: nodejs</code>).
        </li>
        <li>
          <strong>Run PDF:</strong> <code>…/runs/&lt;runId&gt;/report/print</code> 패턴.{' '}
          <strong>공유 PDF (export-by-share):</strong> <code>…/review/health-checkup/&lt;token&gt;/print</code> —{' '}
          <code>runId</code>가 아니라 <strong>토큰</strong> 경로. <code>HEALTH_CHECKUP_SHARE_PRINT_URL_TEMPLATE</code> 또는{' '}
          <code>VET_REPORT_PUBLIC_ORIGIN</code>.
        </li>
        <li>
          <code>PLAYWRIGHT_PDF_SERVICE_URL</code> 이 있으면 <strong>원격 PDF 서비스 우선</strong> (선택·폴백).
        </li>
        <li>
          인쇄 페이지는 <strong>공개 접근 가능</strong>해야 PDF 렌더가 성공하기 쉬움 (로그인 필수 페이지면 실패 가능).
        </li>
      </ul>

      {CHART_API_GROUPS.map((g) => {
        const rows = CHART_API_ENDPOINTS.filter((e) => e.groupId === g.id);
        return (
          <section key={g.id} id={`group-${g.id}`} style={{ marginTop: 36 }}>
            <h2 style={{ fontSize: '1.1rem', borderBottom: '1px solid #e2e8f0', paddingBottom: 8 }}>{g.titleKo}</h2>
            <EndpointTable rows={rows} />
          </section>
        );
      })}

      <p style={{ marginTop: 40, fontSize: 13, color: '#64748b' }}>
        로컬 개발 기본 포트는 <strong>3003</strong> (<code>npm run dev</code>). 배포 후에는 이 페이지와{' '}
        <code>/api/openapi</code>가 파트너에게 동일한 정보를 제공합니다. 리뷰용 장문은{' '}
        <strong>PARTNER_REVIEW.md</strong> 를 저장소에서 함께 공유하세요.
      </p>
    </main>
  );
}
