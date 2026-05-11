import type { NextRequest } from 'next/server';
import { NextResponse } from 'next/server';
import { applyCors, corsPreflightResponse } from '@/lib/cors';

export async function OPTIONS(request: NextRequest) {
  return corsPreflightResponse(request);
}

export async function GET(request: NextRequest) {
  const res = NextResponse.json({ ok: true, service: 'dashboard-api' });
  return applyCors(request, res);
}
