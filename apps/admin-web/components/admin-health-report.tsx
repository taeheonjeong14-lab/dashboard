'use client';

import { useCallback, useEffect, useMemo, useState } from 'react';
import { AdminHealthCheckupWorkspace } from '@/components/admin-health-checkup-workspace';
import type { GeneratedContentListItem } from '@/lib/health-report-admin/types';

const divider = 'rgba(15, 23, 42, 0.1)';

function formatRailDate(iso: string): string {
  try {
    return new Date(iso).toLocaleString('ko-KR', {
      month: 'numeric',
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
    });
  } catch {
    return iso;
  }
}

export default function AdminHealthReport() {
  const [runs, setRuns] = useState<GeneratedContentListItem[]>([]);
  const [runsLoading, setRunsLoading] = useState(true);
  const [runsError, setRunsError] = useState<string | null>(null);
  const [selectedId, setSelectedId] = useState<string | null>(null);
  const [search, setSearch] = useState('');

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

  const filteredRuns = useMemo(() => {
    const q = search.trim().toLowerCase();
    if (!q) return runs;
    return runs.filter((r) => {
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
  }, [runs, search]);

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
        <div style={{ maxHeight: 'min(66vh, calc(100vh - 220px))', overflow: 'auto' }}>
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
                <span style={{ display: 'block', fontWeight: 700, color: 'inherit' }}>
                  {r.patientName?.trim() || r.friendlyId?.trim() || r.parseRunId.slice(0, 8)}
                </span>
                <span className="adminRailSub">{r.hospitalName?.trim() || '병원명 없음'}</span>
                <span className="adminRailSub" style={{ marginTop: 2 }}>
                  {formatRailDate(r.updatedAt)}
                </span>
              </button>
            ))
          )}
        </div>
      </aside>

      <div className="adminLayoutMainPane">
        <div className="adminLayoutMainColumnInset">
          <header style={{ marginBottom: 16 }}>
            <h1
              style={{
                fontSize: 22,
                margin: '0 0 8px',
                fontWeight: 700,
                color: '#0f172a',
                letterSpacing: '-0.02em',
              }}
            >
              건강검진
            </h1>
            <p style={{ margin: 0, color: '#475569', fontSize: 14, lineHeight: 1.55 }}>
              왼쪽은 <code style={{ fontSize: 12 }}>health_checkup</code> 이 저장된 run 목록입니다. 선택 시 생성 결과를 불러와
              검토·수정·저장합니다 (vet-report <code style={{ fontSize: 12 }}>/runs/…/content</code> 계약과 호환).
            </p>
          </header>

          {selectedId ? (
            <div style={{ borderTop: `1px solid ${divider}`, paddingTop: 12 }}>
              <AdminHealthCheckupWorkspace runId={selectedId} onRunsChanged={() => void loadRuns()} />
            </div>
          ) : (
            <p style={{ fontSize: 14, color: '#64748b' }}>목록에서 항목을 선택해 주세요.</p>
          )}
        </div>
      </div>
    </div>
  );
}
