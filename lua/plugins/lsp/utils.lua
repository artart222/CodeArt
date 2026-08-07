local M = {}

---Formatters that conform can actually run for this buffer.
---@param bufnr? integer
---@return string[]
function M.list_available_formatters(bufnr)
  local ok, conform = pcall(require, "conform")
  if not ok then
    return {}
  end

  local names = {}
  for _, formatter in ipairs(conform.list_formatters(bufnr or 0)) do
    if formatter.available then
      table.insert(names, formatter.name)
    end
  end
  return names
end

---Linters configured for this buffer whose command is on PATH.
---@param bufnr? integer
---@return string[]
function M.list_available_linters(bufnr)
  local ok, lint = pcall(require, "lint")
  if not ok then
    return {}
  end

  bufnr = bufnr or 0
  if bufnr == 0 then
    bufnr = vim.api.nvim_get_current_buf()
  end

  local ft = vim.bo[bufnr].filetype
  local configured = {}
  if type(lint._resolve_linter_by_ft) == "function" then
    configured = lint._resolve_linter_by_ft(ft) or {}
  else
    configured = lint.linters_by_ft[ft] or {}
  end

  local names = {}
  for _, name in ipairs(configured) do
    local linter = lint.linters[name]
    if type(linter) == "function" then
      linter = linter()
    end
    if type(linter) == "table" then
      local cmd = linter.cmd
      if type(cmd) == "function" then
        cmd = cmd()
      end
      if type(cmd) == "string" and cmd ~= "" and vim.fn.executable(cmd) == 1 then
        table.insert(names, name)
      end
    end
  end
  return names
end

function M.has_conform_formatter(bufnr)
  return #M.list_available_formatters(bufnr) > 0
end

return M
