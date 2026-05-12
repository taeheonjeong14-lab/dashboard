'use client';

import dynamic from 'next/dynamic';
import { useEffect, useState } from 'react';
import { useParams } from 'next/navigation';
import { adminStatsGetJson } from '@/lib/admin-stats/client-api';
import type { HospitalManagementDayRow } from '@/lib/admin-stats/queries-server';

/** Recharts Bar/ResponsiveContainer는 SSR에서 환경에 따라 실패할 수 있어 클라이언트 전용 로드 */
const ManagementMetricSection = dynamic(
  () => import('@/components/admin-stats/management/ManagementMetricSection'),
  {
    ssr: false,
    loading: () => (
      <div className="flex min-h-[160px] items-center justify-center border-b border-slate-200 bg-white py-8 text-sm text-slate-500">
        차트를 불러오는 중…
      </div>
    ),
  },
);

export default function AdminPerformanceManagementPage() {
  const params = useParams();
  const hospitalId = typeof params.hospitalId === 'string' ? params.hospitalId : '';

  const [ready, setReady] = useState(false);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [rows, setRows] = useState<HospitalManagementDayRow[]>([]);

  useEffect(() => {
    if (!hospitalId) return;
    let active = true;
    setReady(false);
    setLoading(true);
    setRows([]);
    setError(null);

    const load = async (kind: 'initial' | 'refresh') => {
      try {
        const data = await adminStatsGetJson<{ rows: HospitalManagementDayRow[] }>(
          'management',
          hospitalId,
        );
        if (!active) return;
        setRows(data.rows ?? []);
        setError(null);
      } catch (e) {
        if (!active) return;
        setError(e instanceof Error ? e.message : '데이터를 불러오지 못했습니다.');
        setRows([]);
      } finally {
        if (!active) return;
        if (kind === 'initial') {
          setLoading(false);
          setReady(true);
        }
      }
    };

    void load('initial');

    const refresh = () => {
      if (!active) return;
      void load('refresh');
    };
    const interval = window.setInterval(refresh, 15000);
    const onFocus = () => refresh();
    const onVisible = () => {
      if (document.visibilityState === 'visible') refresh();
    };
    window.addEventListener('focus', onFocus);
    document.addEventListener('visibilitychange', onVisible);

    return () => {
      active = false;
      window.clearInterval(interval);
      window.removeEventListener('focus', onFocus);
      document.removeEventListener('visibilitychange', onVisible);
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
      {loading && <p className="mb-2 text-sm text-slate-500">불러오는 중…</p>}

      <div className="flex flex-col divide-y divide-slate-200">
        <ManagementMetricSection
          title="매출"
          description="기간 내 일/월/연 단위 매출 추이와 전년 동월·요일별 분석을 함께 보여줍니다."
          rows={rows}
          metric="sales"
          valueFormat="currency"
        />
        <ManagementMetricSection
          title="진료건수"
          description="기간 내 일/월/연 단위 진료건수 추이와 전년 동월·요일별 분석을 함께 보여줍니다."
          rows={rows}
          metric="visits"
          valueFormat="integer"
          valueSuffix="건"
        />
        <ManagementMetricSection
          title="신규 환자 유입"
          description="기간 내 일/월/연 단위 신규 환자 추이와 전년 동월·요일별 분석을 함께 보여줍니다."
          rows={rows}
          metric="newPatients"
          valueFormat="integer"
          valueSuffix="명"
        />
      </div>

      {error && (
        <p className="mt-3 border border-red-200 bg-red-50 p-3 text-sm text-red-800">{error}</p>
      )}
    </main>
  );
}
