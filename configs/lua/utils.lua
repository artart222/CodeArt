local fn = vim.fn

local M = {}

M.plugins_path = fn.stdpath("data") .. "/site/pack/packer/"
M.os = vim.loop.os_uname().sysname

function M.is_plugin_installed(plugins_name)
  if
    not (fn.empty(fn.glob(M.plugins_path .. "/start/" .. M.plugins_path)) > 0)
    or not (fn.empty(fn.glob(M.plugins_path .. "/opt/" .. M.plugins_path)) > 0)
  then
    return false
  else
    return true
  end
end

-- Functions for make mappings easier.
function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.wk_add(mappings, options, maps_list)
  table.insert(maps_list, { mappings, options })
end

function M.autocmd(group, event, cmd, opts)
  local options = { command = cmd, pattern = event }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_create_autocmd(group, options)
end

return M
