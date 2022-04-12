local M = {}

local lsp_utils = require("plugins.lsp.utils")

function M.lsp_progress(_)
  local Lsp = vim.lsp.util.get_progress_messages()[1]

  if Lsp then
    local msg = Lsp.message or ""
    local percentage = Lsp.percentage or 0
    local title = Lsp.title or ""

    local spinners = { "", "", "" }
    local success_icon = { "", "", "" }

    local ms = vim.loop.hrtime() / 1000000
    local frame = math.floor(ms / 120) % #spinners

    if percentage >= 70 then
      return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
    end

    return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
  end

  return ""
end

function M.treesitter_status(_)
  local b = vim.api.nvim_get_current_buf()
  if type(vim.treesitter.highlighter.active[b]) ~= "nil" then
    if next(vim.treesitter.highlighter.active[b]) then
      return " TS"
    end
    return " TS"
  end
  return " TS"
end

function M.lsp_name(msg)
  msg = msg or "Inactive"
  local buf_clients = vim.lsp.buf_get_clients()
  if next(buf_clients) == nil then
    if type(msg) == "boolean" or #msg == 0 then
      return "Inactive"
    end
    return msg
  end
  local buf_ft = vim.bo.filetype
  local buf_client_names = {}

  for _, client in pairs(buf_clients) do
    if client.name ~= "null-ls" then
      table.insert(buf_client_names, client.name)
    end
  end

  local supported_formatters = lsp_utils.list_registered_formatters(buf_ft)
  vim.list_extend(buf_client_names, supported_formatters)

  local supported_linters = lsp_utils.list_registered_linters(buf_ft)
  vim.list_extend(buf_client_names, supported_linters)

  return table.concat(buf_client_names, ", ")
end

return M
