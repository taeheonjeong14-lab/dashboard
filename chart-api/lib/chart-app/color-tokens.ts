type Rgb = { r: number; g: number; b: number };

function clamp255(n: number): number {
  return Math.max(0, Math.min(255, Math.round(n)));
}

function parseHexColor(raw: string): Rgb | null {
  const t = raw.trim();
  const m = /^#?([0-9a-f]{6})$/i.exec(t);
  if (!m) return null;
  const hex = m[1];
  const r = Number.parseInt(hex.slice(0, 2), 16);
  const g = Number.parseInt(hex.slice(2, 4), 16);
  const b = Number.parseInt(hex.slice(4, 6), 16);
  return { r, g, b };
}

function toHex({ r, g, b }: Rgb): string {
  const h = (n: number) => clamp255(n).toString(16).padStart(2, '0');
  return `#${h(r)}${h(g)}${h(b)}`;
}

function mix(a: Rgb, b: Rgb, t: number): Rgb {
  return {
    r: a.r + (b.r - a.r) * t,
    g: a.g + (b.g - a.g) * t,
    b: a.b + (b.b - a.b) * t,
  };
}

export function reportThemeTokensFromBrandHex(brandHex: string): Record<string, string> | null {
  const base = parseHexColor(brandHex);
  if (!base) return null;
  const white: Rgb = { r: 255, g: 255, b: 255 };
  const black: Rgb = { r: 0, g: 0, b: 0 };

  const sage = mix(base, white, 0.06);
  const sageMid = base;
  const sageSoft = mix(base, white, 0.55);
  const green = mix(base, black, 0.55);
  const greenSoft = mix(base, black, 0.35);

  return {
    '--report-a4-sage': toHex(sage),
    '--report-a4-sage-mid': toHex(sageMid),
    '--report-a4-sage-soft': toHex(sageSoft),
    '--report-a4-green': toHex(green),
    '--report-a4-green-soft': toHex(greenSoft),
  };
}

