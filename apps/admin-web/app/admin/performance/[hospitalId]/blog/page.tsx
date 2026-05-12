'use client';

import { useEffect, useState } from 'react';
import { useParams } from 'next/navigation';
import BlogMetricSection from '@/components/admin-stats/blog/BlogMetricSection';
import BlogRanksSection from '@/components/admin-stats/blog/BlogRanksSection';
import { adminStatsGetJson } from '@/lib/admin-stats/client-api';
import type { BlogPeriodDayRow, BlogRankSummaryRow } from '@/lib/admin-stats/queries-server';

export default function AdminPerformanceBlogPage() {
  const params = useParams();
  const hospitalId = typeof params.hospitalId === 'string' ? params.hospitalId : '';

  const [ready, setReady] = useState(false);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [rows, setRows] = useState<BlogPeriodDayRow[]>([]);
  const [blogRanks, setBlogRanks] = useState<BlogRankSummaryRow[]>([]);

  useEffect(() => {
    if (!hospitalId) return;
    let active = true;
    setReady(false);
    setLoading(true);
    setRows([]);
    setBlogRanks([]);
    setError(null);
    Promise.all([
      adminStatsGetJson<{ rows: BlogPeriodDayRow[] }>('blog-period', hospitalId),
      adminStatsGetJson<{ rows: BlogRankSummaryRow[] }>('blog-ranks', hospitalId),
    ])
      .then(([period, ranks]) => {
        if (!active) return;
        setRows(period.rows ?? []);
        setBlogRanks(ranks.rows ?? []);
        setError(null);
      })
      .catch((e: unknown) => {
        if (!active) return;
        setError(e instanceof Error ? e.message : '데이터를 불러오지 못했습니다.');
      })
      .finally(() => {
        if (!active) return;
        setLoading(false);
        setReady(true);
      });
    return () => {
      active = false;
    };
  }, [hospitalId]);

  if (!ready) {
    return (
      <main className="flex min-h-[40vh] items-center justify-center px-4">
        <p className="text-sm text-slate-600">데이터 준비 중…</p>
      </main>
    );
  }

  return (
    <main className="min-h-screen w-full max-w-none px-4 pb-4 pt-0 sm:px-5 sm:pb-5 sm:pt-0 lg:px-6">
      {loading && <p className="text-sm text-slate-500">불러오는 중…</p>}

      <div className="grid grid-cols-1 lg:grid-cols-3">
        <div className="lg:col-span-1">
          <BlogRanksSection
            rows={blogRanks}
            hospitalId={hospitalId}
            loading={loading}
            headingId="blog-ranks"
          />
        </div>
        <div className="flex flex-col divide-y divide-slate-200 lg:col-span-2 lg:border-l lg:border-slate-200">
          <BlogMetricSection
            title="블로그 조회수"
            description="기간 내 일/월/연 단위 블로그 조회수 추이입니다."
            rows={rows}
            metric="views"
            valueSuffix="회"
          />
          <BlogMetricSection
            title="블로그 순방문자수"
            description="기간 내 일/월/연 단위 블로그 순방문자수 추이입니다."
            rows={rows}
            metric="uniqueVisitors"
            valueSuffix="명"
            footnote="월·연 값은 일일 고유 방문자의 합으로 계산됩니다."
          />
        </div>
      </div>

      {error && (
        <p className="mt-3 border border-red-200 bg-red-50 p-3 text-sm text-red-800">{error}</p>
      )}
    </main>
  );
}
