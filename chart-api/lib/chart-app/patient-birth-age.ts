/** vet-report `lib/patient-birth-age.ts`에서 표지 연령 계산에 필요한 부분만 이식 */

const MS_PER_AVG_YEAR = 365.25 * 24 * 60 * 60 * 1000;

export function parseLeadingIsoDate(raw: string | null | undefined): string | null {
  const t = (raw ?? '').trim();
  const m = t.match(/^(\d{4}-\d{2}-\d{2})\b/);
  if (!m) return null;
  const iso = m[1];
  const [y, mo, d] = iso.split('-').map((x) => Number.parseInt(x, 10));
  if (!Number.isFinite(y) || !Number.isFinite(mo) || !Number.isFinite(d)) return null;
  const dt = new Date(Date.UTC(y, mo - 1, d));
  if (dt.getUTCFullYear() !== y || dt.getUTCMonth() !== mo - 1 || dt.getUTCDate() !== d) return null;
  return iso;
}

export function utcDateFromKstCalendar(now: Date = new Date()): Date {
  const parts = new Intl.DateTimeFormat('en-CA', {
    timeZone: 'Asia/Seoul',
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
  }).formatToParts(now);
  const y = Number(parts.find((p) => p.type === 'year')?.value ?? 'NaN');
  const mo = Number(parts.find((p) => p.type === 'month')?.value ?? 'NaN');
  const d = Number(parts.find((p) => p.type === 'day')?.value ?? 'NaN');
  if (!Number.isFinite(y) || !Number.isFinite(mo) || !Number.isFinite(d)) return new Date(NaN);
  return new Date(Date.UTC(y, mo - 1, d));
}

export function utcDateFromIsoDateOnly(iso: string): Date | null {
  const p = parseLeadingIsoDate(iso);
  if (!p) return null;
  const [y, mo, d] = p.split('-').map((x) => Number.parseInt(x, 10));
  return new Date(Date.UTC(y, mo - 1, d));
}

export function ageYearsCeilFromBirthIso(birthIso: string | null | undefined, refUtcDate: Date): number | null {
  const birth = parseLeadingIsoDate(birthIso ?? '');
  if (!birth) return null;
  const b = utcDateFromIsoDateOnly(birth);
  if (!b || Number.isNaN(b.getTime())) return null;
  const r = new Date(Date.UTC(refUtcDate.getUTCFullYear(), refUtcDate.getUTCMonth(), refUtcDate.getUTCDate()));
  if (Number.isNaN(r.getTime())) return null;
  const diff = r.getTime() - b.getTime();
  if (diff < 0) return null;
  if (diff === 0) return 0;
  return Math.ceil(diff / MS_PER_AVG_YEAR);
}
