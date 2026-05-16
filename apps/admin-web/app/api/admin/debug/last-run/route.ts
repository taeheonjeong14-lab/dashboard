import { NextResponse } from 'next/server';
import { requireAdminApi } from '@/lib/assert-admin-api';
import { createServiceRoleClient } from '@/lib/supabase/service-role';

export async function GET() {
  const gate = await requireAdminApi();
  if (!gate.ok) return gate.response;

  try {
    const supabase = createServiceRoleClient();
    const db = supabase.schema('chart_pdf');

    // 가장 최근 run
    const { data: run, error: runErr } = await db
      .from('parse_runs')
      .select('id, created_at, friendly_id, status, raw_payload, error_message, chart_type:documents(chart_type), file_name:documents(file_name)')
      .order('created_at', { ascending: false })
      .limit(1)
      .maybeSingle();

    if (runErr) return NextResponse.json({ error: runErr.message }, { status: 500 });
    if (!run) return NextResponse.json({ run: null });

    const runId = run.id as string;
    const rawPayload = run.raw_payload as Record<string, unknown> | null;

    // 연결 데이터 개수
    const [chartRows, labRows, vacRows, vitalRows, basicRows] = await Promise.all([
      db.from('result_chart_by_date').select('*', { count: 'exact', head: true }).eq('parse_run_id', runId),
      db.from('result_lab_items').select('*', { count: 'exact', head: true }).eq('parse_run_id', runId),
      db.from('result_vaccination_records').select('*', { count: 'exact', head: true }).eq('parse_run_id', runId),
      db.from('result_vitals').select('*', { count: 'exact', head: true }).eq('parse_run_id', runId),
      db.from('result_basic_info').select('hospital_name,owner_name,patient_name,species').eq('parse_run_id', runId).maybeSingle(),
    ]);

    // raw_payload에서 핵심 정보 추출
    const payloadSummary = rawPayload ? {
      chartBodyByDateCount: Array.isArray(rawPayload.chartBodyByDate) ? (rawPayload.chartBodyByDate as unknown[]).length : '?',
      labItemsByDateCount: Array.isArray(rawPayload.labItemsByDate) ? (rawPayload.labItemsByDate as unknown[]).length : '?',
      vaccinationCount: Array.isArray(rawPayload.vaccinationRecords) ? (rawPayload.vaccinationRecords as unknown[]).length : '?',
      bucketSizes: rawPayload.bucketSizes ?? null,
      llmLineCount: rawPayload.llmLineCount ?? null,
      ocrRowCount: rawPayload.ocrRowCount ?? null,
      effectivePdfLineCount: rawPayload.effectivePdfLineCount ?? null,
      effectiveHead: rawPayload.effectiveHead ?? null,
    } : null;

    return NextResponse.json({
      run: {
        id: runId,
        createdAt: run.created_at,
        friendlyId: run.friendly_id,
        status: run.status,
        errorMessage: run.error_message,
      },
      dbCounts: {
        chartByDate: chartRows.count ?? -1,
        labItems: labRows.count ?? -1,
        vaccination: vacRows.count ?? -1,
        vitals: vitalRows.count ?? -1,
      },
      basicInfo: basicRows.data ?? null,
      payloadSummary,
    });
  } catch (e) {
    return NextResponse.json({ error: e instanceof Error ? e.message : String(e) }, { status: 500 });
  }
}
