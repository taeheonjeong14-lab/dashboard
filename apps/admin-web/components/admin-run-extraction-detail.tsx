'use client';

import Link from 'next/link';
import { useCallback, useEffect, useMemo, useState, type CSSProperties, type MouseEvent } from 'react';
import type { PlanRow, RunDetailResponse } from '@/lib/admin-run-detail-types';
import { canonicalizeLabItemName } from '@/lib/chart-extraction/lab-item-normalize';
import { speciesProfileFromBasicSpecies } from '@/lib/chart-extraction/lab-species-profile';
import { isParseRunUuid } from '@/lib/chart-extraction/uuid';

type ExtractionSection = 'basicInfo' | 'vaccination' | 'chartBody' | 'plan' | 'lab';

type DraftBasicInfo = {
  id: string | null;
  hospitalName: string;
  ownerName: string;
  patientName: string;
  species: string;
  breed: string;
  birth: string;
  age: string;
  sex: string;
};

type DraftVacRow = RunDetailResponse['vaccinationRecords'][number];

type DraftChartRow = { id: string; dateTime: string; bodyText: string };

type PlanViewGroup = {
  dateTime: string;
  rows: PlanRow[];
  planText: string;
  planDetected: boolean;
  planRowsFromDb: boolean;
};

type DraftPlanGroup = PlanViewGroup;

type DraftLabGroup = RunDetailResponse['labItemsByDate'][number];

const divider = 'rgba(15, 23, 42, 0.1)';

function planViewGroupsFromResult(res: RunDetailResponse): PlanViewGroup[] {
  if (res.chartBodyByDate.length > 0) {
    return res.chartBodyByDate.map((c) => {
      const dbRows = res.planByDate.find((p) => p.dateTime === c.dateTime)?.rows ?? [];
      const parsed = c.planRowsFromText ?? [];
      const fromDb = dbRows.length > 0;
      return {
        dateTime: c.dateTime,
        rows: fromDb ? dbRows : parsed,
        planText: c.planText,
        planDetected: c.planDetected,
        planRowsFromDb: fromDb,
      };
    });
  }
  return res.planByDate.map((p) => ({
    dateTime: p.dateTime,
    rows: p.rows,
    planText: '',
    planDetected: p.rows.length > 0,
    planRowsFromDb: p.rows.length > 0,
  }));
}

function withLabItemRawNames(groups: RunDetailResponse['labItemsByDate']): DraftLabGroup[] {
  return groups.map((g) => ({
    ...g,
    items: g.items.map((it) => ({
      ...it,
      itemRawName: it.itemRawName?.trim() ? it.itemRawName : it.itemName,
    })),
  }));
}

function defaultDateTimeForNewRow(res: RunDetailResponse): string {
  const first = res.chartBodyByDate[0]?.dateTime?.trim();
  if (first) return first;
  const d = res.run.createdAt;
  if (d && d.length >= 10) return `${d.slice(0, 10)}T00:00:00`;
  return new Date().toISOString().slice(0, 10) + 'T00:00:00';
}

function deepClone<T>(v: T): T {
  return JSON.parse(JSON.stringify(v)) as T;
}

function SectionEditControls({
  editing,
  saving,
  onEdit,
  onSave,
  onCancel,
  canSave = true,
  editDisabled = false,
}: {
  editing: boolean;
  saving: boolean;
  onEdit: () => void;
  onSave: () => void;
  onCancel: () => void;
  canSave?: boolean;
  editDisabled?: boolean;
}) {
  if (!editing) {
    return (
      <button type="button" onClick={onEdit} disabled={editDisabled} className="adminLegacySecondaryBtn">
        수정
      </button>
    );
  }
  return (
    <span style={{ display: 'inline-flex', flexWrap: 'wrap', gap: 6, alignItems: 'center' }}>
      <button type="button" onClick={onSave} disabled={saving || !canSave} className="adminLegacySecondaryBtn">
        {saving ? '저장 중…' : '저장'}
      </button>
      <button type="button" onClick={onCancel} disabled={saving} className="adminLegacySecondaryBtn">
        취소
      </button>
    </span>
  );
}

function CopyTextButton({ text, disabled, label = '복사' }: { text: string; disabled?: boolean; label?: string }) {
  const [state, setState] = useState<'idle' | 'done' | 'err'>('idle');
  async function onCopy(e: MouseEvent<HTMLButtonElement>) {
    e.preventDefault();
    e.stopPropagation();
    if (disabled || !text) return;
    try {
      await navigator.clipboard.writeText(text);
      setState('done');
      setTimeout(() => setState('idle'), 2000);
    } catch {
      setState('err');
      setTimeout(() => setState('idle'), 2000);
    }
  }
  const suffix = state === 'done' ? ' ✓' : state === 'err' ? ' !' : '';
  return (
    <button type="button" onClick={(ev) => void onCopy(ev)} disabled={disabled || !text} className="adminLegacySmallBtn">
      {label}
      {suffix}
    </button>
  );
}

export function AdminRunExtractionDetail({
  runId,
  embedded = false,
}: {
  runId: string;
  /** 차트 데이터 2열 레이아웃 안에 넣을 때 상단 안내 축소 */
  embedded?: boolean;
}) {
  const [result, setResult] = useState<RunDetailResponse | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [saveError, setSaveError] = useState<string | null>(null);

  const [editing, setEditing] = useState<Record<ExtractionSection, boolean>>({
    basicInfo: false,
    vaccination: false,
    chartBody: false,
    plan: false,
    lab: false,
  });
  const [draftBasic, setDraftBasic] = useState<DraftBasicInfo | null>(null);
  const [draftVac, setDraftVac] = useState<DraftVacRow[] | null>(null);
  const [draftChart, setDraftChart] = useState<DraftChartRow[] | null>(null);
  const [draftPlan, setDraftPlan] = useState<DraftPlanGroup[] | null>(null);
  const [planDeletedIds, setPlanDeletedIds] = useState<string[]>([]);
  const [draftLab, setDraftLab] = useState<DraftLabGroup[] | null>(null);
  const [labDeletedIds, setLabDeletedIds] = useState<string[]>([]);
  const [savingSection, setSavingSection] = useState<ExtractionSection | null>(null);

  const labSpeciesProfile = useMemo(
    () => speciesProfileFromBasicSpecies(result?.basicInfo?.species ?? null),
    [result?.basicInfo?.species],
  );

  const fetchDetail = useCallback(
    async (opts?: { silent?: boolean }) => {
      if (!runId) return;
      if (!opts?.silent) setLoading(true);
      setError(null);
      try {
        const response = await fetch(`/api/admin/runs/${encodeURIComponent(runId)}/detail`, {
          credentials: 'include',
        });
        const raw = (await response.json()) as RunDetailResponse & { error?: string };
        const chartOk = Array.isArray(raw.chartBodyByDate) && raw.run != null && typeof raw.run === 'object';
        if (!response.ok || !chartOk) {
          throw new Error(raw.error ?? 'run detail load failed');
        }
        setResult({
          ...raw,
          vaccinationRecords: raw.vaccinationRecords ?? [],
          planByDate: raw.planByDate ?? [],
          vitalsByDate: raw.vitalsByDate ?? [],
          physicalExamByDate: raw.physicalExamByDate ?? [],
          chartBodyByDate: (raw.chartBodyByDate ?? []).map((c) => ({
            ...c,
            planRowsFromText: c.planRowsFromText ?? [],
          })),
          labItemsByDate: withLabItemRawNames(raw.labItemsByDate ?? []),
        });
      } catch (e) {
        setError(e instanceof Error ? e.message : '결과 조회 실패');
        setResult(null);
      } finally {
        if (!opts?.silent) setLoading(false);
      }
    },
    [runId],
  );

  useEffect(() => {
    void fetchDetail();
  }, [fetchDetail]);

  useEffect(() => {
    setEditing({
      basicInfo: false,
      vaccination: false,
      chartBody: false,
      plan: false,
      lab: false,
    });
    setDraftBasic(null);
    setDraftVac(null);
    setDraftChart(null);
    setDraftPlan(null);
    setPlanDeletedIds([]);
    setDraftLab(null);
    setLabDeletedIds([]);
    setSaveError(null);
  }, [runId]);

  const planGroups = useMemo(() => (result ? planViewGroupsFromResult(result) : []), [result]);

  const patchExtraction = useCallback(
    async (body: object) => {
      const res = await fetch(`/api/admin/runs/${encodeURIComponent(runId)}/extraction`, {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        credentials: 'include',
        body: JSON.stringify(body),
      });
      const payload = (await res.json()) as { ok?: boolean; error?: string };
      if (!res.ok) throw new Error(payload.error ?? '저장에 실패했습니다.');
    },
    [runId],
  );

  async function saveBasicInfo() {
    if (!draftBasic) return;
    setSaveError(null);
    setSavingSection('basicInfo');
    try {
      await patchExtraction({
        section: 'basicInfo',
        basicInfo: {
          id: draftBasic.id,
          hospitalName: draftBasic.hospitalName,
          ownerName: draftBasic.ownerName,
          patientName: draftBasic.patientName,
          species: draftBasic.species,
          breed: draftBasic.breed,
          birth: draftBasic.birth,
          age: draftBasic.age.trim() === '' ? null : draftBasic.age.trim(),
          sex: draftBasic.sex,
        },
      });
      setEditing((e) => ({ ...e, basicInfo: false }));
      setDraftBasic(null);
      await fetchDetail({ silent: true });
    } catch (e) {
      setSaveError(e instanceof Error ? e.message : '저장 실패');
    } finally {
      setSavingSection(null);
    }
  }

  async function saveVaccination() {
    if (!draftVac) return;
    setSaveError(null);
    setSavingSection('vaccination');
    try {
      await patchExtraction({ section: 'vaccination', records: draftVac });
      setEditing((e) => ({ ...e, vaccination: false }));
      setDraftVac(null);
      await fetchDetail({ silent: true });
    } catch (e) {
      setSaveError(e instanceof Error ? e.message : '저장 실패');
    } finally {
      setSavingSection(null);
    }
  }

  async function saveChartBody() {
    if (!draftChart) return;
    setSaveError(null);
    setSavingSection('chartBody');
    try {
      await patchExtraction({
        section: 'chartBody',
        bodies: draftChart.map((c) => ({ id: c.id, bodyText: c.bodyText })),
      });
      setEditing((e) => ({ ...e, chartBody: false }));
      setDraftChart(null);
      await fetchDetail({ silent: true });
    } catch (e) {
      setSaveError(e instanceof Error ? e.message : '저장 실패');
    } finally {
      setSavingSection(null);
    }
  }

  async function savePlan() {
    if (!draftPlan || !result) return;
    setSaveError(null);
    setSavingSection('plan');
    try {
      const rows = draftPlan.flatMap((g) =>
        g.rows.map((r) => ({
          ...r,
          dateTime: g.dateTime,
        })),
      );
      await patchExtraction({
        section: 'plan',
        deletedRowIds: planDeletedIds,
        rows,
      });
      setEditing((e) => ({ ...e, plan: false }));
      setDraftPlan(null);
      setPlanDeletedIds([]);
      await fetchDetail({ silent: true });
    } catch (e) {
      setSaveError(e instanceof Error ? e.message : '저장 실패');
    } finally {
      setSavingSection(null);
    }
  }

  async function saveLab() {
    if (!draftLab || !result) return;
    setSaveError(null);
    setSavingSection('lab');
    try {
      const items = draftLab.flatMap((g) =>
        g.items.map((it) => ({
          id: it.id,
          dateTime: g.dateTime,
          rawItemName: it.itemRawName,
          itemName: it.itemName,
          valueText: it.valueText,
          unit: it.unit,
          referenceRange: it.referenceRange,
          flag: it.flag,
        })),
      );
      await patchExtraction({
        section: 'lab',
        deletedItemIds: labDeletedIds,
        items,
      });
      setEditing((e) => ({ ...e, lab: false }));
      setDraftLab(null);
      setLabDeletedIds([]);
      await fetchDetail({ silent: true });
    } catch (e) {
      setSaveError(e instanceof Error ? e.message : '저장 실패');
    } finally {
      setSavingSection(null);
    }
  }

  if (loading && !result) {
    return <p style={{ fontSize: 14, color: '#64748b' }}>상세 불러오는 중…</p>;
  }
  if (error || !result) {
    return (
      <div
        style={{
          padding: 16,
          border: `1px solid ${divider}`,
          background: '#fef2f2',
          color: '#991b1b',
          fontSize: 14,
        }}
      >
        {error ?? '데이터가 없습니다.'}
      </div>
    );
  }

  const summaryStyle: CSSProperties = {
    cursor: 'pointer',
    listStyle: 'none',
    padding: '10px 12px',
    fontSize: 14,
    fontWeight: 700,
    color: '#0f172a',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'space-between',
    gap: 8,
    flexWrap: 'wrap',
    userSelect: 'none',
  };

  return (
    <div style={{ paddingBottom: 24 }}>
      {!embedded ? (
        <header style={{ marginBottom: 16, display: 'flex', flexWrap: 'wrap', gap: 10, alignItems: 'center' }}>
          <h1 style={{ margin: 0, fontSize: 20, fontWeight: 800 }}>추출 결과</h1>
          <Link href="/admin/chart-data" className="adminLegacySecondaryBtn">
            기록 목록
          </Link>
          <button type="button" className="adminLegacySecondaryBtn" onClick={() => void fetchDetail({ silent: true })}>
            새로고침
          </button>
        </header>
      ) : (
        <div style={{ marginBottom: 12, display: 'flex', flexWrap: 'wrap', gap: 8, alignItems: 'center' }}>
          <span style={{ fontSize: 13, fontWeight: 700, color: '#475569' }}>선택한 건 상세</span>
          <button type="button" className="adminLegacySmallBtn" onClick={() => void fetchDetail({ silent: true })}>
            새로고침
          </button>
        </div>
      )}

      {saveError ? (
        <div style={{ marginBottom: 12, padding: 12, border: `1px solid ${divider}`, background: '#fef2f2', color: '#991b1b', fontSize: 13 }}>
          {saveError}
        </div>
      ) : null}

      <p style={{ margin: '0 0 12px', fontSize: 12, color: '#64748b' }}>
        run <code style={{ fontSize: 11 }}>{result.run.id}</code>
        {result.run.friendlyId ? (
          <>
            {' '}
            · friendly <code style={{ fontSize: 11 }}>{result.run.friendlyId}</code>
          </>
        ) : null}
        {result.run.fileName ? <> · {result.run.fileName}</> : null}
      </p>

      <section style={{ marginBottom: 12, padding: 12, background: '#f8fafc', border: `1px solid ${divider}`, fontSize: 13, color: '#334155' }}>
        <strong>차트 종류</strong> ({result.run.chartType}) — {result.chartTypeNotice}
      </section>

      <section style={{ marginBottom: 10, padding: 12, background: '#fffbeb', border: `1px solid ${divider}`, fontSize: 13, color: '#854d0e' }}>
        AI 평가·이미지 분석 패널은 추후 연동 예정입니다. (vet-report의 assessment / image-case API)
      </section>

      {/* 기본 정보 */}
      <details open style={{ border: `1px solid ${divider}`, marginBottom: 8, background: '#fff' }}>
        <summary style={summaryStyle}>
          <span>기본 정보</span>
          <span style={{ display: 'inline-flex', gap: 6, alignItems: 'center' }}>
            <CopyTextButton
              disabled={!result.basicInfo}
              text={
                result.basicInfo
                  ? [
                      result.basicInfo.hospitalName ?? '',
                      result.basicInfo.ownerName ?? '',
                      result.basicInfo.patientName ?? '',
                      result.basicInfo.species ?? '',
                      result.basicInfo.breed ?? '',
                      result.basicInfo.birth ?? '',
                      result.basicInfo.age != null ? String(result.basicInfo.age) : '',
                      result.basicInfo.sex ?? '',
                    ].join('\t')
                  : ''
              }
            />
            <SectionEditControls
              editing={editing.basicInfo}
              saving={savingSection === 'basicInfo'}
              onEdit={() => {
                const b = result.basicInfo;
                setDraftBasic(
                  b
                    ? {
                        id: b.id,
                        hospitalName: b.hospitalName ?? '',
                        ownerName: b.ownerName ?? '',
                        patientName: b.patientName ?? '',
                        species: b.species ?? '',
                        breed: b.breed ?? '',
                        birth: b.birth ?? '',
                        age: b.age != null ? String(b.age) : '',
                        sex: b.sex ?? '',
                      }
                    : {
                        id: null,
                        hospitalName: '',
                        ownerName: '',
                        patientName: '',
                        species: '',
                        breed: '',
                        birth: '',
                        age: '',
                        sex: '',
                      },
                );
                setEditing((e) => ({ ...e, basicInfo: true }));
              }}
              onSave={() => void saveBasicInfo()}
              onCancel={() => {
                setDraftBasic(null);
                setEditing((e) => ({ ...e, basicInfo: false }));
              }}
            />
          </span>
        </summary>
        <div style={{ padding: '0 12px 12px', borderTop: `1px solid ${divider}` }}>
          {editing.basicInfo && draftBasic ? (
            <div style={{ display: 'grid', gap: 8, marginTop: 10, gridTemplateColumns: '1fr 1fr' }}>
              {(
                [
                  ['hospitalName', '병원명'],
                  ['ownerName', '보호자'],
                  ['patientName', '환자명'],
                  ['species', '종'],
                  ['breed', '품종'],
                  ['birth', '생년월일'],
                  ['age', '나이(세)'],
                  ['sex', '성별'],
                ] as const
              ).map(([key, label]) => (
                <label key={key} style={{ display: 'grid', gap: 4, fontSize: 13 }}>
                  <span style={{ color: '#64748b', fontWeight: 600 }}>{label}</span>
                  <input
                    className="adminLegacyInput"
                    value={draftBasic[key]}
                    onChange={(ev) => setDraftBasic((d) => (d ? { ...d, [key]: ev.target.value } : d))}
                    style={{ padding: 8, border: `1px solid ${divider}` }}
                  />
                </label>
              ))}
            </div>
          ) : (
            <dl style={{ margin: '10px 0 0', display: 'grid', gridTemplateColumns: '7rem 1fr', gap: 6, fontSize: 13 }}>
              {result.basicInfo ? (
                <>
                  <dt style={{ color: '#64748b' }}>병원명</dt>
                  <dd style={{ margin: 0 }}>{result.basicInfo.hospitalName ?? '—'}</dd>
                  <dt style={{ color: '#64748b' }}>보호자</dt>
                  <dd style={{ margin: 0 }}>{result.basicInfo.ownerName ?? '—'}</dd>
                  <dt style={{ color: '#64748b' }}>환자</dt>
                  <dd style={{ margin: 0 }}>{result.basicInfo.patientName ?? '—'}</dd>
                  <dt style={{ color: '#64748b' }}>종/품종</dt>
                  <dd style={{ margin: 0 }}>
                    {[result.basicInfo.species, result.basicInfo.breed].filter(Boolean).join(' / ') || '—'}
                  </dd>
                  <dt style={{ color: '#64748b' }}>생일/나이</dt>
                  <dd style={{ margin: 0 }}>
                    {result.basicInfo.birth ?? '—'} / {result.basicInfo.age != null ? `${result.basicInfo.age}세` : '—'}
                  </dd>
                  <dt style={{ color: '#64748b' }}>성별</dt>
                  <dd style={{ margin: 0 }}>{result.basicInfo.sex ?? '—'}</dd>
                </>
              ) : (
                <p style={{ gridColumn: '1 / -1', margin: 0, color: '#64748b' }}>기본 정보 행이 없습니다. 저장 시 생성됩니다.</p>
              )}
            </dl>
          )}
        </div>
      </details>

      {/* 예방접종 */}
      <details open style={{ border: `1px solid ${divider}`, marginBottom: 8, background: '#fff' }}>
        <summary style={summaryStyle}>
          <span>Vaccination · 외부기생충</span>
          <span style={{ display: 'inline-flex', gap: 6, alignItems: 'center' }}>
            <CopyTextButton
              text={result.vaccinationRecords
                .map(
                  (v) =>
                    `${v.recordType}\t${v.doseOrder}\t${v.productName}\t${v.administeredDate ?? ''}\t${v.sign ?? ''}`,
                )
                .join('\n')
              }
            />
            <SectionEditControls
              editing={editing.vaccination}
              saving={savingSection === 'vaccination'}
              onEdit={() => {
                setDraftVac(deepClone(result.vaccinationRecords));
                setEditing((e) => ({ ...e, vaccination: true }));
              }}
              onSave={() => void saveVaccination()}
              onCancel={() => {
                setDraftVac(null);
                setEditing((e) => ({ ...e, vaccination: false }));
              }}
              editDisabled={result.vaccinationRecords.length === 0}
            />
          </span>
        </summary>
        <div style={{ padding: '8px 12px 12px', borderTop: `1px solid ${divider}`, overflow: 'auto' }}>
          <table className="adminLegacyTable" style={{ width: '100%', fontSize: 12, borderCollapse: 'collapse' }}>
            <thead>
              <tr>
                <th style={{ textAlign: 'left', padding: 6 }}>유형</th>
                <th style={{ textAlign: 'left', padding: 6 }}>차수</th>
                <th style={{ textAlign: 'left', padding: 6 }}>제품</th>
                <th style={{ textAlign: 'left', padding: 6 }}>접종일</th>
                <th style={{ textAlign: 'left', padding: 6 }}>서명</th>
              </tr>
            </thead>
            <tbody>
              {(editing.vaccination && draftVac ? draftVac : result.vaccinationRecords).map((v) => (
                <tr key={v.id}>
                  {editing.vaccination && draftVac ? (
                    <>
                      <td style={{ padding: 4 }}>
                        <select
                          value={v.recordType}
                          onChange={(ev) => {
                            const val = ev.target.value === 'ectoparasite' ? 'ectoparasite' : 'preventive';
                            setDraftVac((rows) =>
                              rows?.map((r) => (r.id === v.id ? { ...r, recordType: val } : r)) ?? null,
                            );
                          }}
                        >
                          <option value="preventive">preventive</option>
                          <option value="ectoparasite">ectoparasite</option>
                        </select>
                      </td>
                      <td style={{ padding: 4 }}>
                        <input
                          value={v.doseOrder}
                          onChange={(ev) =>
                            setDraftVac((rows) =>
                              rows?.map((r) => (r.id === v.id ? { ...r, doseOrder: ev.target.value } : r)) ?? null,
                            )
                          }
                        />
                      </td>
                      <td style={{ padding: 4 }}>
                        <input
                          value={v.productName}
                          onChange={(ev) =>
                            setDraftVac((rows) =>
                              rows?.map((r) => (r.id === v.id ? { ...r, productName: ev.target.value } : r)) ?? null,
                            )
                          }
                        />
                      </td>
                      <td style={{ padding: 4 }}>
                        <input
                          type="date"
                          value={v.administeredDate ?? ''}
                          onChange={(ev) =>
                            setDraftVac((rows) =>
                              rows?.map((r) =>
                                r.id === v.id ? { ...r, administeredDate: ev.target.value || null } : r,
                              ) ?? null,
                            )
                          }
                        />
                      </td>
                      <td style={{ padding: 4 }}>
                        <input
                          value={v.sign ?? ''}
                          onChange={(ev) =>
                            setDraftVac((rows) =>
                              rows?.map((r) => (r.id === v.id ? { ...r, sign: ev.target.value || null } : r)) ?? null,
                            )
                          }
                        />
                      </td>
                    </>
                  ) : (
                    <>
                      <td style={{ padding: 6 }}>{v.recordType}</td>
                      <td style={{ padding: 6 }}>{v.doseOrder}</td>
                      <td style={{ padding: 6 }}>{v.productName}</td>
                      <td style={{ padding: 6 }}>{v.administeredDate ?? '—'}</td>
                      <td style={{ padding: 6 }}>{v.sign ?? '—'}</td>
                    </>
                  )}
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </details>

      {/* 차트 본문 */}
      <details open style={{ border: `1px solid ${divider}`, marginBottom: 8, background: '#fff' }}>
        <summary style={summaryStyle}>
          <span>차트 본문 (날짜별)</span>
          <span style={{ display: 'inline-flex', gap: 6, alignItems: 'center' }}>
            <CopyTextButton
              text={result.chartBodyByDate.map((c) => `${c.dateTime}\n${c.bodyText}`).join('\n\n')}
            />
            <SectionEditControls
              editing={editing.chartBody}
              saving={savingSection === 'chartBody'}
              onEdit={() => {
                setDraftChart(
                  result.chartBodyByDate.map((c) => ({
                    id: c.id,
                    dateTime: c.dateTime,
                    bodyText: c.bodyText,
                  })),
                );
                setEditing((e) => ({ ...e, chartBody: true }));
              }}
              onSave={() => void saveChartBody()}
              onCancel={() => {
                setDraftChart(null);
                setEditing((e) => ({ ...e, chartBody: false }));
              }}
              editDisabled={result.chartBodyByDate.length === 0}
            />
          </span>
        </summary>
        <div style={{ padding: '8px 12px 12px', borderTop: `1px solid ${divider}` }}>
          {(editing.chartBody && draftChart ? draftChart : result.chartBodyByDate).map((c) => (
            <div key={c.id} style={{ marginBottom: 12 }}>
              <div style={{ fontSize: 12, fontWeight: 700, marginBottom: 6, color: '#475569' }}>{c.dateTime}</div>
              {editing.chartBody && draftChart ? (
                <textarea
                  value={draftChart.find((x) => x.id === c.id)?.bodyText ?? ''}
                  onChange={(ev) => {
                    const v = ev.target.value;
                    setDraftChart((rows) => rows?.map((r) => (r.id === c.id ? { ...r, bodyText: v } : r)) ?? null);
                  }}
                  rows={12}
                  style={{ width: '100%', fontFamily: 'inherit', fontSize: 13, padding: 8, border: `1px solid ${divider}` }}
                />
              ) : (
                <pre
                  style={{
                    margin: 0,
                    whiteSpace: 'pre-wrap',
                    fontSize: 13,
                    padding: 10,
                    background: '#f8fafc',
                    border: `1px solid ${divider}`,
                  }}
                >
                  {c.bodyText || '—'}
                </pre>
              )}
            </div>
          ))}
        </div>
      </details>

      {/* 처방·플랜 */}
      <details open style={{ border: `1px solid ${divider}`, marginBottom: 8, background: '#fff' }}>
        <summary style={summaryStyle}>
          <span>처방·플랜 (날짜별)</span>
          <span style={{ display: 'inline-flex', gap: 6, alignItems: 'center' }}>
            <CopyTextButton
              text={planGroups
                .map((g) => {
                  const header = 'code\ttreatment\tqty\tunit\tday\ttotal\troute\tsign';
                  const lines = g.rows
                    .map(
                      (r) =>
                        `${r.code ?? ''}\t${r.treatmentPrescription ?? ''}\t${r.qty ?? ''}\t${r.unit ?? ''}\t${r.day ?? ''}\t${r.total ?? ''}\t${r.route ?? ''}\t${r.signId ?? ''}`,
                    )
                    .join('\n');
                  return `${g.dateTime}\n${header}\n${lines}`;
                })
                .join('\n\n')
              }
            />
            <SectionEditControls
              editing={editing.plan}
              saving={savingSection === 'plan'}
              onEdit={() => {
                setDraftPlan(deepClone(planGroups));
                setPlanDeletedIds([]);
                setEditing((e) => ({ ...e, plan: true }));
              }}
              onSave={() => void savePlan()}
              onCancel={() => {
                setDraftPlan(null);
                setPlanDeletedIds([]);
                setEditing((e) => ({ ...e, plan: false }));
              }}
            />
          </span>
        </summary>
        <div style={{ padding: '8px 12px 12px', borderTop: `1px solid ${divider}` }}>
          {(editing.plan && draftPlan ? draftPlan : planGroups).map((g, gi) => (
            <div key={g.dateTime} style={{ marginBottom: 16 }}>
              <div style={{ fontSize: 12, fontWeight: 700, marginBottom: 6 }}>{g.dateTime}</div>
              {!g.planRowsFromDb && g.rows.length > 0 ? (
                <p style={{ fontSize: 12, color: '#b45309', margin: '0 0 6px' }}>DB 행 없음 — plan_text 파싱 미리보기(읽기 전용 표시와 동일). 저장 시 DB에 반영됩니다.</p>
              ) : null}
              <table style={{ width: '100%', fontSize: 11, borderCollapse: 'collapse' }}>
                <thead>
                  <tr>
                    <th style={{ textAlign: 'left', padding: 4 }}>코드</th>
                    <th style={{ textAlign: 'left', padding: 4 }}>처방</th>
                    <th style={{ textAlign: 'left', padding: 4 }}>수량</th>
                    <th style={{ textAlign: 'left', padding: 4 }}>단위</th>
                    <th style={{ textAlign: 'left', padding: 4 }}>일</th>
                    <th style={{ textAlign: 'left', padding: 4 }}>계</th>
                    <th style={{ textAlign: 'left', padding: 4 }}>경로</th>
                    <th style={{ textAlign: 'left', padding: 4 }}>서명</th>
                    {editing.plan ? <th /> : null}
                  </tr>
                </thead>
                <tbody>
                  {g.rows.map((r, ri) => (
                    <tr key={r.id || `new-${gi}-${ri}`}>
                      {editing.plan && draftPlan ? (
                        <>
                          {(['code', 'treatmentPrescription', 'qty', 'unit', 'day', 'total', 'route', 'signId'] as const).map(
                            (field) => (
                              <td key={field} style={{ padding: 2 }}>
                                <input
                                  style={{ width: '100%', minWidth: 48, fontSize: 11, padding: 4 }}
                                  value={(draftPlan[gi]!.rows[ri] as PlanRow)[field] ?? ''}
                                  onChange={(ev) => {
                                    const val = ev.target.value;
                                    setDraftPlan((groups) =>
                                      groups?.map((gr, gix) =>
                                        gix !== gi
                                          ? gr
                                          : {
                                              ...gr,
                                              rows: gr.rows.map((row,rix) =>
                                                rix !== ri ? row : { ...row, [field]: val || null },
                                              ),
                                            },
                                      ) ?? null,
                                    );
                                  }}
                                />
                              </td>
                            ),
                          )}
                          <td style={{ padding: 2 }}>
                            <button
                              type="button"
                              className="adminLegacySmallBtn"
                              onClick={() => {
                                if (r.id && isParseRunUuid(r.id)) setPlanDeletedIds((d) => [...d, r.id]);
                                setDraftPlan((groups) =>
                                  groups?.map((gr, gix) =>
                                    gix !== gi ? gr : { ...gr, rows: gr.rows.filter((_,rix) => rix !== ri) },
                                  ) ?? null,
                                );
                              }}
                            >
                              삭제
                            </button>
                          </td>
                        </>
                      ) : (
                        <>
                          <td style={{ padding: 4 }}>{r.code}</td>
                          <td style={{ padding: 4 }}>{r.treatmentPrescription}</td>
                          <td style={{ padding: 4 }}>{r.qty}</td>
                          <td style={{ padding: 4 }}>{r.unit}</td>
                          <td style={{ padding: 4 }}>{r.day}</td>
                          <td style={{ padding: 4 }}>{r.total}</td>
                          <td style={{ padding: 4 }}>{r.route}</td>
                          <td style={{ padding: 4 }}>{r.signId}</td>
                        </>
                      )}
                    </tr>
                  ))}
                </tbody>
              </table>
              {editing.plan && draftPlan ? (
                <button
                  type="button"
                  className="adminLegacySecondaryBtn"
                  style={{ marginTop: 6 }}
                  onClick={() => {
                    setDraftPlan((groups) =>
                      groups?.map((gr, gix) =>
                        gix !== gi
                          ? gr
                          : {
                              ...gr,
                              rows: [
                                ...gr.rows,
                                {
                                  id: '',
                                  code: null,
                                  treatmentPrescription: null,
                                  qty: null,
                                  unit: null,
                                  day: null,
                                  total: null,
                                  route: null,
                                  signId: null,
                                  rawText: null,
                                },
                              ],
                            },
                      ) ?? null,
                    );
                  }}
                >
                  행 추가
                </button>
              ) : null}
            </div>
          ))}
        </div>
      </details>

      {/* Lab */}
      <details open style={{ border: `1px solid ${divider}`, marginBottom: 8, background: '#fff' }}>
        <summary style={summaryStyle}>
          <span>Lab Examination</span>
          <span style={{ display: 'inline-flex', gap: 6, alignItems: 'center' }}>
            <CopyTextButton
              text={result.labItemsByDate
                .map((g) => {
                  const h = 'Item(raw)\tItem\tValue\tUnit\tReference\tFlag';
                  const lines = g.items
                    .map(
                      (it) =>
                        `${it.itemRawName}\t${it.itemName}\t${it.valueText}\t${it.unit ?? ''}\t${it.referenceRange ?? ''}\t${it.flag}`,
                    )
                    .join('\n');
                  return `${g.dateTime}\n${h}\n${lines}`;
                })
                .join('\n\n')
              }
            />
            <SectionEditControls
              editing={editing.lab}
              saving={savingSection === 'lab'}
              onEdit={() => {
                setDraftLab(deepClone(withLabItemRawNames(result.labItemsByDate)));
                setLabDeletedIds([]);
                setEditing((e) => ({ ...e, lab: true }));
              }}
              onSave={() => void saveLab()}
              onCancel={() => {
                setDraftLab(null);
                setLabDeletedIds([]);
                setEditing((e) => ({ ...e, lab: false }));
              }}
            />
          </span>
        </summary>
        <div style={{ padding: '8px 12px 12px', borderTop: `1px solid ${divider}` }}>
          {(editing.lab && draftLab ? draftLab : result.labItemsByDate).map((g, gi) => (
            <div key={g.dateTime} style={{ marginBottom: 14 }}>
              <div style={{ fontSize: 12, fontWeight: 700, marginBottom: 6 }}>{g.dateTime}</div>
              <table style={{ width: '100%', fontSize: 11, borderCollapse: 'collapse' }}>
                <thead>
                  <tr>
                    <th style={{ textAlign: 'left', padding: 4 }}>원문(OCR)</th>
                    <th style={{ textAlign: 'left', padding: 4 }}>정규화</th>
                    <th style={{ textAlign: 'left', padding: 4 }}>값</th>
                    <th style={{ textAlign: 'left', padding: 4 }}>단위</th>
                    <th style={{ textAlign: 'left', padding: 4 }}>참고</th>
                    <th style={{ textAlign: 'left', padding: 4 }}>플래그</th>
                    {editing.lab ? <th /> : null}
                  </tr>
                </thead>
                <tbody>
                  {g.items.map((it, ii) => (
                    <tr key={it.id || `nl-${gi}-${ii}`}>
                      {editing.lab && draftLab ? (
                        <>
                          <td style={{ padding: 2 }}>
                            <input
                              style={{ width: '100%', minWidth: 80, fontSize: 11, padding: 4 }}
                              value={draftLab[gi]!.items[ii]!.itemRawName}
                              onChange={(ev) => {
                                const raw = ev.target.value;
                                const normalized = canonicalizeLabItemName(raw, labSpeciesProfile) || raw.trim();
                                setDraftLab((groups) =>
                                  groups?.map((gr, gix) =>
                                    gix !== gi
                                      ? gr
                                      : {
                                          ...gr,
                                          items: gr.items.map((row, iix) =>
                                            iix !== ii ? row : { ...row, itemRawName: raw, itemName: normalized },
                                          ),
                                        },
                                  ) ?? null,
                                );
                              }}
                            />
                          </td>
                          <td style={{ padding: 4, color: '#64748b' }}>{draftLab[gi]!.items[ii]!.itemName}</td>
                          <td style={{ padding: 2 }}>
                            <input
                              style={{ width: '100%', fontSize: 11, padding: 4 }}
                              value={draftLab[gi]!.items[ii]!.valueText}
                              onChange={(ev) => {
                                const val = ev.target.value;
                                setDraftLab((groups) =>
                                  groups?.map((gr, gix) =>
                                    gix !== gi
                                      ? gr
                                      : {
                                          ...gr,
                                          items: gr.items.map((row, iix) =>
                                            iix !== ii ? row : { ...row, valueText: val },
                                          ),
                                        },
                                  ) ?? null,
                                );
                              }}
                            />
                          </td>
                          <td style={{ padding: 2 }}>
                            <input
                              style={{ width: '100%', fontSize: 11, padding: 4 }}
                              value={draftLab[gi]!.items[ii]!.unit ?? ''}
                              onChange={(ev) => {
                                const val = ev.target.value;
                                setDraftLab((groups) =>
                                  groups?.map((gr, gix) =>
                                    gix !== gi
                                      ? gr
                                      : {
                                          ...gr,
                                          items: gr.items.map((row, iix) =>
                                            iix !== ii ? row : { ...row, unit: val || null },
                                          ),
                                        },
                                  ) ?? null,
                                );
                              }}
                            />
                          </td>
                          <td style={{ padding: 2 }}>
                            <input
                              style={{ width: '100%', fontSize: 11, padding: 4 }}
                              value={draftLab[gi]!.items[ii]!.referenceRange ?? ''}
                              onChange={(ev) => {
                                const val = ev.target.value;
                                setDraftLab((groups) =>
                                  groups?.map((gr, gix) =>
                                    gix !== gi
                                      ? gr
                                      : {
                                          ...gr,
                                          items: gr.items.map((row, iix) =>
                                            iix !== ii ? row : { ...row, referenceRange: val || null },
                                          ),
                                        },
                                  ) ?? null,
                                );
                              }}
                            />
                          </td>
                          <td style={{ padding: 2 }}>
                            <select
                              value={draftLab[gi]!.items[ii]!.flag}
                              onChange={(ev) => {
                                const val = ev.target.value as DraftLabGroup['items'][number]['flag'];
                                setDraftLab((groups) =>
                                  groups?.map((gr, gix) =>
                                    gix !== gi
                                      ? gr
                                      : {
                                          ...gr,
                                          items: gr.items.map((row, iix) =>
                                            iix !== ii ? row : { ...row, flag: val },
                                          ),
                                        },
                                  ) ?? null,
                                );
                              }}
                            >
                              {(['low', 'high', 'normal', 'unknown'] as const).map((f) => (
                                <option key={f} value={f}>
                                  {f}
                                </option>
                              ))}
                            </select>
                          </td>
                          <td style={{ padding: 2 }}>
                            <button
                              type="button"
                              className="adminLegacySmallBtn"
                              onClick={() => {
                                if (it.id && isParseRunUuid(it.id)) setLabDeletedIds((d) => [...d, it.id]);
                                setDraftLab((groups) =>
                                  groups?.map((gr, gix) =>
                                    gix !== gi ? gr : { ...gr, items: gr.items.filter((_, iix) => iix !== ii) },
                                  ) ?? null,
                                );
                              }}
                            >
                              삭제
                            </button>
                          </td>
                        </>
                      ) : (
                        <>
                          <td style={{ padding: 4 }}>{it.itemRawName}</td>
                          <td style={{ padding: 4, color: '#64748b' }}>{it.itemName}</td>
                          <td style={{ padding: 4 }}>{it.valueText}</td>
                          <td style={{ padding: 4 }}>{it.unit ?? '—'}</td>
                          <td style={{ padding: 4 }}>{it.referenceRange ?? '—'}</td>
                          <td style={{ padding: 4 }}>{it.flag}</td>
                        </>
                      )}
                    </tr>
                  ))}
                </tbody>
              </table>
              {editing.lab && draftLab ? (
                <button
                  type="button"
                  className="adminLegacySecondaryBtn"
                  style={{ marginTop: 6 }}
                  onClick={() => {
                    setDraftLab((groups) =>
                      groups?.map((gr, gix) =>
                        gix !== gi
                          ? gr
                          : {
                              ...gr,
                              items: [
                                ...gr.items,
                                {
                                  id: '',
                                  itemName: '',
                                  itemRawName: '',
                                  valueText: '',
                                  unit: null,
                                  referenceRange: null,
                                  flag: 'unknown' as const,
                                },
                              ],
                            },
                      ) ?? null,
                    );
                  }}
                >
                  이 날짜 그룹에 행 추가
                </button>
              ) : null}
            </div>
          ))}
          {editing.lab && draftLab && draftLab.length === 0 ? (
            <button
              type="button"
              className="adminLegacySecondaryBtn"
              onClick={() => {
                setDraftLab([
                  {
                    dateTime: defaultDateTimeForNewRow(result),
                    items: [
                      {
                        id: '',
                        itemName: '',
                        itemRawName: '',
                        valueText: '',
                        unit: null,
                        referenceRange: null,
                        flag: 'unknown',
                      },
                    ],
                    source: 'rules',
                    error: null,
                  },
                ]);
              }}
            >
              Lab 그룹 추가
            </button>
          ) : null}
        </div>
      </details>

      {/* Vitals */}
      <details open style={{ border: `1px solid ${divider}`, marginBottom: 8, background: '#fff' }}>
        <summary style={summaryStyle}>
          <span>Vitals (읽기 전용)</span>
          <CopyTextButton
            text={result.vitalsByDate
              .map(
                (v) =>
                  `${v.dateTime}\t${v.weight ?? ''}\t${v.temperature ?? ''}\t${v.respiratoryRate ?? ''}\t${v.heartRate ?? ''}\t${v.bpSystolic ?? ''}\t${v.bpDiastolic ?? ''}`,
              )
              .join('\n')
            }
          />
        </summary>
        <div style={{ padding: '8px 12px 12px', borderTop: `1px solid ${divider}`, overflow: 'auto' }}>
          <table style={{ width: '100%', fontSize: 12, borderCollapse: 'collapse' }}>
            <thead>
              <tr>
                <th style={{ textAlign: 'left', padding: 4 }}>일시</th>
                <th style={{ textAlign: 'left', padding: 4 }}>체중</th>
                <th style={{ textAlign: 'left', padding: 4 }}>체온</th>
                <th style={{ textAlign: 'left', padding: 4 }}>호흡</th>
                <th style={{ textAlign: 'left', padding: 4 }}>심박</th>
                <th style={{ textAlign: 'left', padding: 4 }}>혈압</th>
              </tr>
            </thead>
            <tbody>
              {result.vitalsByDate.map((v) => (
                <tr key={v.id}>
                  <td style={{ padding: 4 }}>{v.dateTime}</td>
                  <td style={{ padding: 4 }}>{v.weight ?? '—'}</td>
                  <td style={{ padding: 4 }}>{v.temperature ?? '—'}</td>
                  <td style={{ padding: 4 }}>{v.respiratoryRate ?? '—'}</td>
                  <td style={{ padding: 4 }}>{v.heartRate ?? '—'}</td>
                  <td style={{ padding: 4 }}>
                    {v.bpSystolic ?? '—'}/{v.bpDiastolic ?? '—'}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </details>

      {/* Physical */}
      <details open style={{ border: `1px solid ${divider}`, marginBottom: 8, background: '#fff' }}>
        <summary style={summaryStyle}>
          <span>신체검사 (읽기 전용)</span>
          <CopyTextButton
            text={result.physicalExamByDate
              .map((g) =>
                [g.dateTime, ...g.items.map((i) => `${i.itemName}\t${i.valueText}\t${i.unit ?? ''}\t${i.referenceRange ?? ''}`)].join(
                  '\n',
                ),
              )
              .join('\n\n')
            }
          />
        </summary>
        <div style={{ padding: '8px 12px 12px', borderTop: `1px solid ${divider}` }}>
          {result.physicalExamByDate.map((g) => (
            <div key={g.dateTime} style={{ marginBottom: 10 }}>
              <div style={{ fontSize: 12, fontWeight: 700, marginBottom: 4 }}>{g.dateTime}</div>
              <table style={{ width: '100%', fontSize: 11, borderCollapse: 'collapse' }}>
                <thead>
                  <tr>
                    <th style={{ textAlign: 'left', padding: 4 }}>항목</th>
                    <th style={{ textAlign: 'left', padding: 4 }}>값</th>
                    <th style={{ textAlign: 'left', padding: 4 }}>단위</th>
                    <th style={{ textAlign: 'left', padding: 4 }}>참고</th>
                  </tr>
                </thead>
                <tbody>
                  {g.items.map((i) => (
                    <tr key={i.id}>
                      <td style={{ padding: 4 }}>{i.itemName}</td>
                      <td style={{ padding: 4 }}>{i.valueText}</td>
                      <td style={{ padding: 4 }}>{i.unit ?? '—'}</td>
                      <td style={{ padding: 4 }}>{i.referenceRange ?? '—'}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          ))}
        </div>
      </details>
    </div>
  );
}
