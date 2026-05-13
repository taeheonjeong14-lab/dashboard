export type HospitalRow = {
  id: string;
  name_ko: string;
  name_en: string;
  address: string | null;
  phone: string | null;
  director_name_ko: string | null;
  director_title: string | null;
  brand_color_hex: string | null;
  code: string | null;
  slug: string;
  logo_url: string | null;
  seal_url: string | null;
  cover_pet_image_url?: string | null;
  tagline_line1: string | null;
  tagline_line2: string | null;
  blog_intro: string | null;
  blog_outro: string | null;
  created_at: string;
  updated_at: string;
};

