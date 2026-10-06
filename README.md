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

- `src/_data/` &mdash; structured content as JSON: `site.json` (nav), `people.json` (team roster), `books.json` (book request list), `resources.json` (resources page links).
- `src/_includes/layouts/base.njk` &mdash; the shared page shell (nav + footer).
- `src/_includes/partials/` &mdash; nav and footer snippets.
- `src/*.njk` &mdash; one file per page.
- `src/assets/` &mdash; CSS and all images (images were downloaded from Squarespace's CDN so the site no longer depends on Squarespace staying online).

### Updating the team roster

Edit `src/_data/people.json`. Each person is `{ name, role, image, bio, email }` (or `calendly` instead of `email`). Add a headshot to `src/assets/images/people/` and reference it by path.

### Updating the book list

Edit `src/_data/books.json`, same pattern, images in `src/assets/images/books/`.

## Deployment (GitHub Pages)

A GitHub Actions workflow (`.github/workflows/deploy.yml`) builds the site and deploys it to GitHub Pages automatically on every push to `main`. One-time setup after pushing this repo to GitHub:

1. On GitHub, go to the repo's **Settings &rarr; Pages**.
2. Under "Build and deployment", set **Source** to **GitHub Actions**.
3. Push to `main` (or re-run the workflow from the **Actions** tab) and the first deployment will run.

## Custom domain (washuimpact.com)

This repo is configured to serve at `washuimpact.com` (see `src/CNAME`, which Eleventy copies into the built site).

**One-time DNS setup at GoDaddy:**

1. Log into GoDaddy &rarr; **My Products** &rarr; find `washuimpact.com` &rarr; **DNS** (or **Manage DNS**).
2. Add/replace the DNS records for the root domain with GitHub Pages' IP addresses &mdash; four **A** records, all for host `@`:
   ```
   185.199.108.153
   185.199.109.153
   185.199.110.153
   185.199.111.153
   ```
   (Remove any existing `A` or `CNAME`/forwarding records on `@` from Squarespace first, if present.)
3. Add a **CNAME** record for `www` pointing to `<your-github-username>.github.io`.
4. Back on GitHub &rarr; **Settings &rarr; Pages**, enter `washuimpact.com` under **Custom domain** and save. Wait for DNS to verify (can take up to ~24 hours, often much faster), then check **Enforce HTTPS**.

Until DNS propagates, the site is also reachable at the default `https://<your-github-username>.github.io/<repo-name>/` URL.

## Known gaps / things to double check before going live

- **Social media links** (footer and Contact page) are placeholders (`#`) &mdash; the Squarespace export didn't include these as page content (they're a site-wide setting). Search this repo for `TODO` to find them and fill in your real profile URLs.
- **Stale dates/deadlines** from the original site were generalized rather than guessed (e.g. a specific past application deadline). Search for `TODO` comments and update with current info.
- The old "Events" page was Squarespace's unfilled placeholder template content and was intentionally **not** carried over.
- The book request page uses a simple grid instead of the original's JS carousel, to avoid extra dependencies/maintenance. The Airtable request form embed is unchanged.
- Double-check all outbound links (job boards, forms, partner orgs) still work &mdash; several were copied as-is from the export and may be a few years old.
