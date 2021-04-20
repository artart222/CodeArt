" Plug settings


" Required settings
set nocompatible              " required
filetype off                  " required
call plug#begin('~/.config/nvim/autoload/plugged')


" Utility
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'alpertuna/vim-header'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'
Plug 'kevinhwang91/rnvimr'
Plug 'szw/vim-maximizer'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf'

" Generic programming support
Plug 'puremourning/vimspector'
Plug 'majutsushi/tagbar'
Plug 'gilsondev/searchtasks.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'vim-scripts/a.vim'
Plug 'vhdirk/vim-cmake'

" C++
Plug 'octol/vim-cpp-enhanced-highlight'

" Markdown
Plug 'iamcco/markdown-preview.vim'
Plug 'iamcco/mathjax-support-for-mkdp'

" Git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'

" Themes/Interface
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'KeitaNakamura/neodark.vim'
Plug 'kyazdani42/nvim-web-devicons'

" Css
Plug 'ap/vim-css-color'

" Html
Plug 'alvan/vim-closetag'


" All of your Plugs must be added before the following line
call plug#end()
filetype plugin indent on    " required
