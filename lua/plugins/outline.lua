local present, outline = pcall(require, "outline")
if not present then
  return
end

local outline_config = {
  outline_window = {
    position = "right",
    width = 30,
  },
}

local config = require("user_settings").config
if config.outline then
  for k, v in pairs(config.outline) do
    outline_config[k] = v
  end
end

outline.setup(outline_config)
