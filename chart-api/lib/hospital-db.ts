export { hospitalRowFromDb, parseHospitalRelation } from '@/lib/chart-app/hospital-db';
export type { HospitalRow } from '@/lib/chart-app/hospitals-types';

/**
 * vet-report export/print가 기대하는 embed select 스펙 자리.
 * chart-api는 PostgREST embed를 쓰지 않으므로 빈 구현을 둔다.
 */
export function hospitalEmbeddedRelationSpec(): string {
  return 'hospitals(*)';
}

