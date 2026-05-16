import type { SupabaseClient } from "@supabase/supabase-js";

import type { HospitalRow } from "@/lib/hospitals-types";
import {
  dbCore,
  getSupabaseChartPdfSchema,
  getSupabaseCoreSchema,
  getSupabaseUnifiedDbSchema,
} from "@/lib/supabase-db-schema";

function trimStr(v: unknown): string | null {
  if (typeof v !== "string") return null;
  const t = v.trim();
  return t.length > 0 ? t : null;
}

function joinAddressLine(base: string | null, detail: string | null): string | null {
  const parts = [base?.trim(), detail?.trim()].filter(Boolean) as string[];
  return parts.length ? parts.join(" ") : null;
}

/**
 * 분리 스키마(core.hospitals camelCase) vs 통합 모드(레거시 snake `public` 등).
 * 통합 모드(`SUPABASE_DB_SCHEMA` 설정)에서는 기존 컬럼명을 그대로 씁니다.
 */
export function hospitalsDbUsesCamelCase(): boolean {
  return getSupabaseUnifiedDbSchema() === null;
}

/** PostgREST select 목록 — `core.hospitals` */
export const CORE_HOSPITAL_POSTGREST_SELECT =
  "id, name, name_en, address, addressDetail, phone, slug, createdAt, updatedAt, code, brandColor, director_name_ko, logoUrl, seal_url, cover_pet_image_url, tagline_line1, tagline_line2, director_title, blog_intro, blog_outro";

/** 레거시 `public.hospitals` 등 snake_case */
export const LEGACY_HOSPITAL_POSTGREST_SELECT =
  "id, name_ko, name_en, address, phone, director_name_ko, director_title, brand_color_hex, code, slug, logo_url, seal_url, tagline_line1, tagline_line2, blog_intro, blog_outro, created_at, updated_at";

export function hospitalTableSelectColumns(): string {
  return hospitalsDbUsesCamelCase() ? CORE_HOSPITAL_POSTGREST_SELECT : LEGACY_HOSPITAL_POSTGREST_SELECT;
}

/** `parse_runs` embed용 — `hospitals(...)` 안쪽 컬럼 문자열 */
export function hospitalEmbeddedRelationSpec(): string {
  return `hospitals(${hospitalTableSelectColumns()})`;
}

/**
 * PostgREST 임베드는 보통 같은 스키마(또는 동일 노출 스키마 안의 FK)에서만 동작한다.
 * `chart_pdf.parse_runs` ↔ `core.hospitals` 처럼 스키마가 갈라지면
 * "Could not find a relationship between 'parse_runs' and 'hospitals'" 가 난다.
 */
export function canEmbedHospitalFromParseRuns(): boolean {
  if (getSupabaseUnifiedDbSchema()) return true;
  return getSupabaseChartPdfSchema() === getSupabaseCoreSchema();
}

/** parse_runs 조회용 — PostgREST가 cross-schema embed 를 못 할 때 별도 core 조회 */
export function parseRunsHospitalSelectPlan(leadingColumns: string): { select: string; embed: boolean } {
  const embed = canEmbedHospitalFromParseRuns();
  const lead = leadingColumns.trim();
  return {
    embed,
    select: embed ? `${lead}, ${hospitalEmbeddedRelationSpec()}` : lead,
  };
}

/** 임베드 사용 여부에 맞춰 병원 행 해석 (분리 스키마면 core 에서 hospital_id 로 조회) */
export async function resolveHospitalForParseRunRow(
  supabase: SupabaseClient,
  runRow: Record<string, unknown> | null | undefined,
  usedEmbed: boolean,
): Promise<HospitalRow | null> {
  if (!runRow) return null;
  if (usedEmbed) {
    return parseHospitalRelation(runRow.hospitals);
  }
  const rawId = runRow.hospital_id;
  const id = typeof rawId === "string" ? rawId.trim() : "";
  if (!id) return null;
  const coreDb = dbCore(supabase);
  const { data, error } = await coreDb
    .from("hospitals")
    .select(hospitalTableSelectColumns())
    .eq("id", id)
    .maybeSingle();
  if (error) throw new Error(error.message);
  return hospitalRowFromDb(data);
}

export function hospitalOrderColumn(): string {
  return hospitalsDbUsesCamelCase() ? "name" : "name_ko";
}

/**
 * DB 행(레거시 snake 또는 core camel)을 UI용 `HospitalRow`로 통일.
 */
export function hospitalRowFromDb(entry: unknown): HospitalRow | null {
  if (!entry || typeof entry !== "object") return null;
  const h = entry as Record<string, unknown>;
  const id = trimStr(h.id);
  if (!id) return null;

  const name_ko =
    trimStr(h.name_ko) ?? trimStr(h.nameKo) ?? trimStr(h.name) ?? "";
  const name_en = trimStr(h.name_en) ?? trimStr(h.nameEn) ?? "";

  const created_at =
    trimStr(h.created_at) ?? trimStr(h.createdAt) ?? new Date().toISOString();
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
    slug: trimStr(h.slug) ?? "",
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

export function mapHospitalListFromDb(rows: unknown): HospitalRow[] {
  if (!Array.isArray(rows)) return [];
  return rows.map(hospitalRowFromDb).filter((row): row is HospitalRow => row != null);
}

/** PostgREST embed `hospitals` 단일 행 또는 배열 */
export function parseHospitalRelation(value: unknown): HospitalRow | null {
  if (value == null) return null;
  const one = Array.isArray(value) ? value[0] : value;
  return hospitalRowFromDb(one);
}

export type AdminHospitalPatchInput = {
  nameKo: string;
  nameEn: string;
  address: string | null;
  phone: string | null;
  director_name_ko: string | null;
  director_title: string | null;
  brand_color_hex: string | null;
  code: string | null;
  slug: string;
  tagline_line1: string | null;
  tagline_line2: string | null;
  blog_intro: string | null;
  blog_outro: string | null;
};

/** INSERT용 — 어드민 폼 한글명은 core 에서 `name` 컬럼으로 저장 */
export function hospitalInsertRowFromAdmin(input: AdminHospitalPatchInput, nowIso: string): Record<string, unknown> {
  if (hospitalsDbUsesCamelCase()) {
    return {
      name: input.nameKo,
      name_en: input.nameEn,
      address: input.address,
      addressDetail: null,
      phone: input.phone,
      director_name_ko: input.director_name_ko,
      director_title: input.director_title,
      brandColor: input.brand_color_hex,
      code: input.code,
      slug: input.slug,
      tagline_line1: input.tagline_line1,
      tagline_line2: input.tagline_line2,
      blog_intro: input.blog_intro,
      blog_outro: input.blog_outro,
      createdAt: nowIso,
      updatedAt: nowIso,
    };
  }
  return {
    name_ko: input.nameKo,
    name_en: input.nameEn,
    address: input.address,
    phone: input.phone,
    director_name_ko: input.director_name_ko,
    director_title: input.director_title,
    brand_color_hex: input.brand_color_hex,
    code: input.code,
    slug: input.slug,
    tagline_line1: input.tagline_line1,
    tagline_line2: input.tagline_line2,
    blog_intro: input.blog_intro,
    blog_outro: input.blog_outro,
    created_at: nowIso,
    updated_at: nowIso,
  };
}

/** PATCH용 — 생성 시각 컬럼은 제외 */
export function hospitalUpdateRowFromAdmin(input: AdminHospitalPatchInput, nowIso: string): Record<string, unknown> {
  const row = hospitalInsertRowFromAdmin(input, nowIso);
  if (hospitalsDbUsesCamelCase()) {
    delete row.createdAt;
  } else {
    delete row.created_at;
  }
  return row;
}

/** 자산 URL 업데이트 시 컬럼명 */
export function hospitalAssetUrlColumn(assetType: "logo" | "seal"): string {
  if (hospitalsDbUsesCamelCase()) {
    return assetType === "logo" ? "logoUrl" : "seal_url";
  }
  return assetType === "logo" ? "logo_url" : "seal_url";
}

export function hospitalTimestampUpdateField(): string {
  return hospitalsDbUsesCamelCase() ? "updatedAt" : "updated_at";
}
