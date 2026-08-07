local present, neoscroll = pcall(require, "neoscroll")
if not present then
  return
end

local neoscroll_config = {}

local config = require("user_settings").config
if config.neoscroll then
  neoscroll_config = vim.tbl_deep_extend("force", neoscroll_config, config.neoscroll)
end

neoscroll.setup(neoscroll_config)
