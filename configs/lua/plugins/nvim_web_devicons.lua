local present, devicons = pcall(require, "nvim-web-devicons")
if not present then
  return
end

local devicons_config = {}

local config = require("user_settings")
if config.nvim_web_devicons then
  for k, v in pairs(config.nvim_web_devicons) do
    devicons_config[k] = v
  end
end

devicons.setup(devicons_config)
