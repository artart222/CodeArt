local present, dap = pcall(require, "dap")
if not present then
  return
end

if
  require("utils").is_plugin_installed("toggleterm.nvim") and not require("user_settings").disable_plugins.toggleterm
then
  dap.defaults.fallback.terminal_win_cmd = "ToggleTerm"
end

vim.fn.sign_define("DapBreakpoint", { text = "● ", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "● ", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "● ", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "→ ", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointReject", { text = "●", texthl = "DiagnosticSignHint", linehl = "", numhl = "" })
