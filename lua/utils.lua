local M = {}

local fn = vim.fn

-- Finding os name.
M.os = vim.loop.os_uname().sysname
-- Setting lazy.nvim and plugins instalation path.
M.plugins_path = fn.stdpath("data") .. "/lazy/"
M.lazy_nvim_path = M.plugins_path .. "lazy.nvim"
M.minimum_version_needed = "nvim-0.9.0"

-- Check for instalation status of plugin.
function M.is_plugin_installed(plugin_name)
  -- If plugin is installed.
  if fn.isdirectory(M.plugins_path .. plugin_name) == 1 then
    return true
  else
    return false
  end
end

-- Check if plugin is loaded.
function M.is_plugin_loaded(plugin_name)
  -- NOTE: Using Lazy.nvim with assumption of it is installed because it's default package manager.
  if require("lazy.core.config").plugins[plugin_name]._.loaded ~= nil then
    return true
  else
    return false
  end
end

-- Functions for make mappings easier.
-- lhs is keymaps and rhs is what we want to do.
function M.map(mode, lhs, rhs, opts)
  -- Adding default options.
  local options = { noremap = true, silent = true }
  -- If user provided more options via opts table add
  -- them to options table.
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  -- Setting keymaps.
  vim.keymap.set(mode, lhs, rhs, options)
end

-- This will add which-key mapping to given maps_list table.
-- This is for user.
function M.wk_add(mappings, options, maps_list)
  table.insert(maps_list, { mappings, options })
end

-- Function for working easier with nvim_set_hl().
function M.highlight(highlight_group, colors, opts)
  -- Function for getting default options(colors and styles) of highlight group.
  local function get_attr(attr)
    return fn.synIDattr(fn.synIDtrans(fn.hlID(highlight_group)), attr)
  end

  -- Setting previous bg and fg.
  -- If else is for when termguicolors is on or off.
  local options = {}
  if vim.opt.termguicolors:get() == true then
    options = {
      bg = get_attr("bg"),
      fg = get_attr("fg"),
      sp = get_attr("sp"),
      blend = tonumber(get_attr("blend")),
    }
  else
    options = {
      ctermbg = tonumber(get_attr("bg")),
      ctermfg = tonumber(get_attr("fg")),
    }
  end

  -- Setting previous styles.
  if get_attr("bold") == "1" then
    options.bold = true
  end
  if get_attr("standout") == "1" then
    options.standout = true
  end
  if get_attr("underline") == "1" then
    options.underline = true
  end
  if get_attr("undercurl") == "1" then
    options.undercurl = true
  end
  if get_attr("underdouble") == "1" then
    options.underdouble = true
  end
  if get_attr("underdotted") == "1" then
    options.underdotted = true
  end
  if get_attr("underdashed") == "1" then
    options.underdashed = true
  end
  if get_attr("strikethrough") == "1" then
    options.strikethrough = true
  end
  if get_attr("italic") == "1" then
    options.italic = true
  end
  if get_attr("reverse") == "1" then
    options.reverse = true
  end
  if get_attr("nocombine") == "1" then
    options.nocombine = true
  end
  -- FIX: make cterm work.
  -- if get_attr("cterm") then
  --   options.cterm = get_attr("cterm")
  -- end

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
  -- FIXME:
  -- Error detected while processing ColorScheme Autocommands for "*":
  -- Error executing lua callback: /home/artin/.config/nvim/lua/utils.lua:132: Invalid highlight color: '203'
  -- stack traceback:
  --         [C]: in function 'nvim_set_hl'
  --         /home/artin/.config/nvim/lua/utils.lua:132: in function 'highlight'
  --         /home/artin/.config/nvim/lua/theme.lua:25: in function </home/artin/.config/nvim/lua/theme.lua:10>
  -- Press ENTER or type command to continue
  vim.api.nvim_set_hl(0, highlight_group, options)
end

function M.update_neovim()
  vim.notify("Updating NeoVim.", vim.log.levels.WARN, { title = "CodeArt" })
  -- Check if user has minimum version needed for CodeArt.
  -- If he/she hasn't minimum version try to update CodeArt with excisting package managers.
  if fn.has(M.minimum_version_needed) == "0" then
    if M.os == "Windows_NT" then
      -- Try Updating NeoVim with excisting package managers.
      if fn.executable("winget") then
        fn.executable(
          "winget install -e --silent --accept-source-agreements --accept-package-agreements --id Neovim.Neovim.Nightly"
        )
        vim.notify("NeoVim Updated.", vim.log.levels.WARN, { title = "CodeArt" })
      elseif fn.executable("choco") then
        fn.system("choco upgrade neovim -y")
        vim.notify("NeoVim Updated.", vim.log.levels.WARN, { title = "CodeArt" })
      end
    elseif M.os == "Linux" then
      -- Try Updating NeoVim with excisting package managers.
      if fn.system("command -v pacman") ~= "" then
        fn.system("sudo pacman -Sy neovim --noconfirm")
        vim.notify("NeoVim Updated.", vim.log.levels.WARN, { title = "CodeArt" })
      elseif fn.system("command -v apt-get") ~= "" then
        fn.system("sudo apt update; sudo apt install neovim -y")
        vim.notify("NeoVim Updated.", vim.log.levels.WARN, { title = "CodeArt" })
      elseif fn.system("command -v dnf") ~= "" then
        fn.system("sudo dnf update -y; sudo dnf install neovim -y")
        vim.notify("NeoVim Updated.", vim.log.levels.WARN, { title = "CodeArt" })
      elseif fn.system("command -v zypper") ~= "" then
        fn.system("sudo zypper ref; sudo zypper -n neovim")
        vim.notify("NeoVim Updated.", vim.log.levels.WARN, { title = "CodeArt" })
      elseif fn.system("command -v emerge") ~= "" then
        fn.system("emerge --ask=n app-editors/neovim")
        vim.notify("NeoVim Updated.", vim.log.levels.WARN, { title = "CodeArt" })
      end
    else
      -- Try Updating NeoVim with excisting package manager.
      if fn.executable("brew") then
        fn.system("brew install neovim")
        vim.notify("NeoVim Updated.", vim.log.levels.WARN, { title = "CodeArt" })
      end
    end
  end
end

function M.update()
  M.update_neovim()

  -- Update CodeArt config via git pull --ff-only
  -- NOTE: Using plenary.nvim with assumption of it is installed because it's used in many plugins.
  local Job = require("plenary.job")
  local job_status
  Job:new({
    command = "git",
    args = { "pull", "--ff-only" },
    cwd = fn.stdpath("config"),
    on_exit = function(_, return_val)
      if return_val == 0 then
        job_status = 0
      else
        job_status = 1
      end
    end,
  }):sync()

  -- Show status to user.
  if job_status == 0 then
    vim.api.nvim_notify("CodeArt Updated!", vim.log.levels.WARN, { title = "CodeArt" })
  else
    vim.notify("Update failed! Please try Updating manually.", vim.log.levels.ERROR, { title = "CodeArt" })
    -- If update failed tell user to go to CodeArt wiki at github and update it manually.
    vim.notify(
      "For more information please go to CodeArt wiki on https://github.com/artart222/CodeArt/wiki.",
      vim.log.levels.ERROR,
      { title = "CodeArt" }
    )
  end
end

return M
