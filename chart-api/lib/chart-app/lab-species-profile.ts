import type { LabCanonicalizeSpecies } from '@/lib/chart-app/lab-item-normalize';

/** vet-report `detectSpeciesProfile` 와 동일 — result_basic_info.species 문자열용 */
export function speciesProfileFromBasicSpecies(raw: string | null | undefined): LabCanonicalizeSpecies {
  const t = (raw ?? '').toLowerCase();
  if (t.includes('cat') || t.includes('feline') || t.includes('고양') || t.includes('묘')) return 'cat';
  return 'dog';
}
