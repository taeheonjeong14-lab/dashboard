import type { HealthSystemsReportBlock } from '@/lib/chart-app/health-systems-demo-blocks';
import type { ImagePlacementResult, PlacementSlot } from '@/lib/chart-app/health-report-image-placement-llm';

function fillSlots(
  slots: (PlacementSlot | null)[],
  storagePathById: Map<string, string>,
  count: number,
): { src?: string; caption?: string }[] {
  const result: { src?: string; caption?: string }[] = [];
  for (let i = 0; i < count; i++) {
    const s = slots[i];
    if (s && s.imageId) {
      const path = storagePathById.get(s.imageId);
      if (path) {
        result.push({ src: path, caption: s.caption || undefined });
      } else {
        result.push({});
      }
    } else {
      result.push({ caption: undefined });
    }
  }
  return result;
}

export function applyImagePlacementToBlocks(
  page4Blocks: HealthSystemsReportBlock[],
  page5Blocks: HealthSystemsReportBlock[],
  placement: ImagePlacementResult,
  storagePathById: Map<string, string>,
): void {
  const dentalSlots = fillSlots(placement.dentalOphthalmology, storagePathById, 6);
  const skinSlots = fillSlots(placement.skinEar, storagePathById, 3);
  const radSlots = fillSlots(placement.radiology, storagePathById, 4);
  const usSlots = fillSlots(placement.ultrasound, storagePathById, 6);

  const p4ImgBlock1 = page4Blocks[1];
  if (p4ImgBlock1?.variant === 'images' || p4ImgBlock1?.variant === 'imagesGrid2x3') {
    const slotCount = p4ImgBlock1.images.length;
    for (let i = 0; i < slotCount; i++) {
      const slot = p4ImgBlock1.images[i];
      if (slot) {
        slot.src = dentalSlots[i]?.src;
        slot.caption = dentalSlots[i]?.caption;
      }
    }
  }

  const p4ImgBlock3 = page4Blocks[3];
  if (p4ImgBlock3?.variant === 'images') {
    for (let i = 0; i < 3; i++) {
      const slot = p4ImgBlock3.images[i];
      if (slot) {
        slot.src = skinSlots[i]?.src;
        slot.caption = skinSlots[i]?.caption;
      }
    }
  }

  const p5ImgBlock1 = page5Blocks[1];
  if (p5ImgBlock1?.variant === 'images4') {
    for (let i = 0; i < 4; i++) {
      const slot = p5ImgBlock1.images[i];
      if (slot) {
        slot.src = radSlots[i]?.src;
        slot.caption = radSlots[i]?.caption;
      }
    }
  }

  const p5ImgBlock3 = page5Blocks[3];
  if (p5ImgBlock3?.variant === 'imagesGrid2x3' || p5ImgBlock3?.variant === 'imagesGrid3x3') {
    const slotCount = p5ImgBlock3.images.length;
    for (let i = 0; i < slotCount; i++) {
      const slot = p5ImgBlock3.images[i];
      if (slot) {
        slot.src = usSlots[i]?.src;
        slot.caption = usSlots[i]?.caption;
      }
    }
  }
}
