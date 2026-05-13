const KST_TIME_ZONE = 'Asia/Seoul';
const DAY_MS = 24 * 60 * 60 * 1000;
const YEAR_DAYS = 365.2425;

function getKstYmd(date: Date): { year: number; month: number; day: number } {
  const parts = new Intl.DateTimeFormat('en-CA', {
    timeZone: KST_TIME_ZONE,
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
  }).formatToParts(date);

  const year = Number(parts.find((p) => p.type === 'year')?.value ?? '0');
  const month = Number(parts.find((p) => p.type === 'month')?.value ?? '0');
  const day = Number(parts.find((p) => p.type === 'day')?.value ?? '0');
  return { year, month, day };
}

function toUtcMidnightFromKstDate(date: Date): number {
  const { year, month, day } = getKstYmd(date);
  return Date.UTC(year, month - 1, day);
}

export function calculatePetAgeCeilFromBirthday(birthday: Date, now: Date = new Date()): number | null {
  const diffMs = toUtcMidnightFromKstDate(now) - toUtcMidnightFromKstDate(birthday);
  if (!Number.isFinite(diffMs) || diffMs < 0) return null;
  const diffDays = diffMs / DAY_MS;
  return Math.ceil(diffDays / YEAR_DAYS);
}

export function tryParseBirthDate(birth: string): Date | null {
  const s = birth.trim();
  if (!s) return null;
  const d = new Date(s);
  if (!Number.isNaN(d.getTime())) return d;
  const m = /^(\d{4})[.\-/](\d{1,2})[.\-/](\d{1,2})/.exec(s);
  if (m) {
    const dd = new Date(Number(m[1]), Number(m[2]) - 1, Number(m[3]));
    if (!Number.isNaN(dd.getTime())) return dd;
  }
  return null;
}
