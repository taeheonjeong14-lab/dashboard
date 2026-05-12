import type { ReactNode } from 'react';
import { cookies } from 'next/headers';
import './globals.css';

export const metadata = {
  title: 'VetSolution',
  description: '동물병원 통합 관리 플랫폼',
};

export default async function RootLayout({ children }: { children: ReactNode }) {
  const cookieStore = await cookies();
  const theme = cookieStore.get('theme')?.value;
  const isDark = theme === 'dark';

  return (
    <html lang="ko" className={isDark ? 'dark' : ''}>
      <body>{children}</body>
    </html>
  );
}
