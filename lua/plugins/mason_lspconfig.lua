-- Apply vim.lsp.config / LspAttach before enabling Mason-installed servers.
require("plugins.lsp.lsp")

local mason_lspconfig = require("utils").safe_require("mason-lspconfig")
if not mason_lspconfig then
  return
end

local mason_lspconfig_config = {
  automatic_enable = true,
}

local config = require("user_settings").config
if config.mason_lspconfig then
  mason_lspconfig_config = vim.tbl_deep_extend("force", mason_lspconfig_config, config.mason_lspconfig)
end

mason_lspconfig.setup(mason_lspconfig_config)

return mason_lspconfig
