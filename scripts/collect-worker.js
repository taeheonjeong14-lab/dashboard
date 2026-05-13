/**
 * collect-worker.js — 로컬 수집 Worker HTTP 서버
 *
 * Vercel admin-web이 COLLECT_WORKER_URL 로 요청을 보내면
 * 실제 Chrome 디버그 포트에 접근해 collect-all.js 를 실행합니다.
 *
 * Usage:
 *   node scripts/collect-worker.js
 *   npm run collect:worker
 *
 * 환경변수 (.env):
 *   COLLECT_WORKER_PORT    — 리슨 포트 (기본: 3099)
 *   COLLECT_WORKER_API_KEY — Bearer 인증 키 (미설정 시 경고 출력, 인증 없음)
 */

const http = require("http");
const { spawn } = require("child_process");
const path = require("path");
require("dotenv").config({ path: path.resolve(__dirname, "..", ".env") });

const PORT = parseInt(process.env.COLLECT_WORKER_PORT || "3099", 10);
const API_KEY = (process.env.COLLECT_WORKER_API_KEY || "").trim();
const ROOT_DIR = path.resolve(__dirname, "..");

function parseCollectOutput(output) {
  const steps = [];
  const upserts = [];

  const stepRe = /✓\s+(\d+)\/(\d+)\s+완료\s+\(([0-9.]+)s\)\s+[—\-]\s+(.+)/g;
  let m;
  while ((m = stepRe.exec(output)) !== null) {
    steps.push({
      index: parseInt(m[1], 10),
      total: parseInt(m[2], 10),
      durationSec: parseFloat(m[3]),
      name: m[4].trim(),
    });
  }

  const blogM = /blog_daily_metrics\s+업서트\s+완료:\s*(\d+)건/.exec(output);
  if (blogM) upserts.push({ label: "블로그 일별 지표", count: parseInt(blogM[1], 10) });

  const spM = /smartplace_daily_metrics\s+업서트\s+완료:\s*(\d+)건/.exec(output);
  if (spM) upserts.push({ label: "스마트플레이스 유입", count: parseInt(spM[1], 10) });

  const rankM = /Supabase\s+업서트\s+완료:\s*(\d+)건/.exec(output);
  if (rankM) upserts.push({ label: "블로그 키워드 순위", count: parseInt(rankM[1], 10) });

  const placeRankM = /Supabase\s+플레이스\s+업서트\s+완료:\s*(\d+)건/.exec(output);
  if (placeRankM) upserts.push({ label: "플레이스 키워드 순위", count: parseInt(placeRankM[1], 10) });

  const searchadM = /SearchAd\s+전체\s+처리\s+완료:\s*total_upsert_rows=(\d+)/.exec(output);
  if (searchadM) upserts.push({ label: "SearchAd 광고 성과", count: parseInt(searchadM[1], 10) });

  return { steps, upserts };
}

function spawnAndCapture(scriptPath, args) {
  return new Promise((resolve) => {
    const chunks = [];
    const env = {
      ...process.env,
      COLLECT_ALL_NO_FILE_LOG: "1",
      PYTHONUTF8: "1",
      PYTHONIOENCODING: "utf-8",
    };
    const child = spawn(process.execPath, [scriptPath, ...args], {
      cwd: ROOT_DIR,
      shell: false,
      env,
      stdio: ["ignore", "pipe", "pipe"],
    });
    child.stdout?.setEncoding("utf8");
    child.stdout?.on("data", (c) => chunks.push(c));
    child.stderr?.setEncoding("utf8");
    child.stderr?.on("data", (c) => chunks.push(c));
    child.on("error", (err) => {
      chunks.push(`[spawn 오류] ${err.message}\n`);
      resolve({ code: 1, output: chunks.join("") });
    });
    child.on("close", (code) => {
      resolve({ code: code ?? 1, output: chunks.join("") });
    });
  });
}

function readBody(req) {
  return new Promise((resolve, reject) => {
    const chunks = [];
    req.on("data", (c) => chunks.push(c));
    req.on("end", () => resolve(Buffer.concat(chunks).toString("utf8")));
    req.on("error", reject);
  });
}

const server = http.createServer(async (req, res) => {
  res.setHeader("Content-Type", "application/json");

  if (req.method === "GET" && req.url === "/health") {
    res.writeHead(200);
    res.end(JSON.stringify({ ok: true }));
    return;
  }

  if (req.method !== "POST" || req.url !== "/collect/run") {
    res.writeHead(404);
    res.end(JSON.stringify({ error: "not_found" }));
    return;
  }

  if (API_KEY) {
    const auth = req.headers["authorization"] || "";
    if (auth !== `Bearer ${API_KEY}`) {
      res.writeHead(401);
      res.end(JSON.stringify({ error: "unauthorized" }));
      return;
    }
  }

  let body = {};
  try {
    const raw = await readBody(req);
    if (raw) body = JSON.parse(raw);
  } catch {
    // body 없음 = 전체 병원 배치
  }

  const hospitalId = (body.hospitalId || "").trim();
  if (hospitalId && !/^[0-9a-f-]{8,36}$/i.test(hospitalId)) {
    res.writeHead(400);
    res.end(JSON.stringify({ error: "유효하지 않은 hospital_id입니다." }));
    return;
  }

  const isBatch = !hospitalId;
  const scriptName = isBatch ? "collect-all-batch.js" : "collect-all.js";
  const scriptPath = path.join(ROOT_DIR, "scripts", scriptName);

  try {
    const { code, output } = await spawnAndCapture(scriptPath, isBatch ? [] : [hospitalId]);
    const { steps, upserts } = parseCollectOutput(output);
    res.writeHead(200);
    res.end(JSON.stringify({ ok: code === 0, output, steps, upserts }));
  } catch (err) {
    res.writeHead(500);
    res.end(JSON.stringify({ ok: false, output: String(err), steps: [], upserts: [] }));
  }
});

server.listen(PORT, () => {
  console.log(`[collect-worker] 포트 ${PORT} 에서 실행 중`);
  if (!API_KEY) {
    console.warn("[collect-worker] 경고: COLLECT_WORKER_API_KEY 미설정 — 인증 없이 누구나 접근 가능");
  }
});
