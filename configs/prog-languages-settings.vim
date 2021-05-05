" Programming languages settings.


" Python, C#, C/C++, header files
au BufNewFile,BufRead *py,*cpp,*cs,*c,*h,*json
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformats=unix,dos,mac

let python_highlight_all=1
autocmd BufNewFile,BufRead *py nnoremap <buffer> <F5> :w <CR> :vs <CR> :term python3 % <CR>
autocmd BufNewFile,BufRead *py setlocal foldmethod=indent

autocmd BufNewFile,BufRead *cs nmap <buffer> <F5> :w <bar> !clear && mcs % && mono %:r.exe<CR>

" autocmd BufNewFile *.cpp 0r ~/.vim/template/temp.cpp
autocmd BufNewFile,BufRead *cpp nnoremap <buffer> <F5> :w <bar> :vs <CR> :term g++ -o %:r % && ./%:r<CR>
autocmd BufNewFile,BufRead *cpp setlocal foldmethod=indent

" Makefile
au BufNewFile,BufRead Makefile
    \ set tabstop=8 |
    \ set softtabstop=8 |
    \ set shiftwidth=8 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformats=unix,dos,mac

" Html and css
au BufNewFile,BufRead *.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformats=unix,dos,mac
autocmd BufNewFile,BufRead *html,*.css nmap <buffer> <F5> :w <bar> :!clear; google-chrome-stable % <CR>

" Ui
au BufNewFile,BufRead *.ui
    \ set tabstop=1 |
    \ set softtabstop=1 |
    \ set shiftwidth=1 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformats=unix,dos,mac
autocmd BufNewFile,BufRead *ui nmap <buffer> <F5> :w <bar> :!clear; pyuic5 -p % <CR>

" Vim script
au BufNewFile,BufRead *.vim
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformats=unix,dos,mac

" Markdown
au BufNewFile,BufRead *.md
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformats=unix,dos,mac
autocmd BufNewFile,BufRead *md nmap <buffer> <F5> :w
autocmd BufNewFile,BufRead *md nmap <buffer> <S-F5> :w
autocmd BufNewFile,BufRead *md nmap <buffer> <F5> <Plug>MarkdownPreview
autocmd BufNewFile,BufRead *md nmap <buffer> <S-F5> <Plug>StopMarkdownPreview
