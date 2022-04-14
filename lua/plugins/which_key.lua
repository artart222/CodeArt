local present, which_key = pcall(require, "which-key")
if not present then
  return
end

local user_settings = require("../user_settings")

-- This function is for using Nvimtree as fullscreen explorer
function nt_explorer()
  local view = require("nvim-tree.view")
  if view.is_visible() then
    vim.cmd("NvimTreeClose")
    vim.cmd("e .")
  else
    vim.cmd("e .")
    vim.cmd("NvimTreeOpen")
  end
end

which_key.setup({
  plugins = {
    marks = false,
    registers = false,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      nav = true,
      z = false,
      g = false,
      windows = false, -- default bindings on <c-w>
    },
  },
  key_labels = {
    ["<space>"] = "SPC",
    ["<leader>"] = "SPC",
    ["<cr>"] = "ENT",
    ["<tab>"] = "TAB",
    ["<a>"] = "ALT",
    ["<s>"] = "SHI",
    ["<c>"] = "CTR",
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  ignore_missing = false,
})

-- Packer
which_key.register({
  p = {
    name = "Packer",
    i = { ":PackerInstall<CR>", "Install CodeArt packages" },
    u = { ":PackerUpdate<CR>", "Update CodeArt packages" },
    r = { ":PackerClean<CR>", "Uninstall unnecessary CodeArt packages" },
    s = { ":PackerSync<CR>", "Sync CodeArt packages" },
    c = { ":PackerCompile<CR>", "Compile CodeArt packages" },
  },
}, { prefix = "<leader>" })

which_key.register({
  b = {
    name = "Buffer",
    c = { ":BufferLinePickClose<CR>", "Close Buffer" },
    C = { ":bdelete! <CR>", "Close Current Buffer" },
    e = { ":noh<CR>", "Erase Search Highlights" },
    l = { ":BufferLineMoveNext<CR>", "Move Buffer Right" },
    h = { ":BufferLineMovePrev<CR>", "Move buffer Left" },
    n = { ":ene <BAR> startinsert<CR>", "New Buffer" },
    m = { ":TZFocus<CR>", "Maximize Current Buffer" },
  },
}, { prefix = "<leader>" })

which_key.register({
  ["r"] = { ":lua vim.lsp.buf.formatting_sync()<CR>", "Format" },
}, { prefix = "<leader>" })

-- NvimTree
if require("utils").is_plugin_installed("nvim-tree.lua") then
  which_key.register({
    n = {
      name = "NvimTree",
      t = { ":NvimTreeToggle<CR>", "Toggle NvimTree" },
      f = { ":NvimTreeFocus<CR>", "Focus on NvimTree" },
      e = { ":lua nt_explorer()<CR>", "Fullscreen Explorer" },
    },
  }, { prefix = "<leader>" })
end

-- Finding different stuf.
which_key.register({
  f = {
    name = "Find",
    w = { ":Telescope live_grep<CR>", "Word" },
    f = { ":Telescope find_files<CR>", "File" },
    o = { ":Telescope oldfiles<CR>", "Old File" },
    d = { ":Telescope find_directories<CR>", "Directory" },
    b = { ":Telescope buffers<CR>", "Buffer" },
    h = { ":Telescope help_tags<CR>", "Help File" },
    B = { ":Telescope marks<CR>", "Find BookMark" },
  },
}, { prefix = "<leader>" })

-- Git keybinds.
which_key.register({
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
    l = { ":Gitsigns blame_line<CR>", "Blame For Current Line" },
    S = { ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
    u = { ":Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk" },
  },
}, { prefix = "<leader>" })

-- ColorScheme keybindings.
which_key.register({
  c = {
    name = "Colorscheme",
    f = { ":Telescope colorscheme<CR>", "Find Colorscheme" },
    p = { ":Telescope colorscheme enable_preview=true<CR>", "Find Colorscheme with previwer " },
    o = { ':lua require("onedark").toggle()<CR>', "Toggle Onedark Style" },
  },
}, { prefix = "<leader>" })

-- Terminal.
which_key.register({
  t = {
    name = "Terminal",
    n = { ":lua _NODE_TOGGLE()<CR>", "Node" },
    N = { ":lua _NCDU_TOGGLE()<CR>", "Ncdu" },
    H = { ":lua _HTOP_TOGGLE()<CR>", "Htop" },
    p = { ":lua _PYTHON_TOGGLE()<CR>", "Python" },
    r = { ":lua _RANGER_TOGGLE()<CR>", "Ranger" },
    l = { ":lua _LAZYGIT_TOGGLE()<CR>", "LazyGit" },
    f = { ":ToggleTerm direction=float<CR>", "Float" },
    h = { ":ToggleTerm direction=horizontal<CR>", "Horizontal" },
    v = { ":ToggleTerm direction=vertical<CR>", "Vertical" },
  },
}, { prefix = "<leader>" })

-- Lsp
which_key.register({
  l = {
    name = "LSP",
    a = { ":Lspsaga range_code_action<cr>", "Code Action" },
    d = { ":Lspsaga show_line_diagnostics<CR>", "Show Current Line Diagnostics" },
    i = { ":LspInfo<CR>", "Info" },
    I = { ":LspInstallInfo<CR>", "Installer Info" },
    r = { ":Lspsaga rename<CR>", "Rename" },
    h = { ":Lspsaga hover_doc<CR>", "Display Information Of Symbol" },
    s = { ":lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    g = {
      name = "GOTO",
      D = { ":lua vim.lsp.buf.declaration()<CR>", "Go To Declaration" },
      i = { ":lua vim.lsp.buf.implementation()<CR>", "Go To Implementation" },
      d = { "::lua vim.lsp.buf.definition()<CR>", "Go to Definition" },
      j = { ":Lspsaga diagnostic_jump_next<CR>", "Go To Previous Diagnostics" },
      k = { ":Lspsaga diagnostic_jump_prev<CR>", "Go To Next Diagnostics" },
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
      D = { ":Telescope diagnostics<CR>", "Show Diagnostics list via Telescope" },
      r = { ":lua vim.lsp.buf.references()<CR>", "Show References" },
    },
  },
}, { prefix = "<leader>" })

-- Dap
which_key.register({
  d = {
    name = "Debugging",
    c = { ':lua require("dap").continue()<CR>', "Continue" },
    t = { ':lua require("dap").terminate()<CR>', "Terminate" },
    l = { ':lua require("dap").run_last()<CR>', "Run Last Debugging Config" },
    d = { ':lua require("dap").repl.open()<CR>', "Open Debug Console" },
    b = {
      name = "Breakpoint",
      t = { ':lua require("dap").toggle_breakpoint()<CR>', "Toggle" },
      c = { ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', "Set conditional" },
      l = {
        ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
        "With Log Point Message",
      },
    },
    s = {
      name = "Step",
      o = { ':lua require("dap").step_over()<CR>', "Step Over" },
      O = { ':lua require("dap").step_into()<CR>', "Step Into" },
      i = { ':lua require("dap").step_out()<CR>', "Step Out" },
      b = { ':lua require("dap").step_back()<CR>', "Step Back" },
      c = { ':lua require("dap").run_to_cursor()<CR>', "Run To Cursor" },
    },
    u = { ':lua require("dapui").toggle()<CR>', "Toggle UI" },
  },
}, { prefix = "<leader>" })

-- Comment
which_key.register({
  ["/"] = { "<Plug>kommentary_line_default", "Comment" },
}, { prefix = "<leader>", noremap = false })
which_key.register({
  ["/"] = { "<Plug>kommentary_visual_default", "Comment" },
}, { prefix = "<leader>", noremap = false, mode = "v" })

-- Adding user mappings
if extra_which_keys then
  for _, v in ipairs(extra_which_keys) do
    which_key.register(v[1], v[2])
  end
end
