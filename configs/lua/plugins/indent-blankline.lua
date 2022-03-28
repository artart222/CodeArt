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
elseif type(user_indent_blankline_style) == "string" then
  vim.g.indent_blankline_char = user_indent_blankline_style
end

local blankline_config = {
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  show_current_context = true,
  indent_blankline_buftype_exclude = { "terminal" },
  filetype_exclude = {
    "help",
    "terminal",
    "dashboard",
    "packer",
    "lsp-installer",
    "lspinfo",
    "vista_kind",
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

vim.api.nvim_create_autocmd("CursorMoved", {
  pattern = "*",
  callback = function()
    vim.cmd("IndentBlanklineRefresh")
  end,
})
