-- Apply vim.lsp.config / LspAttach before enabling Mason-installed servers.
require("plugins.lsp.lsp")

local present, mason_lspconfig = pcall(require, "mason-lspconfig")
if not present then
  return
end

local mason_lspconfig_config = {
  automatic_enable = true,
}

local config = require("user_settings").config
if config.mason_lspconfig then
  for k, v in pairs(config.mason_lspconfig) do
    mason_lspconfig_config[k] = v
  end
end

mason_lspconfig.setup(mason_lspconfig_config)

return mason_lspconfig
