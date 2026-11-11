create table if not exists public.training_data (user_id uuid primary key references auth.users(id) on delete cascade, payload jsonb not null default '{}'::jsonb, updated_at timestamptz not null default now());
alter table public.training_data enable row level security;
grant select, insert, update on public.training_data to authenticated;
create policy "Read own training" on public.training_data for select to authenticated using ((select auth.uid()) = user_id);
create policy "Insert own training" on public.training_data for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "Update own training" on public.training_data for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
