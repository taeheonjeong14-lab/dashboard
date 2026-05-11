import type { ReactNode } from 'react';

export const metadata = {
  title: 'Admin web (stub)',
  description: '관리자용 통합 UI 자리 — 기존 admin-ui·vet-report·DDx 관리 기능과 병행 후 단계적 이관',
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="ko">
      <body style={{ fontFamily: 'system-ui, sans-serif', margin: 0, padding: 24 }}>{children}</body>
    </html>
  );
}
