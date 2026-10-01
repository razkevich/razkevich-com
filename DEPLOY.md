# Deploy razkevich.com

## Never use the Cloudflare dashboard / browser for deploys.

Cloudflare MCP (docs/bindings/builds/observability) cannot upload Workers static assets.
Deploy with Wrangler + `CLOUDFLARE_API_TOKEN` (env on the shared box).

## Layout
- Source: `/workspace/razkevich-com/`
- Static assets only in `public/` (`index.html`, `styles.css`, `posts.json`, `posts/`, `404.html`)
- `wrangler.toml` at project root; `[assets] directory = "./public"`

## Deploy
```bash
/workspace/razkevich-com/scripts/deploy.sh
```

Or manually (Node ≥22 via fnm):
```bash
export PATH="$HOME/.local/share/fnm:$PATH"
eval "$(fnm env)"; fnm use 22
# copy to /tmp and use local wrangler (avoids /node_modules/.cache permission error)
```

Account: Razkevich8@gmail.com's Account (`939d3ac8181b5ffb09f5b9383e667486`)
Worker: `razkevich-com`
Live: https://razkevich.com / https://www.razkevich.com / https://razkevich-com.razkevich8.workers.dev

## After publish/edit
1. Update `public/posts/<slug>/index.html` and `public/posts.json`
2. Rebuild homepage feed in `public/index.html` from `posts.json` (newest first)
3. Run `scripts/deploy.sh`
4. Verify: homepage post count, post dates, deleted slugs return 404
5. Tell Alex only in the Blog chat (never Slack)

## Auth
If token missing/invalid: ask Alex for a new API token (Edit Cloudflare Workers template) via secret-request as `CLOUDFLARE_API_TOKEN`. Never echo the token. Never use Global API Key in chat.
