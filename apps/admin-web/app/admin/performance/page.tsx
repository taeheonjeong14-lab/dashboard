'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';

type HospitalRow = { id: string; name?: string };

export default function AdminPerformanceIndexRedirect() {
  const router = useRouter();
  const [message, setMessage] = useState('병원 목록을 불러오는 중…');

  useEffect(() => {
    let cancelled = false;
    fetch('/api/admin/data/hospitals', { credentials: 'include' })
      .then((r) => r.json())
      .then((data: { hospitals?: HospitalRow[] }) => {
        if (cancelled) return;
        const list = Array.isArray(data.hospitals) ? data.hospitals : [];
        if (list.length === 0) {
          setMessage('등록된 병원이 없습니다. 병원 관리에서 먼저 등록하세요.');
          return;
        }
        router.replace(`/admin/performance/${list[0].id}`);
      })
      .catch(() => {
        if (!cancelled) setMessage('병원 목록을 불러오지 못했습니다.');
      });
    return () => {
      cancelled = true;
    };
  }, [router]);

  return (
    <div className="adminMainSingleGutter">
      <p className="adminLegacyStatus" style={{ margin: 0, color: '#64748b' }}>
        {message}
      </p>
    </div>
  );
}
