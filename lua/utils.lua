local fn = vim.fn

local M = {}

-- Finding os name and packer instalation path.
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

-- This will add which-key mapping to given maps_list table.
function M.wk_add(mappings, options, maps_list)
  table.insert(maps_list, { mappings, options })
end

-- Function for working easier with nvim_set_hl().
function M.highlight(highlight_group, colors, opts)
  -- Function for getting default options(colors and styles) of highlight group.
  local function get_attr(attr)
    return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(highlight_group)), attr)
  end

  -- Setting previous bg and fg.
  local options = {
    bg = get_attr("bg"),
    fg = get_attr("fg"),
  }

  -- Setting some styles if they were in colorscheme for current highlight group.
  if get_attr("bold") == "1" then
    options.bold = true
  end
  if get_attr("italic") == "1" then
    options.italic = true
  end

  if get_attr("undercurl") == "1" then
    options.undercurl = true
  end
  if get_attr("underline") == "1" then
    options.underline = true
  end

  -- Adding new color if they excist.
  for k, v in pairs(colors) do
    if colors[k] == "NONE" then
      options[k] = nil
    else
      options[k] = v
    end
  end

  -- Adding new options if they excist.
  if opts then
    for k, v in pairs(opts) do
      options[k] = v
    end
  end

  -- Applying colors and options.
  vim.api.nvim_set_hl(0, highlight_group, options)
end

function M.update()
  -- Running CodeArtUpdate for checking is config structure new or not.
  local status
  if M.os == "Windows_NT" then
    local status = vim.fn.system(
      "powershell.exe -executionpolicy bypass -file " .. vim.fn.stdpath("config") .. "/CodeArtUpdate.ps1"
    )
  else -- In case of mac and linux and maybe bsd I didn't work with that (:
    local status = vim.fn.system("bash " .. vim.fn.stdpath("config") .. "/CodeArtUpdate.sh; echo $?")
  end

  -- In case of old config structure make it new.
  if vim.fn.trim(status) == "0" then
    vim.notify(
      "CodeArt Backuped your entire NeoVim config into "
        .. vim.fn.stdpath("config")
        .. ".backup"
        .. "your previous config will be use in new file structure but in case of any problem you can have your old config."
        .. "In case of any prolem see https://github.com/artart222/CodeArt/wiki",
      vim.log.levels.WARN,
      { title = "CodeArt" }
    )
  else
    -- In case of new config structure remove CodeArtUpdate because we don't need that
    if M.os == "Windows_NT" then
      vim.fn.system("rm " .. vim.fn.stdpath("config") .. "\\CodeArtUpdate.ps1")
    else
      vim.fn.system("rm " .. vim.fn.stdpath("config") .. "/CodeArtUpdate.sh")
    end
  end

  -- Update CodeArt via git pull --ff-only
  local Job = require("plenary.job")
  Job
    :new({
      command = "git",
      args = { "pull", "--ff-only" },
      cwd = vim.fn.stdpath("config"),
      on_exit = function(_, return_val)
        if return_val == 0 then
          -- vim.api.nvim_notify("Updated!", vim.log.levels.WARN, { title = "CodeArt" })
          print("Updated!")
          return
        else
          -- vim.notify("Update failed! Please try pulling manually.", vim.log.levels.ERROR, { title = "CodeArt" })
          print("Update failed! Please try pulling manually.")
          return
        end
      end,
    })
    :sync()
end

return M
