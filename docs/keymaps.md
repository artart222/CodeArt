# Key maps

Leader is **Space** (`<leader>`). Press Space and wait for [which-key](https://github.com/folke/which-key.nvim) to list groups.

Common groups (when the related plugin is enabled):

| Keys | Group |
|------|--------|
| `<leader>b` | Buffer (e.g. `<leader>bn` new buffer) |
| `<leader>f` | Find / Telescope (`ff` file, `fd` directory, `fw` word, `fB` bookmarks) |
| `<leader>g` | Git |
| `<leader>l` | LSP |
| `<leader>n` | Neo-tree |
| `<leader>t` | Terminal (ToggleTerm) |
| `<leader>d` | Debugging (DAP) |
| `<leader>c` | Colorscheme |
| `<leader>r` | Format (conform + LSP fallback, or LSP if conform disabled) |
| `<leader>/` | Comment |
| `<leader>?` | which-key buffer maps help |

Dashboard shortcuts match these maps (e.g. New File → `SPC b n`).

Exact maps depend on which plugins you disable in `user_settings.lua`. Explore with which-key or read `lua/plugins/which-key.lua`.

Add your own maps with `extra_which_keys` — see [Configuration](configuration.md).
