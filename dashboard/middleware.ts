import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

function hasSupabaseSession(req: NextRequest) {
  return req.cookies
    .getAll()
    .some((cookie) => cookie.name.startsWith("sb-") && cookie.name.endsWith("-auth-token"));
}

export function middleware(req: NextRequest) {
  const { pathname } = req.nextUrl;
  const isLoginPath = pathname === "/login";
  const isAuthenticated = hasSupabaseSession(req);

  if (!isAuthenticated && !isLoginPath) {
    const url = req.nextUrl.clone();
    url.pathname = "/login";
    return NextResponse.redirect(url);
  }

  if (isAuthenticated && isLoginPath) {
    const url = req.nextUrl.clone();
    url.pathname = "/";
    return NextResponse.redirect(url);
  }

  return NextResponse.next();
}

export const config = {
  matcher: ["/((?!_next/static|_next/image|favicon.ico).*)"],
};
