local devicons = require("utils").safe_require("nvim-web-devicons")
if not devicons then
  return
end

local devicons_config = {}

local config = require("user_settings").config
if config.nvim_web_devicons then
  devicons_config = vim.tbl_deep_extend("force", devicons_config, config.nvim_web_devicons)
end

devicons.setup(devicons_config)
