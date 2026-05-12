-- RUN ON ATTACH (PDF) DB — Supabase SQL Editor.
-- Supabase 는 여러 문장을 한 번에 실행하면 마지막 결과만 보여 줌 → 아래는 SELECT 하나로 JSON 한 칸에 전부 담음.
-- 공통 템플릿: attach-db-introspect-public-table-as-json.sql (WITH vars 의 tbl 만 다름).
--
-- 대상: public.parse_runs
-- 마지막 인트로스펙션 기준: id, document_id, status, provider, model, parser_version,
--   raw_payload, error_message, created_at, friendly_id, hospital_id, ai_assessment (updated_at 없음).

WITH vars AS (
  SELECT 'public'::text AS sch, 'parse_runs'::text AS tbl
),
cols AS (
  SELECT COALESCE(
    json_agg(
      json_build_object(
        'column_name', c.column_name,
        'data_type', c.data_type,
        'udt_name', c.udt_name,
        'is_nullable', c.is_nullable,
        'column_default', c.column_default,
        'ordinal_position', c.ordinal_position
      )
      ORDER BY c.ordinal_position
    ),
    '[]'::json
  ) AS j
  FROM information_schema.columns c
  JOIN vars v ON c.table_schema = v.sch AND c.table_name = v.tbl
),
constraints_agg AS (
  SELECT COALESCE(
    json_agg(
      json_build_object(
        'constraint_type', tc.constraint_type,
        'constraint_name', tc.constraint_name,
        'ordinal_position', kcu.ordinal_position,
        'column_name', kcu.column_name
      )
      ORDER BY tc.constraint_type, tc.constraint_name, kcu.ordinal_position
    ),
    '[]'::json
  ) AS j
  FROM information_schema.table_constraints tc
  JOIN information_schema.key_column_usage kcu
    ON tc.constraint_schema = kcu.constraint_schema
    AND tc.constraint_name = kcu.constraint_name
  JOIN vars v ON tc.table_schema = v.sch AND tc.table_name = v.tbl
),
outgoing_fk AS (
  SELECT COALESCE(
    json_agg(
      json_build_object(
        'constraint_name', tc.constraint_name,
        'column_name', kcu.column_name,
        'fk_schema', ccu.table_schema,
        'fk_table', ccu.table_name,
        'fk_column', ccu.column_name
      )
      ORDER BY tc.constraint_name
    ),
    '[]'::json
  ) AS j
  FROM information_schema.table_constraints tc
  JOIN information_schema.key_column_usage kcu
    ON tc.constraint_name = kcu.constraint_name
    AND tc.table_schema = kcu.constraint_schema
  JOIN information_schema.constraint_column_usage ccu
    ON ccu.constraint_schema = tc.constraint_schema
    AND ccu.constraint_name = tc.constraint_name
  JOIN vars v ON tc.table_schema = v.sch AND tc.table_name = v.tbl
  WHERE tc.constraint_type = 'foreign key'
),
indexes_agg AS (
  SELECT COALESCE(
    json_agg(
      json_build_object('indexname', i.indexname, 'indexdef', i.indexdef)
      ORDER BY i.indexname
    ),
    '[]'::json
  ) AS j
  FROM pg_indexes i
  JOIN vars v ON i.schemaname = v.sch AND i.tablename = v.tbl
),
row_count AS (
  SELECT (
    (
      xpath(
        '//row/c/text()',
        xmlparse(
          DOCUMENT query_to_xml(
            format('select count(*)::bigint as c from %I.%I', sch, tbl),
            false,
            false,
            ''
          )
        )
      )
    )[1]
  )::text::bigint AS n
  FROM vars
),
tbl_comment AS (
  SELECT obj_description(format('%I.%I', sch, tbl)::regclass) AS c
  FROM vars
)
SELECT json_build_object(
  'schema', (SELECT sch FROM vars),
  'table', (SELECT tbl FROM vars),
  'columns', (SELECT j FROM cols),
  'table_constraints', (SELECT j FROM constraints_agg),
  'outgoing_foreign_keys', (SELECT j FROM outgoing_fk),
  'indexes', (SELECT j FROM indexes_agg),
  'row_count', (SELECT n FROM row_count),
  'table_comment', (SELECT to_json(c.c) FROM tbl_comment c)
)::text AS introspection_json;
