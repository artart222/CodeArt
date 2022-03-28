local present, better_escape_setup = pcall(require, "better_escape")
if not present then
  return
end

local better_escape_config = { clear_empty_lines = true }

local config = require("user_settings")
if config.better_escape then
  for k, v in pairs(config.better_escape) do
    better_escape_config[k] = v
  end
end

better_escape_setup.setup(better_escape_config)
