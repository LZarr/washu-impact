# WashU Impact Society Website

Rebuilt from the Squarespace export as a static site using [Eleventy](https://www.11ty.dev/). Deploys automatically to GitHub Pages on every push to `main`.

## Local development

Requires [Node.js](https://nodejs.org/) (LTS).

```
npm install
npm start
```

This serves the site locally (Eleventy will print the local URL, typically `http://localhost:8080`) and rebuilds on file changes.

To do a one-off production build without serving it:

```
npm run build
```

Output goes to `_site/` (gitignored).

## Project structure

- `src/_data/` &mdash; structured content as JSON: `site.json` (nav + sitewide links like the mailing list form, "talk with an organizer" form, and Instagram), `people.json` (team roster), `resources.json` (resources page links).
- `src/_includes/layouts/base.njk` &mdash; the shared page shell (nav + footer).
- `src/_includes/partials/` &mdash; nav and footer snippets.
- `src/*.njk` &mdash; one file per page: `index` (home), `get-involved` (Intro Fellowship), `impact-lab`, `people`, `resources`, `contact`.
- `src/assets/` &mdash; CSS and all images (images were downloaded from Squarespace's CDN so the site no longer depends on Squarespace staying online).

### Updating the team roster

Edit `src/_data/people.json`. Each person is `{ name, role, image, bio, email }` (or `calendly` instead of `email`). Add a headshot to `src/assets/images/people/` and reference it by path.

### Updating sitewide links

The mailing list signup form, "talk with an organizer" form, and Instagram URL live in `src/_data/site.json` (`mailingListUrl`, `talkToOrganizerUrl`, `instagramUrl`). Update them there if any of those links change.

## Deployment (GitHub Pages)

A GitHub Actions workflow (`.github/workflows/deploy.yml`) builds the site and deploys it to GitHub Pages automatically on every push to `main`. One-time setup after pushing this repo to GitHub:

1. On GitHub, go to the repo's **Settings &rarr; Pages**.
2. Under "Build and deployment", set **Source** to **GitHub Actions**.
3. Push to `main` (or re-run the workflow from the **Actions** tab) and the first deployment will run.

## Custom domain (washuimpact.com)

**Current status: not yet live.** The domain isn't registered/pointed yet, so the site is built and served at `https://lzarr.github.io/washu-impact/` for now. The build is set up to toggle between the two modes with one line:

- `eleventy.config.js` reads `ELEVENTY_PATH_PREFIX` to decide where the site thinks it's hosted (subpath vs. domain root), and only publishes `src/CNAME` when the prefix is `/` (domain root) &mdash; publishing it while on the `github.io` subpath would get GitHub Pages trying to redirect to a domain that isn't configured yet.
- `.github/workflows/deploy.yml` currently sets `ELEVENTY_PATH_PREFIX: /washu-impact/` in the build step for this reason.

**When the domain is registered and ready to go live:**

1. In `.github/workflows/deploy.yml`, delete the `env: ELEVENTY_PATH_PREFIX: /washu-impact/` block under "Build site" (or set it to `/`) so the site builds for the domain root and `src/CNAME` gets published again.
2. **DNS setup at GoDaddy:**
   - Log into GoDaddy &rarr; **My Products** &rarr; find `washuimpact.com` &rarr; **DNS** (or **Manage DNS**).
   - Add/replace the DNS records for the root domain with GitHub Pages' IP addresses &mdash; four **A** records, all for host `@`:
     ```
     185.199.108.153
     185.199.109.153
     185.199.110.153
     185.199.111.153
     ```
     (Remove any existing `A` or `CNAME`/forwarding records on `@` from Squarespace first, if present.)
   - Add a **CNAME** record for `www` pointing to `lzarr.github.io`.
3. Push the workflow change (step 1) to `main` so the next deploy publishes `CNAME` again.
4. On GitHub &rarr; **Settings &rarr; Pages**, enter `washuimpact.com` under **Custom domain** and save. Wait for DNS to verify (can take up to ~24 hours, often much faster), then check **Enforce HTTPS**.

Once live, `https://lzarr.github.io/washu-impact/` should redirect to `https://washuimpact.com/`.

## Pages intentionally dropped from the original site

Per request, these pages from the Squarespace export are **not** in this site: The Precipice Reading Group, In-Depth Fellowship, Biorisk Fellowship, Career Mentoring, Request a Book, Jobs & Internships, EA Organizations, and the old unfilled "Events" placeholder page. Their content and images were removed from the repo too. If any of these need to come back later, they're recoverable from git history (the initial commit).

## Known gaps / things to double check before going live

- **Stale dates/deadlines** from the original site were generalized rather than guessed (e.g. a specific past application deadline) on pages that are still in the site. Search for `TODO` comments and update with current info.
