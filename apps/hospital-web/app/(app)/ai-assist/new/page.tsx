'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import { ddxPost, DdxApiForbiddenError } from '@/lib/ddx-api';

type GeneratedQuestion = {
  id: string;
  order: number;
  text: string;
  type: string;
  options?: Record<string, unknown> | null;
};

type SurveySession = {
  id: string;
  patientName: string | null;
  guardianName: string | null;
  questions: GeneratedQuestion[];
};

type PatientForm = {
  patientName: string;
  guardianName: string;
  contact: string;
  visitType: string;
  species: string;
  breed: string;
  symptoms: string;
};

type Step = 'form' | 'survey' | 'submitting';

const SPECIES_OPTIONS = ['개', '고양이', '토끼', '햄스터', '새', '파충류', '기타'];
const VISIT_TYPE_OPTIONS = ['초진', '재진'];

function getChoices(q: GeneratedQuestion): string[] {
  const opts = q.options;
  if (!opts) return [];
  if (Array.isArray(opts)) return opts as string[];
  const c = (opts as Record<string, unknown>).choices;
  if (Array.isArray(c)) return c as string[];
  return [];
}

function getScaleMeta(q: GeneratedQuestion): { min: number; max: number; minLabel: string; maxLabel: string } | null {
  if (q.type !== 'scale') return null;
  const opts = q.options as Record<string, unknown> | null | undefined;
  if (!opts) return null;
  return {
    min: typeof opts.min === 'number' ? opts.min : 0,
    max: typeof opts.max === 'number' ? opts.max : 10,
    minLabel: typeof opts.minLabel === 'string' ? opts.minLabel : '',
    maxLabel: typeof opts.maxLabel === 'string' ? opts.maxLabel : '',
  };
}

export default function NewConsultationPage() {
  const router = useRouter();
  const [userId, setUserId] = useState<string | null>(null);
  const [step, setStep] = useState<Step>('form');
  const [form, setForm] = useState<PatientForm>({
    patientName: '',
    guardianName: '',
    contact: '',
    visitType: '초진',
    species: '개',
    breed: '',
    symptoms: '',
  });
  const [surveySession, setSurveySession] = useState<SurveySession | null>(null);
  const [answers, setAnswers] = useState<Record<string, string | string[]>>({});
  const [currentQ, setCurrentQ] = useState(0);
  const [error, setError] = useState('');
  const [creatingSession, setCreatingSession] = useState(false);

  useEffect(() => {
    const supabase = createClient();
    supabase.auth.getUser().then(({ data: { user } }) => {
      if (user?.id) setUserId(user.id);
    });
  }, []);

  const handleFormChange = (field: keyof PatientForm, value: string) => {
    setForm((prev) => ({ ...prev, [field]: value }));
  };

  const handleStartSurvey = async () => {
    if (!userId) return;
    if (!form.patientName.trim()) { setError('환자 이름을 입력해 주세요.'); return; }
    if (!form.guardianName.trim()) { setError('보호자 이름을 입력해 주세요.'); return; }
    if (!form.contact.trim()) { setError('연락처를 입력해 주세요.'); return; }

    setError('');
    setCreatingSession(true);

    try {
      const body: Record<string, string> = {
        userId,
        patientName: `${form.patientName} (${form.species}${form.breed ? '/' + form.breed : ''})`,
        guardianName: form.guardianName,
        contact: form.contact,
        visitType: form.visitType,
      };
      if (form.symptoms.trim()) {
        body.previousChart = `주요 증상: ${form.symptoms}`;
      }

      const res = await ddxPost<{ success: boolean; session: SurveySession; error?: string }>(
        '/api/surveys/sessions',
        userId,
        body,
      );

      if (res.success && res.session) {
        setSurveySession(res.session);
        setAnswers({});
        setCurrentQ(0);
        setStep('survey');
      } else {
        setError(res.error || '세션 생성에 실패했습니다.');
      }
    } catch (err) {
      if (err instanceof DdxApiForbiddenError) {
        setError('ddx-api 계정 동기화가 필요합니다. 관리자에게 문의하세요.');
      } else {
        setError(err instanceof Error ? err.message : '세션 생성 중 오류가 발생했습니다.');
      }
    } finally {
      setCreatingSession(false);
    }
  };

  const handleSubmitSurvey = async () => {
    if (!userId || !surveySession) return;
    setStep('submitting');
    setError('');

    try {
      // Prepare answers text summary
      const answersText = surveySession.questions
        .map((q) => {
          const a = answers[q.id];
          if (!a) return null;
          const answerStr = Array.isArray(a) ? a.join(', ') : a;
          if (!answerStr.trim()) return null;
          return `Q: ${q.text}\nA: ${answerStr}`;
        })
        .filter(Boolean)
        .join('\n\n');

      const transcript = [
        `환자: ${form.patientName} (${form.species}${form.breed ? '/' + form.breed : ''})`,
        `보호자: ${form.guardianName}`,
        `방문 유형: ${form.visitType}`,
        form.symptoms ? `주요 증상: ${form.symptoms}` : '',
        answersText ? `\n문진 답변:\n${answersText}` : '',
      ]
        .filter(Boolean)
        .join('\n');

      const res = await ddxPost<{ success: boolean; sessionId?: string; error?: string }>(
        '/api/consultations',
        userId,
        {
          userId,
          patientName: form.patientName,
          guardianName: form.guardianName,
          visitType: form.visitType,
          surveySessionId: surveySession.id,
          transcript,
          status: 'awaiting_recording',
        },
      );

      if (res.success && res.sessionId) {
        router.push(`/ai-assist/${res.sessionId}`);
      } else {
        setError(res.error || '상담 저장에 실패했습니다.');
        setStep('survey');
      }
    } catch (err) {
      if (err instanceof DdxApiForbiddenError) {
        setError('ddx-api 계정 동기화가 필요합니다. 관리자에게 문의하세요.');
      } else {
        setError(err instanceof Error ? err.message : '상담 저장 중 오류가 발생했습니다.');
      }
      setStep('survey');
    }
  };

  const questions = surveySession?.questions ?? [];
  const totalQ = questions.length;
  const progress = totalQ > 0 ? Math.round((currentQ / totalQ) * 100) : 0;
  const question = questions[currentQ] ?? null;

  const currentAnswer = question ? (answers[question.id] ?? '') : '';

  const canGoNext = (() => {
    if (!question) return false;
    const a = answers[question.id];
    if (!a) return false;
    if (Array.isArray(a)) return a.length > 0;
    return typeof a === 'string' && a.trim().length > 0;
  })();

  const handleNext = () => {
    if (!canGoNext) return;
    if (currentQ < totalQ - 1) {
      setCurrentQ((i) => i + 1);
    } else {
      handleSubmitSurvey();
    }
  };

  const handlePrev = () => {
    if (currentQ > 0) setCurrentQ((i) => i - 1);
  };

  const toggleMulti = (questionId: string, option: string) => {
    setAnswers((prev) => {
      const existing = Array.isArray(prev[questionId]) ? (prev[questionId] as string[]) : [];
      const has = existing.includes(option);
      return { ...prev, [questionId]: has ? existing.filter((v) => v !== option) : [...existing, option] };
    });
  };

  const inputStyle: React.CSSProperties = {
    width: '100%',
    padding: '10px 14px',
    border: '1px solid var(--border)',
    borderRadius: 'var(--radius)',
    background: 'var(--bg)',
    color: 'var(--text)',
    fontSize: '14px',
    boxSizing: 'border-box',
    outline: 'none',
    fontFamily: 'inherit',
  };

  const labelStyle: React.CSSProperties = {
    display: 'block',
    fontSize: '13px',
    fontWeight: 500,
    color: 'var(--text-secondary)',
    marginBottom: '6px',
  };

  // === FORM STEP ===
  if (step === 'form') {
    return (
      <div style={{ padding: '24px', maxWidth: '560px' }}>
        <div style={{ marginBottom: '24px' }}>
          <h1 style={{ margin: '0 0 4px', fontSize: '20px', fontWeight: 700, color: 'var(--text)' }}>
            새 상담 시작
          </h1>
          <p style={{ margin: 0, fontSize: '13px', color: 'var(--text-secondary)' }}>
            환자 정보를 입력하고 AI 문진을 시작하세요.
          </p>
        </div>

        {error && (
          <div style={{
            padding: '10px 14px',
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

        <div style={{
          background: 'var(--bg)',
          border: '1px solid var(--border)',
          borderRadius: 'var(--radius-lg)',
          padding: '24px',
          display: 'flex',
          flexDirection: 'column',
          gap: '16px',
        }}>
          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '16px' }}>
            <div>
              <label style={labelStyle}>환자명 (반려동물) *</label>
              <input
                style={inputStyle}
                value={form.patientName}
                onChange={(e) => handleFormChange('patientName', e.target.value)}
                placeholder="예: 뽀미"
              />
            </div>
            <div>
              <label style={labelStyle}>보호자명 *</label>
              <input
                style={inputStyle}
                value={form.guardianName}
                onChange={(e) => handleFormChange('guardianName', e.target.value)}
                placeholder="예: 홍길동"
              />
            </div>
          </div>

          <div>
            <label style={labelStyle}>연락처 *</label>
            <input
              style={inputStyle}
              value={form.contact}
              onChange={(e) => handleFormChange('contact', e.target.value)}
              placeholder="010-0000-0000"
              type="tel"
            />
          </div>

          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '16px' }}>
            <div>
              <label style={labelStyle}>종 (Species)</label>
              <select
                style={inputStyle}
                value={form.species}
                onChange={(e) => handleFormChange('species', e.target.value)}
              >
                {SPECIES_OPTIONS.map((s) => (
                  <option key={s} value={s}>{s}</option>
                ))}
              </select>
            </div>
            <div>
              <label style={labelStyle}>품종 (Breed)</label>
              <input
                style={inputStyle}
                value={form.breed}
                onChange={(e) => handleFormChange('breed', e.target.value)}
                placeholder="예: 말티즈"
              />
            </div>
          </div>

          <div>
            <label style={labelStyle}>방문 유형</label>
            <div style={{ display: 'flex', gap: '8px' }}>
              {VISIT_TYPE_OPTIONS.map((vt) => (
                <button
                  key={vt}
                  type="button"
                  onClick={() => handleFormChange('visitType', vt)}
                  style={{
                    flex: 1,
                    padding: '9px 0',
                    border: `1px solid ${form.visitType === vt ? 'var(--accent)' : 'var(--border)'}`,
                    borderRadius: 'var(--radius)',
                    background: form.visitType === vt ? 'var(--accent-subtle)' : 'var(--bg)',
                    color: form.visitType === vt ? 'var(--accent)' : 'var(--text)',
                    fontSize: '13px',
                    fontWeight: form.visitType === vt ? 600 : 400,
                    cursor: 'pointer',
                  }}
                >
                  {vt}
                </button>
              ))}
            </div>
          </div>

          <div>
            <label style={labelStyle}>주요 증상 (선택)</label>
            <textarea
              style={{ ...inputStyle, resize: 'none' }}
              rows={3}
              value={form.symptoms}
              onChange={(e) => handleFormChange('symptoms', e.target.value)}
              placeholder="예: 3일 전부터 구토, 기운 없음"
            />
          </div>

          <button
            type="button"
            onClick={handleStartSurvey}
            disabled={creatingSession || !userId}
            style={{
              padding: '12px',
              border: 'none',
              borderRadius: 'var(--radius)',
              background: creatingSession ? 'var(--bg-raised)' : 'var(--accent)',
              color: creatingSession ? 'var(--text-muted)' : '#fff',
              fontSize: '14px',
              fontWeight: 600,
              cursor: creatingSession ? 'not-allowed' : 'pointer',
              width: '100%',
            }}
          >
            {creatingSession ? 'AI 문진 준비 중...' : 'AI 문진 시작'}
          </button>
        </div>
      </div>
    );
  }

  // === SUBMITTING STEP ===
  if (step === 'submitting') {
    return (
      <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', minHeight: '300px', flexDirection: 'column', gap: '16px' }}>
        <div style={{
          width: '24px', height: '24px', border: '2px solid var(--border)',
          borderTopColor: 'var(--accent)', borderRadius: '50%',
          animation: 'spin 0.8s linear infinite',
        }} />
        <style>{`@keyframes spin { to { transform: rotate(360deg); } }`}</style>
        <p style={{ color: 'var(--text-secondary)', fontSize: '14px', margin: 0 }}>상담을 저장하는 중...</p>
      </div>
    );
  }

  // === SURVEY STEP ===
  if (!question) return null;

  const choices = getChoices(question);
  const scaleMeta = getScaleMeta(question);

  return (
    <div style={{ padding: '24px', maxWidth: '560px' }}>
      {/* Header */}
      <div style={{ marginBottom: '20px' }}>
        <h1 style={{ margin: '0 0 4px', fontSize: '18px', fontWeight: 700, color: 'var(--text)' }}>
          AI 문진
        </h1>
        <p style={{ margin: 0, fontSize: '13px', color: 'var(--text-secondary)' }}>
          {form.patientName} / {form.guardianName}
        </p>
      </div>

      {/* Progress */}
      <div style={{ marginBottom: '24px' }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '12px', color: 'var(--text-muted)', marginBottom: '6px' }}>
          <span>{currentQ + 1} / {totalQ}</span>
          <span>{progress}%</span>
        </div>
        <div style={{ height: '4px', background: 'var(--bg-raised)', borderRadius: '2px', overflow: 'hidden' }}>
          <div style={{ height: '100%', width: `${progress}%`, background: 'var(--accent)', transition: 'width 0.3s', borderRadius: '2px' }} />
        </div>
      </div>

      {error && (
        <div style={{
          padding: '10px 14px',
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

      {/* Question card */}
      <div style={{
        background: 'var(--bg)',
        border: '1px solid var(--border)',
        borderRadius: 'var(--radius-lg)',
        padding: '24px',
        marginBottom: '16px',
      }}>
        <h2 style={{ margin: '0 0 20px', fontSize: '16px', fontWeight: 600, color: 'var(--text)', lineHeight: 1.5 }}>
          {question.text}
        </h2>

        {/* Render input based on type */}
        {question.type === 'short_text' && (
          <input
            style={inputStyle}
            value={typeof currentAnswer === 'string' ? currentAnswer : ''}
            onChange={(e) => setAnswers((prev) => ({ ...prev, [question.id]: e.target.value }))}
            placeholder="답변을 입력해 주세요"
          />
        )}

        {question.type === 'long_text' && (
          <textarea
            style={{ ...inputStyle, resize: 'none' }}
            rows={4}
            value={typeof currentAnswer === 'string' ? currentAnswer : ''}
            onChange={(e) => setAnswers((prev) => ({ ...prev, [question.id]: e.target.value }))}
            placeholder="자유롭게 적어 주세요"
          />
        )}

        {question.type === 'single_choice' && choices.length > 0 && (
          <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
            {choices.map((opt) => {
              const isSelected = currentAnswer === opt;
              return (
                <button
                  key={opt}
                  type="button"
                  onClick={() => setAnswers((prev) => ({ ...prev, [question.id]: opt }))}
                  style={{
                    padding: '10px 14px',
                    border: `1px solid ${isSelected ? 'var(--accent)' : 'var(--border)'}`,
                    borderRadius: 'var(--radius)',
                    background: isSelected ? 'var(--accent-subtle)' : 'var(--bg)',
                    color: isSelected ? 'var(--accent)' : 'var(--text)',
                    fontSize: '14px',
                    fontWeight: isSelected ? 600 : 400,
                    cursor: 'pointer',
                    textAlign: 'left',
                    display: 'flex',
                    alignItems: 'center',
                    gap: '10px',
                  }}
                >
                  <span style={{
                    width: '18px', height: '18px', borderRadius: '50%', flexShrink: 0,
                    border: `2px solid ${isSelected ? 'var(--accent)' : 'var(--border)'}`,
                    display: 'flex', alignItems: 'center', justifyContent: 'center',
                  }}>
                    {isSelected && <span style={{ width: '8px', height: '8px', borderRadius: '50%', background: 'var(--accent)' }} />}
                  </span>
                  {opt}
                </button>
              );
            })}
          </div>
        )}

        {question.type === 'multi_choice' && choices.length > 0 && (
          <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
            <p style={{ margin: '0 0 8px', fontSize: '12px', color: 'var(--text-muted)' }}>복수 선택 가능</p>
            {choices.map((opt) => {
              const selected = Array.isArray(currentAnswer) ? currentAnswer : [];
              const isSelected = selected.includes(opt);
              return (
                <button
                  key={opt}
                  type="button"
                  onClick={() => toggleMulti(question.id, opt)}
                  style={{
                    padding: '10px 14px',
                    border: `1px solid ${isSelected ? 'var(--accent)' : 'var(--border)'}`,
                    borderRadius: 'var(--radius)',
                    background: isSelected ? 'var(--accent-subtle)' : 'var(--bg)',
                    color: isSelected ? 'var(--accent)' : 'var(--text)',
                    fontSize: '14px',
                    fontWeight: isSelected ? 600 : 400,
                    cursor: 'pointer',
                    textAlign: 'left',
                    display: 'flex',
                    alignItems: 'center',
                    gap: '10px',
                  }}
                >
                  <span style={{
                    width: '18px', height: '18px', borderRadius: '3px', flexShrink: 0,
                    border: `2px solid ${isSelected ? 'var(--accent)' : 'var(--border)'}`,
                    background: isSelected ? 'var(--accent)' : 'transparent',
                    display: 'flex', alignItems: 'center', justifyContent: 'center',
                  }}>
                    {isSelected && (
                      <svg width="10" height="8" viewBox="0 0 10 8" fill="none">
                        <path d="M1 4l3 3L9 1" stroke="#fff" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                      </svg>
                    )}
                  </span>
                  {opt}
                </button>
              );
            })}
          </div>
        )}

        {question.type === 'scale' && scaleMeta && (
          <div>
            <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '12px', color: 'var(--text-muted)', marginBottom: '12px' }}>
              <span>{scaleMeta.minLabel} ({scaleMeta.min})</span>
              <span>{scaleMeta.maxLabel} ({scaleMeta.max})</span>
            </div>
            <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px', justifyContent: 'center' }}>
              {Array.from({ length: scaleMeta.max - scaleMeta.min + 1 }, (_, i) => scaleMeta.min + i).map((n) => {
                const isSelected = currentAnswer === String(n);
                return (
                  <button
                    key={n}
                    type="button"
                    onClick={() => setAnswers((prev) => ({ ...prev, [question.id]: String(n) }))}
                    style={{
                      width: '42px', height: '42px',
                      border: `1px solid ${isSelected ? 'var(--accent)' : 'var(--border)'}`,
                      borderRadius: 'var(--radius)',
                      background: isSelected ? 'var(--accent-subtle)' : 'var(--bg)',
                      color: isSelected ? 'var(--accent)' : 'var(--text)',
                      fontSize: '14px',
                      fontWeight: isSelected ? 600 : 400,
                      cursor: 'pointer',
                    }}
                  >
                    {n}
                  </button>
                );
              })}
            </div>
          </div>
        )}
      </div>

      {/* Navigation */}
      <div style={{ display: 'flex', gap: '12px' }}>
        <button
          type="button"
          onClick={handlePrev}
          disabled={currentQ === 0}
          style={{
            flex: 1,
            padding: '11px',
            border: '1px solid var(--border)',
            borderRadius: 'var(--radius)',
            background: 'var(--bg)',
            color: 'var(--text)',
            fontSize: '14px',
            fontWeight: 500,
            cursor: currentQ === 0 ? 'not-allowed' : 'pointer',
            opacity: currentQ === 0 ? 0.4 : 1,
          }}
        >
          이전
        </button>
        <button
          type="button"
          onClick={handleNext}
          disabled={!canGoNext}
          style={{
            flex: 2,
            padding: '11px',
            border: 'none',
            borderRadius: 'var(--radius)',
            background: canGoNext ? 'var(--accent)' : 'var(--bg-raised)',
            color: canGoNext ? '#fff' : 'var(--text-muted)',
            fontSize: '14px',
            fontWeight: 600,
            cursor: canGoNext ? 'pointer' : 'not-allowed',
          }}
        >
          {currentQ === totalQ - 1 ? '완료 및 저장' : '다음'}
        </button>
      </div>
    </div>
  );
}
