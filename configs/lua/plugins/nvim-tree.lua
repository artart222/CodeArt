local present, nvimtree = pcall(require, "nvim-tree")
if not present then
  return
end
local tree_cb = require("nvim-tree.config").nvim_tree_callback

-- Set alias for vim.g.
local g = vim.g

g.nvim_tree_auto_ignore_ft = { "dashboard" } -- Don't open tree on specific fiypes.
g.nvim_tree_indent_markers = 1 -- This option shows indent markers when folders are open.
g.nvim_tree_git_hl = 1 -- Will enable file highlight for git attributes (can be used without the icons).
g.nvim_tree_highlight_opened_files = 0 -- Will enable folder and file icon highlight for opened files/directories.
g.nvim_tree_add_trailing = 0 -- Append a trailing slash to folder names. ]]

nvimtree.setup({
  auto_close = false,
  open_on_tab = false,
  update_cwd = true,
  hijack_unnamed_buffer_when_opening = false,
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  filters = {
    custom = {
      ".git",
      "node_modules",
      ".cache",
      "__pycache__",
    },
  },
  view = {
    width = "15%",
    side = "left",
    auto_resize = true,
    mappings = {
      list = {
        { key = "<S-h>", cb = ":call ResizeLeft(3)<CR>" },
        { key = "<C-h>", cb = tree_cb("toggle_dotfiles") },
      },
    },
  },
  open_file = {
    quit_on_open = false,
    resize_window = false,
    window_picker = {
      enable = true,
      chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
      exclude = {
        filetype = { "packer", "vista_kind", "toggleterm" },
        buftype = { "terminal" },
      },
    },
  },
})
