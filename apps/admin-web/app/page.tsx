import { redirect } from 'next/navigation';
import { createClient } from '@/lib/supabase/server';
import { fetchDdxAdminAllowed } from '@/lib/require-admin';

export default async function RootPage() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();

  if (user) {
    const allowed = await fetchDdxAdminAllowed(user.id);
    if (allowed) redirect('/admin');
  }

  redirect('/login');
}
