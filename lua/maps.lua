-- Function for make mapping easier.
local map = require("utils").map
-- Some functions to check if plugin is installed and disabled.
local disabled_plugins = require("user_settings").disable_plugins
local is_plugin_installed = require("utils").is_plugin_installed

-- Map leader key to space.
vim.g.mapleader = " "

-- Split navigations.
map("n", "<A-j>", "<C-w><C-j>")
map("n", "<A-k>", "<C-w><C-k>")
map("n", "<A-l>", "<C-w><C-l>")
map("n", "<A-h>", "<C-w><C-h>")

-- Buffer resizing.
if is_plugin_installed("vim-resize") and not disabled_plugins.vim_resize then
  map("n", "<S-h>", ":call ResizeLeft(3)<CR><Esc>")
  map("n", "<S-l>", ":call ResizeRight(3)<CR><Esc>")
  map("n", "<S-k>", ":call ResizeUp(1)<CR><Esc>")
  map("n", "<S-j>", ":call ResizeDown(1)<CR><Esc>")
end

-- Buffer switching.
if is_plugin_installed("bufferline.nvim") and not disabled_plugins.nvim_bufferline then
  map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
  map("n", "<Tab>", ":BufferLineCycleNext<CR>")
end

-- Moving lines in visual select mode.
map("v", "K", ":move '<-2<CR>gv-gv")
map("v", "J", ":move '>+1<CR>gv-gv")

-- Terminal mapping for resizing and moving between splits.
map("t", "<esc>", "<C-\\><C-n>")
map("t", "<A-h>", "<c-\\><c-n><c-w>h")
map("t", "<A-j>", "<c-\\><c-n><c-w>j")
map("t", "<A-k>", "<c-\\><c-n><c-w>k")
map("t", "<A-l>", "<c-\\><c-n><c-w>l")
map("t", "<S-h>", "<c-\\><C-n>:call ResizeLeft(3)<CR>")
map("t", "<S-j>", "<c-\\><C-n>:call ResizeDown(1)<CR>")
map("t", "<S-k>", "<c-\\><C-n>:call ResizeUp(1)<CR>")
map("t", "<S-l>", "<c-\\><C-n>:call ResizeRight(3)<CR>")

-- ToggleTerm.
if is_plugin_installed("toggleterm.nvim") and not disabled_plugins.toggleterm then
  map("n", "<C-t>", ":ToggleTerm<CR>")
end

-- Don't copy the replaced text after pasting.
map("v", "p", '"_dP')

-- With this you can use Tab and Shift+Tab multiple time for changing indent when you visual selected text.
-- For visual mode.
map("v", "<TAB>", ">gv", { noremap = true, silent = true })
map("v", "<S-TAB>", "<gv", { noremap = true, silent = true })
-- For visual-block mode.
map("x", "<TAB>", ">gv", { noremap = true, silent = true })
map("x", "<S-TAB>", "<gv", { noremap = true, silent = true })
