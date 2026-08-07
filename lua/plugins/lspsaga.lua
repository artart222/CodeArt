local lspsaga = require("utils").safe_require("lspsaga")
if not lspsaga then
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
  lspsaga_config = vim.tbl_deep_extend("force", lspsaga_config, config.lspsaga)
end

lspsaga.setup(lspsaga_config)
