import type { ReactNode } from 'react';

export const dynamic = 'force-dynamic';

export const metadata = {
  title: 'Chart API',
  description: '진료 차트 / 건강검진 (vet-report 호환) HTTP API',
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="ko">
      <body style={{ fontFamily: 'system-ui', padding: 24 }}>{children}</body>
    </html>
  );
}
