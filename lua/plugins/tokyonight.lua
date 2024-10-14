local present, tokyonight = pcall(require, "tokyonight")
if not present then
  return
end

local tokyonight_config = {
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
}

local config = require("user_settings")
if config.tokyonigh then
  for k, v in pairs(config.tokyonigh) do
    tokyonight_config[k] = v
  end
end

tokyonight.setup(tokyonight_config)
