/** vet-report style UUID check (case-insensitive). */
const RUN_ID_RE =
  /^[0-9a-f]{8}-[0-9a-f]{4}-[1-8][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i;

export function isParseRunUuid(value: string | undefined | null): boolean {
  if (!value || typeof value !== 'string') return false;
  return RUN_ID_RE.test(value.trim());
}
