export const HOSPITAL_ASSETS_BUCKET = "hospital-assets";

export const PDF_UPLOAD_BUCKET = "pdf-uploads";

export function caseImageBucket(): string {
  return process.env.SUPABASE_IMAGE_CASE_BUCKET?.trim() || "case-image";
}
