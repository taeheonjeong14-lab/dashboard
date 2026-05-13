import type { HospitalRow } from '@/lib/chart-app/hospitals-types';
import { reportThemeTokensFromBrandHex } from '@/lib/chart-app/color-tokens';

export const DODAM_REPORT_A4_TOKEN_OVERRIDES: Record<string, string> = {
  '--report-a4-sage': '#8ba888',
  '--report-a4-sage-mid': '#7a9a77',
  '--report-a4-sage-soft': '#c5d4c3',
  '--report-a4-green': '#2f5d4a',
  '--report-a4-green-soft': '#3d6b52',
  '--report-a4-line-strong': '#5a6b5d',
};

export type HospitalReportTemplate = {
  logoSrc?: string;
  sealSrc?: string;
  tokenOverrides?: Record<string, string>;
};

function hospitalMatchesDodamAssets(h: HospitalRow | null): boolean {
  if (!h) return false;
  const slug = h.slug?.trim().toLowerCase() ?? '';
  const code = (h.code ?? '').trim().toLowerCase();
  const ko = h.name_ko ?? '';
  const en = h.name_en?.trim().toLowerCase() ?? '';
  if (slug.includes('dodam') || code.includes('dodam')) return true;
  if (ko.includes('도담')) return true;
  if (en.includes('dodam')) return true;
  return false;
}

function dodamFallbackAssets(): Pick<HospitalReportTemplate, 'logoSrc' | 'sealSrc'> {
  return {
    logoSrc: '/dodam_logo.png',
    sealSrc: '/dodam_seal.png',
  };
}

function brandDerivedTokens(hospital: HospitalRow | null): Record<string, string> {
  const raw = hospital?.brand_color_hex?.trim() ?? '';
  if (!raw) return {};
  return reportThemeTokensFromBrandHex(raw) ?? {};
}

export function resolveHospitalReportTemplate(hospital: HospitalRow | null): HospitalReportTemplate {
  const fromBrand = brandDerivedTokens(hospital);
  const isDodam = hospitalMatchesDodamAssets(hospital);
  const fallback = isDodam ? dodamFallbackAssets() : {};

  const tokenOverrides = isDodam
    ? { ...DODAM_REPORT_A4_TOKEN_OVERRIDES, ...fromBrand }
    : Object.keys(fromBrand).length > 0
      ? fromBrand
      : undefined;

  return {
    logoSrc: hospital?.logo_url ?? fallback.logoSrc,
    sealSrc: hospital?.seal_url ?? fallback.sealSrc,
    ...(tokenOverrides ? { tokenOverrides } : {}),
  };
}

