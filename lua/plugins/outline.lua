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
  outline_config = vim.tbl_deep_extend("force", outline_config, config.outline)
end

outline.setup(outline_config)
