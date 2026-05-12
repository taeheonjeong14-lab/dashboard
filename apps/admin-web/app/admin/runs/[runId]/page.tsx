import { AdminRunExtractionDetail } from '@/components/admin-run-extraction-detail';
import { AdminShell } from '@/components/admin-shell';

export default async function AdminRunDetailPage({ params }: { params: Promise<{ runId: string }> }) {
  const { runId } = await params;
  return (
    <AdminShell title="추출 결과 상세" description="parse run 단위로 섹션별 편집·저장">
      <div className="adminMainSingleGutter">
        <AdminRunExtractionDetail runId={runId} embedded={false} />
      </div>
    </AdminShell>
  );
}
