-- ATTACH (PDF) DB — 한 번 실행 → staging_target_columns_json 한 칸 복사 (컬럼 목록만).
-- 우리 DB의 staging DDL·디코더 export 와 Attach public.* 컬럼을 맞출 때 사용.
--
-- 대상: parse_runs, report_case_images, result_* … (staging 묶음과 동일 이름)

select json_build_object(
  'parse_runs',
  (
    select coalesce(
      json_agg(
        json_build_object(
          'column_name', column_name,
          'data_type', data_type,
          'udt_name', udt_name,
          'is_nullable', is_nullable,
          'column_default', column_default,
          'ordinal_position', ordinal_position
        )
        order by ordinal_position
      ),
      '[]'::json
    )
    from information_schema.columns
    where table_schema = 'public'
      and table_name = 'parse_runs'
  ),
  'report_case_images',
  (
    select coalesce(
      json_agg(
        json_build_object(
          'column_name', column_name,
          'data_type', data_type,
          'udt_name', udt_name,
          'is_nullable', is_nullable,
          'column_default', column_default,
          'ordinal_position', ordinal_position
        )
        order by ordinal_position
      ),
      '[]'::json
    )
    from information_schema.columns
    where table_schema = 'public'
      and table_name = 'report_case_images'
  ),
  'result_basic_info',
  (
    select coalesce(
      json_agg(
        json_build_object(
          'column_name', column_name,
          'data_type', data_type,
          'udt_name', udt_name,
          'is_nullable', is_nullable,
          'column_default', column_default,
          'ordinal_position', ordinal_position
        )
        order by ordinal_position
      ),
      '[]'::json
    )
    from information_schema.columns
    where table_schema = 'public'
      and table_name = 'result_basic_info'
  ),
  'result_chart_by_date',
  (
    select coalesce(
      json_agg(
        json_build_object(
          'column_name', column_name,
          'data_type', data_type,
          'udt_name', udt_name,
          'is_nullable', is_nullable,
          'column_default', column_default,
          'ordinal_position', ordinal_position
        )
        order by ordinal_position
      ),
      '[]'::json
    )
    from information_schema.columns
    where table_schema = 'public'
      and table_name = 'result_chart_by_date'
  ),
  'result_lab_items',
  (
    select coalesce(
      json_agg(
        json_build_object(
          'column_name', column_name,
          'data_type', data_type,
          'udt_name', udt_name,
          'is_nullable', is_nullable,
          'column_default', column_default,
          'ordinal_position', ordinal_position
        )
        order by ordinal_position
      ),
      '[]'::json
    )
    from information_schema.columns
    where table_schema = 'public'
      and table_name = 'result_lab_items'
  ),
  'result_physical_exam_items',
  (
    select coalesce(
      json_agg(
        json_build_object(
          'column_name', column_name,
          'data_type', data_type,
          'udt_name', udt_name,
          'is_nullable', is_nullable,
          'column_default', column_default,
          'ordinal_position', ordinal_position
        )
        order by ordinal_position
      ),
      '[]'::json
    )
    from information_schema.columns
    where table_schema = 'public'
      and table_name = 'result_physical_exam_items'
  ),
  'result_plan_rows',
  (
    select coalesce(
      json_agg(
        json_build_object(
          'column_name', column_name,
          'data_type', data_type,
          'udt_name', udt_name,
          'is_nullable', is_nullable,
          'column_default', column_default,
          'ordinal_position', ordinal_position
        )
        order by ordinal_position
      ),
      '[]'::json
    )
    from information_schema.columns
    where table_schema = 'public'
      and table_name = 'result_plan_rows'
  ),
  'result_vaccination_records',
  (
    select coalesce(
      json_agg(
        json_build_object(
          'column_name', column_name,
          'data_type', data_type,
          'udt_name', udt_name,
          'is_nullable', is_nullable,
          'column_default', column_default,
          'ordinal_position', ordinal_position
        )
        order by ordinal_position
      ),
      '[]'::json
    )
    from information_schema.columns
    where table_schema = 'public'
      and table_name = 'result_vaccination_records'
  ),
  'result_vitals',
  (
    select coalesce(
      json_agg(
        json_build_object(
          'column_name', column_name,
          'data_type', data_type,
          'udt_name', udt_name,
          'is_nullable', is_nullable,
          'column_default', column_default,
          'ordinal_position', ordinal_position
        )
        order by ordinal_position
      ),
      '[]'::json
    )
    from information_schema.columns
    where table_schema = 'public'
      and table_name = 'result_vitals'
  )
)::text as staging_target_columns_json;
