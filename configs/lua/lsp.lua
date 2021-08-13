local lsp = require('lspconfig')

-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Html/css
require'lspconfig'.html.setup { capabilities = capabilities }
require'lspconfig'.cssls.setup { capabilities = capabilities }

-- C/CPP/Objective-C
require'lspconfig'.ccls.setup{}

-- Python
require'lspconfig'.pylsp.setup{}

-- Javascript
require'lspconfig'.denols.setup {}

-- Lua-dev
local luadev = require("lua-dev").setup()
local lspconfig = require('lspconfig')
lspconfig.sumneko_lua.setup(luadev)
