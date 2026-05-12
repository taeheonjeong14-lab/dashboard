export function getPdfUploadsBucket(): string {
  const name = process.env.SUPABASE_PDF_UPLOADS_BUCKET?.trim();
  return name || 'pdf-uploads';
}

export function getCaseImageBucket(): string {
  const name = process.env.SUPABASE_IMAGE_CASE_BUCKET?.trim();
  return name || 'case-image';
}

