vim.cmd('filetype on')

return require('packer').startup(function()
  use { 'wbthomason/packer.nvim' }

  -- Color schemes
  use { 'marko-cerovac/material.nvim' }
  require('plugins/material')

  use { 'Shadorain/shadotheme' }
  use { 'folke/tokyonight.nvim' }
  use { 'bluz71/vim-nightfly-guicolors' }
  use { 'bluz71/vim-moonfly-colors' }
  use { 'sainnhe/sonokai' }
  use { 'mhartington/oceanic-next' }
  use { 'fenetikm/falcon' }
  use { 'shaunsingh/nord.nvim' }
  use { 'shaunsingh/moonlight.nvim' }
  use { 'navarasu/onedark.nvim' }
  use { 'NTBBloodbath/doom-one.nvim' }
  use { 'dracula/vim' }
  use { 'nxvu699134/vn-night.nvim' }
  use { 'projekt0n/github-nvim-theme' }

  -- Color sheme switcher and it dependecy
  use { 'xolox/vim-colorscheme-switcher' }
  use { 'xolox/vim-misc'}

  -- Plugin that dims inactive windows
  use { 'artart222/Shade.nvim' }
  require('plugins/shade')

  -- Opens the current buffer in a new full-screen floating window without
  -- messing up with existing window layouts
  use { 'folke/zen-mode.nvim',
    config = function()
      require("zen-mode").setup()
    end
  }

  -- This plugin causes all trailing whitespace characters to be highlighted
  use { 'ntpeters/vim-better-whitespace' }

  -- Maximizes and restores the current window in nvim
  use { 'szw/vim-maximizer' }

  -- Icons
  use { 'kyazdani42/nvim-web-devicons' }

  -- File explorer tree
  use { 'kyazdani42/nvim-tree.lua' }
  require('plugins/nvim-tree')

  -- Bufferline
  use { 'akinsho/nvim-bufferline.lua' }
  require('plugins/bufferline')

  -- Statusline
  use { 'hoob3rt/lualine.nvim' }
  require('plugins/lualine')

  -- TreeSitter
  use { 'nvim-treesitter/nvim-treesitter' }
  require('plugins/treesitter')

  -- Colorizer (for highlighting color codes)
  use { 'norcalli/nvim-colorizer.lua' }
  require('plugins/colorize')

  -- VsCode like pictograms
  use { 'onsails/lspkind-nvim' }
  require('plugins/lspkind')

  -- Set discord profile activity
  use { 'andweeb/presence.nvim' }
  require('plugins/presence')

  -- Startup screen
  use { 'glepnir/dashboard-nvim' }
  require('plugins/dashboard')

  -- Fuzzy finder and it requirments
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/nvim-compe' }
  require('plugins/compe')

  -- LSP signature
  use { "ray-x/lsp_signature.nvim" }
  require("lsp_signature").setup()

  -- View and search LSP symbols, tags in Neovim
  use { 'liuchengxu/vista.vim' }

  -- Terminal
  use { 'akinsho/nvim-toggleterm.lua' }
  require('plugins/toggleterm')

  -- Floating terminal
  use { 'voldikss/vim-floaterm' }

  -- Git support for nvim
  use { 'tpope/vim-fugitive' }

  -- Git signs
  use { 'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Lazygit support for nvim
  use { 'kdheepak/lazygit.nvim' }

  -- Git commit browser
  use { 'junegunn/gv.vim' }

  -- Edit and review GitHub issues and pull requests from nvim
  use {'pwntester/octo.nvim'}
  require"octo".setup()

  -- Auto closes
  use { 'windwp/nvim-ts-autotag' } -- This is for html and it can autorename too!
  require('nvim-autopairs').setup()
  use { 'windwp/nvim-autopairs' }

  -- Scrollbar
  use { 'dstein64/nvim-scrollview' }
  vim.cmd('highlight ScrollView ctermbg=160 guibg=LightCyan') -- Set scrollbar color to LightCyan

  -- Smooth scroll
  use { 'karb94/neoscroll.nvim' }
  require('neoscroll').setup()

  -- Markdow preview
  use { 'iamcco/markdown-preview.nvim' }
  require('plugins/markdown')

  -- Ranger
  use { 'kevinhwang91/rnvimr' }
  require('plugins/ranger')

  -- todo-comments is a lua plugin for Neovim to highlight and search for
  -- todo comments like TODO, HACK, BUG in code base
  use { 'folke/todo-comments.nvim' }
  require('plugins/todo-comments')

  -- WhichKey is a lua plugin that displays a popup with possible
  -- key bindings of the command you started typing
  use { 'folke/which-key.nvim',
    config = function()
      require("which-key").setup()
    end
  }

  -- A plugin for neovim that automatically creates missing directories
  -- on saving a fileA
  use { 'jghauser/mkdir.nvim',
    config = function()
      require('mkdir')
    end
  }

  -- Dev setup for init.lua and plugin development with full signature
  -- help, docs and completion for the nvim lua API
  use { 'folke/lua-dev.nvim' }

  -- Neovim plugin to comment text in and out.
  -- Supports commenting out the current line, a visual selection and a motion
  use { 'b3nj5m1n/kommentary' }

  -- JABS is a minimal buffer switcher window for Neovim.
  use { 'matbme/JABS.nvim' }

  -- Easily adds brief author info and license headers
  use { 'alpertuna/vim-header' }
  require('plugins/header')

  use { 'tpope/vim-dispatch' }
  -- The plugin is a capable Vim debugger for multiple languages.
  -- It's mostly tested for C++, Python and TCL, but in theory supports
  -- any language that Visual Studio Code supports.
  use { 'puremourning/vimspector' }

  -- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text
  use { 'andymass/vim-matchup' }
end )
