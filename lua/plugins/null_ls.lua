local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

-- Check supported formatters
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

-- Check supported linters
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#code-actions
local code_actions = null_ls.builtins.code_actions

local null_ls_config = {
  debug = false,
  sources = {
    formatting.black,
    diagnostics.flake8,
    formatting.stylua,
    formatting.rustfmt,
    formatting.clang_format,
    formatting.prettier,
    formatting.taplo,
    diagnostics.shellcheck,
    diagnostics.zsh,
    formatting.shfmt.with({
      filetypes = { "sh", "bash" },
      command = "shfmt",
      args = {
        "-i",
        "2",
        "-ci",
        "-bn",
        "$FILENAME",
        "-w",
      },
    }),
  },
  -- This function is for format on save.
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
}

local config = require("user_settings")
if config.null_ls then
  for k, v in pairs(config.null_ls) do
    null_ls_config[k] = v
  end
end

null_ls.setup(null_ls_config)
