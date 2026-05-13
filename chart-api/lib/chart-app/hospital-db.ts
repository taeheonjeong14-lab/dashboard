import type { HospitalRow } from '@/lib/chart-app/hospitals-types';

function trimStr(v: unknown): string | null {
  if (typeof v !== 'string') return null;
  const t = v.trim();
  return t.length > 0 ? t : null;
}

function joinAddressLine(base: string | null, detail: string | null): string | null {
  const parts = [base?.trim(), detail?.trim()].filter(Boolean) as string[];
  return parts.length ? parts.join(' ') : null;
}

export function hospitalRowFromDb(entry: unknown): HospitalRow | null {
  if (!entry || typeof entry !== 'object') return null;
  const h = entry as Record<string, unknown>;
  const id = trimStr(h.id);
  if (!id) return null;

  const name_ko = trimStr(h.name_ko) ?? trimStr(h.nameKo) ?? trimStr(h.name) ?? '';
  const name_en = trimStr(h.name_en) ?? trimStr(h.nameEn) ?? '';
  const created_at = trimStr(h.created_at) ?? trimStr(h.createdAt) ?? new Date().toISOString();
  const updated_at = trimStr(h.updated_at) ?? trimStr(h.updatedAt) ?? created_at;
  const address = joinAddressLine(trimStr(h.address), trimStr(h.addressDetail));

  return {
    id,
    name_ko,
    name_en,
    address,
    phone: trimStr(h.phone),
    director_name_ko: trimStr(h.director_name_ko),
    director_title: trimStr(h.director_title),
    brand_color_hex: trimStr(h.brand_color_hex) ?? trimStr(h.brandColor),
    code: trimStr(h.code),
    slug: trimStr(h.slug) ?? '',
    logo_url: trimStr(h.logo_url) ?? trimStr(h.logoUrl),
    seal_url: trimStr(h.seal_url) ?? trimStr(h.sealUrl),
    cover_pet_image_url: trimStr(h.cover_pet_image_url) ?? trimStr(h.coverPetImageUrl),
    tagline_line1: trimStr(h.tagline_line1),
    tagline_line2: trimStr(h.tagline_line2),
    blog_intro: trimStr(h.blog_intro),
    blog_outro: trimStr(h.blog_outro),
    created_at,
    updated_at,
  };
}

export function parseHospitalRelation(value: unknown): HospitalRow | null {
  if (value == null) return null;
  const one = Array.isArray(value) ? value[0] : value;
  return hospitalRowFromDb(one);
}

