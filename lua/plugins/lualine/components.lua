local M = {}

local lsp_utils = require("plugins.lsp.utils")

function M.lsp_progress(_)
  local status = vim.lsp.status()
  if type(status) == "string" and status ~= "" then
    return " " .. status
  end
  return ""
end

function M.treesitter_status(_)
  local b = vim.api.nvim_get_current_buf()
  local ok, parser = pcall(vim.treesitter.get_parser, b)
  if ok and parser then
    return " TS"
  end
  return " TS"
end

function M.lsp_name(msg)
  msg = msg or "Inactive"
  local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
  if vim.tbl_isempty(buf_clients) then
    if type(msg) == "boolean" or #msg == 0 then
      return "Inactive"
    end
    return msg
  end
  local buf_ft = vim.bo.filetype
  local buf_client_names = {}

  for _, client in pairs(buf_clients) do
    table.insert(buf_client_names, client.name)
  end

  local supported_formatters = lsp_utils.list_registered_formatters(buf_ft)
  vim.list_extend(buf_client_names, supported_formatters)

  local supported_linters = lsp_utils.list_registered_linters(buf_ft)
  vim.list_extend(buf_client_names, supported_linters)

  return table.concat(buf_client_names, ", ")
end

return M
