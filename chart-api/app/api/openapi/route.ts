import { NextResponse } from 'next/server';

import { buildOpenApiDocument } from '@/lib/chart-app/openapi-spec';

export const dynamic = 'force-static';

export function GET() {
  return NextResponse.json(buildOpenApiDocument(), {
    headers: {
      'Cache-Control': 'public, max-age=3600, s-maxage=3600',
    },
  });
}
