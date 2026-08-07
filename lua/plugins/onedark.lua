local onedark = require("utils").safe_require("onedark")
if not onedark then
  return
end

local onedark_config = {
  -- Main options --
  style = "deep", -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
  toggle_style_key = "<leader>co", -- Default keybinding to toggle
  term_colors = true,
  code_style = {
    comments = "italic",
    keywords = "none",
    functions = "none",
    strings = "none",
    variables = "none",
  },
  -- Plugins Config --
  diagnostics = {
    darker = true, -- darker colors for diagnostic
    undercurl = true, -- use undercurl instead of underline for diagnostics
    background = true, -- use background color for virtual text
  },
}

-- TODO: make better user settings file.
local config = require("user_settings").config
if config.onedark then
  onedark_config = vim.tbl_deep_extend("force", onedark_config, config.onedark)
end

onedark.setup(onedark_config)
