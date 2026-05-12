import { redirect } from 'next/navigation';

/** 예전 URL 호환: 차트 추출 메뉴는 차트 데이터 + 데이터 수집으로 분리됨 */
export default function AdminChartExtractionRedirectPage() {
  redirect('/admin/chart-data');
}
