import type { ReactNode } from 'react';

export const metadata = {
  title: 'Hospital web (stub)',
  description: '병원용 통합 UI 자리 — 기존 dashboard-ui / DDx와 병행 운영 후 단계적 이관',
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="ko">
      <body style={{ fontFamily: 'system-ui, sans-serif', margin: 0, padding: 24 }}>{children}</body>
    </html>
  );
}
