-- Sourcing config files.
local utils = require("utils")
if not utils.has_minimum_version() then
  utils.notify_neovim_too_old()
  return
end

require("settings")
require("maps")
require("plugins")
require("theme")
require("user_settings").config.other_configs()
