local scrollview = require("utils").safe_require("scrollview")
if not scrollview then
  return
end

local scrollview_config = {

  excluded_filetypes = { "nerdtree", "vista_kind", "Outline" },
  signs_on_startup = {},
  diagnostics_severities = { vim.diagnostic.severity.ERROR },
}

local config = require("user_settings").config
if config.scrollview then
  scrollview_config = vim.tbl_deep_extend("force", scrollview_config, config.scrollview)
end

scrollview.setup(scrollview_config)
