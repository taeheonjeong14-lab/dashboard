/** vet-report `lib/lab-item-normalize.ts` 와 동기화 — PATCH extraction lab canonical 용 */

type CanonicalRule = {
  canonical: string;
  pattern: RegExp;
};

const PRIORITY_RULES: CanonicalRule[] = [
  { canonical: '%RETIC', pattern: /(?:^|[^A-Z])%+\s*RETIC(?:[^A-Z]|$)/i },
  { canonical: 'RETIC', pattern: /(?:^|[^A-Z])RETIC(?:[^A-Z]|$)/i },
  { canonical: 'ALB/GLOB', pattern: /ALBUMIN\s*\/\s*GLOBULIN/i },
  { canonical: 'ALB/GLOB', pattern: /ALB\s*\/\s*GLOB(?:ULIN)?/i },
  { canonical: 'ALB/GLOB', pattern: /ALB\s*\/\s*GL\b/i },
  { canonical: 'ALB/GLOB', pattern: /(?:^|[^A-Z0-9%])A\s*\/\s*G(?:\b|\s*(?:R|ratio|비))/i },
  { canonical: 'BUN/CREA', pattern: /BUN\s*\/\s*CREA/i },
  { canonical: 'BUN/CREA', pattern: /BUN\s*\/\s*CR\b/i },
  { canonical: 'BUN/CREA', pattern: /(?:^|[^A-Z0-9])B\s*\/\s*C(?:\b|\s*(?:R|ratio|비))/i },
  { canonical: 'NA/K', pattern: /NA\s*\/\s*K/i },
  { canonical: 'D-dimer', pattern: /D[\s-]*DIMER/i },
];

const DIRECT_ALIASES: Record<string, string> = {
  RBCIDEXX: 'RBC',
  HCTIDEXX: 'HCT',
  HGBIDEXX: 'HGB',
  MCVIDEXX: 'MCV',
  MCHIDEXX: 'MCH',
  MCHCIDEXX: 'MCHC',
  RDWIDEXX: 'RDW',
  WBCIDEXX: 'WBC',
  NEUIDEXX: 'NEU',
  LYMIDEXX: 'LYM',
  MONOIDEXX: 'MONO',
  EOSIDEXX: 'EOS',
  BASOIDEXX: 'BASO',
  NEUPERCENTIDEXX: '%NEU',
  LYMPERCENTIDEXX: '%LYM',
  MONOPERCENTIDEXX: '%MONO',
  EOSPERCENTIDEXX: '%EOS',
  BASOPERCENTIDEXX: '%BASO',
  'NEU%': '%NEU',
  'LYM%': '%LYM',
  'MONO%': '%MONO',
  'EOS%': '%EOS',
  'BASO%': '%BASO',
  RETICPERCENTIDEXX: '%RETIC',
  ALBGLOB: 'ALB/GLOB',
  ALBGL: 'ALB/GLOB',
  BUNCREA: 'BUN/CREA',
  BUNCR: 'BUN/CREA',
  ALKP: 'ALP',
  NAK: 'NA/K',
  CI: 'CL',
  CAI: 'ICA',
  HEARTWORMAG: 'HWAG',
  FIBRINOGEN: 'FIB',
  DDIMER: 'D-dimer',
  TG: 'TRIG',
  APTT: 'aPTT',
  ATIII: 'AT III',
  PLATELETFUNC: 'Platelet func',
  OSMCA: 'OSM CA',
  CCRP: 'CRP',
  FSAA: 'SAA',
  혈액CRP: 'CRP',
  HEMOGLOBIN: 'HGB',
  HEMATOCRIT: 'HCT',
  PLATELETS: 'PLT',
  PLATLETS: 'PLT',
  LYMPHS: 'LYM',
  MONOS: 'MONO',
  AMY: 'AMYL',
  POTASSIUM: 'K',
  CHLORIDE: 'CL',
  BLOODSMEAR: 'Blood smear',
  CPL: 'cPL',
  FPL: 'fPL',
  ANIONGAP: 'AG',
  TT4: 'T4',
  BILTOTAL: 'TBIL',
  PDWCV: 'PDW',
  RDWCV: 'RDW',
  RDWSD: 'RDW-SD',
  RETHE: 'RET-He',
  PLTLCR: 'PLT-LCR',
  WBCBASO: 'BASO',
  'WBCBASO%': '%BASO',
  WBCEOS: 'EOS',
  'WBCEOS%': '%EOS',
  WBCLYM: 'LYM',
  'WBCLYM%': '%LYM',
  WBCMONO: 'MONO',
  'WBCMONO%': '%MONO',
  WBCNEU: 'NEU',
  'WBCNEU%': '%NEU',
  PROBNP: 'proBNP',
  NTPROBNP: 'proBNP',
  INS: 'INSULIN',
  PROG: 'PROGESTERONE',
  EST: 'E2',
  TEST: 'TESTOSTERONE',
  FELVAG: 'FELV',
  FIVAB: 'FIV',
  FCOVAB: 'FCoV Ab',
  FIPPCR: 'FIP PCR',
  TOXO: 'Toxo',
  CORONAVIRUS: 'Coronavirus',
  EHRLICHIA: 'Ehrlichia',
  ANAPLASMA: 'Anaplasma',
  BABESIA: 'Babesia',
  LYME: 'Lyme',
  LEPTO: 'Lepto',
  DISTEMPER: 'CDV',
  PH: 'pH',
  PCO2: 'pCO2',
  PO2: 'pO2',
  TCO2: 'tCO2',
  LACTATE: 'Lactate',
  LAC: 'Lactate',
  COOMBS: 'Coombs',
  IGG: 'IgG',
  IGM: 'IgM',
  IGA: 'IgA',
  FOLATE: 'Folate',
  FOLICACID: 'Folate',
  VITAMINB12: 'B12',
  VITB12: 'B12',
  VB12: 'B12',
  COBALAMIN: 'B12',
  HISTAMINE: 'Histamine',
  TRYPTASE: 'Tryptase',
  PTHRP: 'PTHrP',
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
    normalized === 'FPLI' ||
    normalized === 'SPECPL' ||
    normalized === 'SPECCPL' ||
    normalized === 'SPECFPL'
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

  if (out === 'PL' && species) {
    return species === 'cat' ? 'fPL' : 'cPL';
  }

  return out;
}
