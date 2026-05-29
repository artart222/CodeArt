local present, conform = pcall(require, "conform")
if not present then
  return
end

local conform_config = {
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    rust = { "rustfmt" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    toml = { "taplo" },
    sh = { "shfmt" },
    bash = { "shfmt" },
  },
  formatters = {
    shfmt = {
      args = { "-i", "2", "-ci", "-bn", "-w", "$FILENAME" },
    },
  },
}

local config = require("user_settings").config
if config.conform then
  for k, v in pairs(config.conform) do
    conform_config[k] = v
  end
end

conform.setup(conform_config)
