local present, nvimtree = pcall(require, "nvim-tree")
if not present then
  return
end

local nvimtree_config = {
  on_attach = function(bufnr)
    -- Adding default mappings.
    local api = require("nvim-tree.api")
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    api.config.mappings.default_on_attach(bufnr)
    -- Remove default H mappings and set it for resizing.
    vim.keymap.del("n", "H", { buffer = bufnr })
    vim.keymap.set("n", "H", function()
      vim.cmd("call ResizeLeft(3)")
    end)
    -- Adding new mapping for toggle dotfiles.
    vim.keymap.set("n", "<C-h>", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
  end,
  open_on_tab = false,
  update_cwd = true,
  disable_netrw = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
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
  renderer = {
    highlight_git = true,
    add_trailing = false,
    highlight_opened_files = "none",
    indent_markers = {
      enable = true,
    },
  },
  view = {
    width = math.floor(vim.fn.winwidth(0) * 0.15), -- Finding 15% of windows width.
    side = "left",
    preserve_window_proportions = false,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = {
            "notify",
            "packer",
            "qf",
            "diff",
            "fugitive",
            "fugitiveblame",
            "Outline",
            "toggleterm",
            "alpha",
          },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
}

local config = require("user_settings")
if config.nvim_tree then
  for k, v in pairs(config.nvim_tree) do
    nvimtree_config[k] = v
  end
end

nvimtree.setup(nvimtree_config)
