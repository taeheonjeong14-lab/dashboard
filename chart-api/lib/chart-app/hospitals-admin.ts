import type pg from 'pg';
import { randomBytes } from 'crypto';

function slugify(name: string): string {
  const s = name
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9가-힣]+/g, '-')
    .replace(/^-+|-+$/g, '')
    .slice(0, 72);
  return s || 'hospital';
}

export async function ensureUniqueSlug(client: pg.PoolClient, base: string): Promise<string> {
  let slug = base;
  for (let i = 0; i < 8; i++) {
    const { rows } = await client.query(`SELECT 1 FROM core.hospitals WHERE slug = $1 LIMIT 1`, [slug]);
    if (rows.length === 0) return slug;
    slug = `${base}-${randomBytes(2).toString('hex')}`;
  }
  return `${base}-${randomBytes(4).toString('hex')}`;
}

export type HospitalRow = Record<string, unknown>;

export async function listHospitals(client: pg.PoolClient): Promise<HospitalRow[]> {
  const { rows } = await client.query(`SELECT * FROM core.hospitals ORDER BY name ASC`);
  return rows as HospitalRow[];
}

export async function insertHospital(
  client: pg.PoolClient,
  body: Record<string, unknown>,
): Promise<{ id: string }> {
  const name_ko = String(body.name_ko ?? body.nameKo ?? '').trim();
  const name_en = String(body.name_en ?? body.nameEn ?? '').trim();
  if (!name_ko || !name_en) throw new Error('name_ko and name_en required');

  const slugBase = slugify(name_en || name_ko);
  const slug = await ensureUniqueSlug(client, slugBase);

  const { rows } = await client.query<{ id: string }>(
    `
    INSERT INTO core.hospitals (
      name,
      name_en,
      slug,
      phone,
      code,
      director_name_ko,
      "brandColor",
      tagline_line1,
      tagline_line2,
      blog_intro,
      blog_outro,
      address,
      "addressDetail"
    ) VALUES (
      $1, $2, $3,
      $4, $5, $6, $7, $8, $9, $10, $11, $12, $13
    )
    RETURNING id
    `,
    [
      name_ko,
      name_en,
      slug,
      body.phone ?? null,
      body.code ?? null,
      body.director_name_ko ?? body.directorNameKo ?? null,
      body.brand_color_hex ?? body.brandColorHex ?? null,
      body.tagline_line1 ?? body.taglineLine1 ?? null,
      body.tagline_line2 ?? body.taglineLine2 ?? null,
      body.blog_intro ?? body.blogIntro ?? null,
      body.blog_outro ?? body.blogOutro ?? null,
      body.address ?? null,
      body.address_detail ?? body.addressDetail ?? null,
    ],
  );
  return { id: rows[0].id };
}

export async function updateHospital(
  client: pg.PoolClient,
  id: string,
  body: Record<string, unknown>,
): Promise<boolean> {
  const name_ko = String(body.name_ko ?? body.nameKo ?? '').trim();
  const name_en = String(body.name_en ?? body.nameEn ?? '').trim();
  if (!name_ko || !name_en) throw new Error('name_ko and name_en required');

  const res = await client.query(
    `
    UPDATE core.hospitals SET
      name = $2,
      name_en = $3,
      phone = COALESCE($4, phone),
      code = COALESCE($5, code),
      director_name_ko = COALESCE($6, director_name_ko),
      "brandColor" = COALESCE($7, "brandColor"),
      tagline_line1 = COALESCE($8, tagline_line1),
      tagline_line2 = COALESCE($9, tagline_line2),
      blog_intro = COALESCE($10, blog_intro),
      blog_outro = COALESCE($11, blog_outro),
      address = COALESCE($12, address),
      "addressDetail" = COALESCE($13, "addressDetail")
    WHERE id::text = $1 OR id = $1
    `,
    [
      id,
      name_ko,
      name_en,
      body.phone ?? null,
      body.code ?? null,
      body.director_name_ko ?? body.directorNameKo ?? null,
      body.brand_color_hex ?? body.brandColorHex ?? null,
      body.tagline_line1 ?? body.taglineLine1 ?? null,
      body.tagline_line2 ?? body.taglineLine2 ?? null,
      body.blog_intro ?? body.blogIntro ?? null,
      body.blog_outro ?? body.blogOutro ?? null,
      body.address ?? null,
      body.address_detail ?? body.addressDetail ?? null,
    ],
  );
  return (res.rowCount ?? 0) > 0;
}

export async function deleteHospital(client: pg.PoolClient, id: string): Promise<boolean> {
  const res = await client.query(`DELETE FROM core.hospitals WHERE id::text = $1 OR id = $1`, [id]);
  return (res.rowCount ?? 0) > 0;
}
