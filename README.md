# Ski Performance Tracker — Android-first PWA

Working static web app with workout logging, training calendar, Vermont and Utah ski-day scorecards, performance tests, offline caching, CSV/JSON exports, and optional Supabase account synchronization.

## Deployment
1. Create a GitHub repository named `ski-performance-tracker` and upload `index.html`, `style.css`, `app.js`, `manifest.webmanifest`, `icon.svg`, and `sw.js` to its root.
2. In GitHub repository Settings → Pages, choose Deploy from a branch, `main`, `/(root)`, then Save. The hosted site may be publicly accessible even if the repository is private. Alternatively use Netlify or Cloudflare Pages static hosting.
3. Visit the published HTTPS URL.

## Enable synchronized training history
1. Create a project at https://supabase.com.
2. In SQL Editor run the provided `supabase.sql`. Row-level security permits each user to access only their own row.
3. In Authentication → Providers enable Email. Email confirmation may be required.
4. Copy the Project URL and **publishable** (or legacy `anon`) public key from the project's API settings. NEVER use the service_role/secret key in this app.
5. On your Galaxy open the hosted tracker → Settings → enter URL and public key → Save → create account or sign in. Confirm email if requested.
6. On your Windows PC open the same hosted URL, configure the same Supabase project URL and public key, and sign in with the same email/password. Tap Sync now. Sync before switching devices.

## Install
**Samsung Galaxy:** In Chrome, open the hosted HTTPS site → three-dot menu → Add to Home screen → Install (wording varies). Launch from the home screen. The app shell caches for offline use after first load.

**Windows:** Open the hosted site in Edge or Chrome and select Install app in the browser menu, or bookmark it.

## Data and limitations
- The app ships with your reported November 9 strength and November 10 aerobic sessions preloaded; you can edit these.
- Logging works locally without Supabase. Cloud sync requires a connection and your own Supabase project.
- Cloud sync uses latest-modified-copy wins, not simultaneous multi-device conflict merging. Avoid editing simultaneously on phone and PC, and sync before switching devices.
- Export JSON backups regularly. Restore replaces the local log.
- Authentication tokens are held in local browser storage; use a personal device and a strong password. Production-grade handling of sensitive information would warrant a security review.
- SVG icon works in modern browsers; for broader PWA compatibility, consider generating 192px and 512px PNG icons and updating the manifest.
- The app is not hosted yet; you must deploy it using your own account. This is not medical clearance to train with ongoing respiratory symptoms.
