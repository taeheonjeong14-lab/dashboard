import type { ExamType, RadiologySub } from '@/lib/chart-app/image-case-types';
import { EXAM_TYPE_LABEL_KO, RADIOLOGY_SUB_LABEL_KO } from '@/lib/chart-app/image-case-types';

export type SimpleCaptionInput = {
  examType: ExamType;
  radiologySub: RadiologySub | null;
  briefComment: string;
};

function inferBodyRegionFromBriefComment(briefComment: string): string | null {
  const t = briefComment.trim().toLowerCase();
  if (!t) return null;
  const rules: Array<{ region: string; pattern: RegExp }> = [
    { region: '흉부', pattern: /(흉부|흉강|폐|심장|thorax|chest|lung|cardiac)/i },
    { region: '복부', pattern: /(복부|간|담낭|비장|췌장|신장|방광|abdomen|abdominal|liver|kidney|bladder)/i },
    { region: '관절', pattern: /(관절|슬개골|고관절|척추|joint|stifle|hip|spine)/i },
    { region: '치아', pattern: /(치아|치과|구강|잇몸|dental|tooth|teeth|oral|gingiva)/i },
    { region: '안구', pattern: /(안구|안과|각막|결막|눈|ocular|eye|cornea)/i },
    { region: '피부', pattern: /(피부|외이도|귀|병변|탈모|derm|skin|ear|lesion)/i },
  ];
  for (const rule of rules) {
    if (rule.pattern.test(t)) return rule.region;
  }
  return null;
}

export function simpleHealthReportImageCaption(input: SimpleCaptionInput): string {
  const examKo = EXAM_TYPE_LABEL_KO[input.examType] ?? input.examType;
  const inferredRegion = inferBodyRegionFromBriefComment(input.briefComment);
  if (input.examType === 'radiology' && input.radiologySub) {
    const subKo = RADIOLOGY_SUB_LABEL_KO[input.radiologySub] ?? input.radiologySub;
    return `${subKo} ${examKo}`;
  }
  if (input.examType === 'ultrasound') {
    return inferredRegion ? `${inferredRegion} ${examKo}` : examKo;
  }
  if (input.examType === 'other') {
    return inferredRegion ?? '사진';
  }
  return examKo;
}
