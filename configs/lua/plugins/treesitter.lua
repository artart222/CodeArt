require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}

--cmd([[
--   set foldmethod=expr
--   set foldexpr=nvim_treesitter#foldexpr()
--]])
