local present, color = pcall(require, "colorizer")
if not present then
  return
end

local colorizer_config = {
  "*",
  css = { rgb_fn = true },
}

local config = require("user_settings")
if config.colorizer then
  for k, v in pairs(config.colorizer) do
    colorizer_config[k] = v
  end
end

color.setup(colorizer_config)
