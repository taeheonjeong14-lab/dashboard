import { NextResponse } from 'next/server';
import { requireAdminApi } from '@/lib/assert-admin-api';
import { createServiceRoleClient } from '@/lib/supabase/service-role';
import { getPdfUploadsBucket } from '@/lib/chart-extraction/storage-config';
import { getAdminWebPgPool } from '@/lib/db';

type StepResult = {
  ok: boolean;
  detail: string;
  data?: Record<string, unknown>;
};

function maskSecret(val: string | undefined): string {
  if (!val) return '(없음)';
  return val.length <= 8 ? '***' : `${val.slice(0, 4)}…${val.slice(-4)}`;
}

async function checkEnvVars(): Promise<StepResult> {
  // 필수 변수만 체크 (스키마 관련은 기본값 있으므로 선택 사항)
  const required = {
    NEXT_PUBLIC_SUPABASE_URL: process.env.NEXT_PUBLIC_SUPABASE_URL,
    SUPABASE_SERVICE_ROLE_KEY: process.env.SUPABASE_SERVICE_ROLE_KEY,
    DATABASE_URL: process.env.DATABASE_URL,
    CHART_API_BASE_URL: process.env.CHART_API_BASE_URL,
    CHART_APP_API_KEY: process.env.CHART_APP_API_KEY,
  };
  const missing = Object.entries(required)
    .filter(([, v]) => !v?.trim())
    .map(([k]) => k);
  return {
    ok: missing.length === 0,
    detail: missing.length === 0 ? '모든 필수 환경변수 설정됨' : `미설정: ${missing.join(', ')}`,
    data: {
      NEXT_PUBLIC_SUPABASE_URL: process.env.NEXT_PUBLIC_SUPABASE_URL?.trim() || '(없음)',
      SUPABASE_SERVICE_ROLE_KEY: maskSecret(process.env.SUPABASE_SERVICE_ROLE_KEY),
      DATABASE_URL: maskSecret(process.env.DATABASE_URL),
      CHART_API_BASE_URL: process.env.CHART_API_BASE_URL?.trim() || '(없음)',
      CHART_APP_API_KEY: maskSecret(process.env.CHART_APP_API_KEY),
      SUPABASE_DB_SCHEMA: process.env.SUPABASE_DB_SCHEMA || '(미설정 → 기본값 public)',
      SUPABASE_SCHEMA_CHART_PDF: process.env.SUPABASE_SCHEMA_CHART_PDF || '(미설정 → 기본값 public)',
      SUPABASE_SCHEMA_CORE: process.env.SUPABASE_SCHEMA_CORE || '(미설정 → 기본값 public)',
      PDF_BUCKET_RESOLVED: getPdfUploadsBucket(),
    },
  };
}

async function checkSupabaseStorage(): Promise<StepResult> {
  try {
    const supabase = createServiceRoleClient();
    const bucket = getPdfUploadsBucket();
    const { data, error } = await supabase.storage.from(bucket).list('extract-uploads', { limit: 3 });
    if (error) {
      return { ok: false, detail: `Storage 조회 실패: ${error.message}`, data: { bucket } };
    }
    return {
      ok: true,
      detail: `Storage 연결 OK (bucket=${bucket}, extract-uploads/ 파일 ${data?.length ?? 0}개)`,
      data: { bucket, recentFiles: (data ?? []).map((f) => f.name) },
    };
  } catch (e) {
    return { ok: false, detail: `Storage 예외: ${e instanceof Error ? e.message : String(e)}` };
  }
}

async function checkPostgresDb(): Promise<StepResult> {
  try {
    const pool = getAdminWebPgPool();
    const { rows } = await pool.query<{ schema_name: string }>(
      `SELECT schema_name FROM information_schema.schemata WHERE schema_name IN ('public','core','chart_pdf') ORDER BY schema_name`,
    );
    const schemas = rows.map((r) => r.schema_name);

    // parse_runs 개수
    let parseRunCount = -1;
    let parseRunError = '';
    for (const schema of ['chart_pdf', 'public']) {
      try {
        const r = await pool.query<{ cnt: string }>(
          `SELECT COUNT(*)::text AS cnt FROM ${schema}.parse_runs LIMIT 1`,
        );
        parseRunCount = Number(r.rows[0]?.cnt ?? -1);
        break;
      } catch (err) {
        parseRunError = err instanceof Error ? err.message : String(err);
      }
    }

    // hospitals 개수
    let hospitalCount = -1;
    for (const schema of ['core', 'public']) {
      try {
        const r = await pool.query<{ cnt: string }>(
          `SELECT COUNT(*)::text AS cnt FROM ${schema}.hospitals LIMIT 1`,
        );
        hospitalCount = Number(r.rows[0]?.cnt ?? -1);
        break;
      } catch { /* try next schema */ }
    }

    return {
      ok: true,
      detail: `DB 연결 OK`,
      data: {
        schemas,
        parseRunCount: parseRunCount >= 0 ? parseRunCount : `오류: ${parseRunError}`,
        hospitalCount: hospitalCount >= 0 ? hospitalCount : '조회 실패',
      },
    };
  } catch (e) {
    return { ok: false, detail: `DB 연결 실패: ${e instanceof Error ? e.message : String(e)}` };
  }
}

async function checkChartApiConnectivity(): Promise<StepResult> {
  const chartApiUrl = process.env.CHART_API_BASE_URL?.replace(/\/$/, '');
  const chartApiKey = process.env.CHART_APP_API_KEY;
  if (!chartApiUrl || !chartApiKey) {
    return { ok: false, detail: 'CHART_API_BASE_URL 또는 CHART_APP_API_KEY 미설정' };
  }
  try {
    const controller = new AbortController();
    const timeout = setTimeout(() => controller.abort(), 8000);
    const res = await fetch(`${chartApiUrl}/api/health`, {
      headers: { Authorization: `Bearer ${chartApiKey}` },
      signal: controller.signal,
    }).finally(() => clearTimeout(timeout));
    const text = await res.text().catch(() => '');
    return {
      ok: res.status < 500,
      detail: `chart-api GET /api/health → HTTP ${res.status}`,
      data: { status: res.status, body: text.slice(0, 200) },
    };
  } catch (e) {
    const msg = e instanceof Error ? e.message : String(e);
    return {
      ok: false,
      detail: `chart-api 연결 실패: ${msg}`,
      data: { url: chartApiUrl },
    };
  }
}

async function checkChartApiTextBucketing(): Promise<StepResult> {
  const chartApiUrl = process.env.CHART_API_BASE_URL?.replace(/\/$/, '');
  const chartApiKey = process.env.CHART_APP_API_KEY;
  if (!chartApiUrl || !chartApiKey) {
    return { ok: false, detail: 'chart-api 환경변수 미설정으로 스킵' };
  }
  try {
    // 빈 FormData로 보내서 어떤 에러가 오는지 확인 (auth + parsing 체크용)
    const form = new FormData();
    const controller = new AbortController();
    const timeout = setTimeout(() => controller.abort(), 10000);
    const res = await fetch(`${chartApiUrl}/api/text-bucketing`, {
      method: 'POST',
      headers: { Authorization: `Bearer ${chartApiKey}` },
      body: form,
      signal: controller.signal,
    }).finally(() => clearTimeout(timeout));
    const text = await res.text().catch(() => '');
    // 400 (validation error) means it received the request fine — auth & parsing OK
    // 401/403 means auth failed
    // 5xx or network error means real problem
    const authOk = res.status !== 401 && res.status !== 403;
    return {
      ok: authOk,
      detail: authOk
        ? `chart-api 연결·인증 OK (빈 요청 → HTTP ${res.status}, 예상된 validation 오류)`
        : `chart-api 인증 실패 (HTTP ${res.status})`,
      data: { status: res.status, body: text.slice(0, 400) },
    };
  } catch (e) {
    const msg = e instanceof Error ? e.message : String(e);
    return {
      ok: false,
      detail: `chart-api text-bucketing 연결 실패: ${msg}`,
    };
  }
}

async function checkSupabaseParseRuns(): Promise<StepResult> {
  try {
    const supabase = createServiceRoleClient();

    // chart_pdf 스키마 or public 시도
    const schemas = ['chart_pdf', 'public'];
    for (const schema of schemas) {
      const client = schema === 'public' ? supabase : supabase.schema(schema);
      const { count, error } = await (client as typeof supabase)
        .from('parse_runs')
        .select('*', { count: 'exact', head: true });
      if (!error) {
        return {
          ok: true,
          detail: `Supabase parse_runs 조회 OK (스키마: ${schema}, 총 ${count ?? 0}건)`,
          data: { schema, count },
        };
      }
    }
    return { ok: false, detail: 'Supabase에서 parse_runs 조회 실패 (어떤 스키마도 매칭 안됨)' };
  } catch (e) {
    return { ok: false, detail: `Supabase parse_runs 예외: ${e instanceof Error ? e.message : String(e)}` };
  }
}

export async function GET() {
  const gate = await requireAdminApi();
  if (!gate.ok) return gate.response;

  const [envVars, storage, postgres, chartApiConn, chartApiBucketing, supabaseParseRuns] =
    await Promise.allSettled([
      checkEnvVars(),
      checkSupabaseStorage(),
      checkPostgresDb(),
      checkChartApiConnectivity(),
      checkChartApiTextBucketing(),
      checkSupabaseParseRuns(),
    ]);

  function settle(r: PromiseSettledResult<StepResult>): StepResult {
    if (r.status === 'fulfilled') return r.value;
    return { ok: false, detail: `예외 발생: ${r.reason instanceof Error ? r.reason.message : String(r.reason)}` };
  }

  const steps = {
    '1_env_vars': settle(envVars),
    '2_supabase_storage': settle(storage),
    '3_postgres_db': settle(postgres),
    '4_chart_api_connectivity': settle(chartApiConn),
    '5_chart_api_text_bucketing': settle(chartApiBucketing),
    '6_supabase_parse_runs': settle(supabaseParseRuns),
  };

  const allOk = Object.values(steps).every((s) => s.ok);
  return NextResponse.json({ ok: allOk, steps }, { status: 200 });
}
