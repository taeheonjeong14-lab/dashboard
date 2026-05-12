"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import type { ReactNode } from "react";

const TABS = [
  { href: "/dashboard", label: "요약" },
  { href: "/dashboard/hospital", label: "경영 통계" },
  { href: "/dashboard/blog", label: "블로그" },
  { href: "/dashboard/place", label: "플레이스" },
  { href: "/dashboard/ads", label: "광고" },
] as const;

export default function DashboardLayout({ children }: { children: ReactNode }) {
  const pathname = usePathname();

  const isActive = (href: string) => {
    if (href === "/dashboard") {
      return pathname === "/dashboard";
    }
    return pathname.startsWith(href);
  };

  return (
    <div>
      <nav
        style={{
          display: "flex",
          gap: "0",
          borderBottom: "1px solid var(--border)",
          marginBottom: "0",
          background: "var(--bg)",
          overflowX: "auto",
        }}
      >
        {TABS.map((tab) => {
          const active = isActive(tab.href);
          return (
            <Link
              key={tab.href}
              href={tab.href}
              style={{
                display: "inline-flex",
                alignItems: "center",
                padding: "10px 16px",
                fontSize: "13px",
                fontWeight: active ? 600 : 400,
                color: active ? "var(--accent)" : "var(--text-secondary)",
                borderBottom: active
                  ? "2px solid var(--accent)"
                  : "2px solid transparent",
                textDecoration: "none",
                whiteSpace: "nowrap",
                transition: "color 0.15s",
                flexShrink: 0,
              }}
            >
              {tab.label}
            </Link>
          );
        })}
      </nav>
      <div style={{ paddingTop: "0" }}>{children}</div>
    </div>
  );
}
