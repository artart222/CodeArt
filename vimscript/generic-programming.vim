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

