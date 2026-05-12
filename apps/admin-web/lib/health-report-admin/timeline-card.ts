const DEFAULT_RECHECK_TITLE = '재검 권장';
const DEFAULT_RECHECK_BODY = '재검 일정을 확인해 주시기 바랍니다.';

export function joinTimelineCardText(cardTitle: string, cardBody: string): string {
  const rawTitle = (cardTitle ?? '').trim();
  const rawBody = (cardBody ?? '').trim();
  const title = rawTitle || DEFAULT_RECHECK_TITLE;
  const body = rawBody || DEFAULT_RECHECK_BODY;
  return `${title}\n${body}`;
}

export function splitTimelineCardText(raw: string): { cardTitle: string; cardBody: string } {
  const s = (raw ?? '').trim();
  if (!s) return { cardTitle: '', cardBody: '' };
  const nl = s.indexOf('\n');
  if (nl === -1) return { cardTitle: '', cardBody: s };
  return { cardTitle: s.slice(0, nl).trim(), cardBody: s.slice(nl + 1).trim() };
}
