export const EXAM_TYPE_LABEL_KO = {
  radiology: '방사선',
  ultrasound: '초음파',
  microscopy: '현미경',
  endoscopy: '검이경',
  slit_lamp: '슬릿램프',
  other: '그 외',
} as const;

export const RADIOLOGY_SUB_LABEL_KO = {
  thorax: '흉부',
  abdomen: '복부',
  joint: '관절',
  dental: '치아',
} as const;

export type ExamType = keyof typeof EXAM_TYPE_LABEL_KO;
export type RadiologySub = keyof typeof RADIOLOGY_SUB_LABEL_KO;
