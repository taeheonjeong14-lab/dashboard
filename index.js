/**
 * 네이버 블로그 통계 수집 (Chrome 디버깅 모드 연동)
 *
 * 사용 방법:
 * 1. Chrome를 디버깅 포트로 실행 (README 참고)
 * 2. 브라우저에서 네이버 로그인
 * 3. node index.js [ID]   또는   npm run collect -- [ID]
 *    예: node index.js howtoanimal
 *    → 계정(ID)당 Excel 하나(data/howtoanimal.xlsx), 시트: 블로그, 플레이스
 */

const puppeteer = require('puppeteer-core');
const fs = require('fs');
const path = require('path');
const XLSX = require('xlsx');
const { createClient } = require('@supabase/supabase-js');
require('dotenv').config();

const CONFIG_PATH = path.join(__dirname, 'config.json');

function loadConfig() {
  const raw = fs.readFileSync(CONFIG_PATH, 'utf8');
  return JSON.parse(raw);
}

function ensureOutputDir(dir) {
  const full = path.isAbsolute(dir) ? dir : path.join(__dirname, dir);
  if (!fs.existsSync(full)) fs.mkdirSync(full, { recursive: true });
  return full;
}

function getYesterdayDateString() {
  const d = new Date();
  d.setDate(d.getDate() - 1);
  return d.toISOString().slice(0, 10);
}

function getOutputFilename(prefix, ext, overwrite) {
  if (overwrite) return `${prefix}.${ext}`;
  const ts = new Date().toISOString().replace(/[:.]/g, '-').slice(0, 19);
  return `${prefix}_${ts}.${ext}`;
}

function saveResult(outputDir, prefix, data, overwrite) {
  const name = getOutputFilename(prefix, 'json', overwrite);
  const jsonPath = path.join(outputDir, name);
  fs.writeFileSync(jsonPath, JSON.stringify(data, null, 2), 'utf8');
  return jsonPath;
}

function getSupabaseClient() {
  const url = process.env.SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  if (!url || !key) return null;
  return createClient(url, key, { auth: { persistSession: false } });
}

async function upsertSupabaseMetrics(supabase, accountId, blogRows, placeRows, hospitalId = null, hospitalName = null) {
  const payload = [];
  const collectedAt = new Date().toISOString();

  (blogRows || []).forEach((r) => {
    payload.push({
      account_id: accountId,
      hospital_id: hospitalId,
      hospital_name: hospitalName,
      source: 'blog',
      metric_date: r.날짜,
      metric_key: 'blog_views',
      metric_value: r.조회수,
      metadata: {},
      collected_at: collectedAt,
    });
    payload.push({
      account_id: accountId,
      hospital_id: hospitalId,
      hospital_name: hospitalName,
      source: 'blog',
      metric_date: r.날짜,
      metric_key: 'blog_unique_visitors',
      metric_value: r.순방문자수,
      metadata: {},
      collected_at: collectedAt,
    });
  });

  (placeRows || []).forEach((r) => {
    payload.push({
      account_id: accountId,
      hospital_id: hospitalId,
      hospital_name: hospitalName,
      source: 'smartplace',
      metric_date: r.날짜,
      metric_key: 'smartplace_inflow',
      metric_value: r.유입수,
      metadata: {},
      collected_at: collectedAt,
    });
  });

  if (payload.length === 0) return 0;
  let { error } = await supabase
    .schema('analytics')
    .from('analytics_daily_metrics')
    .upsert(payload, { onConflict: 'account_id,source,metric_date,metric_key' });
  const errMsg = String((error && error.message) || '');
  const missingHospitalColumn =
    errMsg.includes("Could not find the 'hospital_id' column") ||
    errMsg.includes("Could not find the 'hospital_name' column");
  if (error && missingHospitalColumn) {
    const fallbackPayload = payload.map(({ hospital_id, hospital_name, ...rest }) => rest);
    const fallback = await supabase
      .schema('analytics')
      .from('analytics_daily_metrics')
      .upsert(fallbackPayload, { onConflict: 'account_id,source,metric_date,metric_key' });
    error = fallback.error;
    if (!error) {
      console.warn('analytics.analytics_daily_metrics에 hospital 컬럼이 없어 fallback 저장(account_id 기반)으로 처리했습니다.');
    }
  }
  if (error) throw error;
  return payload.length;
}

async function resolveHospitalByBlogId(supabase, blogId) {
  if (!blogId || !String(blogId).trim()) return { hospitalId: null, hospitalName: null };
  const normalizedBlogId = String(blogId).trim();
  let data = null;
  let error = null;
  // core 스키마 우선 조회, 없으면 public으로 fallback
  const coreResult = await supabase
    .schema('core')
    .from('hospitals')
    .select('id,name')
    .eq('naver_blog_id', normalizedBlogId)
    .limit(1);
  data = coreResult.data;
  error = coreResult.error;

  if (error && String(error.message || '').toLowerCase().includes('relation')) {
    const publicResult = await supabase
      .from('hospitals')
      .select('id,name')
      .eq('naver_blog_id', normalizedBlogId)
      .limit(1);
    data = publicResult.data;
    error = publicResult.error;
  }

  if (error) throw error;
  if (!data || data.length === 0) return { hospitalId: null, hospitalName: null };
  return {
    hospitalId: String(data[0].id),
    hospitalName: data[0].name || null,
  };
}

function sanitizeSheetName(name) {
  return String(name).replace(/[\\/*?:[\]]/g, '_').slice(0, 31);
}

const SHEET_BLOG = '블로그';
const SHEET_PLACE = '플레이스';

function readSheetAsBlogData(ws) {
  const rows = XLSX.utils.sheet_to_json(ws, { header: 1 });
  if (!rows || rows.length < 2) return [];
  const data = [];
  for (let i = 1; i < rows.length; i++) {
    const r = rows[i];
    if (r && r[0]) {
      const 날짜 = String(r[0]).trim();
      if (/^\d{4}-\d{2}-\d{2}$/.test(날짜)) {
        data.push({
          날짜,
          조회수: r[1] != null && r[1] !== '' ? parseInt(r[1], 10) : null,
          순방문자수: r[2] != null && r[2] !== '' ? parseInt(r[2], 10) : null,
        });
      }
    }
  }
  return data;
}

function readSheetAsPlaceData(ws) {
  const rows = XLSX.utils.sheet_to_json(ws, { header: 1 });
  if (!rows || rows.length < 2) return [];
  const data = [];
  for (let i = 1; i < rows.length; i++) {
    const r = rows[i];
    if (r && r[0]) {
      const 날짜 = String(r[0]).trim();
      if (/^\d{4}-\d{2}-\d{2}$/.test(날짜)) {
        data.push({
          날짜,
          유입수: r[1] != null && r[1] !== '' ? parseInt(r[1], 10) : null,
        });
      }
    }
  }
  return data;
}

function readExistingExcelBoth(excelPath) {
  if (!fs.existsSync(excelPath)) return { blog: null, place: null };
  try {
    const wb = XLSX.readFile(excelPath);
    const blog = wb.SheetNames.includes(SHEET_BLOG) ? readSheetAsBlogData(wb.Sheets[SHEET_BLOG]) : null;
    const place = wb.SheetNames.includes(SHEET_PLACE) ? readSheetAsPlaceData(wb.Sheets[SHEET_PLACE]) : null;
    return {
      blog: blog && blog.length > 0 ? blog : null,
      place: place && place.length > 0 ? place : null,
    };
  } catch (e) {
    return { blog: null, place: null };
  }
}

function saveToExcelBoth(outputDir, id, blogData, placeData, existingBlog, existingPlace) {
  const excelPath = path.join(outputDir, `${sanitizeSheetName(id)}.xlsx`);

  const byDateBlog = {};
  (existingBlog || []).forEach((d) => { byDateBlog[d.날짜] = d; });
  (blogData || []).forEach((d) => { byDateBlog[d.날짜] = d; });
  const mergedBlog = Object.values(byDateBlog).sort((a, b) => (a.날짜 > b.날짜 ? 1 : -1));

  const byDatePlace = {};
  (existingPlace || []).forEach((d) => { byDatePlace[d.날짜] = d; });
  (placeData || []).forEach((d) => { byDatePlace[d.날짜] = d; });
  const mergedPlace = Object.values(byDatePlace).sort((a, b) => (a.날짜 > b.날짜 ? 1 : -1));

  const blogRows = [['날짜', '조회수', '순방문자수']];
  mergedBlog.forEach((d) => blogRows.push([d.날짜, d.조회수 ?? '', d.순방문자수 ?? '']));
  const placeRows = [['날짜', '유입수']];
  mergedPlace.forEach((d) => placeRows.push([d.날짜, d.유입수 ?? '']));

  const wb = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(wb, XLSX.utils.aoa_to_sheet(blogRows), SHEET_BLOG);
  XLSX.utils.book_append_sheet(wb, XLSX.utils.aoa_to_sheet(placeRows), SHEET_PLACE);
  XLSX.writeFile(wb, excelPath);
  return excelPath;
}

async function connectBrowser(port) {
  const browser = await puppeteer.connect({
    browserURL: `http://127.0.0.1:${port}`,
    defaultViewport: null,
  });
  return browser;
}

const ADMIN_BASE = 'https://admin.blog.naver.com';

async function getPageBody(page) {
  const bodies = [];
  for (const frame of page.frames()) {
    try {
      const body = await Promise.race([
        frame.evaluate(() => (document.body && document.body.innerText) || ''),
        new Promise((_, rej) => setTimeout(() => rej(new Error('t')), 3000)),
      ]).catch(() => '');
      if (body && body.length > 20) bodies.push(body);
    } catch (e) {}
  }
  const main = await page.evaluate(() => (document.body && document.body.innerText) || '').catch(() => '');
  if (main && main.length > 20) bodies.push(main);
  return bodies.join('\n') || main;
}

function parseTableRows(body) {
  const rows = [];
  const re = /(\d{4})\.(\d{2})\.(\d{2})\.\s*\([^)]+\)[\t\s]+(\d+)/g;
  let m;
  while ((m = re.exec(body)) !== null) {
    const dateStr = `${m[1]}-${m[2]}-${m[3]}`;
    const value = parseInt(m[4], 10);
    rows.push({ 날짜: dateStr, 값: value });
  }
  return rows;
}

async function scrapeFromUrls(page, blogId, config, scrapeDays) {
  const visitPvUrl = config.blog?.visitPvUrl || `${ADMIN_BASE}/${blogId}/stat/visit_pv`;
  const uvUrl = config.blog?.uvUrl || `${ADMIN_BASE}/${blogId}/stat/uv`;
  const daysCount = scrapeDays ?? config.blog?.daysCount ?? 7;

  console.log('조회수 페이지 로드 중...');
  await page.goto(visitPvUrl, { waitUntil: 'domcontentloaded', timeout: 15000 });
  await new Promise((r) => setTimeout(r, 4000));
  const pvBody = await getPageBody(page);
  const pvRows = parseTableRows(pvBody);

  console.log('순방문자수 페이지 로드 중...');
  await page.goto(uvUrl, { waitUntil: 'domcontentloaded', timeout: 15000 });
  await new Promise((r) => setTimeout(r, 4000));
  const uvBody = await getPageBody(page);
  const uvRows = parseTableRows(uvBody);

  const uvByDate = {};
  uvRows.forEach((r) => { uvByDate[r.날짜] = r.값; });

  const merged = [];
  const seen = new Set();
  for (const pv of pvRows) {
    if (seen.has(pv.날짜)) continue;
    seen.add(pv.날짜);
    merged.push({
      날짜: pv.날짜,
      조회수: pv.값,
      순방문자수: uvByDate[pv.날짜] ?? null,
    });
  }
  merged.sort((a, b) => (b.날짜 > a.날짜 ? 1 : -1));
  const latest7 = merged.slice(0, daysCount).reverse();

  const raw = {
    수집일시: new Date().toISOString(),
    페이지텍스트일부: (pvBody + '\n---\n' + uvBody).slice(0, 3000),
  };
  const stats = {
    수집일자: getYesterdayDateString(),
    수집일시: raw.수집일시,
    기간일수: daysCount,
    데이터: latest7,
  };

  if (latest7.length === 0) {
    console.log('디버그: 테이블 데이터를 찾지 못했습니다. data/*.json 의 raw.페이지텍스트일부 를 확인해 보세요.');
  }

  return { stats, raw };
}

function addDays(dateStr, days) {
  const d = new Date(dateStr + 'T12:00:00Z');
  d.setUTCDate(d.getUTCDate() + days);
  return d.toISOString().slice(0, 10);
}

function setUrlDateParams(url, startDate, endDate) {
  const u = new URL(url);
  u.searchParams.set('startDate', startDate);
  u.searchParams.set('endDate', endDate);
  u.searchParams.set('term', 'daily');
  return u.toString();
}

function parsePlaceTableRows(body) {
  const byDate = {};
  const patterns = [
    /(\d{4})[-.](\d{2})[-.](\d{2})[^\d]*?([0-9,]+)\s*(?:건|명|회)?/g,
    /(\d{4})-(\d{2})-(\d{2})[\t\s]+(\d+)/g,
  ];
  for (const re of patterns) {
    let m;
    while ((m = re.exec(body)) !== null) {
      const 날짜 = `${m[1]}-${m[2]}-${m[3]}`;
      const 유입수 = parseInt(String(m[4]).replace(/,/g, ''), 10);
      if (!isNaN(유입수) && 유입수 >= 0 && 유입수 < 10000000) byDate[날짜] = 유입수;
    }
  }
  return Object.entries(byDate).map(([날짜, 유입수]) => ({ 날짜, 유입수 })).sort((a, b) => (a.날짜 > b.날짜 ? 1 : -1));
}

function parsePlaceInflowSingle(body) {
  const m = body.match(/플레이스\s*유입[\s\S]*?([0-9,]+)\s*회\s*전일/);
  return m ? parseInt(String(m[1]).replace(/,/g, ''), 10) : null;
}

async function scrapeSmartPlace(page, config, existingLastDate, outputDir) {
  const baseUrl = config.smartplace?.statUrl;
  if (!baseUrl || !baseUrl.trim()) {
    console.log('스마트플레이스: config.smartplace.statUrl 이 없어 플레이스 수집을 건너뜁니다.');
    return { 데이터: [] };
  }

  const 수집가능최신 = getYesterdayDateString();
  const placeScrapeDays = config.smartplace?.scrapeDays ?? config.blog?.accumulateScrapeDays ?? 31;
  const startDate = existingLastDate ? addDays(existingLastDate, 1) : addDays(수집가능최신, -placeScrapeDays);
  const endDate = 수집가능최신;

  const 데이터 = [];
  const daysToFetch = [];
  for (let i = 0; i <= placeScrapeDays; i++) {
    const day = addDays(startDate, i);
    if (day > endDate) break;
    daysToFetch.push(day);
  }

  console.log('스마트플레이스 유입 수집 중... (%s ~ %s, %d일)', startDate, endDate, daysToFetch.length);

  for (let i = 0; i < daysToFetch.length; i++) {
    const day = daysToFetch[i];
    const url = setUrlDateParams(baseUrl.trim(), day, day);
    await page.goto(url, { waitUntil: 'domcontentloaded', timeout: 15000 });
    await new Promise((r) => setTimeout(r, 2000));
    const body = await getPageBody(page);
    const 유입수 = parsePlaceInflowSingle(body);
    데이터.push({ 날짜: day, 유입수: 유입수 !== null ? 유입수 : null });
    if ((i + 1) % 7 === 0 || i === daysToFetch.length - 1) {
      console.log('  %d/%d일 수집함', i + 1, daysToFetch.length);
    }
  }

  return { 데이터 };
}

async function main() {
  const config = loadConfig();
  const port = config.chrome?.debuggingPort ?? 9222;
  const idArg = process.argv[2];
  const id = (idArg && idArg.trim()) || config.blog?.blogId?.trim();
  const outputDir = ensureOutputDir(config.output?.dir || './data');
  const saveJson = config.output?.saveJson ?? false;
  const accumulate = config.output?.accumulate ?? false;
  const excelPath = path.join(outputDir, sanitizeSheetName(id) + '.xlsx');

  if (!id || id === '여기에_블로그ID_입력') {
    console.error('계정 ID를 지정해 주세요.');
    console.error('  예: node index.js howtoanimal   또는   npm run collect -- howtoanimal');
    console.error('  → data/howtoanimal.xlsx (시트: 블로그, 플레이스)');
    process.exit(1);
  }

  const account = config.accounts && config.accounts[id];
  const blogId = (account && account.blogId) || id;
  const smartplaceStatUrl = (account && account.smartplaceStatUrl) || config.smartplace?.statUrl;
  const effectiveConfig = {
    ...config,
    blog: { ...config.blog, blogId },
    smartplace: { ...config.smartplace, statUrl: smartplaceStatUrl || config.smartplace?.statUrl },
  };

  if (idArg) {
    console.log('계정 ID (명령줄): %s', id);
  }

  console.log('Chrome에 연결 중... (포트 %s)', port);
  let browser;
  try {
    browser = await connectBrowser(port);
  } catch (e) {
    console.error('Chrome에 연결할 수 없습니다. Chrome를 디버깅 포트로 실행했는지 확인하세요.');
    console.error('예: chrome.exe --remote-debugging-port=%s', port);
    process.exit(1);
  }

  const page = (await browser.pages())[0] || await browser.newPage();
  try {
    let existing = { blog: null, place: null };
    if (accumulate) {
      existing = readExistingExcelBoth(excelPath);
      if (existing.blog && existing.blog.length > 0) {
        const last = existing.blog.map((d) => d.날짜).sort().pop();
        console.log('기존 블로그 시트: 마지막 %s, %d일', last, existing.blog.length);
      }
      if (existing.place && existing.place.length > 0) {
        const last = existing.place.map((d) => d.날짜).sort().pop();
        console.log('기존 플레이스 시트: 마지막 %s, %d일', last, existing.place.length);
      }
    }

    const scrapeDays = accumulate ? (effectiveConfig.blog?.accumulateScrapeDays ?? 31) : undefined;
    console.log('[블로그] 통계 수집 중...');
    const { stats, raw } = await scrapeFromUrls(page, blogId, effectiveConfig, scrapeDays);

    let blogToSave = stats.데이터 || [];
    if (accumulate && existing.blog && existing.blog.length > 0) {
      const lastDate = existing.blog.map((d) => d.날짜).sort().pop();
      blogToSave = blogToSave.filter((d) => d.날짜 > lastDate);
      console.log('블로그 추가: %s 이후 %d일', lastDate, blogToSave.length);
    }

    const placeLastDate = existing.place && existing.place.length > 0 ? existing.place.map((d) => d.날짜).sort().pop() : null;
    console.log('[플레이스] 유입수 수집 중...');
    const placeResult = await scrapeSmartPlace(page, effectiveConfig, placeLastDate, outputDir);
    let placeToSave = placeResult.데이터 || [];
    if (accumulate && placeLastDate) {
      placeToSave = placeToSave.filter((d) => d.날짜 > placeLastDate);
      if (placeToSave.length > 0) console.log('플레이스 추가: %s 이후 %d일', placeLastDate, placeToSave.length);
    }

    const existingBlogForMerge = accumulate ? existing.blog : null;
    const existingPlaceForMerge = accumulate ? existing.place : null;
    const writtenPath = saveToExcelBoth(
      outputDir,
      id,
      blogToSave,
      placeToSave,
      existingBlogForMerge,
      existingPlaceForMerge
    );

    console.log('\n[수집 결과]');
    console.log('  블로그: %d일치', (existingBlogForMerge ? existingBlogForMerge.length : 0) + blogToSave.length);
    console.log('  플레이스: %d일치', (existingPlaceForMerge ? existingPlaceForMerge.length : 0) + placeToSave.length);
    console.log('\n저장: %s', writtenPath);

    const supabase = getSupabaseClient();
    if (supabase) {
      try {
        let hospitalId = null;
        let hospitalName = null;
        try {
          const resolved = await resolveHospitalByBlogId(supabase, blogId);
          hospitalId = resolved.hospitalId;
          hospitalName = resolved.hospitalName;
          if (hospitalId) {
            console.log('병원 매핑 완료: %s (%s)', hospitalName || '-', hospitalId);
          } else {
            console.log('병원 매핑 실패: hospitals.naver_blog_id 에 "%s"가 없습니다. hospital_id 없이 저장합니다.', blogId);
          }
        } catch (e) {
          console.warn('병원 매핑 조회 실패(hospitals 권한/정책 확인 필요): %s', e.message || e);
          console.warn('병원 매핑 없이 analytics_daily_metrics 저장을 계속 진행합니다.');
        }

        const upsertCount = await upsertSupabaseMetrics(
          supabase,
          id,
          blogToSave,
          placeToSave,
          hospitalId,
          hospitalName
        );
        console.log('Supabase 업서트 완료: %d건', upsertCount);
      } catch (e) {
        console.error('Supabase 저장 실패:', e.message || e);
      }
    } else {
      console.log('Supabase 환경변수가 없어 DB 저장은 건너뜁니다.');
    }

    if (saveJson) {
      const jsonPath = saveResult(outputDir, id, { stats, placeResult, id, raw }, false);
      console.log('JSON: %s', jsonPath);
    }
  } catch (e) {
    console.error(e);
    process.exit(1);
  } finally {
    await browser.disconnect();
  }
}

main();
