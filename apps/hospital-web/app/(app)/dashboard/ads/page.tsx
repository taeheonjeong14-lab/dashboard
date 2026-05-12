export default function AdsDashboardPage() {
  return (
    <div
      style={{
        display: "flex",
        flexDirection: "column",
        alignItems: "center",
        justifyContent: "center",
        minHeight: "300px",
        padding: "40px 20px",
        gap: "12px",
      }}
    >
      <p
        style={{
          fontSize: "15px",
          fontWeight: 600,
          color: "var(--text)",
          margin: 0,
        }}
      >
        광고 통계 데이터 준비 중
      </p>
      <p
        style={{
          fontSize: "13px",
          color: "var(--text-secondary)",
          margin: 0,
          textAlign: "center",
        }}
      >
        네이버 검색광고, 카카오 광고 등의 성과 데이터를 곧 제공할 예정입니다.
      </p>
    </div>
  );
}
