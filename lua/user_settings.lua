local M = {}

local map = require("utils").map
local wk_add = require("utils").wk_add

-- Extra which-key mappings (which-key v3 specs via wk_add):
-- wk_add({
--   { "<leader>ff", ":Telescope find_files<CR>", desc = "Find File" },
-- }, { mode = "n" }, M.extra_which_keys)
M.extra_which_keys = {}

M.disable_plugins = {
  plenary = false,

  tokyonight = false,
  nightfly = false,
  moonfly = false,
  nord = false,
  onedark = false,
  catppuccin = true,
  nvim_enfocado = false,

  nvim_dap = false,
  nvim_dap_ui = false,
  mason_nvim_dap = false,

  telescope_fzf_native = false,
  telescope_find_directories = false,
  telescope = false,

  scrollview = false,
  neoscroll = true,

  blink_cmp = false,
  luasnip = false,
  friendly_snippets = false,

  nvim_web_devicons = false,
  lualine = false,
  nvim_bufferline = false,
  indent_blankline = false,

  better_escape = true,

  truezen = false,
  neo_tree = false,
  treesitter = false,
  nvim_colorizer = false,
  dashboard = false,
  nvim_lspconfig = false,
  mason = false,
  mason_lspconfig = false,
  conform = false,
  lint = false,
  lspsaga = false,
  outline = false,
  trouble = false,
  surround = false,
  lsp_signature = false,
  toggleterm = false,
  fugitive = false,
  gitsigns = false,
  autopairs = false,
  nvim_ts_autotag = false,
  todo_comments = false,
  which_key = false,
  mkdir = false,
  comment = false,
  ts_context_commentstring = false,
  vim_matchup = false,
  vim_resize = false,
}

M.additional_plugins = {
  {
    "Mofiqul/vscode.nvim",
    colorscheme = "vscode",
  },
}

M.config = {
  -- Merge into conform.nvim setup; opt-in only (no defaults). Example:
  conform = {
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },

  -- nvim-lint: opt-in only (no defaults). Install linters via Mason, then configure:
  -- lint = {
  --   linters_by_ft = {
  --     python = { "flake8" },
  --     sh = { "shellcheck" },
  --   },
  -- },

  -- nvim-treesitter (main): opt-in parsers only (no defaults).
  -- treesitter = {
  --   ensure_installed = { "lua", "vim", "python" },
  -- },

  lsp = function()
    -- vim.lsp.config("lua_ls", {})
    -- vim.lsp.enable("lua_ls")
  end,

  other_configs = function()
    vim.cmd("colorscheme enfocado")
  end,
}

return M
