import type { ReactNode } from 'react';
import { requireAdminSession } from '@/lib/require-admin';
import './admin-legacy.css';

export default async function AdminSectionLayout({ children }: { children: ReactNode }) {
  await requireAdminSession();
  return (
    <div
      style={{
        margin: 0,
        minHeight: '100vh',
        fontFamily: '"Segoe UI", system-ui, sans-serif',
        background: 'radial-gradient(circle at 15% 10%, #f7fbff 0%, #f2f6ff 35%, #eef2ff 100%)',
        color: '#0f172a',
      }}
    >
      {children}
    </div>
  );
}
