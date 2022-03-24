local present, lualine = pcall(require, "lualine")
if not present then
  return
end

require("../user_settings")
local lualine_style = 1
if user_lualine_style then
  if type(user_lualine_style) == "number" then
    lualine_style = user_lualine_style
  elseif type(user_lualine_style) == "table" then
    lualine_style = { user_lualine_style[1], user_lualine_style[2] }
  end
end

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

local section_char, component_char
if user_lualine_style then
  if type(user_lualine_style) == "number" then
    section_char = lualine_styles[lualine_style][1]
    component_char = lualine_styles[lualine_style][2]
  elseif type(user_lualine_style) == "table" then
    section_char = user_lualine_style[1]
    component_char = user_lualine_style[2]
  end
end

lualine.setup({
  options = {
    globalstatus = true,
    theme = "auto",
    disabled_filetypes = {
      "NvimTree",
      "TelescopePrompt",
      "TelescopeResults",
      "vista_kind",
      "dashboard",
      "dapui_scopes",
      "dapui_breakpoints",
      "dapui_stacks",
      "dapui_watches",
      "dap-repl",
    },

    section_separators = section_char,
    component_separators = component_char,
  },
  extensions = { "fugitive" },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      { "branch" },
      {
        "diff",
        symbols = { added = "  ", modified = "柳", removed = " " }, -- changes diff symbols
      },
      { "diagnostics" },
    },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})
