local present, lualine_setup = pcall(require, "lualine")
if not present then
  return
end

local utils = require("plugins.lualine.components")

-- Some preconfigured styles.
local lualine_styles = {
  {
    { left = " ", right = " " },
    { left = "│", right = "│" },
  },
  {
    { left = " ", right = "" },
    { left = " ", right = " " },
  },
  {
    { left = "", right = "" },
    { left = " ", right = " " },
  },
  {
    { left = "", right = "" },
    { left = "", right = "" },
  },
  {
    { left = "", right = "" },
    { left = " ", right = " " },
  },
}

local lualine_style
local section_char, component_char
local config = require("user_settings").config
-- If user has configured lualine style
if config.user_lualine_style then
  -- If user lualine style is number
  if type(config.user_lualine_style) == "number" then
    lualine_style = config.user_lualine_style
    section_char = lualine_styles[lualine_style][1]
    component_char = lualine_styles[lualine_style][2]
    -- If user lualine is custome character use that
  elseif type(config.user_lualine_style) == "table" then
    section_char = config.user_lualine_style[1]
    component_char = config.user_lualine_style[2]
  end
else
  -- If user doesn't configured style use default config.
  lualine_style = 1
  section_char = lualine_styles[1][1]
  component_char = lualine_styles[1][2]
end

local lualine_config = {
  options = {
    globalstatus = true,
    theme = "auto",
    disabled_filetypes = {
      "TelescopePrompt",
      "TelescopeResults",
      "aerial",
      "dapui_scopes",
      "dapui_breakpoints",
      "dapui_stacks",
      "dapui_watches",
      "dap-repl",
    },

    section_separators = section_char,
    component_separators = component_char,
  },
  extensions = { "fugitive", "nvim-tree", "toggleterm", "aerial", "quickfix", "symbols-outline" },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      { "branch" },
      {
        "diff",
        symbols = { added = "  ", modified = "  ", removed = " " }, -- changes diff symbols
      },
      { "diagnostics" },
    },
    lualine_c = {
      { "filetype", icon_only = true, padding = { left = 1, right = 0 }, separator = " " },
      { "filename", padding = { left = 0, right = 1 } },
    },
    lualine_x = {
      {
        utils.lsp_name,
        icon = " ",
        color = { gui = "none" },
      },
      {
        utils.treesitter_status,
        color = {
          -- Setting DiffChange color if termguicolors is setted.
          fg = (vim.opt.termguicolors:get() and vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("DiffChange")), "fg")),
        },
      },
      "fileformat",
    },
    lualine_y = { utils.lsp_progress, "progress" },
    lualine_z = { "location" },
  },
}

-- TODO: make better user settings file.
if config.lualine then
  for k, v in pairs(config.lualine) do
    lualine_config[k] = v
  end
end

lualine_setup.setup(lualine_config)
