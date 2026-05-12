import type { ReactNode } from 'react';
import { AdminShell } from '@/components/admin-shell';
import '@/styles/admin-stats.css';

export default function PerformanceLayout({ children }: { children: ReactNode }) {
  return (
    <AdminShell title="통계" description="병원별 경영·마케팅 통계">
      {children}
    </AdminShell>
  );
}
