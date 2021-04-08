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
