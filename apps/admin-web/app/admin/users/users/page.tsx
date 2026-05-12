import { AdminShell } from '@/components/admin-shell';
import AdminUsersConsole from '@/components/admin-users-console';

export default function AdminUsersAdminPage() {
  return (
    <AdminShell title="사용자 관리 · 사용자 관리" description="가입 승인/거절 및 사용자 상태 관리">
      <div className="adminMainSingleGutter">
        <AdminUsersConsole />
      </div>
    </AdminShell>
  );
}

