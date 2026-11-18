# Turn on cross-device sync (about 10 minutes)

Lift Log keeps your data in the browser. This optional step also saves it to your own free
Supabase account, so every phone or computer where you sign in shows the same lifts.

1. Go to supabase.com, create a free account and a new project (any name, pick a region near you).
2. In the project, open **SQL Editor > New query**, paste everything from `supabase-setup.sql`, and press **Run**.
   This creates one private table. Each person can only read and write their own row.
3. Open **Authentication > Providers > Email**. Make sure Email is enabled.
   For the simplest sign-up, turn **Confirm email** off. If you leave it on, new accounts must click a link in an email first.
4. Open **Project Settings > API**. Copy the **Project URL** and the **anon public** key.
   Do not use the `service_role` key anywhere in this site.
5. Open `sync-config.js` in this folder, paste the URL and key between the quotes, and save.
6. Upload the folder to Netlify again (drag it onto Deploys).
7. In the app, open Settings (the sliders icon), then "Sync across devices". Create an account, and sign in with the same
   email and password on your other devices.

Notes
- The anon key is meant to be public. The row-level security rules from step 2 are what keep each person's data private.
- If two devices change the same thing offline, Lift Log merges them: sets from both devices are kept, and deleted sets stay deleted.
- Free Supabase projects pause after about a week without activity. Your data is kept; you can resume the project from the Supabase dashboard.
- Use "Download backup" in Settings now and then as an extra safety copy.
