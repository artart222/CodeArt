local present, dashboard = pcall(require, "dashboard")
if not present then
  return
end

local plugins_count = require("lazy").stats().loaded

local dashboard_config = {
  theme = "doom",
  hide = {
    tabline = false,
    winbar = false,
  },
  config = {
    header = {
      "                                                                             ",
      "                                                                             ",
      "    █████████               █████            █████████              █████    ",
      "   ███░░░░░███             ░░███            ███░░░░░███            ░░███     ",
      "  ███     ░░░   ██████   ███████   ██████  ░███    ░███  ████████  ███████   ",
      " ░███          ███░░███ ███░░███  ███░░███ ░███████████ ░░███░░███░░░███░    ",
      " ░███         ░███ ░███░███ ░███ ░███████  ░███░░░░░███  ░███ ░░░   ░███     ",
      " ░░███     ███░███ ░███░███ ░███ ░███░░░   ░███    ░███  ░███       ░███ ███ ",
      "  ░░█████████ ░░██████ ░░████████░░██████  █████   █████ █████      ░░█████  ",
      "   ░░░░░░░░░   ░░░░░░   ░░░░░░░░  ░░░░░░  ░░░░░   ░░░░░ ░░░░░        ░░░░░   ",
      "                                                                             ",
      "                                                                             ",
    },
    center = {
      {
        icon = "󰱼 ",
        desc = "Find File                    SPC f f",
        action = "Telescope find_files",
      },
      {
        icon = "󰥨 ",
        desc = "Find directory               SPC f d",
        action = "Telescope find_directories",
      },
      {
        icon = " ",
        desc = "Recent Files                 SPC f o",
        action = "Telescope oldfiles",
      },
      {
        icon = "󰺮 ",
        desc = "Find Word                    SPC f w",
        action = "Telescope live_grep",
      },
      {
        icon = " ",
        desc = "New File                     SPC b n",
        action = "ene | startinsert",
      },
      {
        icon = " ",
        desc = "Bookmarks                    SPC f B",
        action = "Telescope marks",
      },
    },
    footer = {
      "                                                                             ",
      "CodeArt Loaded " .. plugins_count .. " plugins!  ",
    },
  },
}

local config = require("user_settings").config
if config.dashboard then
  for k, v in pairs(config.dashboard) do
    dashboard_config[k] = v
  end
end

dashboard.setup(dashboard_config)
