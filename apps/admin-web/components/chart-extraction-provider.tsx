'use client';

import Link from 'next/link';
import {
  createContext,
  useCallback,
  useContext,
  useMemo,
  useRef,
  useState,
  type ReactNode,
} from 'react';
import { useRouter } from 'next/navigation';
import styles from './admin-shell.module.css';

const UPLOAD_URL = '/api/admin/chart-extraction/upload-url';
const EXTRACT_URL = '/api/admin/chart-extraction';

type ExtractionStatus = 'idle' | 'running' | 'success' | 'error';

type ExtractApiPayload = { runId?: string; friendlyId?: string; error?: string };

type ChartExtractionContextValue = {
  status: ExtractionStatus;
  lastRunId: string | null;
  lastFriendlyId: string | null;
  error: string | null;
  startExtract: (formData: FormData) => Promise<void>;
  clearExtractionBanner: () => void;
};

const ChartExtractionContext = createContext<ChartExtractionContextValue | null>(null);

async function readJsonPayload<T>(res: Response): Promise<{ payload: T | null; rawText: string }> {
  const rawText = await res.text();
  if (!rawText) return { payload: null, rawText: '' };
  try {
    return { payload: JSON.parse(rawText) as T, rawText };
  } catch {
    return { payload: null, rawText };
  }
}

function normalizeExtractError(payloadError: string | undefined, rawText: string): string {
  const fallback = '요청에 실패했습니다.';
  const blob = `${payloadError ?? ''}\n${rawText}`;
  if (/storage signing failed/i.test(blob)) {
    return '스토리지 업로드 서명에 실패했습니다. Supabase 설정과 PDF 업로드 버킷을 확인해 주세요.';
  }
  if (/InvalidKey|Invalid key/i.test(blob)) {
    return '스토리지가 업로드 경로(파일명)를 거부했습니다. 파일명은 자동으로 안전한 형태로 바꿔 요청합니다. 다시 시도해 주세요.';
  }
  if (/Unterminated string in JSON|JSON\.parse|unexpected token/i.test(blob)) {
    return '버킷팅 단계에서 모델 응답 JSON 파싱에 실패했습니다.';
  }
  if (payloadError) return payloadError;
  if (/request entity too large/i.test(rawText)) return '업로드 용량 제한에 걸렸습니다.';
  if (rawText.trim()) return rawText.slice(0, 800);
  return fallback;
}

function sanitizeFilenameForStorage(name: string): string {
  const trimmed = name.trim();
  const safe = trimmed.replace(/[^a-zA-Z0-9._-]/g, '_');
  return safe.length > 0 ? safe : 'upload.pdf';
}

async function uploadPdfToStorage(file: File): Promise<{ bucket: string; storagePath: string }> {
  const fileNameForKey = sanitizeFilenameForStorage(file.name);
  const initRes = await fetch(UPLOAD_URL, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    credentials: 'include',
    body: JSON.stringify({
      fileName: fileNameForKey,
      fileType: file.type,
      fileSize: file.size,
    }),
  });
  const { payload: initPayload, rawText: initRaw } = await readJsonPayload<{
    bucket?: string;
    storagePath?: string;
    signedUrl?: string;
    error?: string;
  }>(initRes);
  if (!initRes.ok || initPayload?.error) {
    throw new Error(normalizeExtractError(initPayload?.error, initRaw));
  }
  if (!initPayload?.bucket || !initPayload?.storagePath || !initPayload?.signedUrl) {
    throw new Error('업로드 URL 응답 형식이 올바르지 않습니다.');
  }
  const supabaseBaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL?.replace(/\/$/, '') ?? '';
  const uploadUrl =
    initPayload.signedUrl.startsWith('http://') || initPayload.signedUrl.startsWith('https://')
      ? initPayload.signedUrl
      : `${supabaseBaseUrl}${initPayload.signedUrl}`;
  if (!uploadUrl.startsWith('http://') && !uploadUrl.startsWith('https://')) {
    throw new Error('스토리지 업로드 URL이 올바르지 않습니다.');
  }
  const uploadRes = await fetch(uploadUrl, {
    method: 'PUT',
    headers: { 'Content-Type': file.type || 'application/pdf' },
    body: file,
  });
  if (!uploadRes.ok) {
    const uploadText = await uploadRes.text().catch(() => '');
    throw new Error(uploadText || '파일 업로드에 실패했습니다.');
  }
  return { bucket: initPayload.bucket, storagePath: initPayload.storagePath };
}

export function useChartExtraction() {
  const ctx = useContext(ChartExtractionContext);
  if (!ctx) throw new Error('useChartExtraction must be used within ChartExtractionProvider');
  return ctx;
}

export function ChartExtractionBanner() {
  const { status, lastRunId, lastFriendlyId, error, clearExtractionBanner } = useChartExtraction();
  if (status === 'idle') return null;
  if (status === 'running') {
    return (
      <div className={`${styles.extractionBanner} ${styles.extractionBannerRunning}`} role="status" aria-live="polite">
        PDF를 분석하는 중입니다. 다른 메뉴로 이동하거나 탭을 바꿔도 백그라운드에서 계속 진행됩니다.
      </div>
    );
  }
  if (status === 'success' && lastRunId) {
    return (
      <div className={`${styles.extractionBanner} ${styles.extractionBannerSuccess}`}>
        <span>
          추출이 완료되었습니다.
          {lastFriendlyId ? (
            <span className={styles.extractionBannerMono}> ({lastFriendlyId})</span>
          ) : null}
        </span>
        <Link href={`/admin/runs/${lastRunId}`} className={styles.extractionBannerLink}>
          결과 보기
        </Link>
        <button type="button" className={styles.extractionBannerBtn} onClick={clearExtractionBanner}>
          닫기
        </button>
      </div>
    );
  }
  if (status === 'error' && error) {
    return (
      <div className={`${styles.extractionBanner} ${styles.extractionBannerError}`}>
        <span>{error}</span>
        <button type="button" className={styles.extractionBannerBtn} onClick={clearExtractionBanner}>
          닫기
        </button>
      </div>
    );
  }
  return null;
}

export function ChartExtractionProvider({ children }: { children: ReactNode }) {
  const router = useRouter();
  const [status, setStatus] = useState<ExtractionStatus>('idle');
  const [lastRunId, setLastRunId] = useState<string | null>(null);
  const [lastFriendlyId, setLastFriendlyId] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  const runningRef = useRef(false);

  const clearExtractionBanner = useCallback(() => {
    setStatus('idle');
    setLastRunId(null);
    setLastFriendlyId(null);
    setError(null);
  }, []);

  const startExtract = useCallback(
    async (formData: FormData) => {
      if (runningRef.current) return;
      runningRef.current = true;
      setStatus('running');
      setError(null);
      setLastRunId(null);
      setLastFriendlyId(null);
      try {
        const fileField = formData.get('file');
        if (!(fileField instanceof File)) throw new Error('업로드 파일이 필요합니다.');
        const storage = await uploadPdfToStorage(fileField);
        formData.delete('file');
        formData.set('storageBucket', storage.bucket);
        formData.set('storagePath', storage.storagePath);
        formData.set('fileName', sanitizeFilenameForStorage(fileField.name));
        formData.set('fileType', fileField.type || 'application/pdf');

        const res = await fetch(EXTRACT_URL, { method: 'POST', body: formData, credentials: 'include' });
        const { payload, rawText } = await readJsonPayload<ExtractApiPayload>(res);
        if (!res.ok) throw new Error(normalizeExtractError(payload?.error, rawText));
        if (!payload?.runId) throw new Error('분석은 완료되었으나 저장된 실행 ID를 받지 못했습니다.');
        setLastRunId(payload.runId);
        setLastFriendlyId(typeof payload.friendlyId === 'string' ? payload.friendlyId : null);
        setStatus('success');
        const path =
          typeof globalThis.window !== 'undefined' ? globalThis.window.location.pathname : '';
        const stillOnExtract =
          path === '/admin/data-upload' ||
          path.endsWith('/data-upload') ||
          path === '/admin/chart-extraction' ||
          path.endsWith('/chart-extraction');
        if (stillOnExtract) {
          const q = payload.friendlyId ? `?friendly=${encodeURIComponent(payload.friendlyId)}` : '';
          router.push(`/admin/runs/${payload.runId}${q}`);
        }
      } catch (e) {
        setError(e instanceof Error ? e.message : '요청 실패');
        setStatus('error');
      } finally {
        runningRef.current = false;
      }
    },
    [router],
  );

  const value = useMemo(
    () => ({ status, lastRunId, lastFriendlyId, error, startExtract, clearExtractionBanner }),
    [status, lastRunId, lastFriendlyId, error, startExtract, clearExtractionBanner],
  );

  return <ChartExtractionContext.Provider value={value}>{children}</ChartExtractionContext.Provider>;
}
