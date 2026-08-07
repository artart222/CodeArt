local surround = require("utils").safe_require("nvim-surround")
if not surround then
  return
end

local surround_config = {}

local config = require("user_settings").config
if config.surround then
  surround_config = vim.tbl_deep_extend("force", surround_config, config.surround)
end

surround.setup(surround_config)
