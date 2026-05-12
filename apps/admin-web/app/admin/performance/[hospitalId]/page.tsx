'use client';

import { useEffect, useState } from 'react';
import { useParams } from 'next/navigation';
import BlogRanksSection from '@/components/admin-stats/blog/BlogRanksSection';
import SummaryDualWeekCompareChart from '@/components/admin-stats/SummaryDualWeekCompareChart';
import { adminStatsGetJson } from '@/lib/admin-stats/client-api';
import type {
  BlogRankSummaryRow,
  PlaceRankSummaryRow,
  SummaryKpis,
} from '@/lib/admin-stats/queries-server';

const EMPTY_KPIS: SummaryKpis = {
  salesCurrentWeek: [],
  salesPreviousWeek: [],
  newCustomersCurrentWeek: [],
  newCustomersPreviousWeek: [],
  datePairs: [],
};

function formatRank(value: number | null) {
  if (value == null) return '-';
  return `${new Intl.NumberFormat('ko-KR').format(value)}위`;
}

export default function AdminPerformanceSummaryPage() {
  const params = useParams();
  const hospitalId = typeof params.hospitalId === 'string' ? params.hospitalId : '';

  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [kpis, setKpis] = useState<SummaryKpis>(EMPTY_KPIS);
  const [blogRanks, setBlogRanks] = useState<BlogRankSummaryRow[]>([]);
  const [placeRanks, setPlaceRanks] = useState<PlaceRankSummaryRow[]>([]);

  useEffect(() => {
    if (!hospitalId) return;
    let active = true;
    setKpis(EMPTY_KPIS);
    setBlogRanks([]);
    setPlaceRanks([]);
    setLoading(true);
    setError(null);
    Promise.all([
      adminStatsGetJson<{ kpis: SummaryKpis }>('summary', hospitalId),
      adminStatsGetJson<{ rows: BlogRankSummaryRow[] }>('blog-ranks', hospitalId),
      adminStatsGetJson<{ rows: PlaceRankSummaryRow[] }>('place-ranks', hospitalId),
    ])
      .then(([s, b, p]) => {
        if (!active) return;
        setKpis(s.kpis ?? EMPTY_KPIS);
        setBlogRanks(b.rows ?? []);
        setPlaceRanks(p.rows ?? []);
        setError(null);
      })
      .catch((e: unknown) => {
        if (!active) return;
        setError(e instanceof Error ? e.message : '요약 데이터를 불러오지 못했습니다.');
      })
      .finally(() => {
        if (active) setLoading(false);
      });
    return () => {
      active = false;
    };
  }, [hospitalId]);

  return (
    <main className="w-full max-w-none px-4 pb-4 pt-0 sm:px-5 sm:pb-5 sm:pt-0 lg:px-6">
      <div className="flex flex-col divide-y divide-slate-200">
        <div className="grid grid-cols-1 lg:grid-cols-2">
          <section
            aria-labelledby="summary-revenue"
            className="min-w-0 border-b border-slate-200 bg-white p-4 sm:p-5"
          >
            <h2 id="summary-revenue" className="mb-1 text-base font-semibold text-slate-900 sm:text-lg">
              병원 일별 매출
            </h2>
            <p className="mb-3 text-sm text-slate-500">
              데이터가 있는 마지막 날짜를 끝점으로 최근 7일 일별 매출(파란색)과 직전 7일 일별 매출(보라색)을 같은 슬롯에서
              비교합니다.
            </p>
            <SummaryDualWeekCompareChart
              ariaLabel="병원 일별 매출: 최근 7일 대 직전 7일"
              variant="currency"
              currentWeek={kpis.salesCurrentWeek}
              previousWeek={kpis.salesPreviousWeek}
              datePairs={kpis.datePairs}
            />
          </section>

          <section
            aria-labelledby="summary-patients"
            className="min-w-0 border-b border-slate-200 bg-white p-4 sm:p-5 lg:border-l lg:border-slate-200"
          >
            <h2 id="summary-patients" className="mb-1 text-base font-semibold text-slate-900 sm:text-lg">
              일별 신규 환자 유입
            </h2>
            <p className="mb-3 text-sm text-slate-500">
              데이터가 있는 마지막 날짜를 끝점으로 최근 7일 일별 신규 환자 수와 직전 7일 일별 신규 환자 수를 같은 슬롯에서
              비교합니다.
            </p>
            <SummaryDualWeekCompareChart
              ariaLabel="일별 신규 환자: 최근 7일 대 직전 7일"
              variant="integer"
              currentWeek={kpis.newCustomersCurrentWeek}
              previousWeek={kpis.newCustomersPreviousWeek}
              datePairs={kpis.datePairs}
            />
          </section>
        </div>

        <BlogRanksSection
          rows={blogRanks}
          hospitalId={hospitalId}
          loading={loading}
          headingId="summary-blog-rank"
          variant="simple"
        />

        <section aria-labelledby="summary-place-rank" className="bg-white p-4 sm:p-5">
          <h2 id="summary-place-rank" className="mb-2 text-base font-semibold text-slate-900 sm:text-lg">
            주요 키워드 · 스마트플레이스 노출 순위
          </h2>
          <p className="mb-3 text-sm text-slate-500">
            가장 최신 수집 기준, 주요 키워드별 스마트플레이스 노출 순위입니다.
          </p>
          {loading && <p className="text-sm text-slate-500">불러오는 중…</p>}
          {!loading && placeRanks.length === 0 && (
            <p className="border border-slate-200 bg-slate-50 p-4 text-sm text-slate-500">
              표시할 데이터가 없습니다.
            </p>
          )}
          {!loading && placeRanks.length > 0 && (
            <div className="overflow-x-auto">
              <table className="w-full min-w-[460px] border-collapse text-left text-sm">
                <thead>
                  <tr className="border-b border-slate-200 text-slate-600">
                    <th className="px-3 py-2 font-medium">검색어</th>
                    <th className="px-3 py-2 font-medium">순위</th>
                  </tr>
                </thead>
                <tbody>
                  {placeRanks.map((row) => (
                    <tr key={row.keyword} className="border-b border-slate-200/70 text-slate-800">
                      <td className="px-3 py-2">{row.keyword}</td>
                      <td className="px-3 py-2">{formatRank(row.rank_value)}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </section>
      </div>
      {error && (
        <p className="mt-3 border border-red-200 bg-red-50 p-3 text-sm text-red-800">{error}</p>
      )}
    </main>
  );
}
