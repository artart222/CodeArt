"Artin Mobasher(artart222) vimrc configuration"



"Required settings
set nocompatible              " required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'



"Utility
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'xolox/vim-misc'
Plugin 'alpertuna/vim-header'

"Generic programming support
Plugin 'vim-scripts/AutoComplPop'
Plugin 'puremourning/vimspector'
Plugin 'majutsushi/tagbar'
Plugin 'gilsondev/searchtasks.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'preservim/nerdcommenter'

"Python
Plugin 'vim-scripts/indentpython.vim'

"C++
Plugin 'octol/vim-cpp-enhanced-highlight'

"markdown
Plugin 'iamcco/markdown-preview.vim'
Plugin 'iamcco/mathjax-support-for-mkdp'

"Git
Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kablamo/vim-git-log'

"Themes / Interface
Plugin 'joshdick/onedark.vim'
Plugin 'ryanoasis/vim-devicons'

"Css
Plugin 'ap/vim-css-color'

"All of your Plugs must be added before the following line
call vundle#end()
filetype plugin indent on    " required
"==================================================================================================



"General settings

set encoding=utf-8

syntax on

set laststatus=2 "Always display the status line

"Show linenumbers
set number
set ruler

"set mouse=a "Enable mouse usage in all modes
set hlsearch "Enable search highlighting
set incsearch "With incsearch even when you dont press enter vim show the word that match to your search even when you dont press enter vim show the word

set splitbelow
set splitright

au VimEnter *  NERDTree "Open NERDTree on startup

"Somethimes if you try to delete a character in insert mode with backspace it may not work
"for fixing this problem you must have this line
set backspace=indent,eol,start

"terminal Bi-directionality "this allows to write in languages that are from right to left
set termbidi

"split navigations
"^Ctrl+J move to the split to below
nnoremap <C-J> <C-W><C-J>
"^Ctrl+K move to the split above
nnoremap <C-K> <C-W><C-K>
"^Ctrl+L move to the split right
nnoremap <C-L> <C-W><C-L>
"^Ctrl+H move to the split to the left
nnoremap <C-H> <C-W><C-H>
"Set leader+r to refresh files showed in NERDTree
nmap <Leader>r :NERDTreeRefreshRoot<cr> \| R \| <c-w><c-p>

"set viminfo+=n~/.cache/viminfo if you uncomment this viminfo file(history file of vim) will save to cache directory
"uncomment this only if you have macOs or linux deivce
"==================================================================================================



"Theme and interface settings

let base16colorspace=256  "Access colors present in 256 colorspace

"Enabling true color support
if (has("termguicolors"))
  set termguicolors
endif

colorscheme onedark

"Set Shift+F8 key for switching to the previous colorschemes
nmap <S-F8> :PrevColorScheme<CR>
"Set Ctrl+F8> key for switching to the random colorscheme
nmap <C-F8> :RandomColorScheme<CR>
"Set airline font.
let g:airline_powerline_fonts = 1
"==================================================================================================



"Generic programming settings

setlocal foldmethod=indent "Enable folding

set foldlevel=99 "When you open file all folds are open.

"Set space for opening and closing folds
nnoremap <space> za

let g:searchtasks_list=["TODO", "FIXME", "XXX", "HACK", "FIXME", "BUG"] " List occurrences for search
"Set Ctrl+t for searching for tasks of open file.
nmap <C-T> :SearchTasks ./%<CR>

"Open/Close NerdTree with pressing F2
nmap <F2> :NERDTreeToggle<CR>
"This Close NerdTree if it was only open tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Open/Close tag viwer with pressing F3
nmap <F3> :TagbarToggle<CR>
"Open terminal with pressing F4
nmap <F4> :terminal<CR>
"Run make command with pressing Ctrl + F5
nnoremap <C-F5> :w <bar>!clear; make<CR>
"Strip bad white space of file with pressing Ctrl + S
nmap <C-S> :StripWhitespace<CR>
"==================================================================================================



"Header settings

map <F12> :AddHeader<CR>
let g:header_auto_add_header = 0

let g:header_field_author = "your name"
let g:header_field_author_email = "your email"
let g:header_field_copyright = "© your copyright"
let g:header_field_license_id = "your license"

let g:header_max_size = 100
let g:header_cfg_comment_char = "="
"==================================================================================================



"Git settings

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

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

"Show git logs with pressing leader+l
nmap <leader>l :GitLog<CR>
"==================================================================================================



"Debuger settings

nmap <F6> :! cp ~/.vim/spector-debugger-conf/vimspector.json .; mv vimspector.json .vimspector.json <CR> <Plug>VimspectorContinue <CR> :!rm .vimspector.json<CR>

nmap <F6> <Plug>VimspectorContinue
nmap <S-F6> <Plug>VimspectorStop
nmap <C-S-F6> <Plug>VimspectorRestart
nmap <F7> <Plug> VimspectorPause
nmap <F9> <Plug> VimspectorToggleBreakpoint
nmap <S-F9> <Plug> VimspectorToggleConditionalBreakpoint
nmap <C-F9> <Plug> VimspectorAddFunctionBreakpoint
nmap <F10> <Plug> VimspectorStepOver
nmap <S-F10> <Plug> VimspectorStepInto
nmap <C-F10> <Plug> VimspectorStepOut
nmap <F11> <Plug> VimspectorRunToCursor

:autocmd BufWinLeave * !rm .vimspector.json; rm ~/.vimspector.log ;clear
"==================================================================================================



"Markdown settings

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



"Programming languages settings.

"Python
au BufNewFile,BufRead *py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
let python_highlight_all=1
autocmd BufNewFile,BufRead *py map <buffer> <F5> :w <CR>:exec '!clear; python' shellescape(@%, 1)<CR>

"C#
au BufNewFile,BufRead *cs
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
autocmd BufNewFile,BufRead *cs nmap <buffer> <F5> :w <bar> !clear && mcs % && mono %:r.exe<CR>

"C++
au BufNewFile,BufRead *.cpp
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
autocmd BufNewFile *.cpp 0r ~/.vim/template/temp.cpp
autocmd BufNewFile,BufRead *cpp nmap <buffer> <F5> :w <bar>!clear && g++ -o %:r % && ./%:r<CR>

"Html and css
au BufNewFile,BufRead *.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
autocmd BufNewFile,BufRead *html,*.css nmap <buffer> <F5> :w <bar> :!clear; google-chrome-stable % <CR>

"Ui
au BufNewFile,BufRead *.ui
    \ set tabstop=1 |
    \ set softtabstop=1 |
    \ set shiftwidth=1 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
autocmd BufNewFile,BufRead *ui nmap <buffer> <F5> :w <bar> :!clear; pyuic5 -p % <CR>

"Md
autocmd BufNewFile,BufRead *md nmap <buffer> <F5> :w
autocmd BufNewFile,BufRead *md nmap <buffer> <S-F5> :w
autocmd BufNewFile,BufRead *md nmap <buffer> <F5> <Plug>MarkdownPreview
autocmd BufNewFile,BufRead *md nmap <buffer> <S-F5> <Plug>StopMarkdownPreview

"doc, docx, rtf, odp, odt
autocmd BufNewFile,BufRead *.doc,*.docx,*.rtf,*.odp,*.odt silent %!pandoc "%" -tplain -o /dev/stdout
"==================================================================================================



"Artin Mobasher(artart222) vimrc Configuration
