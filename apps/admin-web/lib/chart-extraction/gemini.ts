export type GeminiTextOptions = {
  maxOutputTokens?: number;
};

export async function geminiGenerateText(prompt: string, opts?: GeminiTextOptions): Promise<string> {
  const key = process.env.GEMINI_API_KEY?.trim() || process.env.NEXT_PUBLIC_GEMINI_API_KEY?.trim();
  if (!key) {
    throw new Error('GEMINI_API_KEY is not configured');
  }

  const model = process.env.GEMINI_MODEL?.trim() || 'gemini-2.0-flash';
  const url = `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent?key=${encodeURIComponent(key)}`;
  const maxOut = opts?.maxOutputTokens ?? 8192;

  const res = await fetch(url, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      contents: [{ parts: [{ text: prompt }] }],
      generationConfig: { temperature: 0.3, maxOutputTokens: maxOut },
    }),
  });

  if (!res.ok) {
    const t = await res.text();
    throw new Error(`Gemini HTTP ${res.status}: ${t.slice(0, 500)}`);
  }

  const data = (await res.json()) as {
    candidates?: Array<{ content?: { parts?: Array<{ text?: string }> } }>;
  };
  const text = data.candidates?.[0]?.content?.parts?.map((p) => p.text ?? '').join('') ?? '';
  if (!text) throw new Error('Gemini returned empty text');
  return text;
}

export function extractFirstBalancedJsonObject(raw: string): string | null {
  const start = raw.indexOf('{');
  if (start === -1) return null;
  let depth = 0;
  let inString = false;
  let escape = false;
  for (let i = start; i < raw.length; i++) {
    const c = raw[i];
    if (escape) {
      escape = false;
      continue;
    }
    if (inString) {
      if (c === '\\') {
        escape = true;
        continue;
      }
      if (c === '"') inString = false;
      continue;
    }
    if (c === '"') {
      inString = true;
      continue;
    }
    if (c === '{') depth++;
    else if (c === '}') {
      depth--;
      if (depth === 0) return raw.slice(start, i + 1);
    }
  }
  return null;
}

function escapeInvalidJsonStringChars(input: string): string {
  let out = '';
  let inString = false;
  let escape = false;
  for (let i = 0; i < input.length; i++) {
    const c = input[i];
    if (!inString) {
      if (c === '"') inString = true;
      out += c;
      continue;
    }
    if (escape) {
      out += c;
      escape = false;
      continue;
    }
    if (c === '\\') {
      out += c;
      escape = true;
      continue;
    }
    if (c === '"') {
      out += c;
      inString = false;
      continue;
    }
    if (c === '\n') {
      out += '\\n';
      continue;
    }
    if (c === '\r') {
      out += '\\r';
      continue;
    }
    if (c === '\t') {
      out += '\\t';
      continue;
    }
    out += c;
  }
  return out;
}

export function tryParseJsonObject(raw: string): unknown {
  let s = raw.trim();
  if (s.startsWith('```')) {
    s = s.replace(/^```(?:json)?\s*/i, '').replace(/\s*```\s*$/i, '').trim();
  }
  const parse = (chunk: string): unknown => JSON.parse(chunk) as unknown;
  try {
    return parse(s);
  } catch (firstErr) {
    try {
      return parse(escapeInvalidJsonStringChars(s));
    } catch {
      // continue
    }
    const sliced = extractFirstBalancedJsonObject(s);
    if (sliced) {
      try {
        return parse(sliced);
      } catch {
        try {
          return parse(escapeInvalidJsonStringChars(sliced));
        } catch {
          // ignore
        }
      }
    }
    throw firstErr;
  }
}

