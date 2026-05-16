-- collect_jobs에 steps_filter 추가
-- null = 전체 단계 실행, ['blog_metrics','smartplace','keyword_rank','searchad'] 중 선택
alter table analytics.collect_jobs
  add column if not exists steps_filter jsonb;
