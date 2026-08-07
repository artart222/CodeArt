local present, ts_context_commentstring = pcall(require, "ts_context_commentstring")
if not present then
  return
end

local ts_context_commentstring_config = {
  enable_autocmd = false,
}

local config = require("user_settings").config
if config.ts_context_commentstring then
  ts_context_commentstring_config =
    vim.tbl_deep_extend("force", ts_context_commentstring_config, config.ts_context_commentstring)
end

ts_context_commentstring.setup(ts_context_commentstring_config)
