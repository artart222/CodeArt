local fn = vim.fn

local M = {}

M.plugins_path = fn.stdpath("data") .. "/site/pack/packer"
M.os = vim.loop.os_uname().sysname

-- Check for instalation status of plugin.
function M.is_plugin_installed(plugins_name)
  if
    fn.empty(fn.glob(M.plugins_path .. "/start/" .. plugins_name)) > 0
    and fn.empty(fn.glob(M.plugins_path .. "/opt/" .. plugins_name)) > 0
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

function M.highlight(highlight_group, colors, opts)
  local options = {}
  for k, v in pairs(colors) do
    options[k] = v
  end

  if opts then
    for k, v in pairs(opts) do
      options[k] = v
    end
  end

  vim.api.nvim_set_hl(0, highlight_group, options)
end

return M
