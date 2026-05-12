import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { defineConfig, loadEnv } from "vite";
import react from "@vitejs/plugin-react";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

/** Minimal .env parser (no deps). Later entries in merge order win. */
function readEnvFile(absPath) {
  try {
    if (!fs.existsSync(absPath)) return {};
    let raw = fs.readFileSync(absPath, "utf8");
    if (raw.charCodeAt(0) === 0xfeff) raw = raw.slice(1);
    const map = {};
    for (const line of raw.split(/\r?\n/)) {
      const trimmed = line.trim();
      if (!trimmed || trimmed.startsWith("#")) continue;
      const eq = trimmed.indexOf("=");
      if (eq <= 0) continue;
      const key = trimmed.slice(0, eq).trim();
      let val = trimmed.slice(eq + 1).trim();
      if (
        (val.startsWith('"') && val.endsWith('"')) ||
        (val.startsWith("'") && val.endsWith("'"))
      ) {
        val = val.slice(1, -1);
      }
      map[key] = val;
    }
    return map;
  } catch {
    return {};
  }
}

// https://vite.dev/config/
export default defineConfig(({ mode }) => {
  const repoRoot = path.resolve(__dirname, "..");
  const uiRoot = __dirname;

  const fromFiles = {
    ...readEnvFile(path.join(repoRoot, ".env")),
    ...readEnvFile(path.join(repoRoot, ".env.local")),
    ...readEnvFile(path.join(uiRoot, ".env")),
    ...readEnvFile(path.join(uiRoot, ".env.local")),
  };

  const envMerged = {
    ...fromFiles,
    ...loadEnv(mode, repoRoot, ""),
    ...loadEnv(mode, uiRoot, ""),
    ...fromFiles,
  };

  const resolveUrl = () =>
    envMerged.VITE_SUPABASE_URL ||
    envMerged.SUPABASE_URL ||
    envMerged.NEXT_PUBLIC_SUPABASE_URL ||
    "";
  const resolveKey = () =>
    envMerged.VITE_SUPABASE_SERVICE_ROLE_KEY || envMerged.SUPABASE_SERVICE_ROLE_KEY || "";

  return {
    plugins: [react()],
    envDir: repoRoot,
    define: {
      __ADMIN_SUPABASE_URL__: JSON.stringify(resolveUrl()),
      __ADMIN_SUPABASE_SERVICE_ROLE_KEY__: JSON.stringify(resolveKey()),
    },
  };
});
