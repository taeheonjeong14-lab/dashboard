/** Browser-side fetch for `/api/admin/stats/*` (admin cookie session). */

export async function adminStatsGetJson<T extends Record<string, unknown>>(
  endpoint: string,
  hospitalId: string,
): Promise<T> {
  const url = `/api/admin/stats/${endpoint}?hospitalId=${encodeURIComponent(hospitalId)}`;
  const res = await fetch(url, { credentials: "include" });
  const data = (await res.json()) as T & { error?: string };
  if (!res.ok) {
    throw new Error(typeof data.error === "string" ? data.error : `HTTP ${res.status}`);
  }
  return data as T;
}
