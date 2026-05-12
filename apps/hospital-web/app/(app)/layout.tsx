import { redirect } from 'next/navigation';
import { createClient } from '@/lib/supabase/server';
import { HospitalShell } from '@/components/shell/hospital-shell';
import type { ReactNode } from 'react';

export default async function AppLayout({ children }: { children: ReactNode }) {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    redirect('/login');
  }

  // Fetch user profile from core.users
  const { data: coreUser } = await supabase
    .schema('core')
    .from('users')
    .select('approved, name, hospital_name')
    .eq('id', user.id)
    .single();

  // Not yet approved — show pending screen inline
  if (coreUser && coreUser.approved === false) {
    return (
      <div
        style={{
          display: 'flex',
          minHeight: '100vh',
          alignItems: 'center',
          justifyContent: 'center',
          background: 'var(--bg-subtle)',
          padding: '16px',
        }}
      >
        <div
          style={{
            maxWidth: '420px',
            width: '100%',
            background: 'var(--bg)',
            border: '1px solid var(--border)',
            borderRadius: 'var(--radius-lg)',
            padding: '40px 32px',
            textAlign: 'center',
            boxShadow: '0 1px 3px rgba(0,0,0,0.06)',
          }}
        >
          <div style={{ fontSize: '36px', marginBottom: '16px' }}>⏳</div>
          <h1
            style={{
              margin: '0 0 12px',
              fontSize: '17px',
              fontWeight: 700,
              color: 'var(--text)',
            }}
          >
            승인 대기 중
          </h1>
          <p
            style={{
              margin: '0 0 20px',
              fontSize: '14px',
              color: 'var(--text-secondary)',
              lineHeight: 1.7,
            }}
          >
            관리자 승인 후 서비스를 이용할 수 있습니다.
            <br />
            승인 완료 시 가입하신 이메일로 안내드립니다.
          </p>
          <a
            href="/auth/signout"
            style={{
              fontSize: '13px',
              color: 'var(--text-muted)',
              textDecoration: 'underline',
            }}
          >
            로그아웃
          </a>
        </div>
      </div>
    );
  }

  const userName = coreUser?.name ?? user.user_metadata?.name ?? user.email ?? null;
  const hospitalName =
    coreUser?.hospital_name ?? user.user_metadata?.hospital_name ?? null;

  return (
    <HospitalShell userName={userName} hospitalName={hospitalName}>
      {children}
    </HospitalShell>
  );
}
