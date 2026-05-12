/** admin-web·vet-report 공통 — /api 응답이 배열이거나 { hospitals | items | data } 래핑일 수 있음 */

export type ChartHospitalOption = {
  id: string;
  name_ko: string;
};

export function chartAdminHospitalsArrayFromBody(body: unknown): unknown[] {
  if (Array.isArray(body)) return body;
  if (!body || typeof body !== 'object') return [];
  const o = body as Record<string, unknown>;
  const nested =
    (Array.isArray(o.hospitals) ? o.hospitals : null) ??
    (Array.isArray(o.items) ? o.items : null) ??
    (Array.isArray(o.data) ? o.data : null);
  return nested ?? [];
}

export function parseChartAdminHospitalsResponse(body: unknown): ChartHospitalOption[] {
  return chartAdminHospitalsArrayFromBody(body)
    .map((entry) => {
      if (!entry || typeof entry !== 'object') return null;
      const row = entry as Record<string, unknown>;
      const id = typeof row.id === 'string' ? row.id.trim() : '';
      if (!id) return null;
      const name =
        (typeof row.name === 'string' && row.name.trim()) ||
        (typeof row.name_ko === 'string' && row.name_ko.trim()) ||
        '이름 없음';
      return { id, name_ko: name };
    })
    .filter((row): row is ChartHospitalOption => row != null);
}
