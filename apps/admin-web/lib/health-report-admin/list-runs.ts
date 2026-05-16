import { createServiceRoleClient } from '@/lib/supabase/service-role';
import type { GeneratedContentListItem } from '@/lib/health-report-admin/types';

function iso(d: unknown): string {
  if (d instanceof Date) return d.toISOString();
  if (typeof d === 'string') return d;
  return new Date(String(d)).toISOString();
}

/** `health_report.generated_run_content` 중 건강검진만, 병원·환자 표시용으로 chart_pdf 조인. */
export async function loadHealthCheckupReportList(): Promise<GeneratedContentListItem[]> {
  const sb = createServiceRoleClient();
  const { data: rows, error } = await sb
    .schema('health_report')
    .from('generated_run_content')
    .select('id, parse_run_id, content_type, created_at, updated_at')
    .eq('content_type', 'health_checkup')
    .order('updated_at', { ascending: false })
    .limit(100);

  if (error) throw new Error(error.message);
  const list = rows ?? [];
  if (list.length === 0) return [];

  const runIds = [...new Set(list.map((r) => String((r as Record<string, unknown>).parse_run_id ?? '')))].filter(
    Boolean,
  );

  const [{ data: runs }, { data: basics }] = await Promise.all([
    sb.schema('chart_pdf').from('parse_runs').select('id, friendly_id, created_at').in('id', runIds),
    sb
      .schema('chart_pdf')
      .from('result_basic_info')
      .select('parse_run_id, patient_name, hospital_name')
      .in('parse_run_id', runIds),
  ]);

  const runMap = new Map<string, { friendly_id: string | null; created_at: string | null }>();
  for (const r of runs ?? []) {
    const o = r as Record<string, unknown>;
    runMap.set(String(o.id), {
      friendly_id: o.friendly_id != null ? String(o.friendly_id) : null,
      created_at: o.created_at != null ? String(o.created_at) : null,
    });
  }
  const basicMap = new Map<string, { patient_name: string | null; hospital_name: string | null }>();
  for (const b of basics ?? []) {
    const o = b as Record<string, unknown>;
    const pid = String(o.parse_run_id ?? '');
    if (pid)
      basicMap.set(pid, {
        patient_name: o.patient_name != null ? String(o.patient_name) : null,
        hospital_name: o.hospital_name != null ? String(o.hospital_name) : null,
      });
  }

  return list.map((raw) => {
    const r = raw as Record<string, unknown>;
    const parseRunId = String(r.parse_run_id ?? '');
    const fr = runMap.get(parseRunId);
    const bi = basicMap.get(parseRunId);
    return {
      id: String(r.id ?? ''),
      parseRunId,
      contentType: String(r.content_type ?? 'health_checkup'),
      createdAt: iso(r.created_at),
      updatedAt: iso(r.updated_at),
      friendlyId: fr?.friendly_id ?? null,
      parseRunCreatedAt: fr?.created_at ?? null,
      patientName: bi?.patient_name ?? null,
      hospitalName: bi?.hospital_name ?? null,
    };
  });
}
