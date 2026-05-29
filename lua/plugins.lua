local disable_plugins = require("user_settings").disable_plugins
local additional_plugins = require("user_settings").additional_plugins
local lazy_nvim_path = require("utils").lazy_nvim_path
local plugins_path = require("utils").plugins_path

if not vim.uv.fs_stat(lazy_nvim_path) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazy_nvim_path,
  })
end
vim.opt.rtp:prepend(lazy_nvim_path)

local plugins = {
  {
    "nvim-lua/plenary.nvim",
    enabled = not disable_plugins.plenary,
  },

  -- Color schemes
  {
    "folke/tokyonight.nvim",
    config = function()
      require("plugins.tokyonight")
    end,
    enabled = not disable_plugins.tokyonight,
  },
  {
    "bluz71/vim-nightfly-guicolors",
    enabled = not disable_plugins.nightfly,
  },
  {
    "bluz71/vim-moonfly-colors",
    enabled = not disable_plugins.moonfly,
  },
  {
    "shaunsingh/nord.nvim",
    enabled = not disable_plugins.nord,
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("plugins/onedark")
    end,
    enabled = not disable_plugins.onedark,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("plugins.catppuccin")
    end,
    enabled = not disable_plugins.catppuccin,
  },
  {
    "artart222/nvim-enfocado",
    config = function()
      require("plugins.enfocado")
    end,
    enabled = not disable_plugins.nvim_enfocado,
  },

  {
    "Pocco81/true-zen.nvim",
    cmd = {
      "TZFocus",
      "TZAtaraxis",
      "TZNarrow",
      "TZMinimalist",
    },
    config = function()
      require("plugins/true-zen")
    end,
    enabled = not disable_plugins.truezen,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufAdd", "BufRead" },
    cmd = {
      "IndentBlanklineToggle",
      "IndentBlanklineDisable",
      "IndentBlanklineEnable",
      "IndentBlanklineRefreshScroll",
      "IndentBlanklineRefresh",
    },
    config = function()
      require("plugins/indent-blankline")
    end,
    enabled = not disable_plugins.indent_blankline,
  },

  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins.nvim-web-devicons")
    end,
    enabled = not disable_plugins.nvim_web_devicons,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    config = function()
      require("plugins.neo-tree")
    end,
    enabled = not disable_plugins.neo_tree,
  },

  {
    "akinsho/bufferline.nvim",
    event = { "BufAdd", "BufRead" },
    cmd = {
      "BufferLineCloseLeft",
      "BufferLineCloseRight",
      "BufferLineCycleNext",
      "BufferLineCyclePrev",
      "BufferLineGoToBuffer",
      "BufferLineGroupClose",
      "BufferLineGroupToggle",
      "BufferLineMoveNext",
      "BufferLineMovePrev",
      "BufferLinePick",
      "BufferLinePickClose",
      "BufferLineSortByDirectory",
      "BufferLineSortByExtension",
      "BufferLineSortByRelativeDirectory",
      "BufferLineTogglePin",
    },
    config = function()
      require("plugins/bufferline")
    end,
    enabled = not disable_plugins.nvim_bufferline,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = { "BufAdd", "BufRead" },
    config = function()
      require("plugins/lualine/lualine")
    end,
    enabled = not disable_plugins.lualine,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("plugins.better-escape")
    end,
    enabled = not disable_plugins.better_escape,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufAdd", "BufRead" },
    dependencies = { "vim-matchup" },
    build = ":TSUpdate",
    cmd = {
      "TSBufDisable",
      "TSBufEnable",
      "TSBufToggle",
      "TSConfigInfo",
      "TSDisable",
      "TSEditQuery",
      "TSEditQueryUserAfter",
      "TSEnable",
      "TSInstall",
      "TSInstallFromGrammer",
      "TSInstallInfo",
      "TSModuleInfo",
      "TSToggle",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
    },
    config = function()
      require("plugins/treesitter")
    end,
    enabled = not disable_plugins.treesitter,
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufAdd", "BufRead" },
    cmd = {
      "ColorizerAttachToBuffer",
      "ColorizerDetachFromBuffer",
      "ColorizerReloadAllBuffers",
      "ColorizerToggle",
    },
    config = function()
      require("plugins/colorizer")
    end,
    enabled = not disable_plugins.nvim_colorizer,
  },

  {
    "nvimdev/dashboard-nvim",
    cmd = { "Dashboard" },
    config = function()
      require("plugins.dashboard")
    end,
    enabled = not disable_plugins.dashboard,
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      "artart222/telescope_find_directories",
    },
    config = function()
      require("plugins/telescope")
    end,
    enabled = not disable_plugins.telescope,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    enabled = not disable_plugins.telescope_fzf_native,
  },
  {
    "artart222/telescope_find_directories",
    enabled = not disable_plugins.telescope_find_directories,
  },

  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonInstall", "MasonLog", "MasonUninstall", "MasonUninstallAll", "MasonUpdate" },
    config = function()
      require("plugins.mason")
    end,
    enabled = not disable_plugins.mason,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("plugins.mason_lspconfig")
    end,
    enabled = not disable_plugins.mason_lspconfig,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
    dependencies = { "mason-org/mason-lspconfig.nvim", "mason-org/mason.nvim" },
    config = function()
      require("plugins.lsp.lsp")
    end,
    enabled = not disable_plugins.nvim_lspconfig,
  },

  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.conform")
    end,
    enabled = not disable_plugins.conform,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.lint")
    end,
    enabled = not disable_plugins.lint,
  },

  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    config = function()
      require("plugins.toggleterm")
    end,
    enabled = not disable_plugins.toggleterm,
  },

  {
    "folke/which-key.nvim",
    keys = {
      { "<leader>", mode = { "n", "v" } },
      { "g", mode = { "n", "v" } },
      { "d", mode = { "n", "v" } },
      { "y", mode = { "n", "v" } },
      { "!", mode = { "n", "v" } },
      { "z", mode = { "n", "v" } },
      { ">", mode = { "n", "v" } },
      { "<", mode = { "n", "v" } },
      { "]", mode = { "n", "v" } },
      { "[", mode = { "n", "v" } },
      { "v", mode = { "n", "v" } },
      { "c", mode = { "n", "v" } },
    },
    config = function()
      require("plugins.which-key")
    end,
    enabled = not disable_plugins.which_key,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("plugins.lspsaga")
    end,
    enabled = not disable_plugins.lspsaga,
  },
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen", "OutlineClose", "OutlineToggle" },
    config = function()
      require("plugins.outline")
    end,
    enabled = not disable_plugins.outline,
  },
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
    config = function()
      require("plugins.trouble")
    end,
    enabled = not disable_plugins.trouble,
  },

  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_snipmate").lazy_load()
    end,
    enabled = not disable_plugins.luasnip,
  },
  {
    "rafamadriz/friendly-snippets",
    enabled = not disable_plugins.friendly_snippets,
  },
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets" },
    opts = function()
      return require("plugins.blink")
    end,
    enabled = not disable_plugins.blink_cmp,
  },

  {
    "ray-x/lsp_signature.nvim",
    enabled = not disable_plugins.lsp_signature,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufAdd", "BufRead" },
    cmd = "Gitsigns",
    config = function()
      require("plugins/gitsigns")
    end,
    enabled = not disable_plugins.gitsigns,
  },
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    enabled = not disable_plugins.fugitive,
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("plugins.autopairs")
    end,
    enabled = not disable_plugins.autopairs,
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("plugins.surround")
    end,
    enabled = not disable_plugins.surround,
  },

  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "rescript",
      "xml",
      "php",
      "markdown",
      "glimmer",
      "handlebars",
      "hbs",
    },
    config = function()
      require("plugins.nvim-ts-autotag")
    end,
    enabled = not disable_plugins.nvim_ts_autotag,
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = { "jay-babu/mason-nvim-dap.nvim", "nvim-dap-ui" },
    keys = {
      { "<leader>dc", mode = "n" },
      { "<leader>db", mode = "n" },
      { "<leader>du", mode = "n" },
    },
    config = function()
      require("plugins.dap")
    end,
    enabled = not disable_plugins.nvim_dap,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    config = function()
      require("plugins.mason-nvim-dap")
    end,
    enabled = not disable_plugins.mason_nvim_dap,
  },
  {
    "rcarriga/nvim-dap-ui",
    keys = { { "<leader>du", mode = "n" } },
    config = function()
      require("plugins.dapui")
    end,
    enabled = not disable_plugins.nvim_dap_ui,
  },

  {
    "dstein64/nvim-scrollview",
    event = { "BufAdd", "BufRead" },
    config = function()
      require("plugins.nvim-scroll")
    end,
    enabled = not disable_plugins.scrollview,
  },
  {
    "karb94/neoscroll.nvim",
    event = { "BufAdd", "BufRead" },
    config = function()
      require("plugins.neoscroll")
    end,
    enabled = not disable_plugins.neoscroll,
  },

  {
    "folke/todo-comments.nvim",
    event = { "BufAdd", "BufRead" },
    config = function()
      require("plugins/todo-comments")
    end,
    enabled = not disable_plugins.todo_comments,
  },

  {
    "jghauser/mkdir.nvim",
    event = { "FileWritePre", "BufWritePre" },
    config = function()
      require("mkdir")
    end,
    enabled = not disable_plugins.mkdir,
  },

  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = { "n", "x" } },
      { "gbc", mode = { "n", "x" } },
      { "gc", mode = { "n", "x" } },
      { "gb", mode = { "n", "x" } },
      { "<leader>/", mode = { "n", "x" } },
    },
    dependencies = { "nvim-ts-context-commentstring" },
    config = function()
      require("plugins.comment")
    end,
    enabled = not disable_plugins.comment,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    enabled = not disable_plugins.ts_context_commentstring,
  },

  {
    "andymass/vim-matchup",
    config = function() end,
    enabled = not disable_plugins.vim_matchup,
  },

  {
    "artart222/vim-resize",
    event = {
      "FuncUndefined ResizeDown",
      "FuncUndefined ResizeUp",
      "FuncUndefined ResizeLeft",
      "FuncUndefined ResizeRight",
    },
    enabled = not disable_plugins.vim_resize,
  },
}

local lazy_config = {
  root = plugins_path,
  defaults = {
    lazy = true,
  },
  git = {
    timeout = 300,
  },
  ui = {
    border = "single",
  },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "gzip",
        "matchit",
        "rrhelper",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "zip",
        "zipPlugin",
        "tar",
        "tarPlugin",
        "getscript",
        "getscriptPlugin",
        "vimball",
        "vimballPlugin",
        "logipat",
        "spellfile_plugin",
      },
    },
  },
}

for _, plugin in pairs(additional_plugins) do
  table.insert(plugins, plugin)
end

require("lazy").setup(plugins, lazy_config)
