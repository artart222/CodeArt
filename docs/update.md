# Update

## `:CodeArtUpdate`

Updates **CodeArt config and plugins only**:

1. `git pull --ff-only` in the config directory
2. `:Lazy sync`

It does **not** upgrade Neovim. Install or upgrade Neovim with your OS package manager (Homebrew, apt, pacman, winget, etc.).

### Steps

1. Run `:CodeArtUpdate` inside Neovim
2. Restart Neovim
3. Run `:MasonUpdate` and `:TSUpdate` if needed
4. Restart Neovim

If CodeArt reports that Neovim is too old after an update, upgrade Neovim first, then reopen the editor.

## Customizations and dirty trees

Put customizations in `lua/user_settings.lua`.

Local edits **outside** that file (or an uncommitted dirty git tree) can block `git pull --ff-only`. Stash, commit, or back up changes before updating.

## Migrating from older CodeArt

See [CHANGELOG.md](https://github.com/artart222/CodeArt/blob/main/CHANGELOG.md) for breaking changes.

From 1.x / early 2.x renames (examples):

- `config.null_ls` → `config.conform` / `config.lint`
- `config.cmp` → `config.blink`
- `config.nvim_tree` → `config.neo_tree`
- `disable_plugins.nvim_tree` → `neo_tree`
- `disable_plugins.null_ls` → `conform` / `lint`
- `disable_plugins.nvim_cmp` / `cmp_*` → `blink_cmp`

### Treesitter `main` (2.1)

1. Upgrade Neovim to 0.12+
2. Install `tree-sitter-cli` (e.g. `brew install tree-sitter-cli`)
3. Pull CodeArt / `:CodeArtUpdate`
4. `:Lazy sync`
5. `:TSUninstall all`
6. Restart, then `:TSUpdate`
7. `:checkhealth nvim-treesitter`
