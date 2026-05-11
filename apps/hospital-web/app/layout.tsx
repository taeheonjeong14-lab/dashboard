import type { ReactNode } from 'react';

export const metadata = {
  title: 'Vet Solution · 병원',
  description: '병원용 통합 UI — Supabase 로그인 · dashboard-api 연동 스모크',
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="ko">
      <body style={{ fontFamily: 'system-ui, sans-serif', margin: 0, padding: 24 }}>{children}</body>
    </html>
  );
}
