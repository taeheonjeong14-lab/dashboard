import Link from 'next/link';
import { redirect } from 'next/navigation';
import { createClient } from '@/lib/supabase/server';
import { DashboardApiSmoke } from '@/components/dashboard-api-smoke';

export default async function DashboardPage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    redirect('/login');
  }

  const apiBase =
    process.env.NEXT_PUBLIC_DASHBOARD_API_URL?.trim() ||
    'https://dashboard-api-jade.vercel.app';

  return (
    <main style={{ padding: 24, maxWidth: 560 }}>
      <h1 style={{ fontSize: '1.25rem' }}>대시보드 (스타브)</h1>
      <p style={{ marginTop: 8 }}>
        <strong>{user.email}</strong> 로 로그인됨
      </p>
      <p style={{ fontSize: '0.875rem', color: '#555', lineHeight: 1.5, marginTop: 12 }}>
        브라우저에서 <code>dashboard-api</code>를 호출할 때 CORS가 허용되는지 확인하는 스모크입니다.
      </p>
      <DashboardApiSmoke apiBase={apiBase} />
      <p style={{ marginTop: 24, fontSize: '0.875rem' }}>
        <Link href="/auth/signout">로그아웃</Link>
        {' · '}
        <Link href="/">홈</Link>
      </p>
    </main>
  );
}
