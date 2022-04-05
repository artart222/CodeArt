local present, telescope_setup = pcall(require, "telescope")
if not present then
  return
end

local previewers = require("telescope.previewers")
local Job = require("plenary.job")
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job
    :new({
      command = "file",
      args = { "--mime-type", "-b", filepath },
      on_exit = function(j)
        local mime_type = vim.split(j:result()[1], "/")[1]
        if mime_type == "text" then
          previewers.buffer_previewer_maker(filepath, bufnr, opts)
        else
          -- maybe we want to write something to the buffer here
          vim.schedule(function()
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
          end)
        end
      end,
    })
    :sync()
end

local os = require("utils").os
local buffer_previewer_maker
local finder
if os == "Linux" or os == "Darwin" then
  -- Find the name of the fd binary file in the operating system.
  if vim.fn.filereadable("/bin/fdfind") == 1 or vim.fn.filereadable("/usr/bin/fdfind") == 1 then
    finder = "fdfind"
  else
    finder = "fd"
  end
  buffer_previewer_maker = new_maker
else
  finder = "fd"
  buffer_previewer_maker = nil
end

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
    prompt_prefix = "   ",
    selection_caret = " ",
  },
  pickers = {
    find_files = {
      find_command = { finder, "--type=file", "--follow", "--exclude=.git" },
    },
  },
  extensions = {},
}

if require("utils").is_plugin_installed("telescope-fzf-native.nvim") then
  telescope_config.extensions["fzf"] = {
    fuzzy = true,
    override_generic_sorter = true,
    override_file_sorter = true,
    case_mode = "smart_case",
  }
  telescope_setup.load_extension("fzf")
end

if require("utils").is_plugin_installed("telescope_find_directories") then
  telescope_setup.load_extension("find_directories")
end

local config = require("user_settings")
if config.telescope then
  for k, v in pairs(config.telescope) do
    telescope_config[k] = v
  end
end

telescope_setup.setup(telescope_config)
