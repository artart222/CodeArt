local present, neo_tree = pcall(require, "neo-tree")
if not present then
  return
end

local neo_tree_config = {
  close_if_last_window = false,
  popup_border_style = "single",
  enable_git_status = true,
  enable_diagnostics = true,
  open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
  sort_case_insensitive = true,
  default_component_configs = {
    indent = {
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
      highlight = "NeoTreeIndentMarker",
    },
    icon = {
      folder_closed = "",
      folder_open = "",
    },
    git_status = {
      symbols = {
        added = "✚",
        deleted = "✖",
        modified = "",
        renamed = "󰁕",
        untracked = "",
        ignored = "",
        unstaged = "󰄱",
        staged = "",
        conflict = "",
      },
    },
  },
  filesystem = {
    bind_to_cwd = true,
    follow_current_file = { enabled = true },
    use_libuv_file_watcher = false,
    filtered_items = {
      visible = true,
      hide_dotfiles = true,
      hide_gitignored = true,
      hide_by_name = {
        ".git",
        "node_modules",
        ".cache",
        "__pycache__",
      },
    },
    window = {
      mappings = {
        ["<C-h>"] = "toggle_hidden",
        ["H"] = function()
          vim.cmd("call ResizeLeft(3)")
        end,
      },
    },
  },
  window = {
    position = "left",
    width = function()
      return math.floor(vim.fn.winwidth(0) * 0.15)
    end,
    mappings = {
      ["<space>"] = "none",
    },
  },
}

local config = require("user_settings").config
if config.neo_tree then
  for k, v in pairs(config.neo_tree) do
    neo_tree_config[k] = v
  end
end

require("neo-tree").setup(neo_tree_config)
