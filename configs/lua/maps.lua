local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '


map('n', 'cl', '<cmd>noh<CR>')

-- Split navigations.
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')
map('n', '<C-l>', '<C-w><C-l>')
map('n', '<C-h>', '<C-w><C-h>')

-- Buffer resizing.
map('n', '<S-h>', '<cmd>vertical resize +5<CR>')
map('n', '<S-l>', '<cmd>vertical resize -5<CR>')
map('n', '<S-k>', '<cmd>resize -5<CR>')
map('n', '<S-j>', '<cmd>resize +5<CR>')

-- NvimTree toggle
map('n', 'nt', '<cmd>NvimTreeToggle<CR>')

-- Telescop.
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>')
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").live_grep()<CR>')
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>')
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>')

-- Lsp
map('n', '<space>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<space>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<space>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

map('n', '<silent><expr> <C-Space>', '<cmd>compe#confirm("<CR>")')
map('n', '<silent><expr> <C-f>', '<cmd>compe#scroll({ "delta": +4})')
map('n', '<silent><expr> <C-d>', '<cmd>compe#scroll({ "delta": -4})')
--inoremap  compe#complete()
--inoremap <silent><expr> <CR>      
--inoremap <silent><expr> <C-e>     compe#close('<C-e>')
--inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
--inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
--let g:dashboard_default_executive='telescope'
--nmap <Leader>ss :<C-u>SessionSave<CR>
--nmap <Leader>sl :<C-u>SessionLoad<CR>
--nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
--nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
--nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
--nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
--nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
--nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
