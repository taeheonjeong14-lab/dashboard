import type { LabCanonicalizeSpecies } from '@/lib/chart-extraction/lab-item-normalize';

export function speciesProfileFromBasicSpecies(raw: string | null | undefined): LabCanonicalizeSpecies {
  const t = (raw ?? '').toLowerCase();
  if (t.includes('cat') || t.includes('feline') || t.includes('고양') || t.includes('묘')) return 'cat';
  return 'dog';
}

