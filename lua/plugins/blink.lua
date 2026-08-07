local blink_config = {
  keymap = {
    preset = "default",
    ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide", "hide_documentation" },
    ["<CR>"] = { "accept", "fallback" },
    ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
    ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
    ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    ["<C-f>"] = { "scroll_documentation_up", "fallback" },
  },
  appearance = {
    nerd_font_variant = "mono",
    kind_icons = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "",
      Variable = "",
      Class = "",
      Interface = "",
      Module = "",
      Property = "",
      Unit = "",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "",
    },
  },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
    ghost_text = { enabled = true },
    menu = {
      border = "single",
    },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  snippets = { preset = "luasnip" },
  fuzzy = { implementation = "prefer_rust" },
}

local config = require("user_settings").config
if config.blink then
  blink_config = vim.tbl_deep_extend("force", blink_config, config.blink)
end

return blink_config
