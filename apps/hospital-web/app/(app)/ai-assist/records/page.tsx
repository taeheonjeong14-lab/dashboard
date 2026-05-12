'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { createClient } from '@/lib/supabase/client';
import { ddxGet, DdxApiForbiddenError } from '@/lib/ddx-api';

type SurveySession = {
  id: string;
  patientName: string | null;
  guardianName: string | null;
  scheduledDate: string | null;
  status: string;
  createdAt: string;
  visitType?: string | null;
  analysisStatus?: string;
  isUsed?: boolean;
  usedAt?: string | null;
};

type SurveySessionsResponse = {
  success: boolean;
  sessions: SurveySession[];
  error?: string;
};

const STATUS_LABEL: Record<string, string> = {
  pending: '대기 중',
  completed: '제출 완료',
  expired: '만료',
};

const ANALYSIS_LABEL: Record<string, string> = {
  pending: '분석 대기',
  processing: '분석 중',
  done: '분석 완료',
  error: '분석 오류',
};

function formatDate(iso: string) {
  try {
    return new Date(iso).toLocaleString('ko-KR', { dateStyle: 'medium', timeStyle: 'short' });
  } catch {
    return iso;
  }
}

export default function RecordsPage() {
  const [userId, setUserId] = useState<string | null>(null);
  const [sessions, setSessions] = useState<SurveySession[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [search, setSearch] = useState('');

  useEffect(() => {
    const supabase = createClient();
    supabase.auth.getUser().then(({ data: { user } }) => {
      if (user?.id) setUserId(user.id);
      else setLoading(false);
    });
  }, []);

  useEffect(() => {
    if (!userId) return;
    setLoading(true);
    ddxGet<SurveySessionsResponse>('/api/surveys/sessions?take=500', userId)
      .then((data) => {
        if (data.success && Array.isArray(data.sessions)) {
          setSessions(data.sessions);
        } else {
          setSessions([]);
          if (data.error) setError(data.error);
        }
      })
      .catch((err) => {
        if (err instanceof DdxApiForbiddenError) {
          setError('ddx-api 계정 동기화가 필요합니다. 관리자에게 문의하세요.');
        } else {
          setError('데이터를 불러오는 중 오류가 발생했습니다.');
        }
        setSessions([]);
      })
      .finally(() => setLoading(false));
  }, [userId]);

  const filtered = sessions.filter((s) => {
    if (!search.trim()) return true;
    const q = search.toLowerCase();
    return (
      (s.patientName ?? '').toLowerCase().includes(q) ||
      (s.guardianName ?? '').toLowerCase().includes(q)
    );
  });

  return (
    <div style={{ padding: '24px', maxWidth: '900px' }}>
      {/* Header */}
      <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '24px', flexWrap: 'wrap', gap: '12px' }}>
        <div>
          <h1 style={{ margin: '0 0 4px', fontSize: '20px', fontWeight: 700, color: 'var(--text)' }}>
            상담 기록
          </h1>
          <p style={{ margin: 0, fontSize: '13px', color: 'var(--text-secondary)' }}>
            전체 사전문진 세션 목록
          </p>
        </div>
        <div style={{ display: 'flex', gap: '8px', alignItems: 'center', flexWrap: 'wrap' }}>
          <Link
            href="/ai-assist"
            style={{
              padding: '8px 14px',
              border: '1px solid var(--border)',
              borderRadius: 'var(--radius)',
              background: 'var(--bg)',
              color: 'var(--text)',
              fontSize: '13px',
              textDecoration: 'none',
            }}
          >
            홈으로
          </Link>
          <Link
            href="/ai-assist/new"
            style={{
              padding: '8px 16px',
              border: 'none',
              borderRadius: 'var(--radius)',
              background: 'var(--accent)',
              color: '#fff',
              fontSize: '13px',
              fontWeight: 600,
              textDecoration: 'none',
            }}
          >
            + 새 상담
          </Link>
        </div>
      </div>

      {/* Error */}
      {error && (
        <div style={{
          padding: '12px 16px',
          background: 'var(--danger-subtle)',
          border: '1px solid var(--danger)',
          borderRadius: 'var(--radius)',
          color: 'var(--danger)',
          fontSize: '13px',
          marginBottom: '20px',
        }}>
          {error}
        </div>
      )}

      {/* Search */}
      <div style={{ marginBottom: '16px' }}>
        <input
          style={{
            width: '100%',
            maxWidth: '320px',
            padding: '9px 14px',
            border: '1px solid var(--border)',
            borderRadius: 'var(--radius)',
            background: 'var(--bg)',
            color: 'var(--text)',
            fontSize: '13px',
            outline: 'none',
            fontFamily: 'inherit',
            boxSizing: 'border-box',
          }}
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          placeholder="환자명 또는 보호자명 검색"
        />
      </div>

      {/* Table / List */}
      <div style={{
        background: 'var(--bg)',
        border: '1px solid var(--border)',
        borderRadius: 'var(--radius-lg)',
        overflow: 'hidden',
      }}>
        {loading ? (
          <div style={{ padding: '48px', textAlign: 'center', color: 'var(--text-muted)', fontSize: '13px' }}>
            <div style={{
              width: '20px', height: '20px', border: '2px solid var(--border)',
              borderTopColor: 'var(--accent)', borderRadius: '50%',
              animation: 'spin 0.8s linear infinite',
              margin: '0 auto 12px',
            }} />
            불러오는 중...
            <style>{`@keyframes spin { to { transform: rotate(360deg); } }`}</style>
          </div>
        ) : filtered.length === 0 ? (
          <div style={{ padding: '48px', textAlign: 'center' }}>
            <p style={{ color: 'var(--text-muted)', fontSize: '14px', margin: 0 }}>
              {search ? '검색 결과가 없습니다' : '상담 기록이 없습니다'}
            </p>
          </div>
        ) : (
          <>
            {/* Table header */}
            <div style={{
              display: 'grid',
              gridTemplateColumns: '1fr 120px 120px 80px',
              gap: '12px',
              padding: '10px 20px',
              background: 'var(--bg-subtle)',
              borderBottom: '1px solid var(--border)',
              fontSize: '11px',
              fontWeight: 600,
              color: 'var(--text-muted)',
              textTransform: 'uppercase',
            }}>
              <span>환자 / 보호자</span>
              <span>날짜</span>
              <span>상태</span>
              <span>분석</span>
            </div>
            {filtered.map((session, idx) => (
              <Link
                key={session.id}
                href={`/ai-assist/${session.id}`}
                style={{
                  display: 'grid',
                  gridTemplateColumns: '1fr 120px 120px 80px',
                  gap: '12px',
                  padding: '14px 20px',
                  borderBottom: idx < filtered.length - 1 ? '1px solid var(--border)' : 'none',
                  textDecoration: 'none',
                  color: 'inherit',
                  alignItems: 'center',
                  transition: 'background 0.15s',
                }}
                onMouseEnter={(e) => (e.currentTarget.style.background = 'var(--bg-subtle)')}
                onMouseLeave={(e) => (e.currentTarget.style.background = 'transparent')}
              >
                <div>
                  <div style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text)', marginBottom: '2px' }}>
                    {session.patientName || '(이름 없음)'}
                    {session.isUsed && (
                      <span style={{
                        marginLeft: '6px', fontSize: '10px', padding: '1px 6px',
                        background: 'var(--accent-subtle)', color: 'var(--accent)',
                        borderRadius: '999px', fontWeight: 500,
                      }}>완료</span>
                    )}
                  </div>
                  {session.guardianName && (
                    <div style={{ fontSize: '12px', color: 'var(--text-muted)' }}>{session.guardianName}</div>
                  )}
                </div>
                <div style={{ fontSize: '12px', color: 'var(--text-secondary)' }}>
                  {formatDate(session.createdAt)}
                </div>
                <div>
                  <span style={{
                    display: 'inline-block',
                    padding: '2px 8px',
                    borderRadius: '999px',
                    fontSize: '11px',
                    fontWeight: 500,
                    background: session.status === 'completed' ? 'var(--success-subtle)' : 'var(--bg-raised)',
                    color: session.status === 'completed' ? 'var(--success)' : 'var(--text-muted)',
                    border: `1px solid ${session.status === 'completed' ? 'var(--success)' : 'var(--border)'}`,
                  }}>
                    {STATUS_LABEL[session.status] ?? session.status}
                  </span>
                </div>
                <div>
                  {session.analysisStatus && session.analysisStatus !== 'pending' && (
                    <span style={{
                      display: 'inline-block',
                      padding: '2px 8px',
                      borderRadius: '999px',
                      fontSize: '11px',
                      fontWeight: 500,
                      background: session.analysisStatus === 'done' ? 'var(--success-subtle)' : 'var(--bg-raised)',
                      color: session.analysisStatus === 'done' ? 'var(--success)' : session.analysisStatus === 'error' ? 'var(--danger)' : 'var(--text-muted)',
                      border: `1px solid ${session.analysisStatus === 'done' ? 'var(--success)' : session.analysisStatus === 'error' ? 'var(--danger)' : 'var(--border)'}`,
                    }}>
                      {ANALYSIS_LABEL[session.analysisStatus] ?? session.analysisStatus}
                    </span>
                  )}
                </div>
              </Link>
            ))}
          </>
        )}
      </div>

      <div style={{ marginTop: '12px', fontSize: '12px', color: 'var(--text-muted)' }}>
        총 {filtered.length}건
      </div>
    </div>
  );
}
