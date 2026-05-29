# Changelog

## [2.0.0] - 2026-05-29

### Breaking changes

- **Neovim 0.11+** required (was 0.9+).
- Replaced **null-ls** with **conform.nvim** (formatting) and **nvim-lint** (diagnostics).
- Replaced **nvim-cmp** with **blink.cmp**.
- Replaced **nvim-tree** with **neo-tree**.
- Replaced **symbols-outline** with **outline.nvim**.
- Replaced **kommentary** with **Comment.nvim**.
- **lspsaga** moved to `nvimdev/lspsaga.nvim` (new API).
- **Mason** packages moved to `mason-org/*`.
- `user_settings` API changes:
  - `config.null_ls` → `config.conform` / `config.lint`
  - `config.cmp` → `config.blink`
  - `config.nvim_tree` → `config.neo_tree`
  - `disable_plugins.null_ls` → `conform`, `lint`
  - `disable_plugins.nvim_cmp`, `cmp_*` → `blink_cmp`
  - `disable_plugins.nvim_tree` → `neo_tree`
  - `disable_plugins.kommentary` removed; use `comment`
  - `disable_plugins.symbols_outline` → `outline`

### Added

- **folke/trouble.nvim** for diagnostics UI.
- **kylechui/nvim-surround** for surround edits.
- **catppuccin/nvim** colorscheme (disabled by default).
- **lazy-lock.json** for reproducible plugin versions.
- GitHub Actions CI (stylua check).
- `:CodeArtUpdate` runs `:Lazy sync` after a successful git pull.

### Changed

- Install/update docs use `:Lazy sync` instead of `:PackerSync`.
- **mason-lspconfig** uses `handlers` so servers installed later attach without restart.
- Native LSP keymaps when lspsaga is disabled.
- Treesitter foldexpr uses Lua API on Neovim 0.11.
- **neoscroll** disabled by default (keep **nvim-scrollview** only).

### Removed

- packer.nvim references from docs and configs.
- **kommentary**, **null-ls**, **nvim-cmp** and cmp-* plugins.
