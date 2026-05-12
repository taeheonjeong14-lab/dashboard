'use client';

import Link from 'next/link';
import { useCallback, useEffect, useMemo, useState, type CSSProperties } from 'react';
import {
  HEALTH_CHECKUP_DENTAL_SKIN_ROW_MAX_CHARS,
  HEALTH_CHECKUP_LAB_INTERP_MAX_CHARS,
  HEALTH_CHECKUP_MAX_COVER_CHECKUP_DATE_CHARS,
  HEALTH_CHECKUP_MAX_COVER_FIELD_CHARS,
  HEALTH_CHECKUP_MAX_COVER_SEX_CHARS,
  HEALTH_CHECKUP_MAX_COVER_SHORT_FIELD_CHARS,
  HEALTH_CHECKUP_MAX_FOLLOW_UP_CHARS,
  HEALTH_CHECKUP_MAX_OVERALL_CHARS,
  HEALTH_CHECKUP_MAX_RECHECK_BODY_CHARS,
  HEALTH_CHECKUP_MAX_RECHECK_TITLE_CHARS,
  HEALTH_CHECKUP_MIN_FOLLOW_UP_CHARS,
  HEALTH_CHECKUP_MIN_OVERALL_CHARS,
  HEALTH_CHECKUP_MUST_INCLUDE_MAX_CHARS,
  HEALTH_CHECKUP_SYSTEMS_ROW_MAX_CHARS,
} from '@/lib/health-report-admin/limits';
import { mergeHealthPayloadFromStorage, emptyHealthCheckupPayload } from '@/lib/health-report-admin/payload-defaults';
import type { HealthCheckupGeneratedContent } from '@/lib/health-report-admin/types';
import { joinTimelineCardText, splitTimelineCardText } from '@/lib/health-report-admin/timeline-card';
import type { HealthSystemsReportBlock } from '@/lib/health-report-admin/health-systems-types';
import { parseHealthSystemsBlocksFromUnknown } from '@/lib/health-report-admin/health-systems-blocks-parse';
import { AdminHealthReportImageSlots } from '@/components/admin-health-report-image-slots';
import { HealthReportPreviewModal } from '@/components/health-report-preview-modal';

const divider = 'rgba(15, 23, 42, 0.1)';

const labelGrid: CSSProperties = { fontSize: 13, display: 'grid', gap: 4 };

const SPECIES_OPTIONS = ['Canine (개)', 'Feline (고양이)'] as const;
const SEX_OPTIONS = ['암컷(중성화)', '수컷(중성화)', '암컷', '수컷'] as const;

const SYSTEM_KEYS = [
  'systemsPage3Blocks',
  'systemsPage3bBlocks',
  'systemsPage4Blocks',
  'systemsPage5Blocks',
] as const;

type SystemKey = (typeof SYSTEM_KEYS)[number];

const SYSTEM_PAGE_LABELS: Record<SystemKey, string> = {
  systemsPage3Blocks: '장기 시트 (3p)',
  systemsPage3bBlocks: '장기 시트 (3b)',
  systemsPage4Blocks: '치과·피부 (5p)',
  systemsPage5Blocks: '영상·초음파 (6p)',
};

function rowMaxCharsForSystemKey(k: SystemKey): number {
  return k === 'systemsPage5Blocks' ? HEALTH_CHECKUP_DENTAL_SKIN_ROW_MAX_CHARS : HEALTH_CHECKUP_SYSTEMS_ROW_MAX_CHARS;
}

function getStructuredBlocksFromDraft(d: HealthCheckupGeneratedContent, k: SystemKey): HealthSystemsReportBlock[] {
  const v = d[k] as unknown;
  if (!Array.isArray(v) || v.length === 0) return [];
  return parseHealthSystemsBlocksFromUnknown(v) ?? [];
}

function clamp(s: string, max: number): string {
  return s.length <= max ? s : s.slice(0, max);
}

function appendUnitIfNeeded(value: string, suffix: string): string {
  const t = value.trim();
  if (!t) return t;
  if (t.includes(suffix)) return t;
  if (/\d/.test(t)) return `${t}${suffix}`;
  return t;
}

type ContentItem = {
  id: string;
  contentType: string;
  payload: unknown;
  createdAt: string;
  updatedAt: string;
};

export function AdminHealthCheckupWorkspace({
  runId,
  onRunsChanged,
}: {
  runId: string;
  onRunsChanged?: () => void;
}) {
  const [items, setItems] = useState<ContentItem[]>([]);
  const [loadError, setLoadError] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);

  const [draft, setDraft] = useState<HealthCheckupGeneratedContent>(() => emptyHealthCheckupPayload());
  /** 키가 있으면 해당 시트는 원시 JSON 모드(스키마 불일치 시 자동 진입). */
  const [systemsJsonRaw, setSystemsJsonRaw] = useState<Partial<Record<SystemKey, string>>>({});

  const [checkupDate, setCheckupDate] = useState('');
  const [veterinarian, setVeterinarian] = useState('');
  const [mustInclude, setMustInclude] = useState('');
  const [coverProgram, setCoverProgram] = useState('');

  const [saveError, setSaveError] = useState<string | null>(null);
  const [saving, setSaving] = useState(false);
  const [generating, setGenerating] = useState(false);
  const [genError, setGenError] = useState<string | null>(null);

  const [pdfBusy, setPdfBusy] = useState(false);
  const [shareBusy, setShareBusy] = useState(false);
  const [sharePanel, setSharePanel] = useState<{ shareUrl: string; expiresAt: string } | null>(null);
  const [previewOpen, setPreviewOpen] = useState(false);

  const healthItem = useMemo(() => items.find((i) => i.contentType === 'health_checkup') ?? null, [items]);
  const hasContent = healthItem != null;

  const loadContent = useCallback(async () => {
    setLoading(true);
    setLoadError(null);
    try {
      const res = await fetch(`/api/admin/health-report/content?runId=${encodeURIComponent(runId)}`, {
        credentials: 'include',
      });
      const data = (await res.json()) as { runId?: string; items?: ContentItem[]; error?: string };
      if (!res.ok) throw new Error(data.error ?? '불러오기 실패');
      const list = Array.isArray(data.items) ? data.items : [];
      setItems(list);
      const hc = list.find((i) => i.contentType === 'health_checkup');
      if (hc) {
        const merged = mergeHealthPayloadFromStorage(hc.payload);
        setDraft(merged);
        const raw: Partial<Record<SystemKey, string>> = {};
        for (const k of SYSTEM_KEYS) {
          const arr = Array.isArray(merged[k]) ? (merged[k] as unknown[]) : [];
          if (arr.length > 0 && parseHealthSystemsBlocksFromUnknown(arr) === null) {
            try {
              raw[k] = JSON.stringify(arr, null, 2);
            } catch {
              raw[k] = '[]';
            }
          }
        }
        setSystemsJsonRaw(raw);
      } else {
        setDraft(emptyHealthCheckupPayload());
        setSystemsJsonRaw({});
      }
    } catch (e) {
      setLoadError(e instanceof Error ? e.message : '불러오기 실패');
      setItems([]);
    } finally {
      setLoading(false);
    }
  }, [runId]);

  useEffect(() => {
    void loadContent();
  }, [loadContent]);

  useEffect(() => {
    setSharePanel(null);
    setPreviewOpen(false);
  }, [runId]);

  function setRecheckField(
    key: keyof Pick<
      HealthCheckupGeneratedContent,
      'recheckWithin1to2Weeks' | 'recheckWithin1Month' | 'recheckWithin3Months' | 'recheckWithin6Months'
    >,
    part: 'title' | 'body',
    value: string,
  ) {
    const cur = draft[key];
    const { cardTitle, cardBody } = splitTimelineCardText(typeof cur === 'string' ? cur : '');
    const nextTitle = part === 'title' ? value : cardTitle;
    const nextBody = part === 'body' ? value : cardBody;
    const title = clamp(nextTitle, HEALTH_CHECKUP_MAX_RECHECK_TITLE_CHARS);
    const body = clamp(nextBody, HEALTH_CHECKUP_MAX_RECHECK_BODY_CHARS);
    setDraft((d) => ({ ...d, [key]: joinTimelineCardText(title, body) }));
  }

  function buildPayloadForSave(): HealthCheckupGeneratedContent | null {
    const next: HealthCheckupGeneratedContent = { ...draft };
    for (const k of SYSTEM_KEYS) {
      const raw = systemsJsonRaw[k];
      if (raw !== undefined) {
        try {
          const parsed = JSON.parse(raw) as unknown;
          if (!Array.isArray(parsed)) {
            setSaveError(`${k}: JSON은 배열이어야 합니다.`);
            return null;
          }
          if (parsed.length > 0 && parseHealthSystemsBlocksFromUnknown(parsed) === null) {
            setSaveError(`${k}: 블록 스키마가 올바르지 않습니다. vet-report HealthSystemsReportBlock[] 형식을 확인하세요.`);
            return null;
          }
          (next as Record<string, unknown>)[k] = parsed;
        } catch {
          setSaveError(`${k} JSON 형식이 올바르지 않습니다.`);
          return null;
        }
      } else {
        const v = draft[k];
        (next as Record<string, unknown>)[k] = Array.isArray(v) ? v : [];
      }
    }
    setSaveError(null);
    return next;
  }

  async function saveReview() {
    const payload = buildPayloadForSave();
    if (!payload) return;
    setSaving(true);
    setSaveError(null);
    try {
      const res = await fetch('/api/admin/health-report/content', {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        credentials: 'include',
        body: JSON.stringify({
          runId,
          contentType: 'health_checkup',
          payload,
        }),
      });
      const data = (await res.json()) as { ok?: boolean; error?: string };
      if (!res.ok || !data.ok) throw new Error(data.error ?? '저장 실패');
      await loadContent();
      onRunsChanged?.();
    } catch (e) {
      setSaveError(e instanceof Error ? e.message : '저장 실패');
    } finally {
      setSaving(false);
    }
  }

  async function generateContent() {
    setGenerating(true);
    setGenError(null);
    try {
      const res = await fetch('/api/admin/health-report/generate', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        credentials: 'include',
        body: JSON.stringify({
          runId,
          contentType: 'health_checkup',
          checkupDate: checkupDate.trim(),
          veterinarian: veterinarian.trim(),
          mustInclude: mustInclude.trim().slice(0, HEALTH_CHECKUP_MUST_INCLUDE_MAX_CHARS),
          coverProgram: coverProgram.trim(),
        }),
      });
      const data = (await res.json()) as { error?: string; generated?: unknown; saved?: unknown };
      if (!res.ok) {
        throw new Error(data.error ?? `생성 실패 (${res.status})`);
      }
      await loadContent();
      onRunsChanged?.();
    } catch (e) {
      setGenError(e instanceof Error ? e.message : '생성 실패');
    } finally {
      setGenerating(false);
    }
  }

  const overallLen = draft.overallSummary.length;
  const followLen = draft.followUpCare.length;

  const downloadPdf = useCallback(async () => {
    setPdfBusy(true);
    try {
      const res = await fetch(`/api/admin/health-report/export-pdf?runId=${encodeURIComponent(runId)}`, {
        credentials: 'include',
      });
      const ct = res.headers.get('Content-Type') ?? '';
      if (!res.ok) {
        const t = await res.text();
        let msg = `PDF 실패 (${res.status})`;
        try {
          const j = JSON.parse(t) as { error?: string };
          if (j.error) msg = j.error;
        } catch {
          if (t.trim()) msg = t.slice(0, 400);
        }
        throw new Error(msg);
      }
      if (!ct.includes('application/pdf')) {
        const t = await res.text();
        throw new Error(t.trim().slice(0, 400) || 'PDF가 아닌 응답입니다.');
      }
      const cd = res.headers.get('Content-Disposition');
      let filename = `health_checkup_${runId.slice(0, 8)}.pdf`;
      if (cd) {
        const star = /filename\*=UTF-8''([^;]+)/i.exec(cd);
        if (star) {
          try {
            filename = decodeURIComponent(star[1].trim().replace(/^"+|"+$/g, ''));
          } catch {
            /* keep default */
          }
        } else {
          const plain = /filename="([^"]+)"/i.exec(cd);
          if (plain?.[1]) filename = plain[1];
        }
      }
      const buf = await res.arrayBuffer();
      const head = new Uint8Array(buf.byteLength < 5 ? buf : buf.slice(0, 5));
      const sig = String.fromCharCode(...head);
      if (sig !== '%PDF-') {
        const preview = new TextDecoder().decode(buf.byteLength > 800 ? buf.slice(0, 800) : buf);
        throw new Error(preview.trim().slice(0, 300) || 'PDF 시그니처가 아닙니다.');
      }
      const blob = new Blob([buf], { type: 'application/pdf' });
      const objectUrl = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = objectUrl;
      a.download = filename;
      a.rel = 'noopener';
      document.body.appendChild(a);
      a.click();
      a.remove();
      URL.revokeObjectURL(objectUrl);
    } catch (e) {
      window.alert(e instanceof Error ? e.message : 'PDF 실패');
    } finally {
      setPdfBusy(false);
    }
  }, [runId]);

  const issueExternalShareLink = useCallback(async () => {
    setShareBusy(true);
    try {
      const res = await fetch('/api/admin/health-report/review-share', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        credentials: 'include',
        body: JSON.stringify({ runId }),
      });
      const data = (await res.json()) as { ok?: boolean; shareUrl?: string; expiresAt?: string; error?: string };
      if (!res.ok) throw new Error(data.error ?? '링크 발급 실패');
      if (!data.shareUrl) throw new Error('shareUrl 없음');
      setSharePanel({ shareUrl: data.shareUrl, expiresAt: data.expiresAt ?? '' });
    } catch (e) {
      window.alert(e instanceof Error ? e.message : '링크 발급 실패');
    } finally {
      setShareBusy(false);
    }
  }, [runId]);

  if (loading && items.length === 0 && !loadError) {
    return <p style={{ fontSize: 14, color: '#64748b' }}>불러오는 중…</p>;
  }

  return (
    <>
      <div style={{ paddingBottom: 32 }}>
      <div style={{ marginBottom: 14, display: 'flex', flexWrap: 'wrap', gap: 10, alignItems: 'center' }}>
        <Link href="/admin/chart-data" className="adminLegacySmallBtn">
          차트 데이터(이력)
        </Link>
        <Link href={`/admin/runs/${encodeURIComponent(runId)}`} className="adminLegacySmallBtn">
          추출 상세
        </Link>
        <code style={{ fontSize: 11, color: '#64748b' }}>{runId}</code>
      </div>

      {loadError ? (
        <p style={{ color: '#b91c1c', fontSize: 14 }}>{loadError}</p>
      ) : null}
      {saveError ? (
        <p style={{ color: '#b91c1c', fontSize: 14 }}>{saveError}</p>
      ) : null}
      {genError ? (
        <p style={{ color: '#b91c1c', fontSize: 14 }}>{genError}</p>
      ) : null}

      {healthItem ? (
        <p style={{ fontSize: 12, color: '#64748b', marginBottom: 16 }}>
          마지막 저장 {new Date(healthItem.updatedAt).toLocaleString('ko-KR')}
        </p>
      ) : null}

      {!hasContent ? (
        <section style={{ marginBottom: 20, padding: 16, border: `1px solid ${divider}`, background: '#f8fafc' }}>
          <h2 style={{ margin: '0 0 12px', fontSize: 16, fontWeight: 800 }}>생성 전 정보</h2>
          <div style={{ display: 'grid', gap: 10, maxWidth: 560 }}>
            <label style={{ fontSize: 13 }}>
              검진일자
              <input
                style={{ display: 'block', width: '100%', marginTop: 4, padding: 8 }}
                value={checkupDate}
                onChange={(e) => setCheckupDate(e.target.value)}
                placeholder="YYYY-MM-DD"
              />
            </label>
            <label style={{ fontSize: 13 }}>
              담당 수의사
              <input
                style={{ display: 'block', width: '100%', marginTop: 4, padding: 8 }}
                value={veterinarian}
                onChange={(e) => setVeterinarian(clamp(e.target.value, HEALTH_CHECKUP_MAX_COVER_FIELD_CHARS))}
              />
            </label>
            <label style={{ fontSize: 13 }}>
              프로그램(표지·프롬프트)
              <input
                style={{ display: 'block', width: '100%', marginTop: 4, padding: 8 }}
                value={coverProgram}
                onChange={(e) => setCoverProgram(clamp(e.target.value, HEALTH_CHECKUP_MAX_COVER_FIELD_CHARS))}
              />
            </label>
            <label style={{ fontSize: 13 }}>
              반드시 포함 (최대 {HEALTH_CHECKUP_MUST_INCLUDE_MAX_CHARS}자)
              <textarea
                style={{ display: 'block', width: '100%', marginTop: 4, padding: 8, minHeight: 80 }}
                value={mustInclude}
                onChange={(e) => setMustInclude(clamp(e.target.value, HEALTH_CHECKUP_MUST_INCLUDE_MAX_CHARS))}
              />
            </label>
          </div>
          <p style={{ margin: '12px 0 0', fontSize: 12, color: '#64748b' }}>
            LLM 생성은 서버에서 chart-api로 프록시됩니다. <code>CHART_API_BASE_URL</code>, <code>CHART_APP_API_KEY</code>, chart-api
            측 <code>GEMINI_API_KEY</code>가 필요합니다.
          </p>
          <button
            type="button"
            className="adminLegacyPrimaryBtn"
            style={{ marginTop: 12 }}
            disabled={generating}
            onClick={() => void generateContent()}
          >
            {generating ? '생성 중… (수 분 걸릴 수 있음)' : '건강검진 컨텐츠 생성'}
          </button>
        </section>
      ) : null}

      {hasContent ? (
        <>
          <header style={{ marginBottom: 12, display: 'flex', flexWrap: 'wrap', gap: 8, alignItems: 'center' }}>
            <h1 style={{ margin: 0, fontSize: 20, fontWeight: 800 }}>생성 결과 · 건강검진 보고서 (검토·수정)</h1>
            <button type="button" className="adminLegacySecondaryBtn" disabled={saving} onClick={() => void saveReview()}>
              {saving ? '저장 중…' : '검토 내용 저장'}
            </button>
            <button type="button" className="adminLegacySmallBtn" disabled={generating} onClick={() => void generateContent()}>
              {generating ? '재생성 중…' : '다시 생성'}
            </button>
            <span style={{ flexBasis: '100%', height: 0 }} aria-hidden />
            <button
              type="button"
              className="adminLegacySmallBtn"
              onClick={() => setPreviewOpen(true)}
              title="chart-api 미리보기 JSON을 admin에서 모달로 표시합니다(편집 중이면 현재 초안 전달)."
            >
              미리보기
            </button>
            <button
              type="button"
              className="adminLegacySmallBtn"
              disabled={pdfBusy}
              title="응답을 모두 받을 때까지 버튼이 비활성화됩니다. Playwright PDF는 수 분 걸릴 수 있습니다."
              onClick={() => void downloadPdf()}
            >
              {pdfBusy ? 'PDF 생성 중…' : 'PDF 다운로드'}
            </button>
            <button
              type="button"
              className="adminLegacySmallBtn"
              disabled={shareBusy}
              onClick={() => void issueExternalShareLink()}
            >
              {shareBusy ? '링크 발급 중…' : '외부 검토 링크'}
            </button>
          </header>
          <p style={{ fontSize: 12, color: '#64748b', marginBottom: 12, lineHeight: 1.55 }}>
            미리보기는 편집 중인 내용(저장 전)까지 반영합니다. PDF 다운로드는 chart-api가 DB에 <strong>저장된</strong> 내용으로 생성합니다 — 필요하면 먼저「검토 내용 저장」하세요. 외부 링크는
            수의사가 동일 데이터를 검토·저장·PDF로 받을 수 있는 주소이며 7일간 유효합니다(저장 시 원본 run의{' '}
            <code style={{ fontSize: 11 }}>generated_run_content</code>에 반영됩니다).
          </p>

          {sharePanel ? (
            <div
              role="status"
              style={{
                marginBottom: 14,
                padding: '12px 14px',
                border: `1px solid ${divider}`,
                background: '#f0fdf4',
                borderRadius: 8,
                fontSize: 13,
              }}
            >
              <div style={{ fontWeight: 800, marginBottom: 6 }}>외부 검토 링크</div>
              <p style={{ margin: '0 0 8px', color: '#166534', fontSize: 12 }}>
                만료 {sharePanel.expiresAt ? new Date(sharePanel.expiresAt).toLocaleString('ko-KR') : '(응답 없음)'}
              </p>
              <div style={{ display: 'flex', flexWrap: 'wrap', gap: 8, alignItems: 'center' }}>
                <input readOnly value={sharePanel.shareUrl} style={{ flex: '1 1 240px', minWidth: 0, padding: 8, fontSize: 12 }} />
                <button
                  type="button"
                  className="adminLegacySecondaryBtn"
                  onClick={async () => {
                    try {
                      await navigator.clipboard.writeText(sharePanel.shareUrl);
                    } catch {
                      window.alert('복사에 실패했습니다. 입력란에서 직접 복사해 주세요.');
                    }
                  }}
                >
                  복사
                </button>
                <button type="button" className="adminLegacySmallBtn" onClick={() => setSharePanel(null)}>
                  닫기
                </button>
              </div>
            </div>
          ) : null}

          <details open style={{ border: `1px solid ${divider}`, marginBottom: 10, background: '#fff' }}>
            <summary style={{ padding: '10px 12px', fontWeight: 700, cursor: 'pointer' }}>표지 (1p)</summary>
            <div style={{ padding: '12px 14px', display: 'grid', gap: 10, gridTemplateColumns: '1fr 1fr' }}>
              <label style={labelGrid}>
                검진일
                <input
                  type="date"
                  value={draft.coverCheckupDate?.slice(0, 10) ?? ''}
                  onChange={(e) =>
                    setDraft((d) => ({
                      ...d,
                      coverCheckupDate: clamp(e.target.value, HEALTH_CHECKUP_MAX_COVER_CHECKUP_DATE_CHARS),
                    }))
                  }
                />
              </label>
              <label style={labelGrid}>
                프로그램
                <input
                  value={draft.coverProgram ?? ''}
                  onChange={(e) =>
                    setDraft((d) => ({ ...d, coverProgram: clamp(e.target.value, HEALTH_CHECKUP_MAX_COVER_FIELD_CHARS) }))
                  }
                />
              </label>
              <label style={labelGrid}>
                수의사
                <input
                  value={draft.coverVeterinarian ?? ''}
                  onChange={(e) =>
                    setDraft((d) => ({
                      ...d,
                      coverVeterinarian: clamp(e.target.value, HEALTH_CHECKUP_MAX_COVER_FIELD_CHARS),
                    }))
                  }
                />
              </label>
              <label style={labelGrid}>
                반려동물 이름
                <input
                  value={draft.coverPatientName ?? ''}
                  onChange={(e) =>
                    setDraft((d) => ({
                      ...d,
                      coverPatientName: clamp(e.target.value, HEALTH_CHECKUP_MAX_COVER_SHORT_FIELD_CHARS),
                    }))
                  }
                />
              </label>
              <label style={labelGrid}>
                종
                <select
                  value={draft.coverPatientSpecies ?? ''}
                  onChange={(e) => setDraft((d) => ({ ...d, coverPatientSpecies: e.target.value }))}
                >
                  <option value="">선택</option>
                  {SPECIES_OPTIONS.map((s) => (
                    <option key={s} value={s}>
                      {s}
                    </option>
                  ))}
                </select>
              </label>
              <label style={labelGrid}>
                품종
                <input
                  value={draft.coverPatientBreed ?? ''}
                  onChange={(e) =>
                    setDraft((d) => ({
                      ...d,
                      coverPatientBreed: clamp(e.target.value, HEALTH_CHECKUP_MAX_COVER_SHORT_FIELD_CHARS),
                    }))
                  }
                />
              </label>
              <label style={labelGrid}>
                성별
                <select
                  value={draft.coverPatientSex ?? ''}
                  onChange={(e) =>
                    setDraft((d) => ({ ...d, coverPatientSex: clamp(e.target.value, HEALTH_CHECKUP_MAX_COVER_SEX_CHARS) }))
                  }
                >
                  <option value="">선택</option>
                  {SEX_OPTIONS.map((s) => (
                    <option key={s} value={s}>
                      {s}
                    </option>
                  ))}
                </select>
              </label>
              <label style={labelGrid}>
                나이
                <input
                  value={draft.coverPatientAge ?? ''}
                  onBlur={(e) =>
                    setDraft((d) => ({
                      ...d,
                      coverPatientAge: clamp(appendUnitIfNeeded(e.target.value, '세'), HEALTH_CHECKUP_MAX_COVER_SHORT_FIELD_CHARS),
                    }))
                  }
                  onChange={(e) => setDraft((d) => ({ ...d, coverPatientAge: e.target.value }))}
                />
              </label>
              <label style={labelGrid}>
                체중
                <input
                  value={draft.coverPatientWeight ?? ''}
                  onBlur={(e) =>
                    setDraft((d) => ({
                      ...d,
                      coverPatientWeight: clamp(appendUnitIfNeeded(e.target.value, 'kg'), HEALTH_CHECKUP_MAX_COVER_SHORT_FIELD_CHARS),
                    }))
                  }
                  onChange={(e) => setDraft((d) => ({ ...d, coverPatientWeight: e.target.value }))}
                />
              </label>
              <label style={{ ...labelGrid, gridColumn: '1 / -1' }}>
                보호자 성함
                <input
                  value={draft.coverOwnerName ?? ''}
                  onChange={(e) =>
                    setDraft((d) => ({
                      ...d,
                      coverOwnerName: clamp(e.target.value, HEALTH_CHECKUP_MAX_COVER_SHORT_FIELD_CHARS),
                    }))
                  }
                />
              </label>
            </div>
          </details>

          <details open style={{ border: `1px solid ${divider}`, marginBottom: 10, background: '#fff' }}>
            <summary style={{ padding: '10px 12px', fontWeight: 700, cursor: 'pointer' }}>종합 소견 (2p)</summary>
            <div style={{ padding: '12px 14px' }}>
              <textarea
                rows={10}
                style={{ width: '100%', fontSize: 13, padding: 10 }}
                value={draft.overallSummary}
                onChange={(e) => setDraft((d) => ({ ...d, overallSummary: clamp(e.target.value, HEALTH_CHECKUP_MAX_OVERALL_CHARS) }))}
              />
              <p
                style={{
                  margin: '6px 0 0',
                  fontSize: 12,
                  color:
                    overallLen < HEALTH_CHECKUP_MIN_OVERALL_CHARS
                      ? '#b45309'
                      : overallLen > HEALTH_CHECKUP_MAX_OVERALL_CHARS
                        ? '#b91c1c'
                        : '#64748b',
                }}
              >
                {overallLen} / {HEALTH_CHECKUP_MAX_OVERALL_CHARS} (권장 최소 {HEALTH_CHECKUP_MIN_OVERALL_CHARS}자)
              </p>
            </div>
          </details>

          <details open style={{ border: `1px solid ${divider}`, marginBottom: 10, background: '#fff' }}>
            <summary style={{ padding: '10px 12px', fontWeight: 700, cursor: 'pointer' }}>사후 관리 (2p)</summary>
            <div style={{ padding: '12px 14px' }}>
              <textarea
                rows={8}
                style={{ width: '100%', fontSize: 13, padding: 10 }}
                value={draft.followUpCare}
                onChange={(e) => setDraft((d) => ({ ...d, followUpCare: clamp(e.target.value, HEALTH_CHECKUP_MAX_FOLLOW_UP_CHARS) }))}
              />
              <p
                style={{
                  margin: '6px 0 0',
                  fontSize: 12,
                  color:
                    followLen < HEALTH_CHECKUP_MIN_FOLLOW_UP_CHARS
                      ? '#b45309'
                      : followLen > HEALTH_CHECKUP_MAX_FOLLOW_UP_CHARS
                        ? '#b91c1c'
                        : '#64748b',
                }}
              >
                {followLen} / {HEALTH_CHECKUP_MAX_FOLLOW_UP_CHARS} (권장 최소 {HEALTH_CHECKUP_MIN_FOLLOW_UP_CHARS}자)
              </p>
            </div>
          </details>

          <details open style={{ border: `1px solid ${divider}`, marginBottom: 10, background: '#fff' }}>
            <summary style={{ padding: '10px 12px', fontWeight: 700, cursor: 'pointer' }}>권장 재검진</summary>
            <div style={{ padding: '12px 14px', display: 'grid', gap: 14 }}>
              {(
                [
                  ['1–2주', 'recheckWithin1to2Weeks'],
                  ['1개월', 'recheckWithin1Month'],
                  ['3개월', 'recheckWithin3Months'],
                  ['6개월', 'recheckWithin6Months'],
                ] as const
              ).map(([label, key]) => {
                const raw = draft[key];
                const { cardTitle, cardBody } = splitTimelineCardText(typeof raw === 'string' ? raw : '');
                return (
                  <div key={key} style={{ borderTop: `1px solid ${divider}`, paddingTop: 10 }}>
                    <div style={{ fontSize: 12, fontWeight: 700, marginBottom: 6 }}>{label}</div>
                    <input
                      placeholder="제목"
                      style={{ width: '100%', marginBottom: 6, padding: 8 }}
                      value={cardTitle}
                      onChange={(e) => setRecheckField(key, 'title', e.target.value)}
                    />
                    <textarea
                      placeholder="본문"
                      rows={3}
                      style={{ width: '100%', padding: 8 }}
                      value={cardBody}
                      onChange={(e) => setRecheckField(key, 'body', e.target.value)}
                    />
                  </div>
                );
              })}
            </div>
          </details>

          <details open style={{ border: `1px solid ${divider}`, marginBottom: 10, background: '#fff' }}>
            <summary style={{ padding: '10px 12px', fontWeight: 700, cursor: 'pointer' }}>
              장기·검사·치과·영상 시트 (행 편집)
            </summary>
            <div style={{ padding: '12px 14px', display: 'grid', gap: 16 }}>
              <p style={{ margin: 0, fontSize: 12, color: '#64748b' }}>
                vet-report와 동일하게 <code>variant: &quot;rows&quot;</code> 블록의 본문만 행 단위로 편집합니다. 이미지 슬롯 블록은 아래{' '}
                <strong>이미지 배치</strong>에서 편집합니다. 스키마에 맞지 않는 데이터는 원시 JSON 모드로 열립니다.
              </p>
              {SYSTEM_KEYS.map((k) => {
                const jsonText = systemsJsonRaw[k];
                const pageTitle = SYSTEM_PAGE_LABELS[k];
                const rowMax = rowMaxCharsForSystemKey(k);

                if (jsonText !== undefined) {
                  return (
                    <div key={k} style={{ border: `1px solid ${divider}`, borderRadius: 8, padding: 12, background: '#fffbeb' }}>
                      <div style={{ fontSize: 13, fontWeight: 700, marginBottom: 8 }}>
                        {pageTitle} <span style={{ fontWeight: 400, color: '#92400e' }}>(원시 JSON)</span>
                      </div>
                      <textarea
                        rows={12}
                        style={{ width: '100%', fontFamily: 'ui-monospace, monospace', fontSize: 11, padding: 8 }}
                        value={jsonText}
                        onChange={(e) => setSystemsJsonRaw((prev) => ({ ...prev, [k]: e.target.value }))}
                      />
                      <div style={{ marginTop: 8, display: 'flex', flexWrap: 'wrap', gap: 8 }}>
                        <button
                          type="button"
                          className="adminLegacySmallBtn"
                          onClick={() => {
                            try {
                              const parsed = JSON.parse(jsonText) as unknown;
                              if (!Array.isArray(parsed)) {
                                setSaveError(`${k}: 배열 JSON이어야 합니다.`);
                                return;
                              }
                              if (parsed.length > 0 && parseHealthSystemsBlocksFromUnknown(parsed) === null) {
                                setSaveError(`${k}: 블록 스키마가 올바르지 않습니다.`);
                                return;
                              }
                              setSaveError(null);
                              setDraft((d) => ({ ...d, [k]: parsed }));
                              setSystemsJsonRaw((prev) => {
                                const n = { ...prev };
                                delete n[k];
                                return n;
                              });
                            } catch {
                              setSaveError(`${k}: JSON 파싱에 실패했습니다.`);
                            }
                          }}
                        >
                          검증 후 구조 편집으로 적용
                        </button>
                      </div>
                    </div>
                  );
                }

                const blocks = getStructuredBlocksFromDraft(draft, k);
                return (
                  <div key={k} style={{ border: `1px solid ${divider}`, borderRadius: 8, padding: 12, background: '#fafafa' }}>
                    <div style={{ display: 'flex', flexWrap: 'wrap', justifyContent: 'space-between', gap: 8, marginBottom: 10 }}>
                      <div style={{ fontSize: 13, fontWeight: 700 }}>{pageTitle}</div>
                      <button
                        type="button"
                        className="adminLegacySmallBtn"
                        onClick={() => {
                          try {
                            setSystemsJsonRaw((prev) => ({
                              ...prev,
                              [k]: JSON.stringify(Array.isArray(draft[k]) ? draft[k] : [], null, 2),
                            }));
                          } catch {
                            setSystemsJsonRaw((prev) => ({ ...prev, [k]: '[]' }));
                          }
                        }}
                      >
                        원시 JSON
                      </button>
                    </div>
                    {blocks.length === 0 ? (
                      <p style={{ margin: 0, fontSize: 12, color: '#64748b' }}>블록이 비어 있습니다. 컨텐츠 생성 후 채워지거나, 원시 JSON으로 붙여넣을 수 있습니다.</p>
                    ) : null}
                    {blocks.map((block, bi) => (
                      <div key={bi} style={{ marginTop: bi ? 14 : 0, paddingTop: bi ? 14 : 0, borderTop: bi ? `1px solid ${divider}` : undefined }}>
                        {block.variant === 'rows' ? (
                          <>
                            <div style={{ fontSize: 12, fontWeight: 700, marginBottom: 8, color: '#334155' }}>
                              {(block.titleKo || block.titleEn || `블록 ${bi + 1}`).trim() || `블록 ${bi + 1}`}
                            </div>
                            <div style={{ display: 'grid', gap: 10 }}>
                              {block.rows.map((row, ri) => (
                                <label key={ri} style={{ fontSize: 12, display: 'grid', gap: 4 }}>
                                  <span style={{ color: '#64748b' }}>{row.label}</span>
                                  <textarea
                                    rows={3}
                                    style={{ width: '100%', padding: 8, fontSize: 13 }}
                                    value={row.content}
                                    onChange={(e) => {
                                      const v = clamp(e.target.value, rowMax);
                                      setDraft((prev) => {
                                        const cur = getStructuredBlocksFromDraft(prev, k);
                                        if (!cur[bi] || cur[bi].variant !== 'rows') return prev;
                                        const nextBlocks = structuredClone(cur) as HealthSystemsReportBlock[];
                                        const b = nextBlocks[bi];
                                        if (b.variant !== 'rows') return prev;
                                        const nr = [...b.rows];
                                        nr[ri] = { ...nr[ri], content: v };
                                        nextBlocks[bi] = { ...b, rows: nr };
                                        return { ...prev, [k]: nextBlocks };
                                      });
                                    }}
                                  />
                                  <span style={{ fontSize: 11, color: '#94a3b8' }}>
                                    {row.content.length} / {rowMax}
                                  </span>
                                </label>
                              ))}
                            </div>
                          </>
                        ) : (
                          <p style={{ margin: '8px 0 0', fontSize: 12, color: '#64748b' }}>
                            <strong>{block.variant}</strong> 이미지 슬롯 — 아래 <strong>이미지 배치</strong> 패널에서 슬롯·캡션을 편집합니다.
                          </p>
                        )}
                      </div>
                    ))}
                  </div>
                );
              })}
            </div>
          </details>

          <details open style={{ border: `1px solid ${divider}`, marginBottom: 10, background: '#fff' }}>
            <summary style={{ padding: '10px 12px', fontWeight: 700, cursor: 'pointer' }}>이미지 배치 (5p·6p)</summary>
            <div style={{ padding: '12px 14px' }}>
              {systemsJsonRaw.systemsPage4Blocks !== undefined || systemsJsonRaw.systemsPage5Blocks !== undefined ? (
                <p style={{ margin: 0, fontSize: 13, color: '#b45309' }}>
                  4·5번 시트가 원시 JSON 모드입니다. 이미지 슬롯 편집을 쓰려면 해당 시트를 구조 편집으로 되돌린 뒤 저장하세요.
                </p>
              ) : (
                <AdminHealthReportImageSlots
                  runId={runId}
                  page4Raw={draft.systemsPage4Blocks}
                  page5Raw={draft.systemsPage5Blocks}
                  onChangePage4={(blocks) => setDraft((d) => ({ ...d, systemsPage4Blocks: blocks }))}
                  onChangePage5={(blocks) => setDraft((d) => ({ ...d, systemsPage5Blocks: blocks }))}
                />
              )}
            </div>
          </details>

          <details open style={{ border: `1px solid ${divider}`, marginBottom: 10, background: '#fff' }}>
            <summary style={{ padding: '10px 12px', fontWeight: 700, cursor: 'pointer' }}>혈액검사 해석 (7p)</summary>
            <div style={{ padding: '12px 14px' }}>
              <textarea
                rows={6}
                style={{ width: '100%', padding: 10 }}
                value={draft.labInterpretation ?? ''}
                onChange={(e) =>
                  setDraft((d) => ({
                    ...d,
                    labInterpretation: clamp(e.target.value, HEALTH_CHECKUP_LAB_INTERP_MAX_CHARS),
                  }))
                }
              />
              <p style={{ margin: '6px 0 0', fontSize: 12, color: '#64748b' }}>
                {(draft.labInterpretation ?? '').length} / {HEALTH_CHECKUP_LAB_INTERP_MAX_CHARS}
              </p>
            </div>
          </details>

          <div style={{ marginTop: 16 }}>
            <button type="button" className="adminLegacyPrimaryBtn" disabled={saving} onClick={() => void saveReview()}>
              {saving ? '저장 중…' : '검토 내용 저장'}
            </button>
          </div>
        </>
      ) : null}
      </div>
      <HealthReportPreviewModal
        open={previewOpen}
        onClose={() => setPreviewOpen(false)}
        runId={runId}
        generatedPayload={draft}
      />
    </>
  );
}
