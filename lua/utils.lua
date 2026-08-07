local M = {}

local fn = vim.fn

-- Finding os name.
M.os = vim.uv.os_uname().sysname
-- Setting lazy.nvim and plugins instalation path.
M.plugins_path = fn.stdpath("data") .. "/lazy/"
M.lazy_nvim_path = M.plugins_path .. "lazy.nvim"
M.minimum_version_needed = "nvim-0.12.0"

---Return true when the running Neovim meets CodeArt's minimum version.
function M.has_minimum_version()
  return fn.has(M.minimum_version_needed) == 1
end

---Notify about a too-old Neovim and how to upgrade (OS package manager only).
function M.notify_neovim_too_old()
  local v = vim.version()
  vim.notify(
    string.format(
      "CodeArt 2.1 requires Neovim 0.12+. You have: %d.%d.%d\nUpgrade Neovim with your OS package manager, then reopen Neovim.",
      v.major,
      v.minor,
      v.patch
    ),
    vim.log.levels.ERROR,
    { title = "CodeArt" }
  )
end

-- Session-scoped missing-binary warns (one notify per dedupe key).
M._warned_missing = {}

---Warn once per session if none of the given executables are on PATH.
---@param names string|string[] binary name, or list of alternatives (any one is enough)
---@param message string notify body
---@param dedupe_key? string defaults to first name; use for aliases (e.g. fd/fdfind → "fd")
---@return boolean missing true when no candidate was found
function M.warn_missing_executable(names, message, dedupe_key)
  if type(names) == "string" then
    names = { names }
  end

  for _, name in ipairs(names) do
    if fn.executable(name) == 1 then
      return false
    end
  end

  local key = dedupe_key or names[1]
  if M._warned_missing[key] then
    return true
  end
  M._warned_missing[key] = true
  vim.notify(message, vim.log.levels.WARN, { title = "CodeArt" })
  return true
end

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

-- Append which-key v3 mapping specs for user_settings.extra_which_keys.
-- mappings: list of specs, e.g. { { "<leader>ff", ":Telescope find_files<CR>", desc = "Find File" } }
-- options: optional parse opts (mode, etc.)
-- maps_list: usually require("user_settings").extra_which_keys
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

function M.update()
  if not M.has_minimum_version() then
    M.notify_neovim_too_old()
    return
  end

  -- Update CodeArt config via git pull --ff-only
  -- NOTE: Using plenary.nvim with assumption of it is installed because it's used in many plugins.
  local Job = require("plenary.job")
  local job_status
  local job_stderr = {}
  Job:new({
    command = "git",
    args = { "pull", "--ff-only" },
    cwd = fn.stdpath("config"),
    on_stderr = function(_, data)
      if data then
        table.insert(job_stderr, data)
      end
    end,
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
    vim.notify("CodeArt config updated. Syncing plugins...", vim.log.levels.INFO, { title = "CodeArt" })
  else
    vim.notify(
      "Update failed: git pull --ff-only could not update the config.\n"
        .. "Local changes (often lua/user_settings.lua) usually block this.\n"
        .. "Stash or commit your changes, or back up user_settings.lua and try again.",
      vim.log.levels.ERROR,
      { title = "CodeArt" }
    )
    if #job_stderr > 0 then
      vim.notify(table.concat(job_stderr, "\n"), vim.log.levels.ERROR, { title = "CodeArt" })
    end
    return
  end

  if pcall(require, "lazy") then
    require("lazy").sync({ wait = true })
    vim.notify(
      "CodeArt updated! Restart Neovim, then run :MasonUpdate and :TSUpdate if needed.\nEnsure tree-sitter-cli is on PATH for treesitter installs.\n"
        .. ":CodeArtUpdate only updates CodeArt and plugins — upgrade Neovim with your OS package manager when required.",
      vim.log.levels.INFO,
      { title = "CodeArt" }
    )
  else
    vim.notify("CodeArt config updated! Restart Neovim and run :Lazy sync.", vim.log.levels.WARN, { title = "CodeArt" })
  end
end

return M
