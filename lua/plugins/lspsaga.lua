local present, lspsaga = pcall(require, "lspsaga")
if not present then
  return
end

local lspsaga_config = {
  ui = {
    border = "single",
    devicon = true,
    title = true,
  },
  symbol_in_winbar = {
    enable = false,
  },
  beacon = {
    enable = true,
  },
}

local config = require("user_settings").config
if config.lspsaga then
  for k, v in pairs(config.lspsaga) do
    lspsaga_config[k] = v
  end
end

lspsaga.setup(lspsaga_config)
