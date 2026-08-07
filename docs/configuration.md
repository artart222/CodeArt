# Configuration

Edit **`lua/user_settings.lua`**. Prefer that file so `:CodeArtUpdate` can still fast-forward the rest of the config.

## Disable plugins

Set flags under `M.disable_plugins`:

```lua
M.disable_plugins = {
  catppuccin = true,  -- disabled
  neo_tree = false,   -- enabled
}
```

## Plugin options (`M.config`)

Most plugin setups **deep-merge** your table into CodeArt defaults (`vim.tbl_deep_extend("force", ...)`):

- You can override individual nested keys without wiping siblings
- To replace a whole nested section, pass a full table for that section
- For a totally custom plugin setup: disable the plugin and add your own via `additional_plugins`

### Conform (format)

Shipped example enables format-on-save with LSP fallback. Formatters stay opt-in:

```lua
M.config.conform = {
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
  -- formatters_by_ft = {
  --   lua = { "stylua" },
  --   python = { "black" },
  -- },
}
```

Remove or edit `config.conform` to change or disable format-on-save. Manual format: `<leader>r` (conform + LSP fallback, or LSP only if conform is disabled).

### Lint

Opt-in only (no default linters):

```lua
M.config.lint = {
  linters_by_ft = {
    python = { "flake8" },
    sh = { "shellcheck" },
  },
}
```

### Treesitter parsers

Opt-in only (CodeArt ships **no** default parsers):

```lua
M.config.treesitter = {
  ensure_installed = { "lua", "vim", "python" },
}
```

Or use `:TSInstall <language>` — see [LSP and Treesitter](lsp-treesitter.md).

### LSP

```lua
M.config.lsp = function()
  -- vim.lsp.config("lua_ls", {})
  -- vim.lsp.enable("lua_ls")
end
```

### Colorscheme

```lua
M.config.other_configs = function()
  vim.cmd("colorscheme enfocado")
end
```

Optional themes load via Lazy `colorscheme = "..."` triggers (e.g. `:colorscheme tokyonight`).

## Extra plugins

`M.additional_plugins` accepts Lazy.nvim specs (string or table):

```lua
M.additional_plugins = {
  {
    "Mofiqul/vscode.nvim",
    colorscheme = "vscode",
  },
}
```

## Extra which-key maps

which-key **v3** specs via `utils.wk_add`:

```lua
local wk_add = require("utils").wk_add

wk_add({
  { "<leader>ff", ":Telescope find_files<CR>", desc = "Find File" },
}, { mode = "n" }, M.extra_which_keys)
```
