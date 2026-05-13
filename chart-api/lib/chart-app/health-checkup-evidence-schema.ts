export const HEALTH_CHECKUP_EVIDENCE_SECTION_KEYS = [
  'hp3_circ',
  'hp3_digest',
  'hp3_endo',
  'hp3_renal_uro',
  'hp3_hepatobiliary',
  'hp3_msk',
  'hp4_dental',
  'hp4_skin',
  'hp5_rad',
  'hp5_us',
  'lab_overall',
] as const;

export type HealthCheckupEvidenceSectionKey = (typeof HEALTH_CHECKUP_EVIDENCE_SECTION_KEYS)[number];

export type HealthCheckupEvidence = {
  schemaVersion: 'evidence.v1';
  meta: { runId: string; checkupDate: string; generatedAt: string };
  globalAssessment: {
    overallRisk: 'high' | 'moderate' | 'low' | 'undetermined';
    dataQuality: 'high' | 'medium' | 'low';
    notes: string[];
  };
  sections: Array<{
    sectionKey: HealthCheckupEvidenceSectionKey;
    status: 'supported' | 'limited' | 'none';
    fixedPhraseEligible: boolean;
    claims: Array<{
      claimId: string;
      priority: number;
      claimType: 'abnormal' | 'normal' | 'monitoring' | 'recommendation_basis';
      summary: string;
      clinicalMeaning: string;
      certainty: 'high' | 'medium' | 'low';
      evidenceSufficiency: 'sufficient' | 'limited' | 'none';
      timeRelevance: 'same_day' | 'nearby' | 'historical';
      supports: Array<{
        sourceType: 'lab' | 'chart' | 'image' | 'physical_exam' | 'vaccination';
        sourceId: string;
        dateTime: string;
        item: string;
        value: string;
        unit: string;
        refRange: string;
        flag: 'H' | 'L' | 'N' | 'unknown';
        snippet: string;
      }>;
      conflicts?: Array<{ sourceId: string; reason: string }>;
      recommendedActions?: Array<{
        window: '1to2weeks' | '1month' | '3months' | '6months';
        titleHint: string;
        bodyHint: string;
      }>;
    }>;
    noneReason?: 'no_data' | 'not_included_program' | 'no_direct_evidence' | 'date_mismatch';
  }>;
  mustIncludeCoverage?: Array<{
    requirement: string;
    covered: boolean;
    coveredByClaimIds: string[];
  }>;
  consistencyChecks?: {
    crossSectionConflicts?: string[];
    dateFilterViolations?: string[];
  };
};

export function validateHealthCheckupEvidenceV1(input: unknown): { ok: true; value: HealthCheckupEvidence } | { ok: false; error: string } {
  if (!input || typeof input !== 'object') return { ok: false, error: 'evidence must be an object' };
  const obj = input as Record<string, unknown>;
  if (obj.schemaVersion !== 'evidence.v1') return { ok: false, error: 'schemaVersion must be evidence.v1' };
  if (!Array.isArray(obj.sections)) return { ok: false, error: 'sections must be an array' };

  const keys = new Set<string>();
  for (const s of obj.sections as Array<Record<string, unknown>>) {
    const key = String(s.sectionKey ?? '');
    if (!HEALTH_CHECKUP_EVIDENCE_SECTION_KEYS.includes(key as HealthCheckupEvidenceSectionKey)) {
      return { ok: false, error: `invalid sectionKey: ${key}` };
    }
    keys.add(key);
  }
  for (const key of HEALTH_CHECKUP_EVIDENCE_SECTION_KEYS) {
    if (!keys.has(key)) return { ok: false, error: `missing sectionKey: ${key}` };
  }

  return { ok: true, value: obj as HealthCheckupEvidence };
}
