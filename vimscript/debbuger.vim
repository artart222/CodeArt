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
