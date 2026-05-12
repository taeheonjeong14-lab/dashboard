import AdminChartData from '@/components/admin-chart-data';
import { AdminShell } from '@/components/admin-shell';

export default function AdminChartDataPage() {
  return (
    <AdminShell title="차트 데이터" description="추출·저장된 parse run 목록(준비 중)">
      <AdminChartData />
    </AdminShell>
  );
}
