-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Html/css
require'lspconfig'.html.setup { capabilities = capabilities }
require'lspconfig'.cssls.setup { capabilities = capabilities }

-- C/CPP/Objective-C
require'lspconfig'.clangd.setup{}

-- Python
require'lspconfig'.pyright.setup{}

-- Javascript
require'lspconfig'.denols.setup {}

-- Lua
local luadev = require("lua-dev").setup {
  lspconfig = {
    cmd = {"lua-language-server"}
  },
}
local lspconfig = require('lspconfig')
lspconfig.sumneko_lua.setup(luadev)

-- Rust
require'lspconfig'.rust_analyzer.setup {}

-- C# (omnisharp)
require'lspconfig'.omnisharp.setup {}


local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
