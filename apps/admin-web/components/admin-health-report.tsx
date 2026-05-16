'use client';

import { useCallback, useEffect, useMemo, useState } from 'react';
import { AdminHealthCheckupWorkspace } from '@/components/admin-health-checkup-workspace';
import type { GeneratedContentListItem } from '@/lib/health-report-admin/types';

const divider = 'rgba(15, 23, 42, 0.1)';

function formatRailDateShort(iso: string): string {
  if (!iso) return '—';
  try {
    const d = new Date(iso);
    return `${String(d.getMonth() + 1).padStart(2, '0')}/${String(d.getDate()).padStart(2, '0')}`;
  } catch {
    return '—';
  }
}

export default function AdminHealthReport() {
  const [runs, setRuns] = useState<GeneratedContentListItem[]>([]);
  const [runsLoading, setRunsLoading] = useState(true);
  const [runsError, setRunsError] = useState<string | null>(null);
  const [selectedId, setSelectedId] = useState<string | null>(null);
  const [search, setSearch] = useState('');
  const [filterHospital, setFilterHospital] = useState('');
  const [filterCheckupMonth, setFilterCheckupMonth] = useState('');
  const [filterReportMonth, setFilterReportMonth] = useState('');

  const loadRuns = useCallback(async () => {
    setRunsLoading(true);
    setRunsError(null);
    try {
      const res = await fetch('/api/admin/health-report/runs', { credentials: 'include' });
      const data = (await res.json()) as { items?: GeneratedContentListItem[]; error?: string };
      if (!res.ok) throw new Error(data.error ?? '목록을 불러오지 못했습니다.');
      const items = Array.isArray(data.items) ? data.items : [];
      setRuns(items);
      setSelectedId((cur) => {
        if (cur && items.some((r) => r.parseRunId === cur)) return cur;
        return items[0]?.parseRunId ?? null;
      });
    } catch (e) {
      setRunsError(e instanceof Error ? e.message : '목록 실패');
      setRuns([]);
      setSelectedId(null);
    } finally {
      setRunsLoading(false);
    }
  }, []);

  useEffect(() => {
    void loadRuns();
  }, [loadRuns]);

  const hospitalOptions = useMemo(
    () => [...new Set(runs.map((r) => r.hospitalName?.trim() ?? '').filter(Boolean))].sort(),
    [runs],
  );
  const checkupMonthOptions = useMemo(
    () =>
      [...new Set(runs.map((r) => (r.parseRunCreatedAt ?? '').slice(0, 7)).filter(Boolean))].sort().reverse(),
    [runs],
  );
  const reportMonthOptions = useMemo(
    () => [...new Set(runs.map((r) => r.createdAt.slice(0, 7)).filter(Boolean))].sort().reverse(),
    [runs],
  );

  const filteredRuns = useMemo(() => {
    let items = runs;
    if (filterHospital) items = items.filter((r) => (r.hospitalName?.trim() ?? '') === filterHospital);
    if (filterCheckupMonth)
      items = items.filter((r) => (r.parseRunCreatedAt ?? '').startsWith(filterCheckupMonth));
    if (filterReportMonth) items = items.filter((r) => r.createdAt.startsWith(filterReportMonth));
    const q = search.trim().toLowerCase();
    if (!q) return items;
    return items.filter((r) => {
      const hay = [
        r.id,
        r.parseRunId,
        r.friendlyId ?? '',
        r.patientName ?? '',
        r.hospitalName ?? '',
        r.updatedAt,
        r.createdAt,
      ]
        .join(' ')
        .toLowerCase();
      return hay.includes(q);
    });
  }, [runs, filterHospital, filterCheckupMonth, filterReportMonth, search]);

  useEffect(() => {
    if (filteredRuns.length === 0) {
      setSelectedId(null);
      return;
    }
    setSelectedId((cur) => {
      if (cur && filteredRuns.some((r) => r.parseRunId === cur)) return cur;
      return filteredRuns[0]!.parseRunId;
    });
  }, [filteredRuns]);

  return (
    <div className="adminLayout2WithMain">
      <aside className="adminLayoutSecondaryRail" aria-label="건강검진 보고서 목록">
        <div className="adminRailToolbar">
          <input
            type="search"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            placeholder="병원·환자·기록번호 검색"
            aria-label="보고서 목록 검색"
            style={{
              flex: 1,
              minWidth: 0,
              padding: '8px 0',
              background: 'transparent',
              border: 0,
              borderRadius: 0,
              outline: 'none',
              font: 'inherit',
              fontSize: 13,
            }}
            disabled={runsLoading}
          />
        </div>
        {!runsLoading && runs.length > 0 && (
          <div className="adminRailFilterBar">
            <select
              className="adminRailFilterSelect"
              style={{ flexBasis: '100%' }}
              value={filterHospital}
              onChange={(e) => setFilterHospital(e.target.value)}
              aria-label="병원 필터"
            >
              <option value="">병원 전체</option>
              {hospitalOptions.map((h) => (
                <option key={h} value={h}>{h}</option>
              ))}
            </select>
            <select
              className="adminRailFilterSelect"
              value={filterCheckupMonth}
              onChange={(e) => setFilterCheckupMonth(e.target.value)}
              aria-label="검진 날짜 필터"
            >
              <option value="">검진월 전체</option>
              {checkupMonthOptions.map((m) => (
                <option key={m} value={m}>
                  {`${m.slice(2, 4)}년 ${String(Number(m.slice(5, 7)))}월`}
                </option>
              ))}
            </select>
            <select
              className="adminRailFilterSelect"
              value={filterReportMonth}
              onChange={(e) => setFilterReportMonth(e.target.value)}
              aria-label="리포트 생성 날짜 필터"
            >
              <option value="">생성월 전체</option>
              {reportMonthOptions.map((m) => (
                <option key={m} value={m}>
                  {`${m.slice(2, 4)}년 ${String(Number(m.slice(5, 7)))}월`}
                </option>
              ))}
            </select>
          </div>
        )}
        <div style={{ maxHeight: 'min(66vh, calc(100vh - 260px))', overflow: 'auto' }}>
          {runsLoading ? (
            <p style={{ margin: '10px 10px', fontSize: 12, color: '#64748b' }}>불러오는 중…</p>
          ) : runsError ? (
            <p style={{ margin: '10px 10px', fontSize: 12, color: '#b91c1c' }}>{runsError}</p>
          ) : runs.length === 0 ? (
            <p style={{ margin: '10px 10px', fontSize: 12, color: '#64748b', lineHeight: 1.5 }}>
              아직 저장된 건강검진 컨텐츠가 없습니다. chart-api에서 생성·저장된 뒤 여기 목록에 나타납니다.
            </p>
          ) : filteredRuns.length === 0 ? (
            <p style={{ margin: '10px 10px', fontSize: 12, color: '#64748b' }}>검색 결과 없음</p>
          ) : (
            filteredRuns.map((r) => (
              <button
                key={r.id}
                type="button"
                className={`adminRailRow${selectedId === r.parseRunId ? ' adminRailRowActive' : ''}`}
                onClick={() => setSelectedId(r.parseRunId)}
                disabled={runsLoading}
              >
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', gap: 6 }}>
                  <span style={{ fontWeight: 700, color: 'inherit', flex: 1, minWidth: 0, overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>
                    {r.hospitalName?.trim() || '병원명 없음'}
                  </span>
                  <span style={{ fontSize: 11, color: '#94a3b8', flexShrink: 0 }}>
                    {formatRailDateShort(r.updatedAt)}
                  </span>
                </div>
                <span className="adminRailSub">
                  {r.patientName?.trim() ? `${r.patientName.trim()} · ` : ''}
                  {r.friendlyId?.trim() ?? r.parseRunId.slice(0, 8)}
                </span>
              </button>
            ))
          )}
        </div>
      </aside>

      <div className="adminLayoutMainPane">
        <div className="adminLayoutMainColumnInset">
          {selectedId ? (
            <div style={{ borderTop: `1px solid ${divider}`, paddingTop: 12 }}>
              <AdminHealthCheckupWorkspace
                runId={selectedId}
                hospitalName={runs.find((r) => r.parseRunId === selectedId)?.hospitalName ?? undefined}
                patientName={runs.find((r) => r.parseRunId === selectedId)?.patientName ?? undefined}
                onRunsChanged={() => void loadRuns()}
              />
            </div>
          ) : (
            <p style={{ fontSize: 14, color: '#64748b' }}>목록에서 항목을 선택해 주세요.</p>
          )}
        </div>
      </div>
    </div>
  );
}
