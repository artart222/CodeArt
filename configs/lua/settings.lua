cmd('syntax on')

opt.number = true
opt.relativenumber = true
opt.ruler = true
opt.laststatus = 2
opt.hidden = true

opt.cursorline = true

opt.clipboard = 'unnamedplus'

opt.mouse = 'a'

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.ttimeoutlen = 20
opt.timeoutlen = 1000

opt.splitbelow = true
opt.splitright = true

opt.backspace = 'indent,eol,start'

opt.termbidi = true

cmd([[
    augroup help_config
        autocmd!
        autocmd FileType help :set number
        autocmd FileType help :only
    augroup END 
]])
