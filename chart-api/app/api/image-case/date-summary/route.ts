import { NextRequest, NextResponse } from 'next/server';
import { chartAppAuthMiddleware } from '@/lib/chart-app/auth';
import { geminiGenerateText } from '@/lib/chart-app/gemini';
import { isParseRunUuid } from '@/lib/chart-app/uuid';
import { getChartPgPool } from '@/lib/db';

// POST /api/image-case/date-summary
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
  const examDate = String(body.examDate ?? '').trim();
  if (!isParseRunUuid(runId)) return NextResponse.json({ error: 'runId invalid' }, { status: 400 });
  if (!/^\d{4}-\d{2}-\d{2}$/.test(examDate)) {
    return NextResponse.json({ error: 'examDate must be YYYY-MM-DD' }, { status: 400 });
  }

  try {
    let items = body.items as unknown;
    if (!items) {
      const pool = getChartPgPool();
      const { rows } = await pool.query(
        `
        SELECT file_name AS "fileName", exam_type AS "examType", radiology_sub AS "radiologySub",
               brief_comment AS "briefComment", has_notable_finding AS "hasNotableFinding"
        FROM chart_pdf.report_case_images
        WHERE parse_run_id = $1::uuid AND exam_date = $2::date
        LIMIT 80
        `,
        [runId, examDate],
      );
      items = rows;
    }

    try {
      const prompt = `Summarize these veterinary imaging rows for ${examDate} in one short Korean paragraph (plain text, no markdown).\n${JSON.stringify(items).slice(0, 80_000)}`;
      const dateSummary = await geminiGenerateText(prompt);
      return NextResponse.json({ runId, examDate, dateSummary });
    } catch (e) {
      const msg = e instanceof Error ? e.message : String(e);
      if (msg.includes('GEMINI_API_KEY')) {
        return NextResponse.json({ error: 'LLM not configured (GEMINI_API_KEY)' }, { status: 503 });
      }
      throw e;
    }
  } catch (e) {
    console.error('POST /api/image-case/date-summary:', e);
    return NextResponse.json(
      { error: e instanceof Error ? e.message : 'Unknown error' },
      { status: 500 },
    );
  }
}
