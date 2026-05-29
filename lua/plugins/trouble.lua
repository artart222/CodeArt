local present, trouble = pcall(require, "trouble")
if not present then
  return
end

local trouble_config = {}

local config = require("user_settings").config
if config.trouble then
  for k, v in pairs(config.trouble) do
    trouble_config[k] = v
  end
end

trouble.setup(trouble_config)
