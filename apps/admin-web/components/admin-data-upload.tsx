'use client';

import type { ChartHospitalOption } from '@/lib/chart-extraction/chart-admin-hospitals';
import { parseChartAdminHospitalsResponse } from '@/lib/chart-extraction/chart-admin-hospitals';
import type { CSSProperties } from 'react';
import { FormEvent, useEffect, useState } from 'react';
import Link from 'next/link';
import { useRouter, useSearchParams } from 'next/navigation';
import { useChartExtraction } from '@/components/chart-extraction-provider';
import AdminDataConsole from '@/components/admin-data-console';

const MAX_PDF_BYTES = 30 * 1024 * 1024;

type UploadSection = 'pdf' | 'stats';

export default function AdminDataUpload() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const [section, setSection] = useState<UploadSection>('pdf');
  const { startExtract, status, error: extractError } = useChartExtraction();
  const [localError, setLocalError] = useState<string | null>(null);
  const [chartType, setChartType] = useState<string>('intovet');
  const [hospitals, setHospitals] = useState<ChartHospitalOption[]>([]);
  const [hospitalsLoading, setHospitalsLoading] = useState(true);
  const [hospitalsError, setHospitalsError] = useState<string | null>(null);
  const [patchRunId, setPatchRunId] = useState('');
  const [patchJson, setPatchJson] = useState(
    '{\n  "section": "basicInfo",\n  "basicInfo": {\n    "patientName": "수정 예시"\n  }\n}',
  );
  const [patchBusy, setPatchBusy] = useState(false);
  const [patchMessage, setPatchMessage] = useState<string | null>(null);

  useEffect(() => {
    let cancelled = false;
    void (async () => {
      setHospitalsLoading(true);
      setHospitalsError(null);
      try {
        const res = await fetch('/api/admin/data/hospitals', { credentials: 'include' });
        const data = (await res.json()) as { hospitals?: unknown; error?: string };
        if (!res.ok) {
          if (!cancelled) {
            setHospitalsError(data.error ?? '병원 목록을 불러오지 못했습니다.');
            setHospitals([]);
          }
          return;
        }
        if (!cancelled) setHospitals(parseChartAdminHospitalsResponse(data));
      } catch {
        if (!cancelled) {
          setHospitalsError('병원 목록을 불러오지 못했습니다.');
          setHospitals([]);
        }
      } finally {
        if (!cancelled) setHospitalsLoading(false);
      }
    })();
    return () => {
      cancelled = true;
    };
  }, []);

  useEffect(() => {
    if (searchParams.get('section') === 'stats') setSection('stats');
  }, [searchParams]);

  const isExtractRunning = status === 'running';

  async function onSubmit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    setLocalError(null);
    const formData = new FormData(event.currentTarget);
    const file = formData.get('file');
    const hospitalId = formData.get('hospitalId');
    if (typeof hospitalId !== 'string' || !hospitalId.trim()) {
      setLocalError('병원을 선택해 주세요.');
      return;
    }
    if (file instanceof File && file.size > MAX_PDF_BYTES) {
      setLocalError(`PDF는 ${MAX_PDF_BYTES / 1024 / 1024}MB 이하만 업로드할 수 있습니다.`);
      return;
    }
    formData.delete('chartPasteText');
    formData.delete('efriendsChartBlocksJson');
    await startExtract(formData);
  }

  async function sendPatch() {
    setPatchMessage(null);
    if (!patchRunId.trim()) {
      setPatchMessage('보정할 runId를 입력해 주세요.');
      return;
    }
    let body: unknown;
    try {
      body = JSON.parse(patchJson);
    } catch {
      setPatchMessage('보정 JSON 형식이 올바르지 않습니다.');
      return;
    }
    setPatchBusy(true);
    try {
      const res = await fetch(`/api/admin/runs/${encodeURIComponent(patchRunId.trim())}/extraction`, {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        credentials: 'include',
        body: JSON.stringify(body),
      });
      const data = (await res.json()) as { ok?: boolean; error?: string };
      if (!res.ok || !data.ok) throw new Error(data.error || '보정 실패');
      setPatchMessage('보정이 반영되었습니다.');
    } catch (e) {
      setPatchMessage(`보정 실패: ${e instanceof Error ? e.message : String(e)}`);
    } finally {
      setPatchBusy(false);
    }
  }

  const error = localError ?? (status === 'error' ? extractError : null);
  const canSubmit =
    !isExtractRunning && !hospitalsLoading && hospitals.length > 0 && !hospitalsError;

  const selectLineStyle: CSSProperties = {
    padding: '10px 0',
    border: 0,
    borderBottom: '1px solid rgba(15, 23, 42, 0.1)',
    borderRadius: 0,
    background: 'transparent',
    color: '#0f172a',
    font: 'inherit',
    width: '100%',
  };

  return (
    <div className="adminLayout2WithMain">
      <nav className="adminLayoutSecondaryRail" aria-label="데이터 수집 유형">
        <button
          type="button"
          className={`adminRailRow${section === 'pdf' ? ' adminRailRowActive' : ''}`}
          onClick={() => {
            setSection('pdf');
            router.replace('/admin/data-upload', { scroll: false });
          }}
        >
          PDF 업로드
        </button>
        <button
          type="button"
          className={`adminRailRow${section === 'stats' ? ' adminRailRowActive' : ''}`}
          onClick={() => {
            setSection('stats');
            router.replace('/admin/data-upload?section=stats', { scroll: false });
          }}
        >
          경영통계 업로드
        </button>
      </nav>

      <div className="adminLayoutMainPane">
        <div className="adminLayoutMainColumnInset">
          {section === 'pdf' ? (
            <>
              <header style={{ marginBottom: 20 }}>
                <h1
                  style={{
                    fontSize: 22,
                    margin: '0 0 8px',
                    fontWeight: 700,
                    color: '#0f172a',
                    letterSpacing: '-0.02em',
                  }}
                >
                  PDF 업로드
                </h1>
                <p style={{ margin: '0 0 8px', color: '#475569', fontSize: 14, lineHeight: 1.55 }}>
                  PDF 파일을 업로드하면 차트 본문·접종·검사 등을 의미 단위 버킷으로 나누어 저장합니다. 완료 후 실행
                  ID로 후속 작업(보정 등)을 이어갈 수 있습니다.
                </p>
                <p style={{ margin: 0, color: '#64748b', fontSize: 13 }}>
                  업로드 가능한 PDF 크기는 최대 30MB입니다. 텍스트가 없는 스캔 전용 PDF는 지원하지 않습니다(OCR
                  미포함).
                </p>
              </header>

              <div className="adminLegacyBlockBleed">
                <form onSubmit={(e) => void onSubmit(e)} style={{ display: 'grid', gap: 14 }}>
                  <div style={{ display: 'grid', gap: 12 }}>
                    <div
                      style={{
                        display: 'grid',
                        gridTemplateColumns: 'repeat(auto-fill, minmax(220px, 1fr))',
                        gap: 16,
                      }}
                    >
                      <div style={{ display: 'grid', gap: 6 }}>
                        <label htmlFor="hospitalId" style={{ fontSize: 13, fontWeight: 600, color: '#334155' }}>
                          병원 <span style={{ color: '#b91c1c', fontWeight: 700 }}>필수</span>
                        </label>
                        {hospitalsLoading ? (
                          <p style={{ margin: '8px 0 0', fontSize: 13, color: '#64748b' }}>병원 목록 불러오는 중…</p>
                        ) : hospitalsError ? (
                          <p style={{ margin: '8px 0 0', fontSize: 13, color: '#b91c1c' }}>{hospitalsError}</p>
                        ) : hospitals.length === 0 ? (
                          <p style={{ margin: '8px 0 0', fontSize: 13, color: '#475569' }}>
                            등록된 병원이 없습니다.{' '}
                            <Link href="/admin/users/hospitals" style={{ fontWeight: 700, color: '#0f172a' }}>
                              병원 관리
                            </Link>
                            에서 병원을 추가해 주세요.
                          </p>
                        ) : (
                          <select id="hospitalId" name="hospitalId" required defaultValue="" style={selectLineStyle}>
                            <option value="" disabled>
                              병원 선택
                            </option>
                            {hospitals.map((h) => (
                              <option key={h.id} value={h.id}>
                                {h.name_ko}
                              </option>
                            ))}
                          </select>
                        )}
                      </div>
                      <div style={{ display: 'grid', gap: 6 }}>
                        <label htmlFor="chartType" style={{ fontSize: 13, fontWeight: 600, color: '#334155' }}>
                          차트 종류
                        </label>
                        <select
                          id="chartType"
                          name="chartType"
                          value={chartType}
                          onChange={(e) => setChartType(e.target.value)}
                          style={selectLineStyle}
                        >
                          <option value="intovet">인투벳</option>
                          <option value="plusvet">플러스벳</option>
                          <option value="efriends">이프렌즈</option>
                          <option value="other">기타</option>
                        </select>
                      </div>
                    </div>
                    <div style={{ display: 'grid', gap: 6 }}>
                      <label htmlFor="file" style={{ fontSize: 13, fontWeight: 600, color: '#334155' }}>
                        PDF 파일
                      </label>
                      <input id="file" name="file" type="file" accept=".pdf,application/pdf" required />
                    </div>
                  </div>
                  <div className="adminLegacyActions" style={{ marginTop: 4 }}>
                    <button type="submit" className="adminLegacyPrimaryBtn" disabled={!canSubmit}>
                      {isExtractRunning ? '처리 중...' : '실행'}
                    </button>
                  </div>
                </form>
              </div>

              {error ? (
                <div
                  className="adminLegacyBlockBleed"
                  style={{
                    color: '#991b1b',
                    borderBottom: '1px solid rgba(185, 28, 28, 0.25)',
                  }}
                >
                  <p style={{ margin: 0, fontSize: 14 }}>{error}</p>
                </div>
              ) : null}

              <details className="adminMainAccordion">
                <summary
                  className="adminAccordionSummary"
                  style={{ cursor: 'pointer', fontWeight: 700, fontSize: 14, listStyle: 'none' }}
                >
                  고급: 추출 결과 보정 (PATCH /api/admin/runs/…/extraction)
                </summary>
                <div style={{ marginTop: 14, display: 'grid', gap: 12 }}>
                  <label style={{ gridColumn: '1 / -1' }}>
                    runId
                    <input value={patchRunId} onChange={(e) => setPatchRunId(e.target.value)} disabled={patchBusy} />
                  </label>
                  <label style={{ gridColumn: '1 / -1' }}>
                    patch JSON
                    <textarea
                      value={patchJson}
                      onChange={(e) => setPatchJson(e.target.value)}
                      rows={10}
                      disabled={patchBusy}
                    />
                  </label>
                  <div className="adminLegacyActions" style={{ gridColumn: '1 / -1' }}>
                    <button
                      type="button"
                      className="adminLegacySecondaryBtn"
                      onClick={() => void sendPatch()}
                      disabled={patchBusy}
                    >
                      보정 반영
                    </button>
                  </div>
                  {patchMessage ? (
                    <p style={{ gridColumn: '1 / -1', margin: 0, fontSize: 13, color: '#475569' }}>{patchMessage}</p>
                  ) : null}
                </div>
              </details>
            </>
          ) : (
            <>
              <header style={{ marginBottom: 20 }}>
                <h1
                  style={{
                    fontSize: 22,
                    margin: '0 0 8px',
                    fontWeight: 700,
                    color: '#0f172a',
                    letterSpacing: '-0.02em',
                  }}
                >
                  경영통계 업로드
                </h1>
                <p style={{ margin: 0, color: '#475569', fontSize: 14, lineHeight: 1.55 }}>
                  병원별 실적·엑셀 업로드 및 차트 종류별 안내는 아래 콘솔에서 처리합니다. (기존 <strong>통계</strong>{' '}
                  메뉴에 있던 화면과 동일합니다.)
                </p>
              </header>
              <div className="adminMainSingleGutter" style={{ paddingTop: 0, maxWidth: 1280 }}>
                <AdminDataConsole mode="performance" />
              </div>
            </>
          )}
        </div>
      </div>
    </div>
  );
}
