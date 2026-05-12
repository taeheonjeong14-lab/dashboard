'use client';

import { useState, useEffect } from 'react';
import { Moon, Sun } from 'lucide-react';

export function ThemeToggle() {
  const [isDark, setIsDark] = useState(false);

  useEffect(() => {
    // Sync with current HTML class on mount
    setIsDark(document.documentElement.classList.contains('dark'));
  }, []);

  const toggle = () => {
    const newDark = !isDark;
    setIsDark(newDark);
    if (newDark) {
      document.documentElement.classList.add('dark');
      document.cookie = 'theme=dark; path=/; max-age=31536000; SameSite=Lax';
    } else {
      document.documentElement.classList.remove('dark');
      document.cookie = 'theme=light; path=/; max-age=31536000; SameSite=Lax';
    }
  };

  return (
    <button
      onClick={toggle}
      title={isDark ? '라이트 모드로 전환' : '다크 모드로 전환'}
      aria-label={isDark ? '라이트 모드로 전환' : '다크 모드로 전환'}
      style={{
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        width: '30px',
        height: '30px',
        background: 'transparent',
        border: '1px solid var(--border)',
        borderRadius: 'var(--radius)',
        cursor: 'pointer',
        color: 'var(--text-muted)',
        flexShrink: 0,
        transition: 'color 0.15s, border-color 0.15s',
      }}
    >
      {isDark ? <Sun size={14} /> : <Moon size={14} />}
    </button>
  );
}
