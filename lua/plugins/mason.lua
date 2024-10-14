local present, mason = pcall(require, "mason")
if not present then
  return
end

local mason_config = {
  ui = {
    border = "single",
  },
}

local config = require("user_settings")
if config.mason then
  for k, v in pairs(config.mason) do
    mason_config[k] = v
  end
end

mason.setup(mason_config)
