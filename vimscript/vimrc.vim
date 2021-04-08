" Artin Mobasher(artart222) vimrc configuration
"
"                         ███████████████████████████
"                         ███████▀▀▀░░░░░░░▀▀▀███████
"                         ████▀░░░░░░░░░░░░░░░░░▀████
"                         ███│░░░░░░░░░░░░░░░░░░░│███
"                         ██▌│░░░░░░░░░░░░░░░░░░░│▐██
"                         ██░└┐░░░░░░░░░░░░░░░░░┌┘░██
"                         ██░░└┐░░░░░░░░░░░░░░░┌┘░░██
"                         ██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██
"                         ██▌░│██████▌░░░▐██████│░▐██
"                         ███░│▐███▀▀░░▄░░▀▀███▌│░███
"                         ██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██
"                         ██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██
"                         ████▄─┘██▌░░░░░░░▐██└─▄████
"                         █████░░▐█─┬┬┬┬┬┬┬─█▌░░█████
"                         ████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████
"                         █████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████
"                         ███████▄░░░░░░░░░░░▄███████
"                         ██████████▄▄▄▄▄▄▄██████████
"                         ███████████████████████████
"



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
"==================================================================================================



" General settings

set encoding=utf-8

syntax on

" Show line number and additional info
set number
set relativenumber
set ruler
set laststatus=2

set cursorline

set mouse=a " Enable mouse usage in all modes

set hlsearch " Enable search highlighting
set incsearch " With incsearch even when you dont press enter vim show the word that match to your search
nnoremap <CR> :noh<CR><CR>

" Fix spliting
set splitbelow splitright

" Somethimes if you try to delete a character in insert mode with backspace it may not work
" for fixing this problem you must have this line
set backspace=indent,eol,start

" terminal Bi-directionality "this allows to write in languages that are from right to left (like arabic or persian)
set termbidi

" Split navigations
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>

" Buffer resizing shorcuts
nmap <S-h> :vertical resize +5<CR>
nmap <S-l> :vertical resize -5<CR>
nmap <S-k> :resize -5<CR>
nmap <S-j> :resize +5<CR>

nmap <C-F> :RnvimrToggle <CR>

nmap <C-O> :MaximizerToggle<CR>

let g:nerdtree_tabs_open_on_console_startup=1
"==================================================================================================



" Theme and interface settings

set noshowmode
set showtabline=2

" Enable 24 bit collor support
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"

let base16colorspace=256  " Access colors present in 256 colorspace

" Enabling true color support
set termguicolors

colorscheme palenight


" Change the cursor from char block to pre pipe line
set guicursor=i:ver100-iCursor
set guicursor=n:ver100-iCursor
set guicursor=v:ver100-iCursor
set guicursor=c:ver100-iCursor
set guicursor=a:ver100-iCursor

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:onedark_hide_endofbuffer = 1
let g:onedark_termcolors = 256
"==================================================================================================



" Generic programming settings

setlocal foldmethod=indent " Enable folding

set foldlevel=99 " When you open file all folds are open.

" Set space for opening and closing folds
nmap <space> za

let g:searchtasks_list=["TODO", "FIXME", "XXX", "HACK", "FIXME", "BUG"] " List occurrences for search

" Set Ctrl+t for searching for tasks of open file.
nmap <C-T> :SearchTasks ./% <CR>

" Open/Close NerdTree with pressing F2
nmap nt :NERDTreeToggle<CR>

" Open/Close tag viwer with pressing F3
nmap tb :TagbarToggle<cr>

" Open terminal with pressing F4
if has ("nvim")
    nmap <F4> :vsplit <BAR> term <CR>
    autocmd TermOpen * startinsert
else
    nmap <F4> :vertical term <CR>
endif

" Run make command with pressing Ctrl + m
nmap <leader> <C-m> :make <BAR> copen<CR>
" Strip bad white space of file with pressing Ctrl + S
nmap <C-S> :StripWhitespace<CR>
"==================================================================================================



" Airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
"==================================================================================================



" Header settings

nmap <F12> :AddHeader <CR>
let g:header_auto_add_header = 0

let g:header_field_author = "Artin Mobasher (artart222)"
let g:header_field_author_email = "mobasherartin.icm@gmail.com"
let g:header_field_license_id = "MIT"

let g:header_max_size = 100
let g:header_cfg_comment_char = "="
"==================================================================================================



" Git settings

let  g:NERDTreeGitStatusIndicatorMapCustom= {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusConcealBrackets = 1

" Show git logs with pressing leader+l
nmap gl :GV <CR>

" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1


" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" Add color to hunks
highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00
"==================================================================================================



" Debuger settings

nmap <F6> :! cp ~/.vim/spector-debugger-conf/vimspector.json .; mv vimspector.json .vimspector.json <CR> <Plug>VimspectorContinue <CR>

nmap <leader>dt <Plug>VimspectorStop()
nmap <leader>dr <Plug>VimspectorRestart
nmap <leader>dp <Plug>VimspectorPause()
nmap <leader>dtb <Plug>VimspectorToggleBreakpoint()
nmap <leader>do <Plug>VimspectorStepOver
nmap <leader>dj <Plug>VimspectorStepInto
nmap <leader>de <Plug>VimspectorStepOut
nmap <leader>rtc <Plug>VimspectorRunToCursor

:autocmd VImLeave * !rm .vimspector.json; rm ~/.vimspector.log ;clear <CR>
"==================================================================================================



" Markdown settings

let g:mkdp_path_to_chrome = ""
" Path to the chrome or the command to open chrome (or other modern browsers).
" If set, g:mkdp_browserfunc would be ignored.

let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
" Callback Vim function to open browser, the only parameter is the url to open.

let g:mkdp_auto_start = 0
" Set to 1, Vim will open the preview window on entering the Markdown
" buffer.

let g:mkdp_auto_open = 0
" Set to 1, Vim will automatically open the preview window when you edit a
" Markdown file.

let g:mkdp_auto_close = 1
" Set to 1, Vim will automatically close the current preview window when
" switching from one Markdown buffer to another.

let g:mkdp_refresh_slow = 0
" Set to 1, Vim will just refresh Markdown when saving the buffer or
" leaving from insert mode. With default 0, it will automatically refresh
" Markdown as you edit or move the cursor.

let g:mkdp_command_for_global = 0
" Set to 1, the MarkdownPreview command can be used for all files,
" by default it can only be used in Markdown files.

let g:mkdp_open_to_the_world = 0
" Set to 1, the preview server will be available to others in your network.
" By default, the server only listens on localhost (127.0.0.1).
"==================================================================================================



" nerdcommenter settings

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
"==================================================================================================



" C++ highlighting settings
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
"==================================================================================================



" Ranger (file manager) settings

let g:rnvimr_enable_ex = 1
let g:rnvimr_draw_border = 0
let g:rnvimr_shadow_winblend = 60
let g:rnvimr_ranger_cmd = 'ranger --cmd="set draw_borders both"'
highlight link RnvimrNormal CursorLine
"==================================================================================================



" Programming languages settings.

" Python, C#, C/C++, header files
au BufNewFile,BufRead *py,*cpp,*cs,*c,*h,*json
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

let python_highlight_all=1
autocmd BufNewFile,BufRead *py nmap <buffer> <F5> :w <CR>:exec '!clear; python' shellescape(@%, 1)<CR>
autocmd BufNewFile,BufRead *py setlocal foldmethod=indent

autocmd BufNewFile,BufRead *cs nmap <buffer> <F5> :w <bar> !clear && mcs % && mono %:r.exe<CR>

" autocmd BufNewFile *.cpp 0r ~/.vim/template/temp.cpp
autocmd BufNewFile,BufRead *cpp nmap <buffer> <F5> :w <bar>!clear && g++ -o %:r % && ./%:r<CR>
autocmd BufNewFile,BufRead *cpp setlocal foldmethod=indent

" Makefile
au BufNewFile,BufRead Makefile
    \ set tabstop=8 |
    \ set softtabstop=8 |
    \ set shiftwidth=8 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Html and css
au BufNewFile,BufRead *.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
autocmd BufNewFile,BufRead *html,*.css nmap <buffer> <F5> :w <bar> :!clear; google-chrome-stable % <CR>

" Ui
au BufNewFile,BufRead *.ui
    \ set tabstop=1 |
    \ set softtabstop=1 |
    \ set shiftwidth=1 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
autocmd BufNewFile,BufRead *ui nmap <buffer> <F5> :w <bar> :!clear; pyuic5 -p % <CR>

" Markdown
autocmd BufNewFile,BufRead *md nmap <buffer> <F5> :w
autocmd BufNewFile,BufRead *md nmap <buffer> <S-F5> :w
autocmd BufNewFile,BufRead *md nmap <buffer> <F5> <Plug>MarkdownPreview
autocmd BufNewFile,BufRead *md nmap <buffer> <S-F5> <Plug>StopMarkdownPreview
"==================================================================================================



" Artin Mobasher(artart222) vimrc configuration
