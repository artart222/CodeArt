local catppuccin = require("utils").safe_require("catppuccin")
if not catppuccin then
  return
end

local catppuccin_config = {
  flavour = "mocha",
  background = {
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false,
  integrations = {
    gitsigns = true,
    nvimtree = false,
    neo_tree = true,
    telescope = true,
    treesitter = true,
    indent_blankline = { enabled = true },
    native_lsp = { enabled = true },
  },
}

local config = require("user_settings").config
if config.catppuccin then
  catppuccin_config = vim.tbl_deep_extend("force", catppuccin_config, config.catppuccin)
end

catppuccin.setup(catppuccin_config)
