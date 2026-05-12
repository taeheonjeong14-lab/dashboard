/**
 * decode-supabase-format-json-to-sql.mjs / decode-supabase-batch.mjs 공통 로직.
 */

export function normalizeNewlines(s) {
  return s.replace(/\r\n/g, '\n').replace(/\r/g, '\n').trim();
}

export function unwrapSupabaseRowWrapper(rows) {
  if (!Array.isArray(rows) || rows.length < 1) return rows;
  const first = rows[0];
  if (
    rows.length === 1 &&
    first &&
    typeof first.decoder_json === 'string' &&
    typeof first.format !== 'string'
  ) {
    try {
      const inner = JSON.parse(first.decoder_json);
      return Array.isArray(inner) ? inner : rows;
    } catch {
      return rows;
    }
  }
  return rows;
}

export function extractFromJson(raw) {
  const trimmed = raw.replace(/^\uFEFF/, '').trim();
  if (!trimmed.startsWith('[')) return null;
  let rows;
  try {
    rows = JSON.parse(trimmed);
  } catch {
    return null;
  }
  if (!Array.isArray(rows)) return null;
  rows = unwrapSupabaseRowWrapper(rows);

  const parts = [];
  for (const row of rows) {
    const s = row?.format;
    if (typeof s === 'string') parts.push(normalizeNewlines(s));
  }
  return parts.length ? parts : null;
}

export function extractPlainInserts(raw, stagingTableName) {
  const tableEsc = stagingTableName.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  const INSERT_RE = new RegExp(`insert\\s+into\\s+staging\\.${tableEsc}\\b`, 'i');
  const normalized = raw.replace(/\r\n/g, '\n');
  const splitRe = new RegExp(
    `\\n(?=\\s*insert\\s+into\\s+staging\\.${tableEsc}\\b)`,
    'i'
  );
  const chunks = normalized.split(splitRe);
  const inserts = [];
  for (let chunk of chunks) {
    const start = chunk.search(INSERT_RE);
    if (start < 0) continue;
    let sql = chunk.slice(start).replace(/\s*\|\s*$/s, '').trim();
    const end = sql.lastIndexOf(');');
    if (end >= 0) sql = sql.slice(0, end + 2);
    if (INSERT_RE.test(sql)) inserts.push(sql);
  }
  return inserts;
}

export function decodeSupabaseExport(raw, stagingTableName = 'generated_run_content') {
  let parts = extractFromJson(raw) || extractPlainInserts(raw, stagingTableName);
  if (!parts?.length) {
    throw new Error(
      `No INSERT statements found for staging.${stagingTableName}.\n` +
        '- Markdown table (lines starting with "|") is OK: paste as-is.\n' +
        '- Valid JSON export must start with "[".\n' +
        '- Check staging table name matches your INSERT (default: generated_run_content).'
    );
  }
  return parts.map((p) => normalizeNewlines(p));
}
