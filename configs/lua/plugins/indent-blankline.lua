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

-- Disable indent-blankline on these pages.
vim.g.indent_blankline_filetype_exclude = {
  "help",
  "terminal",
  "dashboard",
  "packer",
  "lsp-installer",
  "lspinfo",
  "vista_kind",
}
vim.g.indent_blankline_buftype_exclude = { "terminal" }

vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_show_current_context = true
-- vim.g.indent_blankline_context_char = indent_blankline_styles[indent_blankline_style]

vim.api.nvim_create_autocmd("CursorMoved", {
  pattern = "*",
  callback = function()
    vim.cmd("IndentBlanklineRefresh")
  end,
})
