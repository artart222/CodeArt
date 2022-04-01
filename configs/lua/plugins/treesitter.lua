local present, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
  return
end

local treesitter_config = {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  matchup = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { "python" },
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

local config = require("user_settings")
if config.treesitter then
  for k, v in pairs(config.treesitter) do
    treesitter_config[k] = v
  end
end

nvim_treesitter.setup(treesitter_config)
