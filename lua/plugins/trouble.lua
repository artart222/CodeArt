local trouble = require("utils").safe_require("trouble")
if not trouble then
  return
end

local trouble_config = {}

local config = require("user_settings").config
if config.trouble then
  trouble_config = vim.tbl_deep_extend("force", trouble_config, config.trouble)
end

trouble.setup(trouble_config)
