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

local function lsp_progress(_)
  local Lsp = vim.lsp.util.get_progress_messages()[1]

  if Lsp then
    local msg = Lsp.message or ""
    local percentage = Lsp.percentage or 0
    local title = Lsp.title or ""

    local spinners = { "", "", "" }
    local success_icon = { "", "", "" }

    local ms = vim.loop.hrtime() / 1000000
    local frame = math.floor(ms / 120) % #spinners

    if percentage >= 70 then
      return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
    end

    return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
  end

  return ""
end

local function treesitter_status(_)
  local b = vim.api.nvim_get_current_buf()
  if type(vim.treesitter.highlighter.active[b]) ~= "nil" then
    if next(vim.treesitter.highlighter.active[b]) then
      return " TS"
    end
    return " TS"
  end
  return " TS"
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
    lualine_c = {

      { "filetype", icon_only = true, padding = { left = 1, right = 0 }, separator = " " },
      { "filename", padding = { left = 0, right = 1 } },
    },
    lualine_x = {
      { treesitter_status, color = { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("DiffChange")), "fg") } },
      "fileformat",
    },
    lualine_y = { lsp_progress, "progress" },
    lualine_z = { "location" },
  },
})
