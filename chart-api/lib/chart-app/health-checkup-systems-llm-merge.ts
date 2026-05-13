import type { HealthSystemsReportBlock } from '@/lib/chart-app/health-systems-demo-blocks';
import {
  DEMO_HEALTH_DENTAL_SKIN_BLOCKS,
  DEMO_HEALTH_SYSTEMS_BLOCKS,
  DEMO_HEALTH_SYSTEMS_PAGE_B_BLOCKS,
  DEMO_RADIOLOGY_ULTRASOUND_BLOCKS,
} from '@/lib/chart-app/health-systems-demo-blocks';

/** vet-report와 동일 */
export const HEALTH_CHECKUP_SYSTEMS_P34_ROW_MAX_CHARS = 320;
export const HEALTH_CHECKUP_SYSTEMS_P4_DENTAL_SKIN_ROW_MAX_CHARS = 280;
export const HEALTH_CHECKUP_SYSTEMS_P5_ROW_MAX_CHARS = 250;

function clamp(s: unknown, max: number): string {
  const t = typeof s === 'string' ? s.trim() : '';
  return t.length <= max ? t : t.slice(0, max);
}

function cloneBlocks(blocks: readonly HealthSystemsReportBlock[]): HealthSystemsReportBlock[] {
  return structuredClone(blocks) as HealthSystemsReportBlock[];
}

function setRowContent(
  blocks: HealthSystemsReportBlock[],
  blockIndex: number,
  rowIndex: number,
  content: string,
): void {
  const b = blocks[blockIndex];
  if (b?.variant === 'rows' && b.rows[rowIndex]) {
    b.rows[rowIndex].content = content;
  }
}

function joinLegacyDxImp(dx: unknown, imp: unknown, max: number): string {
  const a = typeof dx === 'string' ? dx.trim() : '';
  const b = typeof imp === 'string' ? imp.trim() : '';
  if (a && b) {
    const joined = `${a}\n\n${b}`;
    return joined.length <= max ? joined : joined.slice(0, max);
  }
  return clamp(a || b, max);
}

function coalesceMergedDxImp(merged: unknown, legacyRenal: unknown, legacyUro: unknown, max: number): string {
  const primary = clamp(merged, max);
  if (primary) return primary;
  const a = typeof legacyRenal === 'string' ? legacyRenal.trim() : '';
  const b = typeof legacyUro === 'string' ? legacyUro.trim() : '';
  if (a && b) {
    const joined = `${a} ${b}`;
    return joined.length <= max ? joined : joined.slice(0, max);
  }
  return clamp(a || b, max);
}

export const HEALTH_CHECKUP_SYSTEMS_LLM_FIELD_KEYS = [
  'hp3_circ_dx',
  'hp3_circ_imp',
  'hp3_digest_dx',
  'hp3_digest_imp',
  'hp3_endo_dx',
  'hp3_endo_imp',
  'hp3_renal_uro_dx',
  'hp3_renal_uro_imp',
  'hp3_hepatobiliary_dx',
  'hp3_hepatobiliary_imp',
  'hp3_msk_dx',
  'hp3_msk_imp',
  'hp4_dental_dx',
  'hp4_dental_imp',
  'hp4_skin_dx',
  'hp4_skin_imp',
  'hp5_rad_interp',
  'hp5_us_interp',
] as const;

/**
 * vet-report와 동일: 데모 블록 클론 후 행 content만 LLM 문자열로 채움.
 * 블록 메타(titleKo/titleEn/이미지 슬롯 구조)는 데모 그대로 유지.
 */
export function mergeHealthSystemsDemosWithLlmFields(o: Record<string, unknown>): {
  systemsPage3Blocks: HealthSystemsReportBlock[];
  systemsPage3bBlocks: HealthSystemsReportBlock[];
  systemsPage4Blocks: HealthSystemsReportBlock[];
  systemsPage5Blocks: HealthSystemsReportBlock[];
} {
  const m3 = HEALTH_CHECKUP_SYSTEMS_P34_ROW_MAX_CHARS;
  const m4 = HEALTH_CHECKUP_SYSTEMS_P4_DENTAL_SKIN_ROW_MAX_CHARS;
  const m5 = HEALTH_CHECKUP_SYSTEMS_P5_ROW_MAX_CHARS;

  const p3a = cloneBlocks(DEMO_HEALTH_SYSTEMS_BLOCKS);
  setRowContent(p3a, 0, 0, clamp(o.hp3_circ_dx, m3));
  setRowContent(p3a, 0, 1, clamp(o.hp3_circ_imp, m3));
  setRowContent(p3a, 1, 0, clamp(o.hp3_digest_dx, m3));
  setRowContent(p3a, 1, 1, clamp(o.hp3_digest_imp, m3));
  setRowContent(p3a, 2, 0, clamp(o.hp3_endo_dx, m3));
  setRowContent(p3a, 2, 1, clamp(o.hp3_endo_imp, m3));

  const renalUroDx = coalesceMergedDxImp(o.hp3_renal_uro_dx, o.hp3_renal_dx, o.hp3_uro_dx, m3);
  const renalUroImp = coalesceMergedDxImp(o.hp3_renal_uro_imp, o.hp3_renal_imp, o.hp3_uro_imp, m3);

  const p3b = cloneBlocks(DEMO_HEALTH_SYSTEMS_PAGE_B_BLOCKS);
  setRowContent(p3b, 0, 0, renalUroDx);
  setRowContent(p3b, 0, 1, renalUroImp);
  setRowContent(p3b, 1, 0, clamp(o.hp3_hepatobiliary_dx, m3));
  setRowContent(p3b, 1, 1, clamp(o.hp3_hepatobiliary_imp, m3));
  setRowContent(p3b, 2, 0, clamp(o.hp3_msk_dx, m3));
  setRowContent(p3b, 2, 1, clamp(o.hp3_msk_imp, m3));

  const p4 = cloneBlocks(DEMO_HEALTH_DENTAL_SKIN_BLOCKS);
  setRowContent(p4, 0, 0, clamp(o.hp4_dental_dx, m4));
  setRowContent(p4, 0, 1, clamp(o.hp4_dental_imp, m4));
  setRowContent(p4, 2, 0, clamp(o.hp4_skin_dx, m4));
  setRowContent(p4, 2, 1, clamp(o.hp4_skin_imp, m4));

  const p5 = cloneBlocks(DEMO_RADIOLOGY_ULTRASOUND_BLOCKS);
  const radInterp = clamp(o.hp5_rad_interp, m5) || joinLegacyDxImp(o.hp5_rad_dx, o.hp5_rad_imp, m5);
  const usInterp = clamp(o.hp5_us_interp, m5) || joinLegacyDxImp(o.hp5_us_dx, o.hp5_us_imp, m5);
  setRowContent(p5, 0, 0, radInterp);
  setRowContent(p5, 2, 0, usInterp);

  return {
    systemsPage3Blocks: p3a,
    systemsPage3bBlocks: p3b,
    systemsPage4Blocks: p4,
    systemsPage5Blocks: p5,
  };
}
