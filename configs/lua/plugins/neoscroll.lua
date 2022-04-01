local present, neoscroll_setup = pcall(require, "neoscroll")
if not present then
  return
end

local neoscroll_config = {}

local config = require("user_settings")
if config.neoscroll then
  for k, v in pairs(config.neoscroll) do
    neoscroll_config[k] = v
  end
end

neoscroll_setup.setup(neoscroll_config)
