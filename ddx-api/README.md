# ddx-api

Next.js (App Router) **HTTP API only** — route handlers copied from the DDx app so this repo can host a dedicated BFF. Same paths as production DDx: `/api/*`.

## Run

```bash
cd ddx-api
cp .env.example .env.local   # fill in values
npm install
npm run dev                 # http://localhost:3001
```

`npm run build` needs `DATABASE_URL` set (any valid connection string for `prisma generate` / Prisma init at import time).

## Deploy

- Separate Vercel project (recommended) or monorepo subpath: set **root directory** to `ddx-api`.
- Copy env vars from DDx / `docs/BACKEND_HANDOFF.md` in the DDx repository (database, Supabase, Gemini, OpenAI, Resend, `ADMIN_EMAILS`, etc.).

## Sync from DDx

When DDx API routes change, re-copy:

- `app/api` → `ddx-api/app/api`
- `lib` → `ddx-api/lib` (server modules used by API)
- `prisma` → `ddx-api/prisma`

Then `npm run build` and fix any drift.

## Prisma

Schema matches Supabase (`core`, `robovet`). Use migrations from `dashboard-data/supabase/migrations` as source of truth for DB shape; do not run `db push` against prod without review.
