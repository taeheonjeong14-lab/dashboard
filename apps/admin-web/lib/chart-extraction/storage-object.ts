import { createServiceRoleClient } from '@/lib/supabase/service-role';

export async function downloadStorageObject(params: { bucket: string; path: string }): Promise<Buffer> {
  const supabase = createServiceRoleClient();
  const { data, error } = await supabase.storage.from(params.bucket).download(params.path);
  if (error || !data) {
    throw new Error(error?.message || 'Storage download failed');
  }
  const ab = await data.arrayBuffer();
  return Buffer.from(ab);
}

