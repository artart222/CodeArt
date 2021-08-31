require("toggleterm").setup{
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true, -- close the terminal window when the process exits
  float_opts = {
    border = 'curved',
    width = 120,
    height = 40,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}

-- Don't show status line on vim terminals
vim.cmd [[ au TermOpen term://* setlocal nonumber laststatus=0 ]]