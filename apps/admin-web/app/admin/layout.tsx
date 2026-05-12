import type { ReactNode } from 'react';
import { requireAdminSession } from '@/lib/require-admin';
import './admin-legacy.css';

export const dynamic = 'force-dynamic';

export default async function AdminSectionLayout({ children }: { children: ReactNode }) {
  await requireAdminSession();
  return <>{children}</>;
}
