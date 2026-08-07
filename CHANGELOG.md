# Changelog

## [2.1.0] - 2026-08-06

### Breaking changes

- **Neovim 0.12+** required (was 0.11+).
- **nvim-treesitter** uses the **`main`** rewrite (not the frozen `master` branch).
- **`tree-sitter-cli` ≥ 0.26.1** is required on PATH (OS package manager / cargo — **not** the npm package).
- `user_settings.config.treesitter.ensure_installed` is **opt-in only** (CodeArt ships **no** default parsers). Set it to a list of parser names to install on startup, or use `:TSInstall <language>`.

**Upgrade from an older 2.1 / treesitter `master` install:**

1. Upgrade Neovim to 0.12+
2. Install `tree-sitter-cli` (e.g. `brew install tree-sitter-cli`)
3. Pull CodeArt / run `:CodeArtUpdate`
4. `:Lazy sync`
5. `:TSUninstall all`
6. Restart Neovim, then `:TSUpdate`
7. `:checkhealth nvim-treesitter`

### Fixed

- Migrate **nvim-treesitter** to `main`: install parsers via the new API, enable highlighting with `vim.treesitter.start()`, and set indent except for Python.
- Wire **vim-matchup** and **nvim-ts-context-commentstring** as standalone setups (old treesitter modules no longer exist on `main`).
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
- Stronger Neovim **0.12+** startup gate: ERROR notify and abort loading CodeArt if the version is too old (upgrade Neovim with your OS package manager).
- Commit **lazy-lock.json** for reproducible plugin versions (removed from `.gitignore`).
- Installers document/install **tree-sitter-cli** where the package manager supports it.
- **conform.nvim** formatters and `format_on_save` are opt-in via `user_settings.config.conform` (no default format-on-save / LSP fallback).
- Plugin user overrides read `require("user_settings").config` consistently.
- **vim-matchup** loads on `BufReadPost` / `BufNewFile` (was never loading under `defaults.lazy = true`).
- **mason-lspconfig** exposes `:LspInstall` / `:LspUninstall` as lazy `cmd` triggers so they work from Dashboard.
- Remove unused leftover `lua/plugins/alpha.lua` (dashboard replaced alpha).
- CI boots this repo via XDG sandbox, pins Neovim **v0.12.0**, runs `:Lazy sync`, and smokes opening a file (asserts treesitter `main`).

### Notes

- `:CodeArtUpdate` updates CodeArt and plugins only. When a release needs a newer Neovim, CodeArt will tell you at startup — upgrade Neovim yourself.
- Missing `tree-sitter` CLI produces a startup warning; parser installs will fail with ENOENT until the CLI is installed.
- Fresh installs have no treesitter parsers until you `:TSInstall` or set `config.treesitter.ensure_installed`.

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
