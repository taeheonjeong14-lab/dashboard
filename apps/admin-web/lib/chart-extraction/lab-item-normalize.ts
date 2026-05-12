type CanonicalRule = {
  canonical: string;
  pattern: RegExp;
};

const PRIORITY_RULES: CanonicalRule[] = [
  { canonical: '%RETIC', pattern: /(?:^|[^A-Z])%+\s*RETIC(?:[^A-Z]|$)/i },
  { canonical: 'RETIC', pattern: /(?:^|[^A-Z])RETIC(?:[^A-Z]|$)/i },
  { canonical: 'ALB/GLOB', pattern: /ALBUMIN\s*\/\s*GLOBULIN/i },
  { canonical: 'ALB/GLOB', pattern: /ALB\s*\/\s*GLOB(?:ULIN)?/i },
  { canonical: 'BUN/CREA', pattern: /BUN\s*\/\s*CREA/i },
  { canonical: 'NA/K', pattern: /NA\s*\/\s*K/i },
  { canonical: 'D-dimer', pattern: /D[\s-]*DIMER/i },
];

const DIRECT_ALIASES: Record<string, string> = {
  ALKP: 'ALP',
  CI: 'CL',
  CAI: 'ICA',
  TG: 'TRIG',
  APTT: 'aPTT',
  CCRP: 'CRP',
  FSAA: 'SAA',
  HEMOGLOBIN: 'HGB',
  HEMATOCRIT: 'HCT',
  PLATELETS: 'PLT',
  PLATLETS: 'PLT',
  LYMPHS: 'LYM',
  MONOS: 'MONO',
  AMY: 'AMYL',
  POTASSIUM: 'K',
  CHLORIDE: 'CL',
  CPL: 'cPL',
  FPL: 'fPL',
  ANIONGAP: 'AG',
  TT4: 'T4',
  BILTOTAL: 'TBIL',
};

function normalizeToken(raw: string): string {
  return raw
    .trim()
    .toUpperCase()
    .replace(/\(.*?\)/g, '')
    .replace(/[^\p{L}\p{N}/%]+/gu, '');
}

function pancreaticLipaseImmunoCanonical(
  normalized: string,
  species: LabCanonicalizeSpecies,
): string | null {
  if (
    normalized === 'PANCREATICLIPASE' ||
    normalized.startsWith('PANCREATICLIPASE') ||
    normalized === 'PLI' ||
    normalized === 'CPLI' ||
    normalized === 'FPLI'
  ) {
    return species === 'cat' ? 'fPL' : 'cPL';
  }
  return null;
}

export type LabCanonicalizeSpecies = 'dog' | 'cat';

export function canonicalizeLabItemName(
  rawName: string,
  species?: LabCanonicalizeSpecies | null,
): string {
  const raw = rawName.trim();
  if (!raw) return '';

  for (const rule of PRIORITY_RULES) {
    if (rule.pattern.test(raw)) return rule.canonical;
  }

  const normalized = normalizeToken(raw);
  const out = DIRECT_ALIASES[normalized] ?? normalized;

  if (species) {
    const pl = pancreaticLipaseImmunoCanonical(normalized, species);
    if (pl) return pl;
  }
  if (out === 'PL' && species) return species === 'cat' ? 'fPL' : 'cPL';
  return out;
}

