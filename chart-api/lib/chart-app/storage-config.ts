/** Supabase Storage — 버킷명·케이스 이미지 튜닝 (파트너 이관 문서 §4.2, §4.7 정합). */

/** PDF 업로드(text-bucketing 등). Supabase 대시보드에서 버킷 생성 필요. */
export function getPdfUploadsBucket(): string {
  const name = process.env.SUPABASE_PDF_UPLOADS_BUCKET?.trim();
  return name || 'pdf-uploads';
}

export function getCaseImageBucket(): string {
  const name = process.env.SUPABASE_IMAGE_CASE_BUCKET?.trim();
  return name || 'case-image';
}

/** 최대 변 길이(px), inside 리사이즈. 기본 2048 (파트너 문서). */
export function getImageCaseMaxEdge(): number {
  const raw = process.env.IMAGE_CASE_MAX_EDGE?.trim();
  if (!raw) return 2048;
  const v = Number.parseInt(raw, 10);
  if (!Number.isFinite(v) || v <= 0) return 2048;
  return Math.min(v, 8192);
}

/** WebP 품질 1–100. 기본 82 (파트너 문서). */
export function getImageCaseWebpQuality(): number {
  const raw = process.env.IMAGE_CASE_WEBP_QUALITY?.trim();
  if (!raw) return 82;
  const v = Number.parseInt(raw, 10);
  if (!Number.isFinite(v) || v < 1 || v > 100) return 82;
  return v;
}
