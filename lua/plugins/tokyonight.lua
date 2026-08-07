local present, tokyonight = pcall(require, "tokyonight")
if not present then
  return
end

local tokyonight_config = {
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
}

local config = require("user_settings").config
if config.tokyonight then
  tokyonight_config = vim.tbl_deep_extend("force", tokyonight_config, config.tokyonight)
end

tokyonight.setup(tokyonight_config)
