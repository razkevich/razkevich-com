# razkevich.com

Personal site and blog for Alex Razkevich, with notes on infrastructure, reliability, GCP, and system design.

Live site: https://razkevich.com

## Repository layout

- `public/` — static site files served by Cloudflare Workers Assets
- `public/index.html` — homepage and post feed
- `public/about/` — short about / self-presentation
- `public/posts.json` — post metadata used as the feed source
- `public/posts/<slug>/index.html` — individual post pages
- `wrangler.toml` — Worker and static-assets configuration
- `scripts/deploy.sh` — the supported deployment command
- `DEPLOY.md` — deployment notes and troubleshooting

## Add or edit a post

1. Add or update the post page at `public/posts/<slug>/index.html`.
2. Add or update its entry in `public/posts.json` (`title`, `slug`, `date`, `date_human`, `excerpt`, `url`, and `path`).
3. Rebuild `public/index.html` from `public/posts.json`, keeping the feed newest first.
4. Check the post link and homepage locally, then deploy.

When changing a slug, update the directory, the `posts.json` entry, and the matching homepage link together.

## Deploy

Run the supported script from the repository root:

```bash
./scripts/deploy.sh
```

It deploys the site with Wrangler using `CLOUDFLARE_API_TOKEN`. Never deploy through the Cloudflare dashboard. See [`DEPLOY.md`](DEPLOY.md) for details.
