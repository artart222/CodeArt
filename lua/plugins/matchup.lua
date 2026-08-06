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
  for k, v in pairs(config.vim_matchup) do
    matchup_config[k] = v
  end
end

match_up.setup(matchup_config)
