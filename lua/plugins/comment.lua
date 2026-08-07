local present, comment_setup = pcall(require, "Comment")
if not present then
  return
end
-- TODO: Complete this file

local comment_config = {
  padding = true,
  ---Whether the cursor should stay at its position
  sticky = true,
  ---Lines to be ignored while (un)comment
  ignore = nil,
  ---LHS of toggle mappings in NORMAL mode
  toggler = {
    ---Line-comment toggle keymap
    line = "gcc",
    ---Block-comment toggle keymap
    block = "gbc",
  },
  ---LHS of operator-pending mappings in NORMAL and VISUAL mode
  opleader = {
    ---Line-comment keymap
    line = "gc",
    ---Block-comment keymap
    block = "gb",
  },
  ---LHS of extra mappings
  extra = {
    ---Add comment on the line above
    above = "gcO",
    ---Add comment on the line below
    below = "gco",
    ---Add comment at the end of line
    eol = "gcA",
  },
  ---Enable keybindings
  ---NOTE: If given `false` then the plugin won't create any mappings
  mappings = {
    basic = true,
    extra = true,
  },
  ---Function to call before (un)comment
  pre_hook = function(...)
    if require("utils").is_plugin_installed("nvim-ts-context-commentstring") then
      local hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
      return hook(...)
    end
  end,
  ---Function to call after (un)comment
  -- post_hook = nil,
}

local config = require("user_settings").config
if config.comment then
  for k, v in pairs(config.comment) do
    comment_config[k] = v
  end
end

comment_setup.setup(comment_config)
