export default function AdminHomePage() {
  return (
    <main>
      <h1 style={{ fontSize: '1.25rem' }}>관리자용 웹 (스타브)</h1>
      <p style={{ maxWidth: 560, lineHeight: 1.6 }}>
        이 앱은 통합 작업용 플레이스홀더입니다. 프로덕션에서 쓰는{' '}
        <strong>admin-ui</strong>(Vite)·<strong>vet-report</strong>·<strong>DDx 관리자</strong> 등은 그대로 두고,
        검증된 기능부터 여기로 옮깁니다.
      </p>
      <p style={{ fontSize: '0.875rem', color: '#555' }}>
        로컬 개발: 레포 루트에서 <code>npm run admin-web:dev</code> (포트 3011)
      </p>
    </main>
  );
}
