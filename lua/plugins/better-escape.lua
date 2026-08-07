local better_escape = require("utils").safe_require("better_escape")
if not better_escape then
  return
end

local better_escape_config = { clear_empty_lines = true }

local config = require("user_settings").config
if config.better_escape then
  better_escape_config = vim.tbl_deep_extend("force", better_escape_config, config.better_escape)
end

better_escape.setup(better_escape_config)
