'use client';

import type { ReactNode } from 'react';
import { Sidebar } from './sidebar';
import { Header } from './header';

interface HospitalShellProps {
  children: ReactNode;
  userName: string | null;
  hospitalName: string | null;
}

export function HospitalShell({ children, userName, hospitalName }: HospitalShellProps) {
  return (
    <div style={{ display: 'flex', minHeight: '100vh' }}>
      <Sidebar userName={userName} hospitalName={hospitalName} />
      <div
        style={{
          marginLeft: 'var(--sidebar-width)',
          flex: 1,
          display: 'flex',
          flexDirection: 'column',
          minWidth: 0,
        }}
      >
        <Header />
        <main
          style={{
            flex: 1,
            marginTop: '40px',
            padding: '24px',
            background: 'var(--bg-subtle)',
            minHeight: 'calc(100vh - 40px)',
          }}
        >
          {children}
        </main>
      </div>
    </div>
  );
}
