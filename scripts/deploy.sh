#!/usr/bin/env bash
# Deploy razkevich.com static site via Wrangler. Never use the dashboard/browser.
set -euo pipefail
SITE_ROOT="${SITE_ROOT:-/workspace/razkevich-com}"
cd "$SITE_ROOT"

if [ -z "${CLOUDFLARE_API_TOKEN:-}" ]; then
  echo "CLOUDFLARE_API_TOKEN is not set. Ask Alex for a Workers API token via secret-request." >&2
  exit 1
fi

export PATH="${HOME}/.local/share/fnm:${PATH}"
if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env)"
  fnm use 22 >/dev/null 2>&1 || fnm install 22 && fnm use 22 >/dev/null
fi

# Wrangler must not run with assets cwd that hits /node_modules/.cache (root-owned).
# Deploy from a copy under /tmp with local wrangler binary.
DEPLOY_DIR="/tmp/razkevich-com-deploy"
mkdir -p "$DEPLOY_DIR"
if [ ! -x "$DEPLOY_DIR/node_modules/.bin/wrangler" ]; then
  (cd "$DEPLOY_DIR" && npm init -y >/dev/null 2>&1 && npm install wrangler@4 --no-fund --no-audit >/dev/null)
fi

rm -rf "$DEPLOY_DIR/site"
mkdir -p "$DEPLOY_DIR/site"
cp -a "$SITE_ROOT/wrangler.toml" "$SITE_ROOT/public" "$DEPLOY_DIR/site/"

cd "$DEPLOY_DIR/site"
"$DEPLOY_DIR/node_modules/.bin/wrangler" deploy

# smoke checks
curl -sS -o /dev/null -w "apex %{http_code}\n" https://razkevich.com/
curl -sS https://razkevich.com/ | grep -c '<li>' || true
