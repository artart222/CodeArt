local present, match_up = pcall(require, "match-up")
if not present then
  return
end

local matchup_config = {
  treesitter = {
    enabled = true,
  },
}

local config = require("user_settings").config
if config.vim_matchup then
  matchup_config = vim.tbl_deep_extend("force", matchup_config, config.vim_matchup)
end

match_up.setup(matchup_config)
