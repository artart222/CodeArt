local M = {}

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

function M.list_registered_providers_names(filetype)
  local s = require("null-ls.sources")
  local available_sources = s.get_available(filetype)
  local registered = {}
  for _, source in ipairs(available_sources) do
    for method in pairs(source.methods) do
      registered[method] = registered[method] or {}
      table.insert(registered[method], source.name)
    end
  end
  return registered
end

function M.list_registered_formatters(filetype)
  local null_ls_methods = require("null-ls.methods")
  local formatter_method = null_ls_methods.internal["FORMATTING"]
  local registered_providers = M.list_registered_providers_names(filetype)
  return registered_providers[formatter_method] or {}
end

function M.list_registered_linters(filetype)
  local null_ls_methods = require("null-ls.methods")
  local formatter_method = null_ls_methods.internal["DIAGNOSTICS"]
  local registered_providers = M.list_registered_providers_names(filetype)
  return registered_providers[formatter_method] or {}
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

  local supported_formatters = M.list_registered_formatters(buf_ft)
  vim.list_extend(buf_client_names, supported_formatters)

  local supported_linters = M.list_registered_linters(buf_ft)
  vim.list_extend(buf_client_names, supported_linters)

  return table.concat(buf_client_names, ", ")
end

return M
