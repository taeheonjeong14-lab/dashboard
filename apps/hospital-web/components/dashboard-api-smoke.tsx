'use client';

import { useEffect, useState } from 'react';

type Props = { apiBase: string };

export function DashboardApiSmoke({ apiBase }: Props) {
  const [text, setText] = useState<string>('불러오는 중…');
  const [ok, setOk] = useState<boolean | null>(null);

  useEffect(() => {
    const base = apiBase.replace(/\/$/, '');
    fetch(`${base}/api/health`, { credentials: 'omit' })
      .then(async (r) => {
        const body = await r.text();
        setOk(r.ok);
        setText(`${r.status} ${body}`);
      })
      .catch((e: unknown) => {
        setOk(false);
        setText(e instanceof Error ? e.message : String(e));
      });
  }, [apiBase]);

  return (
    <section
      style={{
        marginTop: 16,
        padding: 12,
        borderRadius: 8,
        background: ok === true ? '#eefcf0' : ok === false ? '#fdecec' : '#f6f6f6',
        fontFamily: 'ui-monospace, monospace',
        fontSize: '0.8rem',
        wordBreak: 'break-word',
      }}
    >
      <strong>GET {apiBase.replace(/\/$/, '')}/api/health</strong>
      <pre style={{ margin: '8px 0 0', whiteSpace: 'pre-wrap' }}>{text}</pre>
    </section>
  );
}
