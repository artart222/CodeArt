local present, which_key = pcall(require, "which-key")
if not present then
  return
end

local is_plugin_installed = require("utils").is_plugin_installed
local disable_plugins = require("user_settings").disable_plugins

local which_key_config = {
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
  win = {
    border = "single", -- none, single, double, shadow
    wo = { winblend = 0 },
  },
}

-- Lazy.nvim: CodeArt Package Manager.
if is_plugin_installed("lazy.nvim") and not disable_plugins.lazy then
  which_key.add({
    { "<leader>p", group = "Plugin Manager" },
    { "<leader>pc", ":Lazy check<CR>", desc = "Check for updates and show the logs" },
    { "<leader>pd", ":Lazy debug<CR>", desc = "Show lazy.nvim debugger" },
    { "<leader>ph", ":Lazy home<CR>", desc = "Show home page of lazy.nvim" },
    { "<leader>pi", ":Lazy install<CR>", desc = "Install CodeArt packages" },
    { "<leader>pl", ":Lazy log<CR>", desc = "Show lazy.nvim logs" },
    { "<leader>pp", ":Lazy profile<CR>", desc = "Show detailed profiling" },
    { "<leader>pr", ":Lazy clean<CR>", desc = "Uninstall unnecessary CodeArt packages" },
    { "<leader>ps", ":Lazy sync<CR>", desc = "Sync CodeArt packages" },
    { "<leader>pu", ":Lazy update<CR>", desc = "Update CodeArt packages" },
  })
end

local buffer_maps = {
  { "<leader>b", group = "Buffer" },
  { "<leader>bC", ":bdelete! <CR>", desc = "Close Current Buffer" },
  { "<leader>be", ":noh<CR>", desc = "Erase Search Highlights" },
  { "<leader>bn", ":ene <BAR> startinsert<CR>", desc = "New Buffer" },
}
if is_plugin_installed("bufferline.nvim") and not disable_plugins.nvim_bufferline then
  table.insert(buffer_maps, { "<leader>bc", ":BufferLinePickClose<CR>", desc = "Close Buffer" })
  table.insert(buffer_maps, { "<leader>bh", ":BufferLineMovePrev<CR>", desc = "Move buffer Left" })
  table.insert(buffer_maps, { "<leader>bl", ":BufferLineMoveNext<CR>", desc = "Move Buffer Right" })
end
if is_plugin_installed("TrueZen.nvim") then
  table.insert(buffer_maps, { "<leader>bm", ":TZFocus<CR>", desc = "Maximize Current Buffer" })
end
which_key.add(buffer_maps)

which_key.add({
  { "<leader>r", ":lua vim.lsp.buf.format({async=true})<CR>", desc = "Format" },
})

-- NvimTree
if is_plugin_installed("nvim-tree.lua") then
  -- This function is for using Nvimtree as fullscreen explorer
  local function nt_explorer()
    local view = require("nvim-tree.view")
    if view.is_visible() then
      vim.cmd("NvimTreeClose")
      vim.cmd("e .")
    else
      vim.cmd("e .")
      vim.cmd("NvimTreeOpen")
    end
  end

  which_key.add({
    { "<leader>n", group = "NvimTree" },
    { "<leader>ne", nt_explorer, desc = "Fullscreen Explorer" },
    { "<leader>nf", ":NvimTreeFocus<CR>", desc = "Focus on NvimTree" },
    { "<leader>nt", ":NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
  })
end

-- Finding different stuf.
if is_plugin_installed("telescope.nvim") then
  which_key.add({
    { "<leader>f", group = "Find" },
    { "<leader>fB", ":Telescope marks<CR>", desc = "Find BookMark" },
    { "<leader>fb", ":Telescope buffers<CR>", desc = "Buffer" },
    { "<leader>fd", ":Telescope find_directories<CR>", desc = "Directory" },
    { "<leader>ff", ":Telescope find_files<CR>", desc = "File" },
    { "<leader>fh", ":Telescope help_tags<CR>", desc = "Help File" },
    { "<leader>fo", ":Telescope oldfiles<CR>", desc = "Old File" },
    { "<leader>fw", ":Telescope live_grep<CR>", desc = "Word" },
  })
end

-- Git keybinds.
if is_plugin_installed("telescope.nvim") or is_plugin_installed("gitsigns.nvim") then
  local git_maps = { { "<leader>g", group = "Git" } }
  if is_plugin_installed("telescope.nvim") then
    table.insert(git_maps, { "<leader>gC", ":Telescope git_bcommits<CR>", desc = "Buffer Commit History" })
    table.insert(git_maps, { "<leader>gb", ":Telescope git_branches<CR>", desc = "Branches history" })
    table.insert(git_maps, { "<leader>gc", ":Telescope git_commits<CR>", desc = "Commit History" })
    table.insert(git_maps, { "<leader>gs", ":Telescope git_status<CR>", desc = "Status + Git Diff" })
  end
  if is_plugin_installed("gitsigns.nvim") then
    table.insert(git_maps, { "<leader>gR", ":Gitsigns reset_buffer<CR>", desc = "Reset Buffer" })
    table.insert(git_maps, { "<leader>gS", ":Gitsigns stage_hunk<CR>", desc = "Stage Hunk" })
    table.insert(git_maps, { "<leader>gd", ":Gitsigns diffthis<CR>", desc = "Git Diff" })
    table.insert(git_maps, { "<leader>gj", ":Gitsigns next_hunk<CR>", desc = "Next Hunk" })
    table.insert(git_maps, { "<leader>gk", ":Gitsigns prev_hunk<CR>", desc = "Prev Hunk" })
    table.insert(git_maps, { "<leader>gl", ":Gitsigns blame_line<CR>", desc = "Blame For Current Line" })
    table.insert(git_maps, { "<leader>gp", ":Gitsigns preview_hunk<CR>", desc = "Preview Hunk" })
    table.insert(git_maps, { "<leader>gr", ":Gitsigns reset_hunk<CR>", desc = "Reset Hunk" })
    table.insert(git_maps, { "<leader>gu", ":Gitsigns undo_stage_hunk<CR>", desc = "Undo Stage Hunk" })
  end
  which_key.add(git_maps)
end

-- ColorScheme keybindings.
if is_plugin_installed("telescope.nvim") or is_plugin_installed("onedark.nvim") then
  local colorscheme_maps = {
    { "<leader>c", group = "ColorScheme" },
  }
  if is_plugin_installed("telescope.nvim") then
    table.insert(colorscheme_maps, { "<leader>cf", ":Telescope colorscheme<CR>", desc = "Find Colorscheme" })
    table.insert(
      colorscheme_maps,
      { "<leader>cp", ":Telescope colorscheme enable_preview=true<CR>", desc = "Find Colorscheme with previwer " }
    )
  end
  if is_plugin_installed("onedark.nvim") then
    table.insert(
      colorscheme_maps,
      { "<leader>co", ':lua require("onedark").toggle()<CR>', desc = "Toggle Onedark Style" }
    )
  end
  which_key.add(colorscheme_maps)
end

-- Terminal.
if is_plugin_installed("toggleterm.nvim") then
  -- TODO:
  require("toggleterm")
  local terminal_maps = {
    { "<leader>t", group = "Terminal" },
    { "<leader>tf", ":ToggleTerm direction=float<CR>", desc = "Float" },
    { "<leader>th", ":ToggleTerm direction=horizontal<CR>", desc = "Horizontal" },
    { "<leader>tv", ":ToggleTerm direction=vertical<CR>", desc = "Vertical" },
  }
  local exec = vim.fn.executable
  if exec("node") == 1 then
    table.insert(terminal_maps, { "<leader>tn", ":lua NODE_TOGGLE()<CR>", desc = "Node" })
  end
  if exec("ncdu") == 1 then
    table.insert(terminal_maps, { "<leader>tN", ":lua NCDU_TOGGLE()<CR>", desc = "Ncdu" })
  end
  if exec("htop") == 1 then
    table.insert(terminal_maps, { "<leader>tH", ":lua HTOP_TOGGLE()<CR>", desc = "Htop" })
  end
  if exec("python") == 1 then
    table.insert(terminal_maps, { "<leader>tp", ":lua PYTHON_TOGGLE()<CR>", desc = "Python" })
  end
  if exec("ranger") == 1 then
    table.insert(terminal_maps, { "<leader>tr", ":lua RANGER_TOGGLE()<CR>", desc = "Ranger" })
  end
  if exec("lazygit") == 1 then
    table.insert(terminal_maps, { "<leader>tl", ":lua LAZYGIT_TOGGLE()<CR>", desc = "LazyGit" })
  end
  which_key.add(terminal_maps)
end

-- Lsp
local lsp_maps = {
  { "<leader>l", group = "LSP" },
  { "<leader>ls", ":lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
  { "<leader>lg", group = "GOTO" },
  { "<leader>lgD", ":lua vim.lsp.buf.declaration()<CR>", desc = "Go To Declaration" },
  { "<leader>lgd", "::lua vim.lsp.buf.definition()<CR>", desc = "Go to Definition" },
  { "<leader>lgi", ":lua vim.lsp.buf.implementation()<CR>", desc = "Go To Implementation" },
  {
    "<leader>lgt",
    ":lua vim.lsp.buf.type_definition()<CR>",
    desc = "Go To Type Definition",
  },
  { "<leader>lw", group = "Workspace" },
  { "<leader>lwa", ":lua vim.lsp.buf.add_workspace_folder()<CR>", desc = "Add Workspace Folder" },
  {
    "<leader>lwl",
    ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    desc = "List Workspace Folder",
  },
  {
    "<leader>lwr",
    ":lua vim.lsp.buf.remove_workspace_folder()<CR>",
    desc = "Remove Workspace Folder",
  },
  { "<leader>ll", group = "List Reference/Diagnostic" },
  { "<leader>lld", ":lua vim.lsp.diagnostic.set_loclist()<CR>", desc = "List Diagnostic" },
  { "<leader>llr", ":lua vim.lsp.buf.references()<CR>", desc = "Show References" },
}
if is_plugin_installed("lspsaga.nvim") then
  table.insert(lsp_maps, { "<leader>la", ":Lspsaga range_code_action<cr>", desc = "Code Action" })
  table.insert(lsp_maps, { "<leader>ld", ":Lspsaga show_line_diagnostics<CR>", desc = "Show Current Line Diagnostics" })
  table.insert(lsp_maps, { "<leader>lgj", ":Lspsaga diagnostic_jump_next<CR>", desc = "Go To Previous Diagnostics" })
  table.insert(lsp_maps, { "<leader>lgk", ":Lspsaga diagnostic_jump_prev<CR>", desc = "Go To Next Diagnostics" })
  table.insert(lsp_maps, { "<leader>lh", ":Lspsaga hover_doc<CR>", desc = "Display Information Of Symbol" })
  table.insert(lsp_maps, { "<leader>lr", ":Lspsaga rename<CR>", desc = "Rename" })
  table.insert(lsp_maps, { "<leader>lI", ":LspInstallInfo<CR>", desc = "Installer Info" })
  table.insert(lsp_maps, { "<leader>li", ":LspInfo<CR>", desc = "Info" })
end
if is_plugin_installed("telescope.nvim") then
  table.insert(lsp_maps, { "<leader>llD", ":Telescope diagnostics<CR>", desc = "Show Diagnostics list via Telescope" })
end
which_key.add(lsp_maps)

-- Debugger
if is_plugin_installed("nvim-dap") or is_plugin_installed("nvim-dap-ui") then
  local debug_maps = {
    { "<leader>d", group = "Debugging" },
  }
  if is_plugin_installed("nvim-dap") then
    table.insert(debug_maps, { "<leader>dc", ':lua require("dap").continue()<CR>', desc = "Continue" })
    table.insert(debug_maps, { "<leader>dd", ':lua require("dap").repl.open()<CR>', desc = "Open Debug Console" })
    table.insert(debug_maps, { "<leader>dl", ':lua require("dap").run_last()<CR>', desc = "Run Last Debugging Config" })
    table.insert(debug_maps, { "<leader>dt", ':lua require("dap").terminate()<CR>', desc = "Terminate" })
    table.insert(debug_maps, { "<leader>db", group = "Breakpoint" })
    table.insert(debug_maps, {
      "<leader>dbc",
      ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
      desc = "Set conditional",
    })
    table.insert(debug_maps, {
      "<leader>dbl",
      ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
      desc = "With Log Point Message",
    })
    table.insert(debug_maps, { "<leader>dbt", ':lua require("dap").toggle_breakpoint()<CR>', desc = "Toggle" })
    table.insert(debug_maps, { "<leader>ds", group = "Step" })
    table.insert(debug_maps, { "<leader>dsO", ':lua require("dap").step_into()<CR>', desc = "Step Into" })
    table.insert(debug_maps, { "<leader>dsb", ':lua require("dap").step_back()<CR>', desc = "Step Back" })
    table.insert(debug_maps, { "<leader>dsc", ':lua require("dap").run_to_cursor()<CR>', desc = "Run To Cursor" })
    table.insert(debug_maps, { "<leader>dsi", ':lua require("dap").step_out()<CR>', desc = "Step Out" })
    table.insert(debug_maps, { "<leader>dso", ':lua require("dap").step_over()<CR>', desc = "Step Over" })
  end
  if is_plugin_installed("nvim-dap-ui") then
    table.insert(debug_maps, { "<leader>du", ':lua require("dapui").toggle()<CR>', desc = "Toggle UI" })
  end
  which_key.add(debug_maps)
end

-- Comment
if is_plugin_installed("kommentary") then
  which_key.add({
    { "<leader>/", "<Plug>kommentary_line_default", desc = "Comment", mode = "n" },
    { "<leader>/", "<Plug>kommentary_visual_default", desc = "Comment", mode = "v" },
  })
end

-- Adding user mappings
if require("user_settings").extra_which_keys then
  for _, v in ipairs(require("user_settings").extra_which_keys) do
    which_key.register(v[1], v[2])
  end
end

local config = require("user_settings")
if config.which_key then
  for k, v in pairs(config.which_key) do
    which_key_config[k] = v
  end
end

which_key.setup(which_key_config)
