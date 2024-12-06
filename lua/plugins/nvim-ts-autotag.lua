local present, autotag = pcall(require, "nvim-ts-autotag")
if not present then
  return
end

local autotag_config = {}

local config = require("user_settings")
if config.cmp then
  for k, v in pairs(config.cmp) do
    autotag_config[k] = v
  end
end

autotag.setup(autotag_config)
