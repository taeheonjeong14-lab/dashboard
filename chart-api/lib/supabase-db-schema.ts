import type { SupabaseClient } from "@supabase/supabase-js";

function schemaClient(supabase: SupabaseClient, schema: string): SupabaseClient {
  if (schema === "public") return supabase;
  return supabase.schema(schema) as unknown as SupabaseClient;
}

export function getSupabaseUnifiedDbSchema(): string | null {
  const s = process.env.SUPABASE_DB_SCHEMA?.trim();
  return s && s.length > 0 ? s : null;
}

function chartPdfSchemaName(): string {
  const u = getSupabaseUnifiedDbSchema();
  if (u) return u;
  const s = process.env.SUPABASE_SCHEMA_CHART_PDF?.trim();
  return s && s.length > 0 ? s : "public";
}

function healthReportSchemaName(): string {
  const u = getSupabaseUnifiedDbSchema();
  if (u) return u;
  const s = process.env.SUPABASE_SCHEMA_HEALTH_REPORT?.trim();
  return s && s.length > 0 ? s : "public";
}

function coreSchemaName(): string {
  const u = getSupabaseUnifiedDbSchema();
  if (u) return u;
  const s = process.env.SUPABASE_SCHEMA_CORE?.trim();
  return s && s.length > 0 ? s : "public";
}

export function dbChartPdf(supabase: SupabaseClient): SupabaseClient {
  return schemaClient(supabase, chartPdfSchemaName());
}

export function dbHealthReport(supabase: SupabaseClient): SupabaseClient {
  return schemaClient(supabase, healthReportSchemaName());
}

export function dbCore(supabase: SupabaseClient): SupabaseClient {
  return schemaClient(supabase, coreSchemaName());
}

export function dbSchema(supabase: SupabaseClient): SupabaseClient {
  return dbChartPdf(supabase);
}

export function getSupabaseChartPdfSchema(): string {
  return chartPdfSchemaName();
}

export function getSupabaseDbSchema(): string {
  return chartPdfSchemaName();
}

export function getSupabaseCoreSchema(): string {
  return coreSchemaName();
}

export function getSupabaseHealthReportSchema(): string {
  return healthReportSchemaName();
}
