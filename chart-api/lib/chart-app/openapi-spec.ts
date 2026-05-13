import {
  CHART_API_ENDPOINTS,
  CHART_API_GROUPS,
  pathToOpenApi,
  type AuthKind,
  type ChartApiEndpoint,
} from './api-catalog';

const OPENAPI_VERSION = '3.0.3';

function tagForGroup(groupId: string): string {
  const g = CHART_API_GROUPS.find((x) => x.id === groupId);
  return g?.titleKo ?? groupId;
}

function securityForAuth(auth: AuthKind): Record<string, unknown>[] | undefined {
  switch (auth) {
    case 'bearer_chart':
      return [{ BearerChartKey: [] }];
    case 'bearer_cron':
      return [{ BearerCronSecret: [] }];
    case 'share_token':
    case 'public':
      return [];
    default:
      return [];
  }
}

function mergePaths(endpoints: ChartApiEndpoint[]): Record<string, Record<string, unknown>> {
  const paths: Record<string, Record<string, unknown>> = {};

  for (const ep of endpoints) {
    const oPath = pathToOpenApi(ep.path);
    if (!paths[oPath]) paths[oPath] = {};

    const sec = securityForAuth(ep.auth);
    const tag = tagForGroup(ep.groupId);
    const summary = ep.summaryKo + (ep.detailKo ? ` — ${ep.detailKo}` : '');

    for (const method of ep.methods) {
      const m = method.toLowerCase();
      paths[oPath][m] = {
        tags: [tag],
        summary,
        responses: {
          '200': { description: '성공 (일부 엔드포인트는 JSON 본문 형식 상이)' },
          '400': { description: '잘못된 요청' },
          '401': { description: '인증 실패' },
          '403': { description: '권한 없음' },
          '503': { description: '미구현·키 미설정 등 — 서버 안내 JSON' },
        },
        ...(sec && sec.length ? { security: sec } : { security: [] }),
      };
    }
  }

  return paths;
}

/** Partner tooling: Postman import, codegen, etc. */
export function buildOpenApiDocument(): Record<string, unknown> {
  return {
    openapi: OPENAPI_VERSION,
    info: {
      title: 'chart-api',
      description:
        '진료 차트 PDF·건강검진·케이스 이미지 vet-report 호환 API. 대부분 Bearer CHART_APP_API_KEY. PDF export는 인프로세스 playwright-core + @sparticuz/chromium; PLAYWRIGHT_PDF_SERVICE_URL 이 있으면 원격 우선. 로컬은 PLAYWRIGHT_CHROMIUM_EXECUTABLE_PATH 권장. 건강검진 run 인쇄 …/runs/{runId}/report/print, 공유 …/review/health-checkup/{token}/print — SHARE 템플릿· env 참고. Storage: pdf-uploads·hospital-assets. PDF 업로드 경로 extract-uploads/YYYY-MM-DD/{uuid}-{파일}.pdf.',
      version: '1.0.0',
    },
    servers: [{ url: '/', description: '배포 호스트 루트(예: Vercel 프로젝트 URL)' }],
    tags: CHART_API_GROUPS.map((g) => ({ name: g.titleKo })),
    paths: mergePaths(CHART_API_ENDPOINTS),
    components: {
      securitySchemes: {
        BearerChartKey: {
          type: 'http',
          scheme: 'bearer',
          description: '환경 변수 CHART_APP_API_KEY 와 동일한 값',
        },
        BearerCronSecret: {
          type: 'http',
          scheme: 'bearer',
          description: '환경 변수 CRON_SECRET 과 동일한 값',
        },
      },
    },
  };
}
