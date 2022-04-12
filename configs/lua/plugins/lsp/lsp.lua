local utils = require("plugins.lualine.components")
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  opts.on_attach = function(client, bufnr)
    require("lsp_signature").on_attach({
      hint_prefix = "",
    })

    local formatters = require("plugins.lsp.utils")
    local client_filetypes = client.config.filetypes or {}
    for _, filetype in ipairs(client_filetypes) do
      if #vim.tbl_keys(formatters.list_registered_formatters(filetype)) > 0 then
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
      end
    end

    opts.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

    vim.cmd([[ do User LspAttachBuffers ]])
  end
  server:setup(opts)
end)
