const DDX_API = process.env.NEXT_PUBLIC_DDX_API_URL ?? 'https://ddx-api.vercel.app';

export async function ddxGet<T>(path: string, userId: string): Promise<T> {
  const sep = path.includes('?') ? '&' : '?';
  const res = await fetch(`${DDX_API}${path}${sep}userId=${encodeURIComponent(userId)}`);
  if (res.status === 403) {
    throw new DdxApiForbiddenError();
  }
  if (!res.ok) {
    throw new Error(`ddx-api error: ${res.status}`);
  }
  return res.json() as Promise<T>;
}

export async function ddxPost<T>(path: string, userId: string, body: object): Promise<T> {
  const res = await fetch(`${DDX_API}${path}?userId=${encodeURIComponent(userId)}`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(body),
  });
  if (res.status === 403) {
    throw new DdxApiForbiddenError();
  }
  if (!res.ok) {
    throw new Error(`ddx-api error: ${res.status}`);
  }
  return res.json() as Promise<T>;
}

export async function ddxPostStream(
  path: string,
  userId: string,
  body: object,
): Promise<Response> {
  const res = await fetch(`${DDX_API}${path}?userId=${encodeURIComponent(userId)}`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(body),
  });
  if (res.status === 403) {
    throw new DdxApiForbiddenError();
  }
  if (!res.ok) {
    throw new Error(`ddx-api error: ${res.status}`);
  }
  return res;
}

export class DdxApiForbiddenError extends Error {
  constructor() {
    super('ddx-api 계정 동기화가 필요합니다. 관리자에게 문의하세요.');
    this.name = 'DdxApiForbiddenError';
  }
}
