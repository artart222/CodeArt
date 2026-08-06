local present, ts_context_commentstring = pcall(require, "ts_context_commentstring")
if not present then
  return
end

local ts_context_commentstring_config = {
  enable_autocmd = false,
}

local config = require("user_settings").config
if config.ts_context_commentstring then
  for k, v in pairs(config.ts_context_commentstring) do
    ts_context_commentstring_config[k] = v
  end
end

ts_context_commentstring.setup(ts_context_commentstring_config)
