local present, telescope = pcall(require, "telescope")
if not present then
    return
end

local os = vim.loop.os_uname().sysname
if os == "Linux" and vim.fn.has("wsl") == 0 then
  telescope.setup {
    extensions = {
      media_files = {
        filetypes = { "png", "webp", "jpg", "jpeg" },
        find_cmd = "rg"
      },
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  }
  telescope.load_extension("media_files")
  telescope.load_extension("find_directories")
  telescope.load_extension("fzf")
else
  telescope.setup {
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    },
  }
  telescope.load_extension("fzf")
  telescope.load_extension("find_directories")
end
