# LSP and Treesitter

## LSP

Install a language server (Mason + mason-lspconfig):

```vim
:LspInstall <server_or_filetype>
```

Examples: `:LspInstall lua_ls`, `:LspInstall pyright`.

Open `:Mason` for the UI. Commands work from a fresh Dashboard session (`LspInstall` / `LspUninstall` lazy-load mason-lspconfig).

Configure servers in `user_settings.lua`:

```lua
M.config.lsp = function()
  -- vim.lsp.config("lua_ls", {})
  -- vim.lsp.enable("lua_ls")
end
```

## Treesitter

CodeArt uses nvim-treesitter on the **`main`** branch (Neovim 0.12+).

Requires **`tree-sitter` CLI ≥ 0.26.1** on `PATH` (install `tree-sitter-cli` via your OS package manager — not npm).

### Install parsers

Interactively:

```vim
:TSInstall lua
:TSUpdate
```

Or ensure on startup (opt-in; no defaults shipped):

```lua
M.config.treesitter = {
  ensure_installed = { "lua", "vim", "python" },
}
```

Fresh installs have **no** parsers until you install some. Neovim may still highlight a few languages using bundled parsers.

### Health

```vim
:checkhealth nvim-treesitter
```
