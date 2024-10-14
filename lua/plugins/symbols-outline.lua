local present, symbols_outline = pcall(require, "symbols-outline")
if not present then
  return
end

local symbols_outline_config = {
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = true,
  position = "right",
  relative_width = true,
  width = 16,
  auto_close = false,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  preview_bg_highlight = "Pmenu",
  autofold_depth = nil,
  auto_unfold_hover = true,
  fold_markers = { "", "" },
  wrap = false,
  keymaps = {
    -- These keymaps can be a string or a table for multiple keys
    close = { "<Esc>", "q" },
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = "h",
    unfold = "l",
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",
  },
  lsp_blacklist = {},
  symbol_blacklist = {},
  -- TODO: Make a file to sete icons universally.
  symbols = {
    File = { icon = "", hl = "@text.uri" },
    Module = { icon = "", hl = "@namespace" },
    Namespace = { icon = "", hl = "@namespace" },
    Package = { icon = "", hl = "@namespace" },
    Class = { icon = "", hl = "@type" },
    Method = { icon = "", hl = "@method" },
    Property = { icon = "", hl = "@method" },
    Field = { icon = "", hl = "@field" },
    Constructor = { icon = "", hl = "@constructor" },
    Enum = { icon = "", hl = "@type" },
    Interface = { icon = "", hl = "@type" },
    Function = { icon = "", hl = "@function" },
    Variable = { icon = "", hl = "@constant" },
    Constant = { icon = "", hl = "@constant" },
    String = { icon = "", hl = "@string" },
    Number = { icon = "", hl = "@number" },
    Boolean = { icon = "", hl = "@boolean" },
    Array = { icon = "", hl = "@constant" },
    Object = { icon = "", hl = "@type" },
    Key = { icon = "", hl = "@type" },
    Null = { icon = "󰟢", hl = "@type" },
    EnumMember = { icon = "", hl = "@field" },
    Struct = { icon = "", hl = "@type" },
    Event = { icon = "", hl = "@type" },
    Operator = { icon = "", hl = "@operator" },
    TypeParameter = { icon = "", hl = "@parameter" },
    Component = { icon = "󰅴", hl = "@function" },
    Fragment = { icon = "󰅴", hl = "@constant" },
  },
}

-- TODO: make better user settings file.
local config = require("user_settings")
if config.symbols_outline then
  for k, v in pairs(config.symbols_outline) do
    symbols_outline_config[k] = v
  end
end

symbols_outline.setup(symbols_outline_config)
