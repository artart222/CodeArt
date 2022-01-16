-- Function for make mapping easier.
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- Map leader key to space.
vim.g.mapleader = " "


-- Set cl for clearing highlights after searching word in file.
map("n", "cl", ":noh<CR>")


-- Split navigations.
map("n", "<A-j>", "<C-w><C-j>")
map("n", "<A-k>", "<C-w><C-k>")
map("n", "<A-l>", "<C-w><C-l>")
map("n", "<A-h>", "<C-w><C-h>")


-- Buffer resizing.
map("n", "<S-h>", ":call ResizeLeft(3)<CR><Esc>")
map("n", "<S-l>", ":call ResizeRight(3)<CR><Esc>")
map("n", "<S-k>", ":call ResizeUp(1)<CR><Esc>")
map("n", "<S-j>", ":call ResizeDown(1)<CR><Esc>")


-- Buffer switching.
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
map("n", "<Tab>", ":BufferLineCycleNext<CR>")


-- Buffer closing.
map("n", "<leader>bc", ":BufferLinePickClose<CR>")


-- Buffer moving.
map("n", "<leader>bl", ":BufferLineMoveNext<CR>")
map("n", "<leader>bh", ":BufferLineMovePrev<CR>")


-- Don't copy the replaced text after pasting.
map("v", "p", "\"_dP")


-- Jk for going to normal mode while you are in insert mode.
map("i", "jk", "<ESC>")

-- With this you can use > < multiple time for changing indent when you visual selected text.
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Packer
map("n", "<leader>pi", ":PackerInstall<CR>")
map("n", "<leader>pu", ":PackerUpdate<CR>")
map("n", "<leader>pr", ":PackerClean<CR>")
map("n", "<leader>ps", ":PackerSync<CR>")
map("n", "<leader>pc", ":PackerCompile<CR>")

-- NvimTree toggle
map("n", "<leader>nt", ":NvimTreeToggle<CR>")


-- Telescope
map("n", "<Leader>fw", ":Telescope live_grep<CR>")
map("n", "<Leader>gt", ":Telescope git_status<CR>")
map("n", "<Leader>cm", ":Telescope git_commits<CR>")
map("n", "<Leader>ff", ":Telescope find_files<CR>")
map("n", "<Leader>fd", ":Telescope find_directories<CR>")
map("n", "<Leader>fp", ":Telescope media_files<CR>")
map("n", "<Leader>fb", ":Telescope buffers<CR>")
map("n", "<Leader>fh", ":Telescope help_tags<CR>")
map("n", "<Leader>fo", ":Telescope oldfiles<CR>")
map("n", "<Leader>th", ":Telescope colorscheme<CR>")


-- Dashboard
map("n", "<Leader>db", ":Dashboard<CR>")
map("n", "<Leader>fn", ":DashboardNewFile<CR>")
map("n", "<Leader>bm", ":DashboardJumpMarks<CR>")
map("n", "<C-s>l", ":SessionLoad<CR>")
map("n", "<C-s>s", ":SessionSave<CR>")


-- Lsp
local lsp_opts = { noremap=true, silent=true }
map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", lsp_opts)
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", lsp_opts)
map("n", "<leader>k", ":lua vim.lsp.buf.hover()<CR>", lsp_opts)
map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", lsp_opts)
map("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", lsp_opts)
map("n", "<leader>wa", ":lua vim.lsp.buf.add_workspace_folder()<CR>", lsp_opts)
map("n", "<leader>wr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>", lsp_opts)
map("n", "<leader>wl", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", lsp_opts)
map("n", "<leader>D", ":lua vim.lsp.buf.type_definition()<CR>", lsp_opts)
map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", lsp_opts)
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", lsp_opts)
map("n", "gr", ":lua vim.lsp.buf.references()<CR>", lsp_opts)
map("n", "<leader>e", ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", lsp_opts)
map("n", "[d", ":lua vim.lsp.diagnostic.goto_prev()<CR>", lsp_opts)
map("n", "]d", ":lua vim.lsp.diagnostic.goto_next()<CR>", lsp_opts)
map("n", "<leader>q", ":lua vim.lsp.diagnostic.set_loclist()<CR>", lsp_opts)


-- Dap
map("n", "<F5>", ":lua require(\"dap\").continue()<CR>")
map("n", "<leader>te", ":lua require(\"dap\").terminate()<CR>")
map("n", "<leader>br", ":lua require(\"dap\").toggle_breakpoint()<CR>")
map("n", "<leader>Br", ":lua require(\"dap\").set_breakpoint(vim.fn.input(\"Breakpoint condition: \"))<CR>")
map("n", "<leader>lp", ":lua require(\"dap\").set_breakpoint(nil, nil, vim.fn.input(\"Log point message: \"))<CR>")
map("n", "<F10>", ":lua require(\"dap\").step_over()<CR>")
map("n", "<F11>", ":lua require(\"dap\").step_into()<CR>")
map("n", "<F12>", ":lua require(\"dap\").step_out()<CR>")
map("n", "<leader>sb", ":lua require(\"dap\").step_back()<CR>")
map("n", "<leader>rc", ":lua require(\"dap\").run_to_cursor()<CR>")
map("n", "<leader>ro", ":lua require(\"dap\").repl.open()<CR>")
map("n", "<leader>dt", ":lua require(\"dapui\").toggle()<CR>")
map("n", "<leader>dl", ":lua require(\"dap\").run_last()<CR>")


-- ToggleTerm
function _G.set_terminal_keymaps()
  map("t", "<esc>", "<C-\\><C-n>")
  map("t", "<A-h>", "<c-\\><c-n><c-w>h")
  map("t", "<A-j>", "<c-\\><c-n><c-w>j")
  map("t", "<A-k>", "<c-\\><c-n><c-w>k")
  map("t", "<A-l>", "<c-\\><c-n><c-w>l")

  map("t", "<S-h>", "<c-\\><C-n>:call ResizeLeft(3)<CR>")
  map("t", "<S-j>", "<c-\\><C-n>:call ResizeDown(1)<CR>")
  map("t", "<S-k>", "<c-\\><C-n>:call ResizeUp(1)<CR>")
  map("t", "<S-l>", "<c-\\><C-n>:call ResizeRight(3)<CR>")
end
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")


-- Remove unnecessary white spaces.
map("n", "<leader>cw", ":StripWhitespace<CR>")


-- TrueZen focus mode.
map("n", "<leader>fs", ":TZFocus<CR>")


-- comment
map("n", "ct", ":CommentToggle<CR>")
map("v", "ct", ":'<,'>CommentToggle<CR>")


-- Code formatter.
map("n", "<leader>fr", ":Neoformat<CR>", lsp_opts)
