local M = {}

function M.list_registered_formatters(filetype)
  local ok, conform = pcall(require, "conform")
  if not ok then
    return {}
  end

  local formatters = conform.formatters_by_ft[filetype] or {}
  local names = {}
  for _, formatter in ipairs(formatters) do
    if type(formatter) == "string" then
      table.insert(names, formatter)
    elseif type(formatter) == "table" and formatter.name then
      table.insert(names, formatter.name)
    end
  end
  return names
end

function M.list_registered_linters(filetype)
  local ok, lint = pcall(require, "lint")
  if not ok then
    return {}
  end

  return lint.linters_by_ft[filetype] or {}
end

function M.has_conform_formatter(bufnr)
  local ok, conform = pcall(require, "conform")
  if not ok then
    return false
  end
  return #conform.list_formatters(bufnr) > 0
end

return M
