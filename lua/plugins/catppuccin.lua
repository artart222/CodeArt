local present, catppuccin = pcall(require, "catppuccin")
if not present then
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
  for k, v in pairs(config.catppuccin) do
    catppuccin_config[k] = v
  end
end

catppuccin.setup(catppuccin_config)
