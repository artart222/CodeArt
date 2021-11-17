local present, lualine = pcall(require, "lualine")
if not present then
  return
end

require("../user_settings")
local lualine_style = 1
if user_lualine_style then
    lualine_style = user_lualine_style
end

local lualine_styles = {
    {
      { left = " ", right = " " },
      { left = "│", right = "│" },
    },
    {
      { left = ' ', right = ''},
      { left = ' ', right = ' '},
    },
    {
      { left = '', right = ''},
      { left = ' ', right = ' '},
    },
    {
      { left = "", right = "" },
      { left = '', right = '' }
    },
    {
      { left = "", right = ""},
      { left = ' ', right = ' '}
    }
}

lualine.setup {
  options = {
    theme = "auto",
    disabled_filetypes = {
      "toggleterm",
      "NvimTree",
      "vista_kind",
      "dapui_scopes",
      "dapui_breakpoints",
      "dapui_stacks",
      "dapui_watches",
      "dap-repl"
    },

    section_separators = lualine_styles[lualine_style][1],
    component_separators = lualine_styles[lualine_style][2]
  },
  extensions = { "fugitive" },
}
