local present, surround = pcall(require, "surround")
if not present then
  return
end

local surround_config = {}

local config = require("user_settings").config
if config.surround then
  for k, v in pairs(config.surround) do
    surround_config[k] = v
  end
end

surround.setup(surround_config)
