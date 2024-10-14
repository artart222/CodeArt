local present, todo_comments = pcall(require, "todo-comments")
if not present then
  return
end

local icons = require("theme").icons

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

local config = require("user_settings")
if config.todo_comments then
  for k, v in pairs(config.todo_comments) do
    todo_comments_config[k] = v
  end
end

todo_comments.setup(todo_comments_config)
