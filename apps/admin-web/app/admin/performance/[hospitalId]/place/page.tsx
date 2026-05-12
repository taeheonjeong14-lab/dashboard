'use client';

import { useEffect, useState } from 'react';
import { useParams } from 'next/navigation';
import PlaceInflowSection from '@/components/admin-stats/place/PlaceInflowSection';
import { adminStatsGetJson } from '@/lib/admin-stats/client-api';
import type { PlacePeriodDayRow, PlaceRankSummaryRow } from '@/lib/admin-stats/queries-server';

function formatRank(value: number | null) {
  if (value == null) return '-';
  return `${new Intl.NumberFormat('ko-KR').format(value)}위`;
}

export default function AdminPerformancePlacePage() {
  const params = useParams();
  const hospitalId = typeof params.hospitalId === 'string' ? params.hospitalId : '';

  const [ready, setReady] = useState(false);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [placeRanks, setPlaceRanks] = useState<PlaceRankSummaryRow[]>([]);
  const [inflowRows, setInflowRows] = useState<PlacePeriodDayRow[]>([]);
  const [inflowError, setInflowError] = useState<string | null>(null);

  useEffect(() => {
    if (!hospitalId) return;
    let active = true;
    setReady(false);
    setLoading(true);
    setPlaceRanks([]);
    setInflowRows([]);
    setInflowError(null);
    setError(null);
    (async () => {
      try {
        const [rankResult, inflowResult] = await Promise.allSettled([
          adminStatsGetJson<{ rows: PlaceRankSummaryRow[] }>('place-ranks', hospitalId),
          adminStatsGetJson<{ rows: PlacePeriodDayRow[] }>('place-period', hospitalId),
        ]);
        if (!active) return;

        if (rankResult.status === 'fulfilled') {
          setPlaceRanks(rankResult.value.rows ?? []);
        } else {
          setPlaceRanks([]);
        }

        if (inflowResult.status === 'fulfilled') {
          setInflowRows(inflowResult.value.rows ?? []);
          setInflowError(null);
        } else {
          setInflowRows([]);
          setInflowError(
            inflowResult.reason instanceof Error
              ? `플레이스 유입수 조회 오류: ${inflowResult.reason.message}`
              : '플레이스 유입수 조회 중 오류가 발생했습니다.',
          );
        }

        if (rankResult.status === 'rejected' && inflowResult.status === 'rejected') {
          setError('플레이스 통계 데이터를 불러오지 못했습니다.');
        } else {
          setError(null);
        }
      } catch (e) {
        if (!active) return;
        setError(e instanceof Error ? e.message : '데이터를 불러오지 못했습니다.');
      } finally {
        if (!active) return;
        setLoading(false);
        setReady(true);
      }
    })();

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
    <main className="w-full max-w-none px-4 pb-4 pt-0 sm:px-5 sm:pb-5 sm:pt-0 lg:px-6">
      {loading && <p className="text-sm text-slate-500">불러오는 중…</p>}

      <div className="grid grid-cols-1 lg:grid-cols-3">
        <section aria-labelledby="place-ranks" className="border-b border-slate-200 bg-white p-4 sm:p-5">
          <h2 id="place-ranks" className="mb-2 text-base font-semibold text-slate-900 sm:text-lg">
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
              <table className="w-full min-w-[320px] border-collapse text-left text-sm">
                <thead>
                  <tr className="border-b border-slate-200 text-slate-600">
                    <th className="px-3 py-2 font-medium">검색어</th>
                    <th className="px-3 py-2 font-medium">순위</th>
                  </tr>
                </thead>
                <tbody>
                  {placeRanks.map((row) => (
                    <tr key={row.keyword} className="border-b border-slate-200 text-slate-800">
                      <td className="px-3 py-2">{row.keyword}</td>
                      <td className="px-3 py-2">{formatRank(row.rank_value)}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </section>

        <PlaceInflowSection rows={inflowRows} loading={loading} errorMessage={inflowError} />
      </div>

      {error && (
        <p className="mt-3 border border-red-200 bg-red-50 p-3 text-sm text-red-800">{error}</p>
      )}
    </main>
  );
}
