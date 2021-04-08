" Plugin settings


" Required settings
set nocompatible              " required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'gmarik/Vundle.vim'
" Utility
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'PhilRunninger/nerdtree-visual-selection'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'alpertuna/vim-header'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'xolox/vim-misc'
Plugin 'kevinhwang91/rnvimr'
Plugin 'szw/vim-maximizer'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'neoclide/coc.nvim'
Plugin 'voldikss/vim-floaterm'
Plugin 'junegunn/fzf'

" Generic programming support
Plugin 'puremourning/vimspector'
Plugin 'majutsushi/tagbar'
Plugin 'gilsondev/searchtasks.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'preservim/nerdcommenter'
Plugin 'vim-scripts/a.vim'
Plugin 'vhdirk/vim-cmake'

" C++
Plugin 'octol/vim-cpp-enhanced-highlight'

" Markdown
Plugin 'iamcco/markdown-preview.vim'
Plugin 'iamcco/mathjax-support-for-mkdp'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mhinz/vim-signify'
Plugin 'junegunn/gv.vim'

" Themes/Interface
Plugin 'joshdick/onedark.vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'KeitaNakamura/neodark.vim'
Plugin 'kyazdani42/nvim-web-devicons'

" Css
Plugin 'ap/vim-css-color'

" Html
Plugin 'alvan/vim-closetag'


" All of your Plugs must be added before the following line
call vundle#end()
filetype plugin indent on    " required
