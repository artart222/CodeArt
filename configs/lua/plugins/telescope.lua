local present, telescope = pcall(require, "telescope")
if not present then
    return
end

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
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
        end)
      end
    end
  }):sync()
end

local os = vim.loop.os_uname().sysname
if os == "Linux" or os == "Darwin" then
  -- Find the name of the fd binary file in the operating system.
  if vim.fn.filereadable("/bin/fdfind") == 1 or vim.fn.filereadable("/usr/bin/fdfind") == 1 then
    finder = "fdfind"
  else
    finder = "fd"
  end

  telescope.setup {
    defaults = {
      buffer_previewer_maker = new_maker,
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
        find_command = { finder, "--type=file", "--hidden", "--follow", "--exclude=.git" }
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  }
  telescope.load_extension("find_directories")
  telescope.load_extension("fzf")
else
  telescope.setup {
    defaults = {
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
        find_command = { "fd", "--type=file", "--hidden", "--follow", "--exclude=.git" }
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  }
  telescope.load_extension("fzf")
  telescope.load_extension("find_directories")
end
