-- Function for make mapping easier.
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- Map leader key to space.
vim.g.mapleader = ' '


-- Set cl for clearing highlights after searching word in file.
map('n', 'cl', ':noh<CR>')


-- Split navigations.
map('n', '<A-j>', '<C-w><C-j>')
map('n', '<A-k>', '<C-w><C-k>')
map('n', '<A-l>', '<C-w><C-l>')
map('n', '<A-h>', '<C-w><C-h>')


-- Buffer resizing.
map('n', '<S-h>', ':call ResizeLeft(3)<CR><Esc>')
map('n', '<S-l>', ':call ResizeRight(3)<CR><Esc>')
map('n', '<S-k>', ':call ResizeUp(1)<CR><Esc>')
map('n', '<S-j>', ':call ResizeDown(1)<CR><Esc>')


-- Buffer switching.
map('n', '<A-[>', ':BufferLineCyclePrev<CR>')
map('n', '<A-]>', ':BufferLineCycleNext<CR>')

-- Buffer closing.
map('n', '<leader>bc', ':BufferLinePickClose<CR>')

-- Buffer moving.
map('n', '<leader>bl', ':BufferLineMoveNext<CR>')
map('n', '<leader>bh', '::BufferLineMovePrev<CR>')


-- NvimTree toggle
map('n', 'nt', ':NvimTreeToggle<CR>')


-- Telescop.
map("n", "<Leader>fw", ":Telescope live_grep<CR>")
map("n", "<Leader>gt", ":Telescope git_status<CR>")
map("n", "<Leader>cm", ":Telescope git_commits<CR>")
map("n", "<Leader>ff", ":Telescope find_files<CR>")
map("n", "<Leader>fp", ":lua require('telescope').extensions.media_files.media_files()<CR>")
map("n", "<Leader>fb", ":Telescope buffers<CR>")
map("n", "<Leader>fh", ":Telescope help_tags<CR>")
map("n", "<Leader>fo", ":Telescope oldfiles<CR>")
map("n", "<Leader>th", ":Telescope themes<CR>")


-- Dashboard
map("n", "<Leader>db", ":Dashboard<CR>")
map("n", "<Leader>fn", ":DashboardNewFile<CR>")
map("n", "<Leader>bm", ":DashboardJumpMarks<CR>")
map("n", "<C-s>l", ":SessionLoad<CR>")
map("n", "<C-s>s", ":SessionSave<CR>")


-- Lsp
map('n', '<space>,', ':lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<space>;', ':lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<space>a', ':lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>')
map('n', '<space>f', ':lua vim.lsp.buf.formatting()<CR>')
map('n', '<space>h', ':lua vim.lsp.buf.hover()<CR>')
map('n', '<space>m', ':lua vim.lsp.buf.rename()<CR>')
map('n', '<space>r', ':lua vim.lsp.buf.references()<CR>')
map('n', '<space>s', ':lua vim.lsp.buf.document_symbol()<CR>')


-- ToggleTerm
map('n', '<C-t>', ':ToggleTerm<CR>')
map('t', '<C-t>', ':ToggleTerm<CR>')
map('n', 'v:count1 <C-t>', ':v:count1' .. '"ToggleTerm"<CR>')
map('v', 'v:count1 <C-t>', ':v:count1' .. '"ToggleTerm"<CR>')
function _G.set_terminal_keymaps()
  map('t', '<esc>', '<C-\\><C-n>')
  map('t', 'jk', '<C-\\><C-n>')
  map('t', '<A-h>', '<c-\\><c-n><c-w>h')
  map('t', '<A-j>', '<c-\\><c-n><c-w>j')
  map('t', '<A-k>', '<c-\\><c-n><c-w>k')
  map('t', '<A-l>', '<c-\\><c-n><c-w>l')

  map('t', '<S-h>', '<c-\\><C-n>:call ResizeLeft(3)<CR>')
  map('t', '<S-j>', '<c-\\><C-n>:call ResizeDown(1)<CR>')
  map('t', '<S-k>', '<c-\\><C-n>:call ResizeUp(1)<CR>')
  map('t', '<S-l>', '<c-\\><C-n>:call ResizeRight(3)<CR>')
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


-- Remove unnecessary white spaces.
map('n', '<leader>cw', ':StripWhitespace<CR>')


-- TrueZen focus mode.
map('n', '<leader>fs', ':TZFocus<CR>')


-- Toggle fold.
map('n', '<leader>ft', 'za')


-- comment
map("n", "ct", ":CommentToggle<CR>")
map("v", "ct", ":'<,'>CommentToggle<CR>")
