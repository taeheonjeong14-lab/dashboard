/** Mirrors chart-api `health-systems-demo-blocks` discriminated unions for payload + parser parity. */

export type HealthSystemsImageSlot = {
  src?: string;
  alt?: string;
  caption?: string;
  rotationDeg?: number;
};

export type HealthSystemsReportBlock =
  | {
      variant: 'rows';
      titleKo: string;
      titleEn: string;
      rows: Array<{ label: string; content: string }>;
      compact?: boolean;
    }
  | {
      variant: 'images';
      titleKo: string;
      titleEn: string;
      images: [HealthSystemsImageSlot, HealthSystemsImageSlot, HealthSystemsImageSlot];
    }
  | {
      variant: 'images4';
      titleKo: string;
      titleEn: string;
      images: [
        HealthSystemsImageSlot,
        HealthSystemsImageSlot,
        HealthSystemsImageSlot,
        HealthSystemsImageSlot,
      ];
    }
  | {
      variant: 'imagesGrid2x3';
      titleKo: string;
      titleEn: string;
      images: [
        HealthSystemsImageSlot,
        HealthSystemsImageSlot,
        HealthSystemsImageSlot,
        HealthSystemsImageSlot,
        HealthSystemsImageSlot,
        HealthSystemsImageSlot,
      ];
    }
  | {
      variant: 'imagesGrid3x3';
      titleKo: string;
      titleEn: string;
      images: [
        HealthSystemsImageSlot,
        HealthSystemsImageSlot,
        HealthSystemsImageSlot,
        HealthSystemsImageSlot,
        HealthSystemsImageSlot,
        HealthSystemsImageSlot,
        HealthSystemsImageSlot,
        HealthSystemsImageSlot,
        HealthSystemsImageSlot,
      ];
    };
