if vim.g.codeart_lsp_loaded then
  return
end
vim.g.codeart_lsp_loaded = true

local lsp_utils = require("plugins.lsp.utils")

local function get_capabilities()
  if require("utils").is_plugin_installed("blink.cmp") then
    return require("blink.cmp").get_lsp_capabilities()
  end
  return vim.lsp.protocol.make_client_capabilities()
end

vim.lsp.config("*", {
  capabilities = get_capabilities(),
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("CodeArtLspAttach", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end

    local bufnr = args.buf

    if require("utils").is_plugin_installed("lsp_signature.nvim") then
      require("lsp_signature").on_attach({
        hint_prefix = "",
      }, bufnr)
    end

    if lsp_utils.has_conform_formatter(bufnr) then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end
  end,
})

vim.diagnostic.config({
  virtual_text = false,
})

if require("user_settings").config.lsp ~= nil then
  require("user_settings").config.lsp()
end
