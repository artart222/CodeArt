local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

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
local config = require("user_settings")
if config.gitsigns then
  for k, v in pairs(config.gitsigns) do
    gitsigns_config[k] = v
  end
end

gitsigns.setup(gitsigns_config)
