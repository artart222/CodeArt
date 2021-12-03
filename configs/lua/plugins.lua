local use = require("packer").use
local user_settings_file = require("../user_settings")

return require("packer").startup({function()
  use { "wbthomason/packer.nvim" }

  -- Color schemes.
  use { "folke/tokyonight.nvim" }
  use { "bluz71/vim-nightfly-guicolors" }
  use { "bluz71/vim-moonfly-colors" }
  use { "shaunsingh/nord.nvim" }
  use { "navarasu/onedark.nvim" }
  use { "wuelnerdotexe/vim-enfocado" }

  -- TrueZen.nvim is a Neovim plugin that aims to provide a cleaner and less cluttered interface
  -- when toggled in either of it has three different modes (Ataraxis, Minimalist and Focus).
  use {
    "Pocco81/TrueZen.nvim",
    cmd = {
      "TZFocus",
      "TZAtaraxis",
      "TZMinimalist",
    },
    setup = function()
      require("plugins/true-zen")
    end
  }

  -- This plugin adds indentation guides to all lines (including empty lines).
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufEnter",
    config = function()
      require("plugins/indent-blankline")
    end
  }

  -- This plugin show trailing whitespace.
  use {
    "ntpeters/vim-better-whitespace",
    event = "BufRead",
    config = function()
        require("plugins/better-whitespace")
    end
  }

  -- Icons.
  use {
    "kyazdani42/nvim-web-devicons",
    event = "BufEnter"
  }

  -- File explorer tree.
  use {
    "kyazdani42/nvim-tree.lua",
    cmd = {
      "NvimTreeOpen",
      "NvimTreeFocus",
      "NvimTreeToggle",
    },
    config = function()
      require("plugins/nvim-tree")
    end
  }

  -- Bufferline.
  use {
    "akinsho/nvim-bufferline.lua",
    after = "nvim-web-devicons",
    config  = function()
      require("plugins/bufferline")
    end
  }

  -- Statusline.
  use {
    "nvim-lualine/lualine.nvim",
    after = "nvim-bufferline.lua",
    config = function ()
      require("plugins/lualine")
    end
  }

  -- TreeSitter.
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "BufEnter",
    cmd = {
      "TSInstall",
      "TSInstallSync",
      "TSBufEnable",
      "TSBufToggle",
      "TSEnableAll",
      "TSInstallFromGrammer",
      "TSToggleAll",
      "TSUpdate",
      "TSUpdateSync"
    },
    config = function()
      require("plugins/treesitter")
    end
  }

  -- Colorizer (for highlighting color codes).
  use {
    "norcalli/nvim-colorizer.lua",
    event = "BufEnter",
    config = function()
      require("plugins/colorize")
      vim.cmd("ColorizerAttachToBuffer")
    end
  }

  -- Startup screen.
  use {
    "glepnir/dashboard-nvim",
    cmd = {
      "Dashboard",
      "DashboardChangeColorscheme",
      "DashboardFindFile",
      "DashboardFindHistory",
      "DashboardFindWord",
      "DashboardNewFile",
      "DashboardJumpMarks",
      "SessionLoad",
      "SessionSave"
    },
    setup = function()
        require("plugins/dashboard")
    end
  }

  use {
    "nvim-lua/plenary.nvim",
  }

  use {
    "nvim-telescope/telescope-fzf-native.nvim", run = "make",
    cmd = "Telescope"
  }
  local os = vim.loop.os_uname().sysname
  if os == "Linux" then
    use {
      "nvim-lua/popup.nvim",
      cmd = "Telescope"
    }
    use {
      "nvim-telescope/telescope-media-files.nvim",
      cmd = "Telescope"
    }
    use {
      "artart222/telescope_find_directories",
      cmd = "Telescope"
    }
  else
    use {
      "artart222/telescope_find_directories",
    }
  end
  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function()
      require("plugins/telescope")
    end
  }

  -- LSP, LSP installer and tab completion.
  use {
    "neovim/nvim-lspconfig",
    event = "BufEnter"
  }
  use {
    "williamboman/nvim-lsp-installer",
    after = "nvim-lspconfig",
    config = function()
      require("../lsp")
    end
  }
  use {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter"
  }
  use {
    "hrsh7th/nvim-cmp",
    after = "friendly-snippets",
    config = function()
      require("plugins/cmp")
    end
  }
  use {
    "hrsh7th/cmp-buffer",
    after = "nvim-cmp"
  }
  use {
    "hrsh7th/cmp-path",
    after = "cmp-buffer"
  }
  use {
    "hrsh7th/cmp-nvim-lsp",
    after = "nvim-lsp-installer"
  }
  use {
    "L3MON4D3/LuaSnip",
    after = "nvim-cmp"
  }
  use {
    "saadparwaiz1/cmp_luasnip",
     after = "LuaSnip"
  }
  use {
    "hrsh7th/cmp-nvim-lua",
    after = "nvim-cmp"
  }

  -- LSP signature.
  use {
    "ray-x/lsp_signature.nvim",
    after = "friendly-snippets",
    config = function ()
      require("lsp_signature").setup()
    end
  }

  -- VsCode like pictograms for lsp.
  use {
    "onsails/lspkind-nvim",
    after = "friendly-snippets"
  }

  use {
    "mfussenegger/nvim-dap",
  }
  use {
    "Pocco81/DAPInstall.nvim",
    cmd = {
      "lua require'dap'.continue()",
      "lua require'dap'.run()",
      "lua require'dap'.run_last()",
      "lua require'dap'.launch()",
      "lua require'dap'.terminate()",
      "lua require'dap'.disconnect()",
      "lua require'dap'.close()",
      "lua require'dap'.attach()",
      "lua require'dap'.set_breakpoint()",
      "lua require'dap'.toggle_breakpoint()",
      "lua require'dap'.list_breakpoints()",
      "lua require'dap'.set_exception_breakpoints()",
      "lua require'dap'.step_over()",
      "lua require'dap'.step_into()",
      "lua require'dap'.step_out()",
      "lua require'dap'.step_back()",
      "lua require'dap'.pause()",
      "lua require'dap'.reverse_continue()",
      "lua require'dap'.up()",
      "lua require'dap'.down()",
      "lua require'dap'.run_to_cursor()",
      "lua require'dap'.repl.open()",
      "lua require'dap'.repl.toggle()",
      "lua require'dap'.repl.close()",
      "lua require'dap'.set_log_level()",
      "lua require'dap'.session()",
      "DIInstall",
      "DIUninstall",
      "DIList",
    },
  }
  use {
    "rcarriga/nvim-dap-ui",
    after = "DAPInstall.nvim",
    config = function ()
      require("plugins/dap")
    end
  }

  -- Code formatter.
  use {
    "sbdchd/neoformat",
    cmd = "Neoformat"
  }

  -- View and search LSP symbols, tags in Neovim.
  use {
    "liuchengxu/vista.vim",
    cmd = "Vista",
    config = function ()
      require("plugins/vista")
    end
  }

  -- Terminal.
  use {
    "akinsho/nvim-toggleterm.lua",
    cmd = "ToggleTerm",
    config = function()
      require("plugins/toggleterm")
    end
  }

  -- Git support for nvim.
  use {
    "tpope/vim-fugitive",
    cmd = "Git"
  }

  -- Git signs.
  use {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
      require("gitsigns").setup()
    end
  }

  -- Auto closes.
  use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
       require("nvim-autopairs").setup()
    end
  }
  -- This is for html and it can autorename too!
  use {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "php"
    }
  }

  -- Scrollbar.
  use {
    "dstein64/nvim-scrollview",
    event = "BufRead",
    config = function()
      require("plugins/nvim-scroll")
    end
  }

  -- Smooth scroll.
  use {
    "karb94/neoscroll.nvim",
    event = "BufRead",
    config = function()
      require("neoscroll").setup()
    end
  }
  -- todo-comments is a lua plugin for Neovim to highlight and search for
  -- todo comments like TODO, HACK, BUG in code base.
  use {
    "folke/todo-comments.nvim",
    event = "BufEnter",
    config = function()
      require("plugins/todo-comments")
    end
  }

  -- WhichKey is a lua plugin that displays a popup with possible
  -- key bindings of the command you started typing.
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end
  }

  -- A plugin for neovim that automatically creates missing directories
  -- on saving a file.
  use {
    "jghauser/mkdir.nvim",
    cmd = "new",
    config = function()
      require("mkdir")
    end
  }

  -- Neovim plugin to comment text in and out.
  -- Supports commenting out the current line, a visual selection and a motion.
  use {
    "terrortylor/nvim-comment",
    cmd = "CommentToggle",
    config = function()
      require("nvim_comment").setup()
    end
  }

  -- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text.
  use { "andymass/vim-matchup" }

  -- With this plugin you can resize Neovim buffers easily.
  use {
    "artart222/vim-resize",
    event = "BufEnter"
  }

  for key, plugin in pairs(additional_plugins) do
    if type(plugin) == "string" then
      use { plugin }
    else
      use { unpack(plugin) }
    end
  end

end,
config = {
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end
  }
}})
