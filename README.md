# primandir-landing

Static marketing/landing site for **Digital Temple** (primandir.com). Plain HTML/CSS — no build step, no backend, no database, no analytics, no tracking, no paid dependencies.

## Contents

| File | Purpose |
| --- | --- |
| `index.html` | Home page (hero, about, features, who it's for, early access, partner/contact) |
| `privacy.html` | Privacy policy (draft — legal review needed) |
| `terms.html` | Terms of use (draft — legal review needed) |
| `support.html` | Support / FAQ |
| `contact.html` | Contact + waitlist + booking |
| `styles.css` | Single stylesheet |
| `favicon.svg` | Favicon |
| `og-image.svg` | Open Graph / social share image |
| `robots.txt` | Crawler rules + sitemap pointer |
| `sitemap.xml` | Sitemap for Search Console |
| `utm-links.csv` | Prebuilt UTM-tagged CTA links (see also `docs/marketing/UTM_LINK_BUILDER.md` in the app repo) |

## CTA destinations (single source of truth)

- **Waitlist form:** `https://share-na2.hsforms.com/2gvDkJfGJRAiBXt5oMio0hQ42qy01`
- **Booking link:** `https://meetings-na2.hubspot.com/priyansh-chordia`

If either link changes, update every `.html` file plus `utm-links.csv`.

## Local preview

No build needed. Either open `index.html` directly, or serve the folder:

```sh
cd primandir-landing
python3 -m http.server 8080
# open http://localhost:8080
```

## Deploy to Vercel (Free / Hobby)

This is a static site — no framework. In Vercel:

1. **New Project → Import** the `primandir-landing` GitHub repo.
2. **Framework Preset:** `Other` (no framework).
3. **Build Command:** leave empty. **Output Directory:** leave as root (`.`).
4. Deploy. Confirm the `*.vercel.app` preview URL loads `index.html`.
5. Do **not** enable paid Vercel Analytics, Speed Insights, or any paid feature/trial.

## Custom domain + DNS safety (do this in Vercel, then GoDaddy)

Goal: keep `primandir.com` showing in the browser (replace the current HubSpot forwarding) by pointing **web** DNS at Vercel.

1. In Vercel → Project → **Settings → Domains**, add `primandir.com` and `www.primandir.com`.
2. **Copy the exact A / CNAME values Vercel shows. Do not guess DNS values.**
3. In GoDaddy, remove the existing **web forwarding** to the HubSpot form and add only the Vercel-required A/CNAME records.

### ⚠️ DNS do-NOT-touch rules

These protect email and the rest of the domain. Changing them can break mail delivery.

- **Do NOT change nameservers.**
- **Do NOT touch `MX` records.**
- **Do NOT touch `SPF` / `TXT`, `DKIM`, or `DMARC` records.**
- **Do NOT touch any Google Workspace / email records.**
- Only add/modify the **A (apex)** and **CNAME (www)** records Vercel asks for.
- If any change might affect email, **stop and confirm with the owner.**

## Copy guardrails

- Say "being built," "planned," "early access" — do **not** claim the app is fully launched.
- Avoid medical, therapeutic, clinical, healing, or guaranteed-outcome claims.
- Do **not** claim official temple / institutional affiliation.
- Privacy/terms pages are conservative drafts and need owner + legal review before launch (search for `LEGAL REVIEW NEEDED`).
