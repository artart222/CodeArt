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
