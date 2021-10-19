local use = require('packer').use
return require('packer').startup({function()
  use { 'wbthomason/packer.nvim' }

  -- Color schemes.
  use { 'folke/tokyonight.nvim' }
  use { 'bluz71/vim-nightfly-guicolors' }
  use { 'bluz71/vim-moonfly-colors' }
  use { 'shaunsingh/nord.nvim' }
  use { 'navarasu/onedark.nvim' }
  use { 'wuelnerdotexe/vim-enfocado' }

  -- TrueZen.nvim is a Neovim plugin that aims to provide a cleaner and less cluttered interface
  -- when toggled in either of it's three different modes (Ataraxis, Minimalist and Focus).
  use {
    'Pocco81/TrueZen.nvim',
    cmd = {
      'TZFocus',
      'TZAtaraxis',
      'TZMinimalist',
    },
    setup = function()
      require('plugins/true-zen')
    end
  }

  -- This plugin adds indentation guides to all lines (including empty lines).
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- This plugin causes all trailing whitespace characters to be highlighted.
  use { 'ntpeters/vim-better-whitespace' }

  -- Icons.
  use { 'kyazdani42/nvim-web-devicons' }

  -- File explorer tree.
  use {
    'kyazdani42/nvim-tree.lua',
    cmd = {
      'NvimTreeOpen',
      'NvimTreeFocus',
      'NvimTreeToggle',
    },
    config = function()
      require('plugins/nvim-tree')
    end
  }

  -- Bufferline.
  use { 'akinsho/nvim-bufferline.lua' }

  -- Statusline.
  use { 'hoob3rt/lualine.nvim' }

  -- TreeSitter.
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Colorizer (for highlighting color codes).
  use { 'norcalli/nvim-colorizer.lua' }

  -- Startup screen.
  use {
    'glepnir/dashboard-nvim',
    cmd = {
      'Dashboard',
      'DashboardChangeColorscheme',
      'DashboardFindFile',
      'DashboardFindHistory',
      'DashboardFindWord',
      'DashboardNewFile',
      'DashboardJumpMarks',
      'SessionLoad',
      'SessionSave'
    },
    setup = function()
        require('plugins/dashboard')
    end
  }

  -- Fuzzy finder and it requirments.
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-telescope/telescope-media-files.nvim' },
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' }
    },
    cmd = 'Telescope',
    config = function()
      require('plugins/telescope')
    end
  }

  -- LSP, LSP installer and tab completion.
  use { 'neovim/nvim-lspconfig' }
  use { 'kabouzeid/nvim-lspinstall' }
  use { 'hrsh7th/nvim-compe' }

  -- LSP signature.
  use { "ray-x/lsp_signature.nvim" }

  -- VsCode like pictograms for lsp.
  use { 'onsails/lspkind-nvim' }

  -- View and search LSP symbols, tags in Neovim.
  use { 'liuchengxu/vista.vim', cmd = 'Vista' }

  -- Terminal.
  use {
    'akinsho/nvim-toggleterm.lua',
    cmd = 'ToggleTerm',
    setup = function()
      require('plugins/toggleterm')
    end
  }

  -- Git support for nvim.
  use {
    'tpope/vim-fugitive',
    cmd = 'Git'
  }

  -- Git signs.
  use {
    'lewis6991/gitsigns.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Auto closes.
  use { 'windwp/nvim-ts-autotag' } -- This is for html and it can autorename too!
  use { 'windwp/nvim-autopairs' }

  -- Scrollbar.
  use { 'dstein64/nvim-scrollview' }

  -- Smooth scroll.
  use {
    'karb94/neoscroll.nvim',
  }

  -- Ranger.
  use {
    'kevinhwang91/rnvimr',
    cmd = 'RnvimrToggle',
    config = function()
      require('plugins/ranger')
    end
  }

  -- todo-comments is a lua plugin for Neovim to highlight and search for
  -- todo comments like TODO, HACK, BUG in code base.
  use { 'folke/todo-comments.nvim' }
  -- NOTE Check code to here

  -- WhichKey is a lua plugin that displays a popup with possible
  -- key bindings of the command you started typing.
  use { 'folke/which-key.nvim' }

  -- A plugin for neovim that automatically creates missing directories
  -- on saving a file.
  use {
    'jghauser/mkdir.nvim',
    cmd = 'new',
    config = function()
      require('mkdir')
    end
  }

  -- Dev setup for init.lua and plugin development with full signature
  -- help, docs and completion for the nvim lua API.
  use { 'folke/lua-dev.nvim' }

  -- Neovim plugin to comment text in and out.
  -- Supports commenting out the current line, a visual selection and a motion.
  use { 'b3nj5m1n/kommentary' }

  -- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text.
  use { 'andymass/vim-matchup' }

  -- With this plugin you can resize Neovim buffers easily.
  use { 'artart222/vim-resize' }

  -- Import settings of plugins or start plugins.
  require('plugins/indent-blankline')
  require('plugins/bufferline')
  require('plugins/lualine')
  require('plugins/treesitter')
  require('plugins/colorize')
  require('plugins/lspkind')
  require('plugins/compe')
  require('lsp_signature').setup()
  require('gitsigns').setup()
  require('nvim-autopairs').setup()
  require('neoscroll').setup()
  require('plugins/nvim-scroll')
  require('plugins/todo-comments')
  require("which-key").setup()
  require('kommentary.config')
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})
