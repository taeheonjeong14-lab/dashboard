import type { HealthSystemsReportBlock } from '@/lib/chart-app/health-systems-demo-blocks';
import { signCaseImageStoragePaths } from '@/lib/chart-app/image-case-signing';

function collectStoragePaths(blocks: HealthSystemsReportBlock[]): string[] {
  const paths: string[] = [];
  for (const b of blocks) {
    if (b.variant === 'images' || b.variant === 'images4' || b.variant === 'imagesGrid2x3' || b.variant === 'imagesGrid3x3') {
      for (const slot of b.images) {
        if (slot.src && !slot.src.startsWith('http') && !slot.src.startsWith('blob:')) {
          paths.push(slot.src);
        }
      }
    }
  }
  return paths;
}

export async function signImageSlotsInBlocks(blocks: HealthSystemsReportBlock[]): Promise<void> {
  const paths = collectStoragePaths(blocks);
  if (paths.length === 0) return;
  const signed = await signCaseImageStoragePaths(paths);
  for (const b of blocks) {
    if (b.variant === 'images' || b.variant === 'images4' || b.variant === 'imagesGrid2x3' || b.variant === 'imagesGrid3x3') {
      for (const slot of b.images) {
        if (slot.src && !slot.src.startsWith('http') && !slot.src.startsWith('blob:')) {
          const url = signed.get(slot.src);
          if (url) slot.src = url;
        }
      }
    }
  }
}

