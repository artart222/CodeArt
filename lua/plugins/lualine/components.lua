local M = {}

local lsp_utils = require("plugins.lsp.utils")

local icons = {
  lsp = " ",
  formatter = "󰉿 ",
  linter = "󰁨 ",
}

---@param names string[]
---@param icon string
---@return string|nil
local function format_category(names, icon)
  if #names == 0 then
    return nil
  end
  if #names == 1 then
    return icon .. names[1]
  end
  return icon .. names[1] .. string.format(" +%d", #names - 1)
end

---@param names string[]
---@return string[]
local function unique_names(names)
  local seen = {}
  local out = {}
  for _, name in ipairs(names) do
    if type(name) == "string" and name ~= "" and not seen[name] then
      seen[name] = true
      table.insert(out, name)
    end
  end
  return out
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

  local lsp_names = {}
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    table.insert(lsp_names, client.name)
  end
  lsp_names = unique_names(lsp_names)

  local formatters = unique_names(lsp_utils.list_available_formatters(0))
  local linters = unique_names(lsp_utils.list_available_linters(0))

  local parts = {}
  local lsp_part = format_category(lsp_names, icons.lsp)
  local fmt_part = format_category(formatters, icons.formatter)
  local lint_part = format_category(linters, icons.linter)
  if lsp_part then
    table.insert(parts, lsp_part)
  end
  if fmt_part then
    table.insert(parts, fmt_part)
  end
  if lint_part then
    table.insert(parts, lint_part)
  end

  if #parts == 0 then
    if type(msg) == "boolean" or #msg == 0 then
      return "Inactive"
    end
    return msg
  end

  return table.concat(parts, " · ")
end

return M
