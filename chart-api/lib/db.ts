import pg from 'pg';

const globalForPool = globalThis as unknown as { chartPgPool: pg.Pool | undefined };

export function getChartPgPool(): pg.Pool {
  const url = process.env.DATABASE_URL?.trim();
  if (!url) {
    throw new Error('DATABASE_URL is not set');
  }
  if (!globalForPool.chartPgPool) {
    globalForPool.chartPgPool = new pg.Pool({
      connectionString: url,
      max: 10,
      idleTimeoutMillis: 30_000,
    });
  }
  return globalForPool.chartPgPool;
}

export async function withPgTransaction<T>(fn: (client: pg.PoolClient) => Promise<T>): Promise<T> {
  const pool = getChartPgPool();
  const client = await pool.connect();
  try {
    await client.query('BEGIN');
    const out = await fn(client);
    await client.query('COMMIT');
    return out;
  } catch (e) {
    await client.query('ROLLBACK');
    throw e;
  } finally {
    client.release();
  }
}
