import AdminHealthReport from '@/components/admin-health-report';
import { AdminShell } from '@/components/admin-shell';

export default function AdminHealthReportPage() {
  return (
    <AdminShell title="건강검진" description="저장된 건강검진 보고서 검토·수정">
      <AdminHealthReport />
    </AdminShell>
  );
}
