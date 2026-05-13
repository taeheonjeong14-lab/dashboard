import type { NextConfig } from 'next';

const nextConfig: NextConfig = {
  allowedDevOrigins: ['*.ngrok-free.app', '*.ngrok-free.dev', '*.ngrok.io', '*.ngrok.app'],
  serverExternalPackages: ['@sparticuz/chromium', 'playwright-core'],
  outputFileTracingIncludes: {
    '/api/report/health-checkup/export': ['./node_modules/@sparticuz/chromium/bin/**'],
    '/api/report/health-checkup/export-by-share': ['./node_modules/@sparticuz/chromium/bin/**'],
  },
};

export default nextConfig;
