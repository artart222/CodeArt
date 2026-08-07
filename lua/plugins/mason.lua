local mason = require("utils").safe_require("mason")
if not mason then
  return
end

local mason_config = {
  ui = {
    border = "single",
  },
}

local config = require("user_settings").config
if config.mason then
  mason_config = vim.tbl_deep_extend("force", mason_config, config.mason)
end

mason.setup(mason_config)
