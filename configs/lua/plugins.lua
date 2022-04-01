local utils = require("utils")

-- Disable some builtin plugins.
local disabled_built_ins = {
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
}
for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

local fn = vim.fn
local packer_bootstrap
if not utils.is_plugin_installed("packer.nvim") then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    utils.plugins_path .. "/start/packer.nvim",
  })
  vim.cmd([[packadd packer.nvim]])
end

local use = require("packer").use
local user_settings_file = require("user_settings")

return require("packer").startup({
  function()
    use({ "wbthomason/packer.nvim" })

    -- These two plugins make CodeArt startup faster.
    -- In addition FixCursorHold can fix this bug:
    -- https://github.com/neovim/neovim/issues/12587
    use({
      "lewis6991/impatient.nvim",
      config = function()
        require("impatient")
      end,
      disable = disable_plugins.impatient,
    })
    use({
      "antoinemadec/FixCursorHold.nvim",
      event = "BufRead",
      disable = disable_plugins.fix_cursor_hold,
    })

    -- This plugin is needed for many plugins(like telescope) so this is one of
    -- default CodeArt's plugins.
    use({
      "nvim-lua/plenary.nvim",
      disable = disable_plugins.plenary,
    })

    -- Color schemes.
    use({
      "folke/tokyonight.nvim",
      disable = disable_plugins.tokyonight,
    })
    use({
      "bluz71/vim-nightfly-guicolors",
      disable = disable_plugins.nightfly,
    })
    use({
      "bluz71/vim-moonfly-colors",
      disable = disable_plugins.moonfly,
    })
    use({
      "shaunsingh/nord.nvim",
      disable = disable_plugins.nord,
    })
    use({
      "navarasu/onedark.nvim",
      config = function()
        require("plugins/onedark")
      end,
      disable = disable_plugins.onedark,
    })
    use({
      "artart222/nvim-enfocado",
      disable = disable_plugins.nvim_enfocado,
    })

    -- TrueZen.nvim is a Neovim plugin that aims to provide a cleaner and less cluttered interface
    -- when toggled in either of it has three different modes (Ataraxis, Minimalist and Focus).
    use({
      "Pocco81/TrueZen.nvim",
      cmd = {
        "TZFocus",
        "TZAtaraxis",
        "TZMinimalist",
      },
      config = function()
        require("plugins/true-zen")
      end,
      disable = disable_plugins.truezen,
    })

    -- This plugin adds indentation guides to all lines (including empty lines).
    use({
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      config = function()
        require("plugins/indent-blankline")
      end,
      disable = disable_plugins.indent_blankline,
    })

    -- Icons.
    use({
      "kyazdani42/nvim-web-devicons",
      event = "BufRead",
      config = function()
        require("plugins.nvim_web_devicons")
      end,
      disable = disable_plugins.nvim_web_devicons,
    })

    -- File explorer tree.
    use({
      "kyazdani42/nvim-tree.lua",
      cmd = {
        "NvimTreeOpen",
        "NvimTreeFocus",
        "NvimTreeToggle",
      },
      config = function()
        require("plugins.nvim-tree")
      end,
      disable = disable_plugins.nvim_tree,
    })

    -- Bufferline.
    use({
      "akinsho/nvim-bufferline.lua",
      event = "BufRead",
      -- after = "nvim-treesitter",
      config = function()
        require("plugins/bufferline")
      end,
      disable = disable_plugins.nvim_bufferline,
    })

    -- Statusline.
    use({
      "nvim-lualine/lualine.nvim",
      after = "nvim-bufferline.lua",
      config = function()
        require("plugins/lualine/lualine")
      end,
      disable = disable_plugins.lualine,
    })

    -- Better escape --> For escaping easily from insert mode with jk/jj.
    use({
      "max397574/better-escape.nvim",
      keys = { { "i", "jj" }, { "i", "jk" } },
      config = function()
        require("plugins.better_escape")
      end,
      disable = disable_plugins.better_escape,
    })

    -- TreeSitter.
    use({
      "nvim-treesitter/nvim-treesitter",
      run = "TSUpdate",
      event = "BufRead",
      cmd = {
        "TSInstall",
        "TSInstallInfo",
        "TSInstallSync",
        "TSUninstall",
        "TSUpdate",
        "TSUpdateSync",
        "TSDisableAll",
        "TSEnableAll",
      },
      config = function()
        require("plugins/treesitter")
      end,
      disable = disable_plugins.treesitter,
    })

    -- Colorizer (for highlighting color codes).
    use({
      "norcalli/nvim-colorizer.lua",
      event = "BufRead",
      config = function()
        require("plugins/colorizer")
        vim.cmd("ColorizerAttachToBuffer")
      end,
      disable = disable_plugins.nvim_colorizer,
    })

    -- Startup screen.
    use({
      "goolord/alpha-nvim",
      cmd = "Alpha",
      config = function()
        require("plugins.alpha")
      end,
      disable = disable_plugins.alpha,
    })

    use({
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make",
      cmd = "Telescope",
      disable = disable_plugins.telescope_fzf_native,
    })
    use({
      "artart222/telescope_find_directories",
      after = "telescope-fzf-native.nvim",
      disable = disable_plugins.telescope_find_directories,
    })
    use({
      "nvim-telescope/telescope.nvim",
      after = "telescope_find_directories",
      config = function()
        require("plugins/telescope")
      end,
      disable = disable_plugins.telescope,
    })

    -- LSP, LSP installer and tab completion.
    use({
      "neovim/nvim-lspconfig",
      event = "BufRead",
      disable = disable_plugins.nvim_lspconfig,
    })
    use({
      "williamboman/nvim-lsp-installer",
      after = "nvim-lspconfig",
      config = function()
        require("plugins.lsp.lsp")
      end,
      disable = disable_plugins.nvim_lsp_installer,
    })
    use({
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require("plugins.lsp.null-ls")
        local config = require("user_settings")
        if config.null_ls ~= nil then
          config.null_ls()
        end
      end,
      after = "nvim-lsp-installer",
      disable = disable_plugins.null_ls,
    })

    use({
      "tami5/lspsaga.nvim",
      cmd = "Lspsaga",
      disable = disable_plugins.lspsaga,
    })

    use({
      "stevearc/aerial.nvim",
      cmd = {
        "AerialOpen",
        "AerialClose",
        "AerialPrev",
        "AerialNext",
        "AerialPrevUp",
        "AerialNextUp",
        "AerialGo",
        "AerialTreeOpen",
        "AerialTreeClose",
        "AerialTreeToggle",
        "AerialTreeOpenAll",
        "AerialTreeCloseAll",
        "AerialTreeSyncFolds",
        "AerialInfo",
      },
      config = function()
        require("plugins/aerial")
      end,
      disable = disable_plugins.aerial,
    })

    use({
      "rafamadriz/friendly-snippets",
      event = "InsertEnter",
      disable = disable_plugins.friendly_snippets,
    })
    use({
      "L3MON4D3/LuaSnip",
      after = "friendly-snippets",
      config = function()
        require("luasnip/loaders/from_vscode").load()
      end,
      disable = disable_plugins.luasnip,
    })
    use({
      "hrsh7th/nvim-cmp",
      after = "LuaSnip",
      config = function()
        require("plugins/cmp")
      end,
      disable = disable_plugins.nvim_cmp,
    })
    use({
      "hrsh7th/cmp-buffer",
      after = "nvim-cmp",
      disable = disable_plugins.cmp_buffer,
    })
    use({
      "hrsh7th/cmp-path",
      after = "nvim-cmp",
      disable = disable_plugins.cmp_path,
    })
    use({
      "hrsh7th/cmp-nvim-lsp",
      after = "nvim-cmp",
      disable = disable_plugins.cmp_nvim_lsp,
    })
    use({
      "saadparwaiz1/cmp_luasnip",
      after = "LuaSnip",
      disable = disable_plugins.cmp_luasnip,
    })
    use({
      "hrsh7th/cmp-nvim-lua",
      -- after = "nvim-cmp",
      ft = "lua",
      disable = disable_plugins.cmp_nvim_lua,
    })

    -- LSP signature.
    use({
      "ray-x/lsp_signature.nvim",
      event = "InsertEnter",
      config = function()
        require("lsp_signature").setup()
      end,
      disable = disable_plugins.lsp_signature,
    })

    -- TODO: Do better lazyloading here for dap.
    use({
      "mfussenegger/nvim-dap",
      event = "BufRead",
      disable = disable_plugins.nvim_dap,
    })

    use({
      "Pocco81/DAPInstall.nvim",
      after = "nvim-dap",
      config = function()
        require("plugins/dap")
      end,
      disable = disable_plugins.dap_install,
    })
    use({
      "rcarriga/nvim-dap-ui",
      after = "nvim-dap",
      config = function()
        require("plugins/dapui")
      end,
      disable = disable_plugins.nvim_dap_ui,
    })

    -- Terminal.
    use({
      "akinsho/nvim-toggleterm.lua",
      keys = "<C-t>",
      cmd = "ToggleTerm",
      config = function()
        require("plugins/toggleterm")
      end,
      disable = disable_plugins.toggleterm,
    })

    -- Git support for nvim.
    use({
      "tpope/vim-fugitive",
      cmd = "Git",
      disable = disable_plugins.fugitive,
    })

    -- Git signs.
    use({
      "lewis6991/gitsigns.nvim",
      event = "BufRead",
      config = function()
        require("plugins/gitsigns")
      end,
      disable = disable_plugins.gitsigns,
    })

    -- Auto closes.
    use({
      "windwp/nvim-autopairs",
      keys = {
        { "i", "(" },
        { "i", "[" },
        { "i", "{" },
        { "i", "'" },
        { "i", '"' },
        { "i", "<BS>" },
      },
      config = function()
        require("nvim-autopairs").setup()
      end,
      disable = disable_plugins.autopairs,
    })
    -- This is for html and it can autorename too!
    use({
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
      disable = disable_plugins.nvim_ts_autotag,
    })

    -- Scrollbar.
    use({
      "dstein64/nvim-scrollview",
      event = "BufRead",
      config = function()
        require("plugins/nvim-scroll")
      end,
      disable = disable_plugins.scrollview,
    })

    -- Smooth scroll.
    use({
      "karb94/neoscroll.nvim",
      event = "BufRead",
      config = function()
        require("plugins.neoscroll")
      end,
      disable = disable_plugins.neoscroll,
    })
    -- todo-comments is a lua plugin for Neovim to highlight and search for
    -- todo comments like TODO, HACK, BUG in code base.
    use({
      "folke/todo-comments.nvim",
      event = "BufRead",
      config = function()
        require("plugins/todo-comments")
      end,
      disable = disable_plugins.todo_comments,
    })
    -- WhichKey is a lua plugin that displays a popup with possible
    -- key bindings of the command you started typing.
    use({
      "folke/which-key.nvim",
      -- event = "BufEnter",
      keys = {
        "<leader>",
        "g",
        "d",
        "y",
        "!",
        "z",
        ">",
        "<",
        "]",
        "[",
        "v",
        "c",
      },
      config = function()
        require("plugins/which_key")
      end,
      disable = disable_plugins.which_key,
    })

    -- A plugin for neovim that automatically creates missing directories
    -- on saving a file.
    use({
      "jghauser/mkdir.nvim",
      cmd = "new",
      config = function()
        require("mkdir")
      end,
      disable = disable_plugins.mkdir,
    })

    -- Neovim plugin to comment in/out text.
    use({
      "b3nj5m1n/kommentary",
      keys = {
        "<Plug>kommentary_line_default",
        "<Plug>kommentary_visual_default",
      },
      config = function()
        require("plugins.kommentary")
      end,
      disable = disable_plugins.kommentary,
    })
    use({
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "BufRead",
      disable = disable_plugins.ts_context_commentstring,
    })

    -- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text.
    use({
      "andymass/vim-matchup",
      event = "BufRead",
      config = function()
        vim.g.matchup_matchparen_offscreen = {}
      end,
      disable = disable_plugins.vim_matchup,
    })

    -- With this plugin you can resize Neovim buffers easily.
    use({
      "artart222/vim-resize",
      event = {
        "FuncUndefined ResizeDown",
        "FuncUndefined ResizeUp",
        "FuncUndefined ResizeLeft",
        "FuncUndefined ResizeRight",
      },
      disable = disable_plugins.vim_resize,
    })

    for _, plugin in pairs(additional_plugins) do
      if type(plugin) == "string" then
        use({ plugin })
      else
        use({ table.unpack(plugin) })
      end
    end

    if packer_bootstrap then
      require("packer").sync()
    end

    user_settings_file.other_configs()
  end,
  config = {
    -- compile_path = vim.fn.stdpath("config") .. "/plugin/" .. "packer_compiled.lua",
    -- git = {
    --   clone_timeout = 300,
    -- },
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
