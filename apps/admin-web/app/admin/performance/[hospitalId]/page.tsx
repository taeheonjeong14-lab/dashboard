import { redirect } from 'next/navigation';

export default function AdminPerformanceHospitalRoot({
  params,
}: {
  params: { hospitalId: string };
}) {
  redirect(`/admin/performance/${params.hospitalId}/hospital`);
}
