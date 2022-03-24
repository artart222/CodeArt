local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = function(client, bufnr)
      require("lsp_signature").on_attach({
        hint_prefix = "",
      })
      require("aerial").on_attach(client, bufnr)
    end,
  }
  server:setup(
    opts,
    { capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()) }
  )
  vim.cmd([[ do User LspAttachBuffers ]])
end)
