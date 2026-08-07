local autotag = require("utils").safe_require("nvim-ts-autotag")
if not autotag then
  return
end

local autotag_config = {}

local config = require("user_settings").config
if config.nvim_ts_autotag then
  autotag_config = vim.tbl_deep_extend("force", autotag_config, config.nvim_ts_autotag)
end

autotag.setup(autotag_config)
