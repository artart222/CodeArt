local utils = require("utils")
local gitsigns = utils.safe_require("gitsigns")
if not gitsigns then
  return
end

utils.warn_missing_executable(
  "git",
  "gitsigns: `git` was not found on PATH.\n" .. "Install git so signs, blame, and hunk actions work."
)

-- TODO: complete setting file.
local gitsigns_config = {
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  attach_to_untracked = true,
  current_line_blame = false,
  sign_priority = 1,
  update_debounce = 100,
  max_file_length = 40000,
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "│" },
    topdelete = { text = "│" },
    changedelete = { text = "│" },
    untracked = { text = "│" },
  },
}

-- TODO: make better user settings file.
local config = require("user_settings").config
if config.gitsigns then
  gitsigns_config = vim.tbl_deep_extend("force", gitsigns_config, config.gitsigns)
end

gitsigns.setup(gitsigns_config)
