-- Set alias for vim.g.
local g = vim.g

g.nvim_tree_side = "left" -- set nvim-tree to left side.
g.nvim_tree_width = 25 -- Set width's of nvim-tree.
g.nvim_tree_ignore = {".git", "node_modules", ".cache", "__pycache__"} -- Ignore these types in listing.
g.nvim_tree_gitignore = 1 -- Enable gitignore.
g.nvim_tree_auto_ignore_ft = {"dashboard"} -- Don't open tree on specific fiypes.

g.nvim_tree_auto_open = 0    -- Disable auto open.
g.nvim_tree_auto_close = 0   -- closes tree when it's the last window.
g.nvim_tree_quit_on_open = 0 -- closes tree when file's opened.
-- Auto open nvim-tree when writing (nvim .) in command line.
vim.cmd
[[
  if index(argv(), ".") >= 0
    let g:nvim_tree_auto_open = 1
  endif
  let g:nvim_tree_auto_close = 0
]]

g.nvim_tree_follow = 1 -- This option allows the cursor to be updated when entering a buffer.
g.nvim_tree_indent_markers = 1 -- This option shows indent markers when folders are open.
g.nvim_tree_hide_dotfiles = 1 -- This option hides files and folders starting with a dot `.`.
g.nvim_tree_git_hl = 1 -- Will enable file highlight for git attributes (can be used without the icons).
g.nvim_tree_highlight_opened_files = 0 -- Will enable folder and file icon highlight for opened files/directories.
g.nvim_tree_tab_open = 0 -- Will not open the tree when entering a new tab and the tree was previously open.
g.nvim_tree_allow_resize = 1 -- Will resize the tree to its saved width when opening a file.
g.nvim_tree_add_trailing = 0 -- Append a trailing slash to folder names.
g.nvim_tree_update_cwd = 1 -- will update the tree cwd when changing nvim's directory (DirChanged event).


-- Hide statusline in nvim-tree buffer/tabs.
vim.cmd [[au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif]]
