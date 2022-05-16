local present, toggle_term = pcall(require, "toggleterm")
if not present then
  return
end

local toggleterm_config = {
  open_mapping = "<c-t>",
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_terminals = false,
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = "horizontal",
  close_on_exit = true, -- close the terminal window when the process exits
  highlights = {
    Normal = {
      guibg = "Normal",
    },
  },
  float_opts = {
    border = "curved",
    width = 120,
    height = 40,
    winblend = 3,
  },
}

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

local node = Terminal:new({ cmd = "node", hidden = true, direction = "float" })
function _NODE_TOGGLE()
  node:toggle()
end

local ncdu = Terminal:new({ cmd = "ncdu", hidden = true, direction = "float" })
function _NCDU_TOGGLE()
  ncdu:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true, direction = "float" })
function _HTOP_TOGGLE()
  htop:toggle()
end

local python = Terminal:new({ cmd = "python", hidden = true, direction = "float" })
function _PYTHON_TOGGLE()
  python:toggle()
end

local ranger = Terminal:new({ cmd = "ranger", hidden = true, direction = "float" })
function _RANGER_TOGGLE()
  ranger:toggle()
end

local config = require("user_settings")
if config.toggleterm then
  for k, v in pairs(config.toggleterm) do
    toggleterm_config[k] = v
  end
end

toggle_term.setup(toggleterm_config)
