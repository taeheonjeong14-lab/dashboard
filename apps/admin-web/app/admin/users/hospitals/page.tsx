import AdminHospitalsManager from '@/components/admin-hospitals-manager';
import { AdminShell } from '@/components/admin-shell';

export default function AdminHospitalsAdminPage() {
  return (
    <AdminShell title="사용자 관리 · 병원 관리" description="병원 정보 조회/추가/수정 및 키워드·광고 설정">
      <AdminHospitalsManager />
    </AdminShell>
  );
}

