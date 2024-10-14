local disable_plugins = require("user_settings").disable_plugins
local additional_plugins = require("user_settings").additional_plugins
local lazy_nvim_path = require("utils").lazy_nvim_path
local plugins_path = require("utils").plugins_path

-- Install lazy.nvim if it is not installed.
if not vim.loop.fs_stat(lazy_nvim_path) then
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
  -- This plugin is needed for many plugins(like telescope) so this is one of
  -- default CodeArt's plugins.
  {
    "nvim-lua/plenary.nvim",
    enabled = not disable_plugins.plenary,
  },

  -- Color schemes.
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
    "artart222/nvim-enfocado",
    config = function()
      require("plugins.enfocado")
    end,
    enabled = not disable_plugins.nvim_enfocado,
  },

  -- TrueZen.nvim is a Neovim plugin that aims to provide a cleaner and less cluttered interface.
  -- lazy-load if one of it's four different modes (Ataraxis, Minimalist, Narrow and Focus).
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

  -- This plugin adds indentation guides to all lines (including empty lines).
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

  -- Icons.
  {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("plugins.nvim-web-devicons")
    end,
    enabled = not disable_plugins.nvim_web_devicons,
  },

  -- File explorer tree.
  {
    "kyazdani42/nvim-tree.lua",
    cmd = {
      "NvimTreeOpen",
      "NvimTreeFocus",
      "NvimTreeToggle",
      "NvimTreeClose",
      "NvimTreeRefresh",
      "NvimTreeFindFile",
      "NvimTreeFindFileToggle",
      "NvimTreeClipboard",
      "NvimTreeResize",
      "NvimTreeCollapse",
      "NvimTreeCollapseKeepBuffers",
      "NvimTreeGenerateOnAttach",
    },
    config = function()
      require("plugins.nvim-tree")
    end,
    enabled = not disable_plugins.nvim_tree,
  },

  -- Bufferline.
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

  -- Statusline.
  {
    "nvim-lualine/lualine.nvim",
    event = { "BufAdd", "BufRead" },
    config = function()
      require("plugins/lualine/lualine")
    end,
    enabled = not disable_plugins.lualine,
  },

  -- Better escape --> For escaping easily from insert mode with jk/jj.
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("plugins.better-escape")
    end,
    enabled = not disable_plugins.better_escape,
  },

  -- TreeSitter.
  {
    "nvim-treesitter/nvim-treesitter",
    -- Load only when file type detected or just after creating a new buffer.
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

  -- Colorizer (for highlighting color codes).
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

  -- Startup screen.
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

  -- LSP, LSP installer and tab completion.
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonInstall", "MasonLog", "MasonUninstall", "MasonUninstallAll", "MasonUpdate" },
    config = function()
      require("plugins.mason")
    end,
    enabled = not disable_plugins.mason,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
    dependencies = {
      "mason-lspconfig.nvim",
    },
    config = function()
      require("plugins.lsp.lsp")
    end,
    enabled = not disable_plugins.nvim_lspconfig,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("plugins.mason_lspconfig")
    end,
    enabled = not disable_plugins.mason_lspconfig,
  },
  -- NOTE: Fix under this.
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufRead", "BufNewFile" },
    config = function()
      local config = require("user_settings").config
      if config.null_ls ~= nil then
        config.null_ls()
      end
    end,
    enabled = not disable_plugins.null_ls,
  },

  -- Terminal.
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    config = function()
      require("plugins.toggleterm")
    end,
    enabled = not disable_plugins.toggleterm,
  },

  -- WhichKey is a lua plugin that displays a popup with possible
  -- key bindings of the command you started typing.
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
    "tami5/lspsaga.nvim",
    cmd = "Lspsaga",
    config = function()
      require("plugins.lspsaga")
    end,
    enabled = not disable_plugins.lspsaga,
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = {
      "SymbolsOutline",
      "SymbolsOutlineOpen",
      "SymbolsOutlineClose",
    },
    config = function()
      require("plugins.symbols-outline")
    end,
    enabled = not disable_plugins.symbols_outline,
  },

  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    event = "InsertEnter",
    config = function()
      -- TODO: Add setup function and seperate config file.
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_snipmate").lazy_load()
    end,
    enabled = not disable_plugins.luasnip,
  },
  {
    "rafamadriz/friendly-snippets",
    -- AutoLazy load.
    -- TODO: Add setup function and seperate config file.
    enabled = not disable_plugins.friendly_snippets,
  },

  {
    "hrsh7th/nvim-cmp",
    event = { "BufAdd", "BufRead" },
    dependencies = {
      "cmp-buffer",
      "cmp-path",
      "cmp-nvim-lsp",
      "cmp_luasnip",
      "cmp-nvim-lua",
    },
    config = function()
      require("plugins/cmp")
    end,
    enabled = not disable_plugins.nvim_cmp,
  },

  {
    "hrsh7th/cmp-buffer",
    enabled = not disable_plugins.cmp_buffer,
  },
  {
    "hrsh7th/cmp-path",
    enabled = not disable_plugins.cmp_path,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    enabled = not disable_plugins.cmp_nvim_lsp,
  },
  {
    "saadparwaiz1/cmp_luasnip",
    enabled = not disable_plugins.cmp_luasnip,
  },
  {
    "hrsh7th/cmp-nvim-lua",
    ft = "lua",
    enabled = not disable_plugins.cmp_nvim_lua,
  },

  -- LSP signature.
  {
    "ray-x/lsp_signature.nvim",
    -- AutoLazy load.
    -- TODO:
    -- Config of this plugin is in plugins/lsp/lsp.lua
    -- Add seperate config file and setup.
    enabled = not disable_plugins.lsp_signature,
  },

  -- Git signs.
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufAdd", "BufRead" },
    cmd = "Gitsigns",
    config = function()
      require("plugins/gitsigns")
    end,
    enabled = not disable_plugins.gitsigns,
  },
  -- Git support for nvim.
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    enabled = not disable_plugins.fugitive,
  },

  -- Auto closes.
  {
    "windwp/nvim-autopairs",
    keys = {
      { "(", mode = "i" },
      { "[", mode = "i" },
      { "{", mode = "i" },
      { "'", mode = "i" },
      { '"', mode = "i" },
      { "<BS>", mode = "i" },
    },
    -- TODO: Move this file config to seperate file.
    config = function()
      require("nvim-autopairs").setup()
    end,
    enabled = not disable_plugins.autopairs,
  },

  -- This is for html and it can autorename too!
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
    -- TODO: Make lazyload better and if available remove manual lazy loading.
    -- TODO: move config to seperate file.
    -- TODO: check https://github.com/windwp/nvim-ts-autotag/issues/19
    config = function()
      require("plugins.nvim-ts-autotag")
    end,
    enabled = not disable_plugins.nvim_ts_autotag,
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = { "jay-babu/mason-nvim-dap.nvim", "nvim-dap-ui" },
    -- TODO: Do better lazy loading.
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
    -- TODO: Find a way to load plugin after user use keymaps for it.
    -- cmd = {
    --   "lua require(dapui).open()",
    --   "lua require(dapui).close()",
    --   "lua require(dapui).toggle()",
    -- },
    config = function()
      require("plugins.dapui")
    end,
    enabled = not disable_plugins.nvim_dap_ui,
  },

  -- Scrollbar.
  {
    "dstein64/nvim-scrollview",
    event = { "BufAdd", "BufRead" },
    config = function()
      require("plugins.nvim-scroll")
    end,
    enabled = not disable_plugins.scrollview,
  },
  -- Smooth scroll.
  {
    "karb94/neoscroll.nvim",
    event = { "BufAdd", "BufRead" },
    config = function()
      require("plugins.neoscroll")
    end,
    enabled = not disable_plugins.neoscroll,
  },

  -- todo-comments is a lua plugin for Neovim to highlight and search for
  -- todo comments like TODO, HACK, BUG in code base.
  {
    "folke/todo-comments.nvim",
    event = { "BufAdd", "BufRead" },
    config = function()
      require("plugins/todo-comments")
    end,
    enabled = not disable_plugins.todo_comments,
  },

  -- A plugin for neovim that automatically creates missing directories
  -- on saving a file.
  {
    "jghauser/mkdir.nvim",
    event = { "FileWritePre", "BufWritePre" },
    config = function()
      require("mkdir")
    end,
    enabled = not disable_plugins.mkdir,
  },

  {
    "b3nj5m1n/kommentary",
    dependencies = { "nvim-ts-context-commentstring" },
    keys = {
      { "<Plug>kommentary_line_default", mode = { "n", "v" } },
      { "<Plug>kommentary_visual_default", mode = { "n", "v" } },
    },
    config = function()
      require("plugins.kommentary")
    end,
    enabled = not disable_plugins.kommentary,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    enabled = not disable_plugins.ts_context_commentstring,
  },

  -- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text.
  {
    "andymass/vim-matchup",
    config = function() end,
    enabled = not disable_plugins.vim_matchup,
  },

  -- With this plugin you can resize Neovim buffers easily.
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
