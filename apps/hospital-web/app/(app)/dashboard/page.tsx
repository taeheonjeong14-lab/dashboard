"use client";

import { useEffect, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import {
  fetchSummaryKpis,
  fetchSummaryBlogRanks,
  fetchSummaryPlaceRanks,
  type SummaryKpis,
  type BlogRankSummaryRow,
  type PlaceRankSummaryRow,
} from "@/lib/queries";
import SummaryDualWeekCompareChart from "@/components/dashboard/SummaryDualWeekCompareChart";
import BlogRanksSection from "@/components/dashboard/BlogRanksSection";

type LoadState = "loading" | "error" | "done";

export default function DashboardSummaryPage() {
  const [loadState, setLoadState] = useState<LoadState>("loading");
  const [error, setError] = useState<string | null>(null);
  const [hospitalId, setHospitalId] = useState<string | null>(null);
  const [kpis, setKpis] = useState<SummaryKpis | null>(null);
  const [blogRanks, setBlogRanks] = useState<BlogRankSummaryRow[]>([]);
  const [placeRanks, setPlaceRanks] = useState<PlaceRankSummaryRow[]>([]);

  useEffect(() => {
    let cancelled = false;

    async function load() {
      try {
        const supabase = createClient();
        const {
          data: { user },
        } = await supabase.auth.getUser();
        if (!user) throw new Error("로그인이 필요합니다.");

        const { data: profile } = await supabase
          .schema("core")
          .from("users")
          .select("hospital_id")
          .eq("id", user.id)
          .maybeSingle();

        const hid = profile?.hospital_id ? String(profile.hospital_id) : null;
        if (!hid) {
          if (!cancelled) {
            setHospitalId(null);
            setLoadState("done");
          }
          return;
        }

        const [kpisData, blogRanksData, placeRanksData] = await Promise.all([
          fetchSummaryKpis(hid),
          fetchSummaryBlogRanks(hid),
          fetchSummaryPlaceRanks(hid),
        ]);

        if (!cancelled) {
          setHospitalId(hid);
          setKpis(kpisData);
          setBlogRanks(blogRanksData);
          setPlaceRanks(placeRanksData);
          setLoadState("done");
        }
      } catch (err) {
        if (!cancelled) {
          setError(err instanceof Error ? err.message : "데이터를 불러오는 중 오류가 발생했습니다.");
          setLoadState("error");
        }
      }
    }

    load();
    return () => {
      cancelled = true;
    };
  }, []);

  if (loadState === "loading") {
    return (
      <div
        style={{
          display: "flex",
          alignItems: "center",
          justifyContent: "center",
          minHeight: "300px",
          color: "var(--text-muted)",
          fontSize: "14px",
        }}
      >
        데이터를 불러오는 중...
      </div>
    );
  }

  if (loadState === "error") {
    return (
      <div
        style={{
          margin: "24px",
          padding: "16px",
          border: "1px solid var(--danger)",
          borderRadius: "var(--radius)",
          background: "var(--danger-subtle)",
          color: "var(--danger)",
          fontSize: "14px",
        }}
      >
        {error ?? "알 수 없는 오류"}
      </div>
    );
  }

  if (!hospitalId) {
    return (
      <div
        style={{
          display: "flex",
          alignItems: "center",
          justifyContent: "center",
          minHeight: "300px",
          color: "var(--text-muted)",
          fontSize: "14px",
        }}
      >
        병원 정보가 없습니다. 관리자에게 문의하세요.
      </div>
    );
  }

  const hasKpiData =
    kpis &&
    (kpis.salesCurrentWeek.some((v) => v != null) ||
      kpis.newCustomersCurrentWeek.some((v) => v != null));

  return (
    <div>
      {/* KPI 섹션 */}
      <section style={{ padding: "20px 20px 0" }}>
        <h2
          style={{
            fontSize: "15px",
            fontWeight: 600,
            color: "var(--text)",
            marginBottom: "16px",
          }}
        >
          최근 7일 KPI 현황
        </h2>
        {!hasKpiData ? (
          <p
            style={{
              padding: "16px",
              border: "1px solid var(--border)",
              borderRadius: "var(--radius)",
              color: "var(--text-muted)",
              fontSize: "13px",
            }}
          >
            데이터 없음
          </p>
        ) : (
          <div
            style={{
              display: "grid",
              gridTemplateColumns: "repeat(auto-fit, minmax(300px, 1fr))",
              gap: "16px",
            }}
          >
            <div>
              <p
                style={{
                  fontSize: "12px",
                  color: "var(--text-secondary)",
                  marginBottom: "8px",
                }}
              >
                매출 비교
              </p>
              <SummaryDualWeekCompareChart
                ariaLabel="최근 7일 vs 직전 7일 매출 비교 차트"
                variant="currency"
                currentWeek={kpis?.salesCurrentWeek}
                previousWeek={kpis?.salesPreviousWeek}
                datePairs={kpis?.datePairs}
              />
            </div>
            <div>
              <p
                style={{
                  fontSize: "12px",
                  color: "var(--text-secondary)",
                  marginBottom: "8px",
                }}
              >
                신규 고객 비교
              </p>
              <SummaryDualWeekCompareChart
                ariaLabel="최근 7일 vs 직전 7일 신규 고객 비교 차트"
                variant="integer"
                currentWeek={kpis?.newCustomersCurrentWeek}
                previousWeek={kpis?.newCustomersPreviousWeek}
                datePairs={kpis?.datePairs}
              />
            </div>
          </div>
        )}
      </section>

      {/* 블로그 순위 섹션 */}
      <section style={{ marginTop: "24px" }}>
        <div style={{ padding: "0 20px 8px" }}>
          <h2
            style={{
              fontSize: "15px",
              fontWeight: 600,
              color: "var(--text)",
            }}
          >
            블로그 키워드 순위 요약
          </h2>
        </div>
        <BlogRanksSection
          rows={blogRanks}
          hospitalId={hospitalId}
          variant="simple"
          title=""
          description="최신 수집 기준 네이버 블로그 노출 순위입니다."
          headingId="summary-blog-ranks"
        />
      </section>

      {/* 플레이스 순위 섹션 */}
      <section style={{ marginTop: "8px", padding: "0 20px 24px" }}>
        <h2
          style={{
            fontSize: "15px",
            fontWeight: 600,
            color: "var(--text)",
            marginBottom: "12px",
          }}
        >
          플레이스 키워드 순위 요약
        </h2>
        {placeRanks.length === 0 ? (
          <p
            style={{
              padding: "16px",
              border: "1px solid var(--border)",
              borderRadius: "var(--radius)",
              color: "var(--text-muted)",
              fontSize: "13px",
            }}
          >
            데이터 없음
          </p>
        ) : (
          <div
            style={{
              overflowX: "auto",
              border: "1px solid var(--border)",
              borderRadius: "var(--radius)",
            }}
          >
            <table
              style={{
                width: "100%",
                borderCollapse: "collapse",
                fontSize: "13px",
              }}
            >
              <thead>
                <tr
                  style={{
                    borderBottom: "1px solid var(--border)",
                    color: "var(--text-secondary)",
                  }}
                >
                  <th
                    style={{
                      padding: "8px 12px",
                      textAlign: "left",
                      fontWeight: 500,
                    }}
                  >
                    검색어
                  </th>
                  <th
                    style={{
                      padding: "8px 12px",
                      textAlign: "left",
                      fontWeight: 500,
                    }}
                  >
                    순위
                  </th>
                </tr>
              </thead>
              <tbody>
                {placeRanks.map((row) => (
                  <tr
                    key={row.keyword}
                    style={{
                      borderBottom: "1px solid var(--border)",
                      color: "var(--text)",
                    }}
                  >
                    <td style={{ padding: "8px 12px" }}>{row.keyword}</td>
                    <td style={{ padding: "8px 12px" }}>
                      {row.rank_value != null ? (
                        `${new Intl.NumberFormat("ko-KR").format(row.rank_value)}위`
                      ) : (
                        <span style={{ color: "var(--text-muted)" }}>-</span>
                      )}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </section>
    </div>
  );
}
