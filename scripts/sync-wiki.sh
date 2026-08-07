#!/usr/bin/env bash
# Sync docs/ (source of truth) → GitHub wiki (artart222/CodeArt.wiki).
# Usage: ./scripts/sync-wiki.sh
# Env:
#   WIKI_REMOTE  override wiki clone URL
#   GH_TOKEN     optional; used for HTTPS push in CI
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DOCS="$ROOT/docs"
WIKI_DIR="${WIKI_DIR:-${TMPDIR:-/tmp}/CodeArt.wiki-sync}"

if [[ -n "${GH_TOKEN:-}" ]]; then
  WIKI_REMOTE="${WIKI_REMOTE:-https://x-access-token:${GH_TOKEN}@github.com/artart222/CodeArt.wiki.git}"
else
  WIKI_REMOTE="${WIKI_REMOTE:-https://github.com/artart222/CodeArt.wiki.git}"
fi

if [[ ! -d "$DOCS" ]]; then
  echo "docs/ not found at $DOCS" >&2
  exit 1
fi

rm -rf "$WIKI_DIR"
git clone --depth 1 "$WIKI_REMOTE" "$WIKI_DIR"

# docs file → wiki page filename (Home.md is the wiki landing page)
copy_page() {
  local src="$1"
  local dest="$2"
  if [[ ! -f "$DOCS/$src" ]]; then
    echo "missing docs/$src" >&2
    exit 1
  fi
  cp "$DOCS/$src" "$WIKI_DIR/$dest"
}

copy_page "README.md" "Home.md"
copy_page "installation.md" "Installation.md"
copy_page "update.md" "Update.md"
copy_page "configuration.md" "Configuration.md"
copy_page "keymaps.md" "Key-maps.md"
copy_page "lsp-treesitter.md" "LSP-and-Treesitter.md"

# Rewrite in-repo relative links to wiki page names.
rewrite_links() {
  local file="$1"
  # macOS/BSD sed needs -i ''; GNU sed accepts -i.bak or -i
  if sed --version >/dev/null 2>&1; then
    SED=(sed -i)
  else
    SED=(sed -i '')
  fi
  "${SED[@]}" \
    -e 's|](installation\.md)|](Installation)|g' \
    -e 's|](update\.md)|](Update)|g' \
    -e 's|](configuration\.md)|](Configuration)|g' \
    -e 's|](keymaps\.md)|](Key-maps)|g' \
    -e 's|](lsp-treesitter\.md)|](LSP-and-Treesitter)|g' \
    -e 's|](README\.md)|](Home)|g' \
    "$file"
}

for page in Home.md Installation.md Update.md Configuration.md Key-maps.md LSP-and-Treesitter.md; do
  rewrite_links "$WIKI_DIR/$page"
done

# Banner so editors know not to hand-edit the wiki long-term
HEADER=$'<!-- Synced from CodeArt docs/ — edit files under docs/ in the main repo, then run scripts/sync-wiki.sh -->\n\n'
for page in Home.md Installation.md Update.md Configuration.md Key-maps.md LSP-and-Treesitter.md; do
  if ! grep -q 'Synced from CodeArt docs/' "$WIKI_DIR/$page"; then
    printf '%s%s' "$HEADER" "$(cat "$WIKI_DIR/$page")" >"$WIKI_DIR/$page.tmp"
    mv "$WIKI_DIR/$page.tmp" "$WIKI_DIR/$page"
  fi
done

cd "$WIKI_DIR"
git add -A
if git diff --staged --quiet; then
  echo "Wiki already up to date"
  exit 0
fi

git config user.name "${GIT_AUTHOR_NAME:-CodeArt docs sync}"
git config user.email "${GIT_AUTHOR_EMAIL:-noreply@github.com}"

SHA="$(git -C "$ROOT" rev-parse --short HEAD 2>/dev/null || echo unknown)"
git commit -m "Sync docs from CodeArt ${SHA}"
git push

echo "Wiki synced to $WIKI_REMOTE"
