local status_ok, scrollview = pcall(require, "scrollview")
if not status_ok then
  return
end

local scrollview_config = {

  excluded_filetypes = { "nerdtree", "vista_kind", "Outline" },
  signs_on_startup = {},
  diagnostics_severities = { vim.diagnostic.severity.ERROR },
}

local config = require("user_settings")
if config.scrollview then
  for k, v in pairs(config.scrollview) do
    scrollview_config[k] = v
  end
end

scrollview.setup(scrollview_config)
