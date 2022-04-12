-- Defining alias for vim.opt.
local opt = vim.opt
local exec = vim.api.nvim_exec

local is_plugin_installed = require("utils").is_plugin_installed
local autocmd = vim.api.nvim_create_autocmd

-- Using new filetype detection in lua.
vim.g.do_filetype_lua = 1

-- Decrease time of completion menu.
opt.updatetime = 300
vim.g.cursorhold_updatetime = 100

-- Set file encoding to utf-8
opt.fileencoding = "utf-8"

-- Number settings.
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true

-- Set signcolumn width to 2
vim.opt.signcolumn = "yes:3"

-- Remove showing mode.
opt.showmode = false

-- True collor support.
opt.termguicolors = true

-- Enable clipboard.
opt.clipboard = "unnamedplus"

-- Enable mouse in all modes.
opt.mouse = "a"

-- Enable cursor line.
opt.cursorline = true

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
opt.pumheight = 20 -- pop up menu height

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

-- Enabling ruler and statusline.
opt.ruler = true

-- Setting time that Neovim wait after each keystroke.
opt.timeoutlen = 200

-- Setting up autocomplete menu.
opt.completeopt = { "menuone", "noselect" }

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99

-- Set line number for help files.
local help_config = vim.api.nvim_create_augroup("help_config", { clear = true })
autocmd("FileType", {
  pattern = "help",
  callback = function()
    opt.number = true
  end,
  group = help_config,
})

-- Trim Whitespace
autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    exec(
      [[
            function! NoWhitespace()
                let l:save = winsaveview()
                keeppatterns %s/\s\+$//e
                call winrestview(l:save)
            endfunction
            call NoWhitespace()
            ]],
      true
    )
  end,
})

-- Auto open nvim-tree when writing (nvim .) in command line
-- and auto open Alpha when nothing given as argument.
if vim.fn.index(vim.fn.argv(), ".") >= 0 then
  autocmd("VimEnter", {
    pattern = "*",
    callback = function()
      if is_plugin_installed("nvim-tree.lua") == true then
        vim.cmd("NvimTreeOpen")
      end
    end,
  })
  vim.cmd("bd1")
elseif vim.fn.len(vim.fn.argv()) == 0 then
  autocmd("VimEnter", {
    pattern = "*",
    callback = function()
      if is_plugin_installed("alpha-nvim") == true then
        vim.cmd("Alpha")
        vim.cmd("bd 1")
      end
    end,
  })
end

if require("utils").os == "Windows_NT" then
  vim.api.nvim_create_user_command(
    "CodeArtUpdate",
    '!powershell.exe -executionpolicy bypass -file "$HOME\\AppData\\Local\\nvim\\CodeArtUpdate.ps1',
    { nargs = 0 }
  )
else
  -- vim.api.nvim_create_user_command("CodeArtUpdate", "!bash ~/.config/nvim/CodeArtUpdate.sh", { nargs = 0 })
  vim.api.nvim_create_user_command("CodeArtUpdate", function()
    require("utils").update()
  end, { nargs = 0 })
end

-- NOTE: Your shell must be powershell in bellow code block because of :CodeArtUpdate command
vim.cmd([[
if has("win32")
  set shell=powershell " Your shell must be powershell
  let &shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  let &shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  let &shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  set shellquote= shellxquote=
endif
]])

vim.api.nvim_create_user_command("CodeArtTransparent", "lua make_codeart_transparent()", { nargs = 0 })

-- Add cursorline and diasable it in some buffers and filetypes.
statusline_hide = {
  "alpha",
  "TelescopePrompt",
  "TelescopeResults",
  "packer",
  "lspinfo",
  "lsp-installer",
}

function hide_statusline(types)
  for _, type in pairs(types) do
    if vim.bo.filetype == type or vim.bo.buftype == type then
      opt.laststatus = 0
      opt.ruler = false
      opt.cursorline = false
      break
    else
      opt.laststatus = 3
      opt.ruler = true
      opt.cursorline = true
    end
  end
end

autocmd({ "BufEnter", "BufRead", "BufWinEnter", "FileType", "WinEnter" }, {
  pattern = "*",
  callback = function()
    hide_statusline(statusline_hide)
    if vim.bo.filetype == "toggleterm" then
      opt.signcolumn = "no"
      opt.cursorline = false
    end
  end,
})
