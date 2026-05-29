local lsp_utils = require("plugins.lsp.utils")

local function get_capabilities()
  if require("utils").is_plugin_installed("blink.cmp") then
    return require("blink.cmp").get_lsp_capabilities()
  end
  return vim.lsp.protocol.make_client_capabilities()
end

local M = {}

M.lsp_config = {
  on_attach = function(client, bufnr)
    if require("utils").is_plugin_installed("lsp_signature.nvim") then
      require("lsp_signature").on_attach({
        hint_prefix = "",
      })
    end

    if lsp_utils.has_conform_formatter(bufnr) then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end

    if client.name == "clangd" then
      client.offset_encoding = "utf-16"
    end
  end,
  capabilities = get_capabilities(),
}

vim.diagnostic.config({
  virtual_text = false,
})

if require("user_settings").config.lsp ~= nil then
  require("user_settings").config.lsp()
end

return M
