local wk = require("which-key")

-- Function for make mapping easier.
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- Map leader key to space.
vim.g.mapleader = " "


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


-- Save and load session/Dashboard.
map("n", "<Leader>db", ":Dashboard<CR>")
map("n", "<C-s>l", ":SessionLoad<CR>")
map("n", "<C-s>s", ":SessionSave<CR>")


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


-- comment
vim.g.kommentary_create_default_mappings = false
vim.api.nvim_set_keymap("n", "<leader>ct", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<leader>ct", "<Plug>kommentary_visual_default", {})

-- Don't copy the replaced text after pasting.
map("v", "p", "\"_dP")


-- Jk for going to normal mode while you are in insert mode.
map("i", "jk", "<ESC>")


-- With this you can use > < multiple time for changing indent when you visual selected text.
map("v", "<", "<gv")
map("v", ">", ">gv")


-- Buffer
wk.register({
  b = {
    name = "Buffer",
    c = { ":BufferLinePickClose<CR>", "Close Buffer" },
    e = { ":noh<CR>", "Erase Search Highlights" },
    l = { ":BufferLineMoveNext<CR>", "Move Buffer Right" },
    h = { ":BufferLineMovePrev<CR>", "Move buffer Left" },
    n = { ":DashboardNewFile<CR>", "New Buffer"},
    r = { ":Neoformat<CR>", "Format Buffer" },
    m = { ":TZFocus<CR>", "Maximize Current Buffer" },
  }
}, { prefix = "<leader>" })


-- Packer
wk.register({
  p = {
    name = "Packer",
    i = { ":PackerInstall<CR>", "Install CodeArt packages" },
    u = { ":PackerUpdate<CR>", "Update CodeArt packages" },
    r = { ":PackerClean<CR>", "Uninstall unnecessary CodeArt packages" },
    s = { ":PackerSync<CR>", "Sync CodeArt packages" },
    c = { ":PackerClean<CR>", "Compile CodeArt packages" },
  }
}, { prefix = "<leader>" })


-- NvimTree
wk.register({
  n = {
    name = "NvimTree",
    t = { ":NvimTreeToggle<CR>", "Toggle NvimTree" },
    f = { ":NvimTreeFocus<CR>", "Focus on NvimTree" },
  }
}, { prefix = "<leader>" })


-- Finding different stuf.
wk.register({
  f = {
    name = "Find",
    w = { ":Telescope live_grep<CR>", "Word" },
    f = { ":Telescope find_files<CR>", "File" },
    o = { ":Telescope oldfiles<CR>", "Old File" },
    d = { ":Telescope find_directories<CR>", "Directory" },
    b = { ":Telescope buffers<CR>", "Buffer" },
    h = { ":Telescope help_tags<CR>", "Help File" },
    B = { ":DashboardJumpMarks<CR>", "Find BookMark" },
  }
}, { prefix = "<leader>" })


-- Git keybinds.
wk.register({
  g = {
    name = "Git",
    s = { ":Telescope git_status<CR>", "Status + Git Diff" },
    c = { ":Telescope git_commits<CR>", "Commit History" },
    C = { ":Telescope git_bcommits<CR>", "Buffer Commit History" },
    b = { ":Telescope git_branches<CR>", "Branches history" },
    k = { ":Gitsigns prev_hunk<CR>", "Next Hunk" },
    j = { ":Gitsigns next_hunk<CR>", "Prev Hunk" },
    p = { ":Gitsigns preview_hunk<CR>", "Preview Hunk" },
    r = { ":Gitsigns reset_hunk<CR>", "Reset Hunk" },
    R = { ":Gitsigns reset_buffer<CR>", "Reset Buffer" },
    d = { ":Gitsigns diffthis<CR>", "Git Diff" },
    l = { ":Gitsigns blame_line<CR>", "Blame For Current Line"},
    S = { ":Gitsigns stage_hunk<CR>", "Stage Hunk"},
    u = { ":Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk"},
    },
}, { prefix = "<leader>" })


-- ColorScheme keybindings.
wk.register({
  t = {
    name = "Theme",
    h = { ":Telescope colorscheme<CR>", "Find Colorscheme" },
    p = { ":Telescope colorscheme enable_preview=true<CR>", "Find Colorscheme with previwer " },
  }
}, { prefix = "<leader>" })


-- Lsp
wk.register({
  l = {
    name = "LSP",
    a = { ":lua vim.lsp.buf.code_action()<CR>", "Code Action" },
    d = { ":Telescope diagnostics<CR>", "Diagnostics" },
    i = { ":LspInfo<CR>", "Info" },
    I = { ":LspInstallInfo<CR>", "Installer Info" },
    r = { ":lua vim.lsp.buf.rename()<CR>", "Rename" },
    h = { ":lua vim.lsp.buf.hover()<CR>", "Display Information Of Symbol" },
    s = { ":lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    g = {
      name = "GOTO",
      D = { ":lua vim.lsp.buf.declaration()<CR>", "Go To Declaration" },
      i = { ":lua vim.lsp.buf.implementation()<CR>", "Go To Implementation" },
      d = { "::lua vim.lsp.buf.definition()<CR>", "Go to Definition" },
      j = { ":lua vim.lsp.diagnostic.goto_prev()<CR>", "Go To Previous Diagnostics" },
      k = { ":lua vim.lsp.diagnostic.goto_next()<CR>", "Go To Next Diagnostics" },
      t = { ":lua vim.lsp.buf.type_definition()<CR>", "Go To Type Definition" },
    },
    w = {
      name = "Workspace",
      l = { ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List Workspace Folder" },
      a = { ":lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Workspace Folder" },
      r = { ":lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Workspace Folder" },
    },
    l = {
      name = "List Reference/Diagnostic",
      d = { ":lua vim.lsp.diagnostic.set_loclist()<CR>", "List Diagnostic" },
      r = { ":lua vim.lsp.buf.references()<CR>", "Show References" },
    },
  }
}, { prefix = "<leader>" })


-- Dap
wk.register({
  d = {
    name = "Debugging",
    c = { ":lua require(\"dap\").continue()<CR>", "Continue" },
    t = { ":lua require(\"dap\").terminate()<CR>", "Terminate" },
    l = { ":lua require(\"dap\").run_last()<CR>", "Run Last Debugging Config" },
    d = { ":lua require(\"dap\").repl.open()<CR>", "Open Debug Console" },
    b = {
      name = "Breakpoint",
      t = { ":lua require(\"dap\").toggle_breakpoint()<CR>", "Toggle" },
      c = { ":lua require(\"dap\").set_breakpoint(vim.fn.input(\"Breakpoint condition: \"))<CR>", "Set conditional" },
      l = { ":lua require(\"dap\").set_breakpoint(nil, nil, vim.fn.input(\"Log point message: \"))<CR>", "With Log Point Message" },
    },
    s = {
      name = "Step",
      o = { ":lua require(\"dap\").step_over()<CR>", "Step Over" },
      O = { ":lua require(\"dap\").step_into()<CR>", "Step Into" },
      i = { ":lua require(\"dap\").step_out()<CR>", "Step Out" },
      b = { ":lua require(\"dap\").step_back()<CR>", "Step Back" },
      c = { ":lua require(\"dap\").run_to_cursor()<CR>", "Run To Cursor" },
    },
    u = { ":lua require(\"dapui\").toggle()<CR>", "Toggle UI" },
  }
}, { prefix = "<leader>" })
