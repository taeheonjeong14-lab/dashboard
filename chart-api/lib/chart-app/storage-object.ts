import { getChartAppSupabaseService } from '@/lib/chart-app/supabase-service';

export async function downloadStorageObject(params: { bucket: string; path: string }): Promise<Buffer> {
  const supabase = getChartAppSupabaseService();
  const { data, error } = await supabase.storage.from(params.bucket).download(params.path);
  if (error || !data) {
    throw new Error(error?.message || 'Storage download failed');
  }
  const ab = await data.arrayBuffer();
  return Buffer.from(ab);
}
