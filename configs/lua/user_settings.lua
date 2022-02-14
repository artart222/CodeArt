-- Function for make mapping easier.
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

additional_plugins = {
  -- You can put your additional plugins here.
  -- Syntax is like normal packer.nvim Syntax. Examples:

  -- { "famiu/feline.nvim", branch = "develop" },

  -- "mhartington/formatter.nvim",

  -- { crispgm/nvim-go", ft = "go" },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    config = function ()
      vim.g.mkdp_auto_close = 0
    end
  },

  {
    "andweeb/presence.nvim",
    config = function ()
      require("presence"):setup({
      log_level           = "info", -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
      debounce_timeout    = 5,   -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
      blacklist           = {},  -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
      })
    end
  }
}

-- Other settings here
-- For examples for disabling line number:
-- vim.opt.number = false
-- vim.opt.relativenumber = false


-- Or for changing terminal toggle mapping:
-- first argument is mode of mapping. second argument is keymap.
-- third argument is command. and last argument is optional argument like {expr = true}.
-- map("n", "<C-t>", ":ToggleTerm<CR>")
-- map("t", "<C-t>", ":ToggleTerm<CR>")

user_lualine_style = 1 -- You can choose between 1, 2, 3, 4 and 5
user_indent_blankline_style = 1 -- You can choose between 1, 2, 3, 4,5 and 6

vim.cmd("autocmd FileType lua set tabstop=2")
vim.cmd("autocmd Filetype lua set shiftwidth=2")
