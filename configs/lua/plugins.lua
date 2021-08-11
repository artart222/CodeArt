cmd('filetype plugin indent on')

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Color scheme
  use { 'marko-cerovac/material.nvim' }

  -- Icons
  use { 'kyazdani42/nvim-web-devicons' }

  -- File explorer tree
  use { 'kyazdani42/nvim-tree.lua' }

  -- Bufferline
  use { 'akinsho/nvim-bufferline.lua' }

  -- Statusline
  use { 'hoob3rt/lualine.nvim' }

  -- TreeSitter
  use { 'nvim-treesitter/nvim-treesitter' }

  -- Colorizer (for highlighting color codes)
  use { 'norcalli/nvim-colorizer.lua' }

  -- VsCode like pictograms
  use { 'onsails/lspkind-nvim' }

  -- Startup screen
  use { "glepnir/dashboard-nvim" }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/nvim-compe' }

  use { 'andweeb/presence.nvim', run = "GlowInstall" }

  -- Terminal
  use {"akinsho/nvim-toggleterm.lua"}

  require('plugins/material')
  require('plugins/nvim-tree')
  require('plugins/bufferline')
  require('plugins/lualine')
  require('plugins/treesitter')
  require('plugins/compe')
  require('plugins/lspkind')
  require('plugins/colorize')
  require('plugins/dashboard')
  require('plugins/presence')
  require('plugins/toggleterm')
end )
