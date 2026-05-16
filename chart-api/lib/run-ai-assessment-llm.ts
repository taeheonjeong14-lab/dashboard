import { GoogleGenAI, Type } from "@google/genai";
import { dbSchema } from "@/lib/supabase-db-schema";
import { getSupabaseServerClient } from "@/lib/supabase/server";

export type AssessmentCondition = {
  name: string;
  status: "confirmed" | "suspected";
  rationale: string;
};

export type AiAssessment = {
  conditions: AssessmentCondition[];
  generatedAt: string;
};

type ChartBodyEntry = { dateTime: string; bodyText: string | null; planText?: string | null };
type LabItem = { itemName: string; valueText: string | null; flag: string | null };
type LabEntry = { dateTime: string; items: LabItem[] };

export type AssessmentInput = {
  chartBodyByDate: ChartBodyEntry[];
  labItemsByDate: LabEntry[];
};

function buildPrompt(input: AssessmentInput): string {
  const chartSection = input.chartBodyByDate
    .map((g) => {
      const body = (g.bodyText ?? "").trim();
      const plan = (g.planText ?? "").trim();
      const parts: string[] = [`[${g.dateTime}]`];
      if (body) parts.push(`차트 본문: ${body}`);
      if (plan) parts.push(`플랜/처방: ${plan}`);
      return parts.join("\n");
    })
    .filter((s) => s.length > 0)
    .join("\n\n");

  const abnormalLab = input.labItemsByDate
    .flatMap((g) =>
      g.items
        .filter((it) => it.flag && it.flag.trim().length > 0)
        .map((it) => `[${g.dateTime}] ${it.itemName}: ${it.valueText ?? ""} (${it.flag})`),
    )
    .join("\n");

  const sections: string[] = [];
  if (chartSection) sections.push(`=== 차트 본문 및 플랜 ===\n${chartSection}`);
  if (abnormalLab) sections.push(`=== 이상 검사 수치 ===\n${abnormalLab}`);

  const dataText = sections.length > 0 ? sections.join("\n\n") : "(데이터 없음)";

  return `당신은 수의 임상 기록을 분석하는 전문가입니다.
아래 차트 기록과 검사 데이터를 검토하고, 이 환자에게 확인되었거나 의심되는 질환/이상 소견 목록을 JSON으로 출력하세요.

규칙:
- 최대 5개. 가장 심각하거나 임상적으로 중요한 순서대로 나열할 것
- status: "confirmed" = 기록 또는 검사 결과로 확진/진단된 것, "suspected" = 소견이 있으나 확진 전이거나 의심 단계인 것
- rationale: 1~2문장. 근거를 간결하게 한국어로 서술
- 데이터에 근거 없는 질환은 절대 포함하지 말 것
- 질환명은 한국어로 작성

${dataText}`;
}

function normalizeConditions(raw: unknown): AssessmentCondition[] {
  if (!raw || typeof raw !== "object") return [];
  const obj = raw as Record<string, unknown>;
  const arr = Array.isArray(obj.conditions) ? obj.conditions : [];
  const result: AssessmentCondition[] = [];
  for (const item of arr) {
    if (!item || typeof item !== "object") continue;
    const c = item as Record<string, unknown>;
    const name = typeof c.name === "string" ? c.name.trim() : "";
    const status = c.status === "confirmed" ? "confirmed" : "suspected";
    const rationale = typeof c.rationale === "string" ? c.rationale.trim() : "";
    if (name) result.push({ name, status, rationale });
    if (result.length >= 5) break;
  }
  return result;
}

export async function generateAssessment(input: AssessmentInput): Promise<AiAssessment> {
  const apiKey = process.env.GEMINI_API_KEY;
  if (!apiKey) throw new Error("GEMINI_API_KEY not set");

  const model =
    process.env.GEMINI_REPORT_MODEL?.trim() ||
    process.env.GEMINI_VISION_MODEL?.trim() ||
    "gemini-2.5-flash";

  const genai = new GoogleGenAI({ apiKey });
  const prompt = buildPrompt(input);

  const response = await genai.models.generateContent({
    model,
    contents: [{ role: "user", parts: [{ text: prompt }] }],
    config: {
      responseMimeType: "application/json",
      responseSchema: {
        type: Type.OBJECT,
        properties: {
          conditions: {
            type: Type.ARRAY,
            items: {
              type: Type.OBJECT,
              properties: {
                name: { type: Type.STRING },
                status: { type: Type.STRING, enum: ["confirmed", "suspected"] },
                rationale: { type: Type.STRING },
              },
              required: ["name", "status", "rationale"],
            },
          },
        },
        required: ["conditions"],
      },
    },
  });

  const text = (typeof response.text === "string" ? response.text : "").trim();
  let parsed: unknown;
  try {
    parsed = JSON.parse(text);
  } catch {
    throw new Error(`AI Assessment LLM JSON 파싱 실패: ${text.slice(0, 200)}`);
  }

  const conditions = normalizeConditions(parsed);
  return { conditions, generatedAt: new Date().toISOString() };
}

export async function generateAndSaveAssessment(
  runId: string,
  input: AssessmentInput,
): Promise<void> {
  const assessment = await generateAssessment(input);
  const supabase = getSupabaseServerClient();
  const db = dbSchema(supabase);
  const { error } = await db
    .from("parse_runs")
    .update({ ai_assessment: assessment })
    .eq("id", runId);
  if (error) {
    throw new Error(`AI Assessment DB 저장 실패: ${error.message}`);
  }
}
