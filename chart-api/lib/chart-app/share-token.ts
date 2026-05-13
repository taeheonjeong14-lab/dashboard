import crypto from 'crypto';

export function randomShareToken(): string {
  return crypto.randomBytes(32).toString('base64url');
}

export function hashShareToken(token: string): string {
  return crypto.createHash('sha256').update(token, 'utf8').digest('hex');
}
