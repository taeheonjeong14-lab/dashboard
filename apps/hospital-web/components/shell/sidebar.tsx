'use client';

import { usePathname, useRouter } from 'next/navigation';
import Link from 'next/link';
import { BarChart2, FileHeart, Stethoscope, LogOut } from 'lucide-react';
import { createClient } from '@/lib/supabase/client';

interface SidebarProps {
  userName: string | null;
  hospitalName: string | null;
}

const navItems = [
  {
    href: '/dashboard',
    label: '경영 대시보드',
    icon: BarChart2,
    matchPrefix: '/dashboard',
  },
  {
    href: '/health-report',
    label: '건강검진 리포트',
    icon: FileHeart,
    matchPrefix: '/health-report',
  },
  {
    href: '/ai-assist',
    label: 'AI 진료 보조',
    icon: Stethoscope,
    matchPrefix: '/ai-assist',
  },
];

export function Sidebar({ userName, hospitalName }: SidebarProps) {
  const pathname = usePathname();
  const router = useRouter();

  const handleSignOut = async () => {
    const supabase = createClient();
    await supabase.auth.signOut();
    router.push('/login');
  };

  return (
    <aside style={styles.sidebar}>
      {/* Logo */}
      <div style={styles.logoArea}>
        <span style={styles.logoIcon}>🐾</span>
        <span style={styles.logoText}>VetSolution</span>
      </div>

      {/* Nav */}
      <nav style={styles.nav}>
        {navItems.map((item) => {
          const isActive = pathname.startsWith(item.matchPrefix);
          const Icon = item.icon;
          return (
            <Link
              key={item.href}
              href={item.href}
              style={{
                ...styles.navItem,
                ...(isActive ? styles.navItemActive : {}),
              }}
            >
              <Icon
                size={15}
                style={{
                  ...styles.navIcon,
                  color: isActive ? 'var(--accent)' : 'var(--text-muted)',
                }}
              />
              <span style={{ color: isActive ? 'var(--accent)' : 'var(--text-secondary)' }}>
                {item.label}
              </span>
            </Link>
          );
        })}
      </nav>

      {/* Spacer */}
      <div style={{ flex: 1 }} />

      {/* User area */}
      <div style={styles.userArea}>
        <div style={styles.userInfo}>
          <div style={styles.userName}>{userName ?? '사용자'}</div>
          {hospitalName && (
            <div style={styles.hospitalName}>{hospitalName}</div>
          )}
        </div>
        <button onClick={handleSignOut} style={styles.signOutBtn} title="로그아웃">
          <LogOut size={14} />
          <span>로그아웃</span>
        </button>
      </div>
    </aside>
  );
}

const styles: Record<string, React.CSSProperties> = {
  sidebar: {
    position: 'fixed',
    top: 0,
    left: 0,
    bottom: 0,
    width: 'var(--sidebar-width)',
    background: 'var(--bg)',
    borderRight: '1px solid var(--border)',
    display: 'flex',
    flexDirection: 'column',
    zIndex: 50,
    overflowY: 'auto',
  },
  logoArea: {
    display: 'flex',
    alignItems: 'center',
    gap: '8px',
    padding: '14px 16px',
    borderBottom: '1px solid var(--border)',
    flexShrink: 0,
  },
  logoIcon: {
    fontSize: '18px',
    lineHeight: 1,
  },
  logoText: {
    fontSize: '14px',
    fontWeight: 700,
    color: 'var(--text)',
    letterSpacing: '-0.01em',
  },
  nav: {
    display: 'flex',
    flexDirection: 'column',
    padding: '8px',
    gap: '2px',
  },
  navItem: {
    display: 'flex',
    alignItems: 'center',
    gap: '9px',
    padding: '7px 10px',
    borderRadius: 'var(--radius)',
    fontSize: '13px',
    fontWeight: 450,
    textDecoration: 'none',
    color: 'var(--text-secondary)',
    transition: 'background 0.1s',
    borderLeft: '2px solid transparent',
  },
  navItemActive: {
    background: 'var(--accent-subtle)',
    borderLeft: '2px solid var(--accent)',
    fontWeight: 500,
  },
  navIcon: {
    flexShrink: 0,
  },
  userArea: {
    padding: '12px',
    borderTop: '1px solid var(--border)',
    display: 'flex',
    flexDirection: 'column',
    gap: '8px',
    flexShrink: 0,
  },
  userInfo: {
    padding: '0 4px',
  },
  userName: {
    fontSize: '13px',
    fontWeight: 500,
    color: 'var(--text)',
    overflow: 'hidden',
    textOverflow: 'ellipsis',
    whiteSpace: 'nowrap',
  },
  hospitalName: {
    fontSize: '11px',
    color: 'var(--text-muted)',
    marginTop: '2px',
    overflow: 'hidden',
    textOverflow: 'ellipsis',
    whiteSpace: 'nowrap',
  },
  signOutBtn: {
    display: 'flex',
    alignItems: 'center',
    gap: '6px',
    padding: '6px 10px',
    fontSize: '12px',
    color: 'var(--text-muted)',
    background: 'transparent',
    border: '1px solid var(--border)',
    borderRadius: 'var(--radius)',
    cursor: 'pointer',
    transition: 'color 0.15s, border-color 0.15s',
    width: '100%',
  },
};
