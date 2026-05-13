const DEFAULT_RECHECK_TITLE = '재검 권장';
const DEFAULT_RECHECK_BODY = '재검 일정을 확인해 주시기 바랍니다.';

export function joinTimelineCardText(cardTitle: string, cardBody: string): string {
  const rawTitle = (cardTitle ?? '').trim();
  const rawBody = (cardBody ?? '').trim();
  const title = rawTitle || DEFAULT_RECHECK_TITLE;
  const body = rawBody || DEFAULT_RECHECK_BODY;
  return `${title}\n${body}`;
}
