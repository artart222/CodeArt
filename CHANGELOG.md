# Changelog

## [2.1.0] - 2026-08-06

### Fixed

- Pin **nvim-treesitter** to `master` (`lazy = false`) so fresh installs use the configs API again (default `main` branch broke `ensure_installed` / highlighting setup).
- Add missing **nvim-neotest/nvim-nio** dependency for **nvim-dap-ui** (DAP UI could not load).
- Rewrite LSP setup for **mason-lspconfig** v2: remove removed `handlers` API; use `vim.lsp.config()` + `LspAttach` and `automatic_enable`.
- Fix **nvim-surround** setup (`require("nvim-surround")` instead of `require("surround")`).
- Fix **lualine** LSP progress component for `vim.lsp.status()` returning a string (no more idle `(0%)` spinner).
- Fix **Comment.nvim** `pre_hook` so treesitter context commentstring is actually returned.
- Fix **tokyonight** user override key typo (`config.tokyonight`).
- Fix **lazy.nvim** bootstrap when git clone fails (notify and abort instead of cascading `module 'lazy' not found`).
- Remove dead `require("theme").icons` from todo-comments config.

### Changed

- **`:CodeArtUpdate`** is config-only: `git pull --ff-only` + `:Lazy sync`. It no longer tries to install/upgrade Neovim via OS package managers.
- Stronger Neovim **0.11+** startup gate: ERROR notify and abort loading CodeArt if the version is too old (upgrade Neovim with your OS package manager).
- Commit **lazy-lock.json** for reproducible plugin versions (removed from `.gitignore`).

### Notes

- `:CodeArtUpdate` updates CodeArt and plugins only. When a release needs a newer Neovim, CodeArt will tell you at startup — upgrade Neovim yourself.

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
- GitHub Actions CI (stylua check).
- `:CodeArtUpdate` runs `:Lazy sync` after a successful git pull.

### Changed

- Install/update docs use `:Lazy sync` instead of `:PackerSync`.
- Native LSP keymaps when lspsaga is disabled.
- Treesitter foldexpr uses Lua API on Neovim 0.11.
- **neoscroll** disabled by default (keep **nvim-scrollview** only).

### Removed

- packer.nvim references from docs and configs.
- **kommentary**, **null-ls**, **nvim-cmp** and cmp-* plugins.
