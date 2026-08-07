local present, telescope_setup = pcall(require, "telescope")
if not present then
  return
end

local utils = require("utils")
local previewers = require("telescope.previewers")
local Job = require("plenary.job")
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = "file",
    args = { "--mime-type", "-b", filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], "/")[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
        end)
      end
    end,
  }):sync()
end

local buffer_previewer_maker = nil
if utils.os == "Linux" or utils.os == "Darwin" then
  local missing_file = utils.warn_missing_executable(
    "file",
    "Telescope previews: `file` was not found on PATH.\n"
      .. "Install it (usually via your OS coreutils package) for binary-vs-text preview detection."
  )
  if not missing_file then
    buffer_previewer_maker = new_maker
  end
end

local function resolve_fd_finder()
  if vim.fn.executable("fd") == 1 then
    return "fd"
  end
  if vim.fn.executable("fdfind") == 1 then
    return "fdfind"
  end
  return nil
end

local finder = resolve_fd_finder()
local find_files = {}
if finder then
  find_files.find_command = { finder, "--type=file", "--follow", "--exclude=.git" }
else
  utils.warn_missing_executable(
    { "fd", "fdfind" },
    "Telescope find_files: `fd` (or `fdfind`) was not found on PATH.\n"
      .. "Install it with your package manager (e.g. brew install fd, apt install fd-find, choco install fd),\n"
      .. "then ensure Neovim can see it (:echo exepath('fd')). Falling back to Telescope defaults.",
    "fd"
  )
end

utils.warn_missing_executable(
  "rg",
  "Telescope / search: `rg` (ripgrep) was not found on PATH.\n"
    .. "Install ripgrep with your package manager so live_grep and todo search work."
)

local telescope_config = {
  defaults = {
    buffer_previewer_maker = buffer_previewer_maker,
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!.git/",
    },
    prompt_prefix = "   ",
    selection_caret = "󰋇 ",
  },
  pickers = {
    find_files = find_files,
  },
  extensions = {},
}

local config = require("user_settings").config
if config.telescope then
  for k, v in pairs(config.telescope) do
    telescope_config[k] = v
  end
end

if utils.is_plugin_installed("telescope-fzf-native.nvim") then
  telescope_config.extensions = telescope_config.extensions or {}
  telescope_config.extensions["fzf"] = {
    fuzzy = true,
    override_generic_sorter = true,
    override_file_sorter = true,
    case_mode = "smart_case",
  }
  utils.warn_missing_executable(
    "make",
    "telescope-fzf-native: `make` was not found on PATH.\n"
      .. "Install make so the native fuzzy sorter can build (Lazy build step)."
  )
  utils.warn_missing_executable(
    { "gcc", "clang", "cc" },
    "telescope-fzf-native: no C compiler (`gcc`/`clang`/`cc`) was found on PATH.\n"
      .. "Install a C toolchain so the native fuzzy sorter can build.",
    "c_compiler"
  )
end

telescope_setup.setup(telescope_config)

if utils.is_plugin_installed("telescope-fzf-native.nvim") then
  pcall(telescope_setup.load_extension, "fzf")
end

if utils.is_plugin_installed("telescope_find_directories") then
  pcall(telescope_setup.load_extension, "find_directories")
end
