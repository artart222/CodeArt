local present, which_key = pcall(require, "which-key")
if not present then
  return
end

local is_plugin_installed = require("utils").is_plugin_installed
require("toggleterm")

-- This function is for using Nvimtree as fullscreen explorer
if is_plugin_installed("nvim-tree.lua") then
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
end

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
}

-- Packer
if is_plugin_installed("packer.nvim") then
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
end

local buffer_maps = {
  b = {
    name = "Buffer",
    C = { ":bdelete! <CR>", "Close Current Buffer" },
    e = { ":noh<CR>", "Erase Search Highlights" },
    n = { ":ene <BAR> startinsert<CR>", "New Buffer" },
  },
}
if is_plugin_installed("bufferline.nvim") then
  buffer_maps.b.c = { ":BufferLinePickClose<CR>", "Close Buffer" }
  buffer_maps.b.l = { ":BufferLineMoveNext<CR>", "Move Buffer Right" }
  buffer_maps.b.h = { ":BufferLineMovePrev<CR>", "Move buffer Left" }
end
if is_plugin_installed("TrueZen.nvim") then
  buffer_maps.b.m = { ":TZFocus<CR>", "Maximize Current Buffer" }
end
which_key.register(buffer_maps, { prefix = "<leader>" })

which_key.register({
  ["r"] = { ":lua vim.lsp.buf.formatting_sync()<CR>", "Format" },
}, { prefix = "<leader>" })

-- NvimTree
if is_plugin_installed("nvim-tree.lua") then
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
if is_plugin_installed("telescope.nvim") then
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
end

-- Git keybinds.
if is_plugin_installed("telescope.nvim") or is_plugin_installed("gitsigns.nvim") then
  local git_maps = { g = { name = "Git" } }
  if is_plugin_installed("telescope.nvim") then
    git_maps.g.s = { ":Telescope git_status<CR>", "Status + Git Diff" }
    git_maps.g.c = { ":Telescope git_commits<CR>", "Commit History" }
    git_maps.g.C = { ":Telescope git_bcommits<CR>", "Buffer Commit History" }
    git_maps.g.b = { ":Telescope git_branches<CR>", "Branches history" }
  end
  if is_plugin_installed("gitsigns.nvim") then
    git_maps.g.k = { ":Gitsigns prev_hunk<CR>", "Prev Hunk" }
    git_maps.g.j = { ":Gitsigns next_hunk<CR>", "Next Hunk" }
    git_maps.g.p = { ":Gitsigns preview_hunk<CR>", "Preview Hunk" }
    git_maps.g.r = { ":Gitsigns reset_hunk<CR>", "Reset Hunk" }
    git_maps.g.R = { ":Gitsigns reset_buffer<CR>", "Reset Buffer" }
    git_maps.g.d = { ":Gitsigns diffthis<CR>", "Git Diff" }
    git_maps.g.l = { ":Gitsigns blame_line<CR>", "Blame For Current Line" }
    git_maps.g.S = { ":Gitsigns stage_hunk<CR>", "Stage Hunk" }
    git_maps.g.u = { ":Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk" }
  end
  which_key.register(git_maps, { prefix = "<leader>" })
end

-- ColorScheme keybindings.
if is_plugin_installed("telescope.nvim") or is_plugin_installed("onedark.nvim") then
  local colorscheme_maps = {
    c = {
      name = "ColorScheme",
    },
  }
  if is_plugin_installed("telescope.nvim") then
    colorscheme_maps.c.f = { ":Telescope colorscheme<CR>", "Find Colorscheme" }
    colorscheme_maps.c.p = { ":Telescope colorscheme enable_preview=true<CR>", "Find Colorscheme with previwer " }
  end
  if is_plugin_installed("onedark.nvim") then
    colorscheme_maps.c.o = { ':lua require("onedark").toggle()<CR>', "Toggle Onedark Style" }
  end
  which_key.register(colorscheme_maps, { prefix = "<leader>" })
end

-- Terminal.
if is_plugin_installed("toggleterm.nvim") then
  local terminal_maps = {
    t = {
      name = "Terminal",
      f = { ":ToggleTerm direction=float<CR>", "Float" },
      h = { ":ToggleTerm direction=horizontal<CR>", "Horizontal" },
      v = { ":ToggleTerm direction=vertical<CR>", "Vertical" },
    },
  }
  local exec = vim.fn.executable
  if exec("node") == 1 then
    terminal_maps.t.n = { ":lua NODE_TOGGLE()<CR>", "Node" }
  end
  if exec("ncdu") == 1 then
    terminal_maps.t.N = { ":lua NCDU_TOGGLE()<CR>", "Ncdu" }
  end
  if exec("htop") == 1 then
    terminal_maps.t.H = { ":lua HTOP_TOGGLE()<CR>", "Htop" }
  end
  if exec("python") == 1 then
    terminal_maps.t.p = { ":lua PYTHON_TOGGLE()<CR>", "Python" }
  end
  if exec("ranger") == 1 then
    terminal_maps.t.r = { ":lua RANGER_TOGGLE()<CR>", "Ranger" }
  end
  if exec("lazygit") == 1 then
    terminal_maps.t.l = { ":lua LAZYGIT_TOGGLE()<CR>", "LazyGit" }
  end
  which_key.register(terminal_maps, { prefix = "<leader>" })
end

-- Lsp
local lsp_maps = {
  l = {
    name = "LSP",
    s = { ":lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    g = {
      name = "GOTO",
      D = { ":lua vim.lsp.buf.declaration()<CR>", "Go To Declaration" },
      i = { ":lua vim.lsp.buf.implementation()<CR>", "Go To Implementation" },
      d = { "::lua vim.lsp.buf.definition()<CR>", "Go to Definition" },
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
  },
}
if is_plugin_installed("lspsaga.nvim") then
  lsp_maps.l.a = { ":Lspsaga range_code_action<cr>", "Code Action" }
  lsp_maps.l.d = { ":Lspsaga show_line_diagnostics<CR>", "Show Current Line Diagnostics" }
  lsp_maps.l.i = { ":LspInfo<CR>", "Info" }
  lsp_maps.l.I = { ":LspInstallInfo<CR>", "Installer Info" }
  lsp_maps.l.r = { ":Lspsaga rename<CR>", "Rename" }
  lsp_maps.l.h = { ":Lspsaga hover_doc<CR>", "Display Information Of Symbol" }
  lsp_maps.l.g.k = { ":Lspsaga diagnostic_jump_prev<CR>", "Go To Next Diagnostics" }
  lsp_maps.l.g.j = { ":Lspsaga diagnostic_jump_next<CR>", "Go To Previous Diagnostics" }
end
if is_plugin_installed("telescope.nvim") then
  lsp_maps.l.l.D = { ":Telescope diagnostics<CR>", "Show Diagnostics list via Telescope" }
end
which_key.register(lsp_maps, { prefix = "<leader>" })

-- Debugger
if is_plugin_installed("nvim-dap") or is_plugin_installed("nvim-dap-ui") then
  local debug_maps = {
    d = {
      name = "Debugging",
    },
  }
  if is_plugin_installed("nvim-dap") then
    debug_maps.d.c = { ':lua require("dap").continue()<CR>', "Continue" }
    debug_maps.d.t = { ':lua require("dap").terminate()<CR>', "Terminate" }
    debug_maps.d.l = { ':lua require("dap").run_last()<CR>', "Run Last Debugging Config" }
    debug_maps.d.d = { ':lua require("dap").repl.open()<CR>', "Open Debug Console" }
    debug_maps.d.b = {
      name = "Breakpoint",
      t = { ':lua require("dap").toggle_breakpoint()<CR>', "Toggle" },
      c = { ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', "Set conditional" },
      l = {
        ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
        "With Log Point Message",
      },
    }
    debug_maps.d.s = {
      name = "Step",
      o = { ':lua require("dap").step_over()<CR>', "Step Over" },
      O = { ':lua require("dap").step_into()<CR>', "Step Into" },
      i = { ':lua require("dap").step_out()<CR>', "Step Out" },
      b = { ':lua require("dap").step_back()<CR>', "Step Back" },
      c = { ':lua require("dap").run_to_cursor()<CR>', "Run To Cursor" },
    }
  end
  if is_plugin_installed("nvim-dap-ui") then
    debug_maps.d.u = { ':lua require("dapui").toggle()<CR>', "Toggle UI" }
  end
  which_key.register(debug_maps, { prefix = "<leader>" })
end

-- Comment
if is_plugin_installed("kommentary") then
  which_key.register({
    ["/"] = { "<Plug>kommentary_line_default", "Comment" },
  }, { prefix = "<leader>", noremap = false })
  which_key.register({
    ["/"] = { "<Plug>kommentary_visual_default", "Comment" },
  }, { prefix = "<leader>", noremap = false, mode = "v" })
end

-- Adding user mappings
if extra_which_keys then
  for _, v in ipairs(extra_which_keys) do
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
