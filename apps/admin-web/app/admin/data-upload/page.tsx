import { Suspense } from 'react';
import AdminDataUpload from '@/components/admin-data-upload';
import { AdminShell } from '@/components/admin-shell';

export default function AdminDataUploadPage() {
  return (
    <AdminShell title="데이터 수집" description="PDF 업로드 → 추출 실행 · 경영통계(엑셀) 업로드">
      <Suspense fallback={<p style={{ padding: 16, color: '#64748b', fontSize: 14 }}>불러오는 중…</p>}>
        <AdminDataUpload />
      </Suspense>
    </AdminShell>
  );
}
