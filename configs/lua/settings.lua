-- Defining aliases.
local cmd = vim.cmd
local opt = vim.opt

-- Enabling syntax highlighting.
cmd('syntax on')

-- Number settings.
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true

-- True collor support.
opt.termguicolors = true

-- Enable clipboard.
opt.clipboard = 'unnamedplus'

-- Enable mouse in all modes.
opt.mouse = 'a'

-- Enable cursor line.
opt.cursorline = true

-- Setting colorcolumn. This is set becuse of
-- this (https://github.com/lukas-reineke/indent-blankline.nvim/issues/59)
-- indent-blankline bug.
cmd('set colorcolumn=99999')

-- With set hidden you’re telling Neovim that you can
-- have unsaved worked that’s not displayed on your screen.
opt.hidden = true

-- Set indentation stuf.
cmd('filetype plugin indent on')
opt.smarttab = true
opt.smartindent = true

-- Set indentation for some languages manually.
vim.cmd('autocmd Filetype javascript,python,cpp,c setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4')
vim.cmd('autocmd Filetype lua,html,css setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2')

-- Go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line.
-- opt.whichwrap:append("<>hl")

-- Set searching stuf.
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true

-- Set terminal bidirectual.
-- For writing in right to left languages like arabic, persian and hebrew.
opt.termbidi = true

-- Without this option some times backspace did not work correctly.
opt.backspace = 'indent,eol,start'

-- For opening splits on right or bottom.
opt.splitbelow = true
opt.splitright = true

-- Enabling ruler and statusline.
opt.ruler = true
opt.laststatus = 2

-- Setting time that Neovim wait after each keystroke.
opt.ttimeoutlen = 20
opt.timeoutlen = 1000

-- Setting up autocomplete menu.
opt.completeopt = "menuone,noselect"

-- Set line number for help files.
cmd
[[
  augroup help_config
    autocmd!
    autocmd FileType help :set number
  augroup END
]]
