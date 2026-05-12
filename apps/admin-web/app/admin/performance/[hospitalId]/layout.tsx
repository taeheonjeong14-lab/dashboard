import type { ReactNode } from 'react';
import AdminPerformanceHospitalLayout from '@/components/admin-performance-hospital-layout';

export default function PerformanceHospitalRouteLayout({ children }: { children: ReactNode }) {
  return <AdminPerformanceHospitalLayout>{children}</AdminPerformanceHospitalLayout>;
}
