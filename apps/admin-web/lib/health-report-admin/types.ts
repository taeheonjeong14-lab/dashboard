/** chart-api `HealthCheckupGeneratedContent` 와 동일 계약(저장 JSON). */
export type HealthCheckupGeneratedContent = {
  overallSummary: string;
  followUpCare: string;
  recheckWithin1to2Weeks: string;
  recheckWithin1Month: string;
  recheckWithin3Months: string;
  recheckWithin6Months: string;
  coverCheckupDate?: string;
  coverProgram?: string;
  coverVeterinarian?: string;
  coverPatientName?: string;
  coverPatientSpecies?: string;
  coverPatientBreed?: string;
  coverPatientSex?: string;
  coverPatientAge?: string;
  coverPatientWeight?: string;
  coverOwnerName?: string;
  systemsPage3Blocks?: unknown;
  systemsPage3bBlocks?: unknown;
  systemsPage4Blocks?: unknown;
  systemsPage5Blocks?: unknown;
  labInterpretation?: string;
};

export type GeneratedContentListItem = {
  id: string;
  parseRunId: string;
  contentType: string;
  updatedAt: string;
  createdAt: string;
  friendlyId: string | null;
  patientName: string | null;
  hospitalName: string | null;
  parseRunCreatedAt: string | null;
};
