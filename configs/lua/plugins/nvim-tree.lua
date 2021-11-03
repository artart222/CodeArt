local present, nvimtree = pcall(require, 'nvim-tree')
if not present then
    return
end

-- Set alias for vim.g.
local g = vim.g

g.nvim_tree_ignore = { '.git', 'node_modules', '.cache', '__pycache__'} -- Ignore these types in listing.
g.nvim_tree_auto_ignore_ft = { 'dashboard' } -- Don't open tree on specific fiypes.
g.nvim_tree_quit_on_open = 0 -- closes tree when file's opened.
g.nvim_tree_indent_markers = 1 -- This option shows indent markers when folders are open.
g.nvim_tree_hide_dotfiles = 1 -- This option hides files and folders starting with a dot `.`.
g.nvim_tree_git_hl = 1 -- Will enable file highlight for git attributes (can be used without the icons).
g.nvim_tree_highlight_opened_files = 0 -- Will enable folder and file icon highlight for opened files/directories.
g.nvim_tree_add_trailing = 0 -- Append a trailing slash to folder names. ]]

nvimtree.setup {
  auto_close = false,
  open_on_tab = false,
  update_cwd = true,
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  view = {
    width = "20%",
    side = "left",
  }
}

-- Hide statusline in nvim-tree buffer/tabs.
vim.cmd('au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname("%") == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif')
