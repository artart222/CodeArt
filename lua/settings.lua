-- Defining alias for vim.opt and vim.api.nvim_exec.
local opt = vim.opt
local exec = vim.api.nvim_exec

-- Defining alias for some functions.
local is_plugin_installed = require("utils").is_plugin_installed
local disable_plugins = require("user_settings").disable_plugins
local autocmd = vim.api.nvim_create_autocmd

-- Decrease time of completion menu.
opt.updatetime = 300

-- Set cursorhold updatetime(:  .
vim.g.cursorhold_updatetime = 100

-- Set file encoding to utf-8.
opt.fileencoding = "utf-8"

-- Line number settings.
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true

-- Hide ~ from end of lines.
vim.opt.fillchars = { eob = " " }

-- Set signcolumn width to 3.
vim.opt.signcolumn = "yes:3"

-- Remove showing mode.
opt.showmode = false

-- Adding true color to NeoVim.
opt.termguicolors = true

-- Enable clipboard.
opt.clipboard = "unnamedplus"

-- Enable mouse in all modes.
opt.mouse = "a"

-- Setting colorcolumn. This is set because of
-- this (https://github.com/lukas-reineke/indent-blankline.nvim/issues/59)
-- indent-blankline bug.
opt.colorcolumn = "9999"

-- With set hidden you’re telling Neovim that you can
-- have unsaved worked that’s not displayed on your screen.
opt.hidden = true

-- Set indentation stuf.
opt.tabstop = 8
opt.shiftwidth = 4
opt.smartindent = true
opt.smartcase = true
opt.expandtab = true

-- Setting completion menu height.
opt.pumheight = 20 -- pop up menu height.

-- Set searching stuf.
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true

-- Set terminal bidirectual.
-- For writing in right to left languages like arabic, persian and hebrew.
opt.termbidi = true

-- Without this option some times backspace did not work correctly.
opt.backspace = "indent,eol,start"

-- For opening splits on right or bottom.
opt.splitbelow = true
opt.splitright = true

-- Setting time that Neovim wait after each keystroke.
opt.timeoutlen = 200

-- Setting up autocomplete menu.
opt.completeopt = { "menuone", "noselect" }

-- Seting fold settings.
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99

-- Enables the experimental Lua module loader.
vim.loader.enable()

-- Set line number for help files.
autocmd("FileType", {
  pattern = "help",
  callback = function()
    opt.number = true
    opt.relativenumber = false
  end,
})

-- Set or unset line number, relativenumber and cursorline in different buffers.
-- If buffer is terminal start in insertmode.
-- FIX: This doesn't work in ToggleTerm and it works in normal terminals if
-- only you open terminal go to other buffer and again come back to terminal.
-- autocmd("BufEnter", {
--   callback = function()
--     if vim.o.buftype == "terminal" then
--       opt.number = false
--       opt.relativenumber = false
--       opt.cursorline = false
--       vim.cmd("startinsert")
--     else
--       opt.number = true
--       opt.relativenumber = true
--       opt.cursorline = true
--     end
--   end,
-- })

-- Auto open nvim-tree when writing (nvim .) in command line
-- and auto open Alpha when nothing given as argument.
if vim.fn.index(vim.fn.argv(), ".") >= 0 then
  autocmd("VimEnter", {
    pattern = "*",
    callback = function()
      if is_plugin_installed("nvim-tree.lua") and not disable_plugins.nvim_tree then
        require("nvim-tree.api").tree.open()
      end
    end,
  })
  vim.api.nvim_buf_delete(0, {})
elseif vim.fn.len(vim.fn.argv()) == 0 then
  autocmd("VimEnter", {
    pattern = "*",
    callback = function()
      if is_plugin_installed("dashboard-nvim") and not disable_plugins.alpha then
        vim.cmd("Dashboard")
      end
    end,
  })
end

-- Defining CodeArtUpdate commands.
vim.api.nvim_create_user_command("CodeArtUpdate", function()
  require("utils").update()
end, { nargs = 0 })

-- NOTE: Set your shell to powershell because of :CodeArtUpdate command and
-- other problems with cmd in Windows.
if require("utils").os == "Windows_NT" then
  vim.opt.shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell"
  vim.opt.shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
  vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
end

-- Creating CodeArtTransparent command.
vim.api.nvim_create_user_command("CodeArtTransparent", function()
  require("theme").make_codeart_transparent()
end, { nargs = 0 })

-- TODO: check if it's better to move these in another file.
-- TODO: Complete this list.
local statusline_hide = {
  "alpha",
  "TelescopePrompt",
  "TelescopeResults",
  "packer",
  "lspinfo",
  "lsp-installer",
}
local cursorline_hide = {
  "alpha",
  "dashboard",
  "TelescopePrompt",
  "TelescopeResults",
  "packer",
  "lspinfo",
  "lsp-installer",
}
local function toggle_statusline(types)
  for _, type in pairs(types) do
    if vim.o.filetype == type then
      opt.laststatus = 0
      opt.ruler = false
      break
    else
      opt.laststatus = 3
      opt.ruler = true
    end
  end
end

local function toggle_cursorline(types)
  for _, type in pairs(types) do
    if vim.o.filetype == type then
      opt.cursorline = false
      break
    else
      opt.cursorline = true
    end
  end
end

autocmd({ "FileType", "BufEnter" }, {
  callback = function()
    toggle_statusline(statusline_hide)
    toggle_cursorline(cursorline_hide)
  end,
})
