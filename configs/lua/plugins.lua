return require('packer').startup(function()
  use { 'wbthomason/packer.nvim' }

  -- Color schemes.
  use { 'folke/tokyonight.nvim' }
  use { 'bluz71/vim-nightfly-guicolors' }
  use { 'bluz71/vim-moonfly-colors' }
  use { 'shaunsingh/nord.nvim' }
  use { 'navarasu/onedark.nvim' }

  -- TrueZen.nvim is a Neovim plugin that aims to provide a cleaner and less cluttered interface
  -- when toggled in either of it's three different modes (Ataraxis, Minimalist and Focus).
  use { 'Pocco81/TrueZen.nvim' }

  -- This plugin adds indentation guides to all lines (including empty lines).
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- This plugin causes all trailing whitespace characters to be highlighted.
  use { 'ntpeters/vim-better-whitespace' }

  -- Icons.
  use { 'kyazdani42/nvim-web-devicons' }

  -- File explorer tree.
  use { 'kyazdani42/nvim-tree.lua' }

  -- Bufferline.
  use { 'akinsho/nvim-bufferline.lua' }

  -- Statusline.
  use { 'hoob3rt/lualine.nvim' }

  -- TreeSitter.
  use { 'nvim-treesitter/nvim-treesitter' }

  -- Colorizer (for highlighting color codes).
  use { 'norcalli/nvim-colorizer.lua' }

  -- Startup screen.
  use { 'glepnir/dashboard-nvim' }

  -- Fuzzy finder and it requirments.
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-media-files.nvim' }
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }

  -- LSP and completion.
  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/nvim-compe' }

  -- LSP signature.
  use { "ray-x/lsp_signature.nvim" }

  -- VsCode like pictograms for lsp.
  use { 'onsails/lspkind-nvim' }

  -- View and search LSP symbols, tags in Neovim.
  use { 'liuchengxu/vista.vim' }

  -- Terminal.
  use { 'akinsho/nvim-toggleterm.lua' }

  -- Floating terminal.
  use { 'voldikss/vim-floaterm' }

  -- Git support for nvim.
  use { 'tpope/vim-fugitive' }

  -- Git signs.
  use { 'lewis6991/gitsigns.nvim' }

  -- Git commit browser.
  use { 'junegunn/gv.vim' }

  -- Auto closes.
  use { 'windwp/nvim-ts-autotag' } -- This is for html and it can autorename too!
  use { 'windwp/nvim-autopairs' }

  -- Scrollbar.
  use { 'dstein64/nvim-scrollview' }

  -- Smooth scroll.
  use { 'karb94/neoscroll.nvim' }

  -- Markdow preview.
  use { 'iamcco/markdown-preview.nvim' }

  -- Ranger.
  use { 'kevinhwang91/rnvimr' }

  -- todo-comments is a lua plugin for Neovim to highlight and search for
  -- todo comments like TODO, HACK, BUG in code base.
  use { 'folke/todo-comments.nvim' }
  -- NOTE Check code to here

  -- WhichKey is a lua plugin that displays a popup with possible
  -- key bindings of the command you started typing.
  use { 'folke/which-key.nvim' }

  -- A plugin for neovim that automatically creates missing directories
  -- on saving a file.
  use { 'jghauser/mkdir.nvim' }

  -- Dev setup for init.lua and plugin development with full signature
  -- help, docs and completion for the nvim lua API.
  use { 'folke/lua-dev.nvim' }

  -- Neovim plugin to comment text in and out.
  -- Supports commenting out the current line, a visual selection and a motion.
  use { 'b3nj5m1n/kommentary' }

  -- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text.
  use { 'andymass/vim-matchup' }

  -- Import settings of plugins or start plugins.
  require('plugins/dashboard')
  require('plugins/indent-blankline')
  require('plugins/nvim-tree')
  require('plugins/bufferline')
  require('plugins/lualine')
  require('plugins/true-zen')
  require('plugins/treesitter')
  require('plugins/colorize')
  require('plugins/lspkind')
  require('plugins/compe')
  require('lsp_signature').setup()
  require('plugins/toggleterm')
  require('gitsigns').setup()
  require('nvim-autopairs').setup()
  require('neoscroll').setup()
  vim.cmd('highlight ScrollView ctermbg=160 guibg=LightCyan') -- Set scrollbar color to LightCyan
  require('plugins/markdown')
  require('plugins/ranger')
  require('plugins/todo-comments')
  require("which-key").setup()
  require('mkdir')
  require('plugins/telescope')
end )
