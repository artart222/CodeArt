local present, blankline = pcall(require, "indent_blankline")
if not present then
  return
end

require("../user_settings")
local indent_blankline_style = 1
if user_indent_blankline_style then
  if type(user_indent_blankline_style) == "number" then
    indent_blankline_style = user_indent_blankline_style
  elseif type(user_indent_blankline_style) == "string" then
    indent_blankline_style = user_indent_blankline_style
  end
end

local indent_blankline_styles = {
  "▏",
  "¦",
  "┆",
  "│",
  "⎸",
  "|",
}
if type(user_indent_blankline_style) == "number" then
  vim.g.indent_blankline_char = indent_blankline_styles[indent_blankline_style]
  vim.g.indent_blankline_context_char = indent_blankline_styles[indent_blankline_style]
elseif type(user_indent_blankline_style) == "string" then
  vim.g.indent_blankline_char = user_indent_blankline_style
  vim.g.indent_blankline_context_char = user_indent_blankline_style
elseif type(user_indent_blankline_style) == "nil" then
  vim.g.indent_blankline_char = indent_blankline_styles[indent_blankline_style]
  vim.g.indent_blankline_context_char = indent_blankline_styles[indent_blankline_style]
end

local blankline_config = {
  show_trailing_blankline_indent = false,
  indent_blankline_use_treesitter = true,
  show_first_indent_level = true,
  show_current_context = true,
  buftype_exclude = { "terminal", "nofile", "help" },
  filetype_exclude = {
    "help",
    "toggleterm",
    "alpha",
    "packer",
    "lsp-installer",
    "lspinfo",
    "vista_kind",
    "terminal",
    "TelescopePrompt",
    "TelescopeResults",
  },
}

local config = require("user_settings")
if config.indent_blankline then
  for k, v in pairs(config.indent_blankline) do
    blankline_config[k] = v
  end
end

-- Disable indent-blankline on these pages.
blankline.setup(blankline_config)
