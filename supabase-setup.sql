-- Lift Log sync table. Run this once in Supabase: SQL Editor > New query > paste > Run.
create table if not exists public.lift_log (
  user_id uuid primary key default auth.uid() references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.lift_log enable row level security;

drop policy if exists "lift_log select own" on public.lift_log;
drop policy if exists "lift_log insert own" on public.lift_log;
drop policy if exists "lift_log update own" on public.lift_log;
drop policy if exists "lift_log delete own" on public.lift_log;

create policy "lift_log select own" on public.lift_log for select using (auth.uid() = user_id);
create policy "lift_log insert own" on public.lift_log for insert with check (auth.uid() = user_id);
create policy "lift_log update own" on public.lift_log for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "lift_log delete own" on public.lift_log for delete using (auth.uid() = user_id);
