local lsp = require('lspconfig')

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local omnisharp_bin = "/path/to/omnisharp-repo/run"
require'lspconfig'.omnisharp.setup{
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
}


require'lspconfig'.html.setup {
  capabilities = capabilities,
}
require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}
require'lspconfig'.denols.setup{}
lsp.ccls.setup {}
lsp.pylsp.setup {}
-- lspfuzzy.setup {}  -- Make the LSP client use FZF instead of the quickfix list
