import { NextRequest, NextResponse } from 'next/server';
import { chartAppAuthMiddleware } from '@/lib/chart-app/auth';
import { geminiGenerateText, tryParseJsonObject } from '@/lib/chart-app/gemini';
import { isParseRunUuid } from '@/lib/chart-app/uuid';
import { getChartPgPool } from '@/lib/db';

// POST /api/report/generate — DB 로드 후 템플릿 모델 JSON (저장 없음)
export async function POST(request: NextRequest) {
  const authErr = chartAppAuthMiddleware(request);
  if (authErr) return authErr;

  let body: Record<string, unknown>;
  try {
    body = (await request.json()) as Record<string, unknown>;
  } catch {
    return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
  }

  const runId = String(body.runId ?? '').trim();
  if (!isParseRunUuid(runId)) return NextResponse.json({ error: 'runId invalid' }, { status: 400 });

  try {
    const pool = getChartPgPool();
    const ok = await pool.query(`SELECT 1 FROM chart_pdf.parse_runs WHERE id = $1::uuid`, [runId]);
    if (ok.rows.length === 0) return NextResponse.json({ error: 'run not found' }, { status: 404 });

    const [basic, charts, labs] = await Promise.all([
      pool.query(`SELECT * FROM chart_pdf.result_basic_info WHERE parse_run_id = $1::uuid LIMIT 1`, [runId]),
      pool.query(`SELECT * FROM chart_pdf.result_chart_by_date WHERE parse_run_id = $1::uuid`, [runId]),
      pool.query(`SELECT * FROM chart_pdf.result_lab_items WHERE parse_run_id = $1::uuid LIMIT 80`, [runId]),
    ]);

    const source = {
      basicInfo: basic.rows[0] ?? null,
      charts: charts.rows,
      labs: labs.rows,
    };

    try {
      const prompt = `Return JSON only: { "templateModel": { "sections": [] }, "generated": { "highlights": [] } } — Korean vet health report planning structure based on:\n${JSON.stringify(source).slice(0, 100_000)}`;
      const raw = await geminiGenerateText(prompt);
      const parsed = tryParseJsonObject(raw) as Record<string, unknown>;
      const templateModel = parsed.templateModel ?? parsed;
      const generated = parsed.generated ?? {};
      return NextResponse.json({ runId, source, generated, templateModel });
    } catch (e) {
      const msg = e instanceof Error ? e.message : String(e);
      if (msg.includes('GEMINI_API_KEY')) {
        return NextResponse.json({ error: 'LLM not configured (GEMINI_API_KEY)' }, { status: 503 });
      }
      throw e;
    }
  } catch (e) {
    console.error('POST /api/report/generate:', e);
    return NextResponse.json(
      { error: e instanceof Error ? e.message : 'Unknown error' },
      { status: 500 },
    );
  }
}
