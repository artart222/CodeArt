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
