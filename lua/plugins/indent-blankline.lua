local present, blankline = pcall(require, "ibl")
if not present then
  return
end

local indent_blankline_styles = {
  "▏",
  "¦",
  "┆",
  "│",
  "⎸",
  "|",
}
local config = require("user_settings").config
if config.user_indent_blankline_style then
  if type(config.user_indent_blankline_style) == "number" then
    local indent_blankline_style = config.user_indent_blankline_style
    vim.g.indent_blankline_char = indent_blankline_styles[indent_blankline_style]
    vim.g.indent_blankline_context_char = indent_blankline_styles[indent_blankline_style]
  elseif type(config.user_indent_blankline_style) == "string" then
    local indent_blankline_style = config.user_indent_blankline_style
    vim.g.indent_blankline_char = indent_blankline_style
    vim.g.indent_blankline_context_char = indent_blankline_style
  end
else
  vim.g.indent_blankline_char = indent_blankline_styles[1]
  vim.g.indent_blankline_context_char = indent_blankline_styles[1]
end

local blankline_config = {
  -- show_trailing_blankline_indent = false,
  -- indent_blankline_use_treesitter = true,
  -- show_first_indent_level = true, --TODO: complete this config.
  -- show_current_context = true,
  indent = { char = vim.g.indent_blankline_char },
  whitespace = { remove_blankline_trail = true },
  scope = { show_start = false, show_end = false, char = vim.g.indent_blankline_char },
  exclude = {
    buftypes = { "terminal", "nofile", "help" },
    filetypes = {
      "help",
      "toggleterm",
      "alpha",
      "dashboard",
      "packer",
      "lsp-installer",
      "lspinfo",
      "vista_kind",
      "terminal",
      "TelescopePrompt",
      "TelescopeResults",
    },
  },
}

if config.indent_blankline then
  for k, v in pairs(config.indent_blankline) do
    blankline_config[k] = v
  end
end

-- Disable indent-blankline on these pages.
blankline.setup(blankline_config)
