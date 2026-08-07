local todo_comments = require("utils").safe_require("todo-comments")
if not todo_comments then
  return
end

require("utils").warn_missing_executable(
  "rg",
  "todo-comments: `rg` (ripgrep) was not found on PATH.\n"
    .. "Install ripgrep with your package manager so TODO search works."
)

local todo_comments_config = {
  sign_priority = 10, -- sign priority
  keywords = {
    FIX = { icon = "" },
    TODO = { icon = "" },
    HACK = { icon = "" },
    WARN = { icon = "" },
    PERF = { icon = "󰅒" },
    NOTE = { icon = "" },
    TEST = { icon = "󰙨" },
  },
  highlight = {
    pattern = [[(KEYWORDS)]], -- pattern or table of patterns, used for highlightng (vim regex)
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You"ll likely get false positives
  },
}

local config = require("user_settings").config
if config.todo_comments then
  todo_comments_config = vim.tbl_deep_extend("force", todo_comments_config, config.todo_comments)
end

todo_comments.setup(todo_comments_config)
