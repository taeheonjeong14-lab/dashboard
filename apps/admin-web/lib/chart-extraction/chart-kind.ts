export type ChartKind = 'intovet' | 'plusvet' | 'other' | 'efriends';

export function parseChartKind(raw: unknown): ChartKind | null {
  if (raw === 'plusvet' || raw === 'other' || raw === 'intovet' || raw === 'efriends') return raw;
  return null;
}

