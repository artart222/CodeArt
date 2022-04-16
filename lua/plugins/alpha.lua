local fn = vim.fn

local present, alpha = pcall(require, "alpha")
if not present then
  return
end
local dashboard = require("alpha.themes.dashboard")

local os = require("utils").os

local function button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    text = txt,
    shortcut = sc,
    cursor = 5,
    width = 36,
    align_shortcut = "right",
    hl = "AlphaCenter",
    hl_shortcut = "AlphaShortcut",
  }

  if keybind then
    opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
  end

  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = opts,
  }
end

dashboard.section.header.val = {
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
}
dashboard.section.header.opts.hl = "AlphaHeader"

dashboard.section.buttons.val = {
  button("SPC f f", "  Find File", ":Telescope find_files<CR>"),
  button("SPC f d", "  Find directory", ":Telescope find_directories<CR>"),
  button("SPC f o", "  Recents", ":Telescope oldfiles<CR>"),
  button("SPC f w", "  Find Word", ":Telescope live_grep<CR>"),
  button("SPC f n", "  New File", ":ene <BAR> startinsert<CR><ESC>"),
  button("SPC f m", "  Bookmarks", ":Telescope marks<CR>"),
}
dashboard.section.buttons.opts.hl = "AlphaCenter"
dashboard.section.buttons.opts.hl_shortcut = "AlphaShortcut"

local plugins_count
if os == "Windows_NT" then
  plugins_count = fn.len(fn.globpath("~/AppData/Local/nvim-data/site/pack/packer/start", "*", 0, 1))
else
  plugins_count = fn.len(fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
end
dashboard.section.footer.val = "CodeArt Loaded " .. plugins_count .. " plugins!  "
dashboard.section.footer.opts.hl = "AlphaFooter"

alpha.setup(dashboard.config)
