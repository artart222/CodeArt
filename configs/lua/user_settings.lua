-- NOTE: These two functions are for
-- making mappings and adding item to
-- which key easier
-- Functions for make mapping easier.
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function wk_add(mappings, options)
  table.insert(extra_which_keys, { mappings, options })
end

-- WARN: Do not touch this table.
extra_which_keys = {}

disable_plugins = {
  impatient = false,
  fix_cursor_hold = false,
  tokyonight = false,
  nightfly = false,
  moonfly = false,
  nord = false,
  onedark = false,
  nvim_enfocado = false,
  truezen = false,
  indent_blankline = false,
  nvim_web_devicons = false,
  nvim_tree = false,
  nvim_bufferline = false,
  lualine = false,
  better_escape = false,
  treesitter = false,
  nvim_colorizer = false,
  dashboard_nvim = false,
  telescope_fzf_native = false,
  telescope_find_directories = false,
  telescope = false,
  nvim_lspconfig = false,
  lsp_installer = false,
  null_ls = false,
  lspsaga = false,
  aerial = false,
  friendly_snippets = false,
  nvim_cmp = false,
  cmp_buffer = false,
  cmp_path = false,
  cmp_nvim_lsp = false,
  luasnip = false,
  cmp_luasnip = false,
  cmp_nvim_lua = false,
  lsp_signature = false,
  nvim_dap = false,
  dap_install = false,
  nvim_dap_ui = false,
  vista = false,
  toggleterm = false,
  fugitive = false,
  gitsigns = false,
  autopairs = false,
  nvim_ts_autotag = false,
  scrollview = false,
  neoscroll = false,
  todo_comments = false,
  which_key = false,
  mkdir = false,
  kommentary = false,
  ts_context_commentstring = false,
  vim_matchup = false,
  vim_resize = false,
}

additional_plugins = {
  -- You can put your additional plugins here.
  -- Syntax is like normal packer.nvim Syntax.
  -- If you need to set some settings for your plugins
  -- you must put configs in config = function() like below examples

  -- { "famiu/feline.nvim", branch = "develop" },

  -- "mhartington/formatter.nvim",

  -- { "crispgm/nvim-go", ft = "go" },

  -- {
  --   "iamcco/markdown-preview.nvim",
  --   ft = "markdown",
  --   run = ":call mkdp#util#install()",
  --   config = function()
  --     vim.g.mkdp_auto_close = 0
  --   end,
  -- },

  -- {
  --   "andweeb/presence.nvim",
  --   config = function()
  --     require("presence"):setup({
  --       log_level = "info", -- Log messages (one of the following: "debug", "info", "warn", "error")
  --       debounce_timeout = 5,
  --       blacklist = {}, -- file name, path, or workspace matches
  --     })
  --   end,
  -- },
}

-- NOTE: here
-- Name of functions is exactly like config file in plugins directory
-- the only diffrence is if in file name you have hifen here you must
-- replace it with underline.
local config = {
  -- null-ls configuration
  null_ls = function()
    -- Formatting and linting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim
    local status_ok, null_ls = pcall(require, "null-ls")
    if not status_ok then
      return
    end

    -- Check supported formatters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting

    -- Check supported linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup({
      debug = false,
      sources = {
        -- Settings up some linters and code formatters.
        formatting.black,
        formatting.stylua,
        formatting.rustfmt,
        formatting.clang_format,
        formatting.prettier,
        formatting.taplo,
        formatting.shfmt.with({
          command = "shfmt",
          args = {
            "-i",
            "2",
            "-ci",
            "-bn",
            "$FILENAME",
            "-w",
          },
        }),
        diagnostics.zsh,
        -- formatting.clang_format
        -- diagnostics.luacheck,
        diagnostics.pylint,
      },
      -- This function is for format on save.
      -- on_attach = function(client)
      --   if client.resolved_capabilities.document_formatting then
      --     vim.cmd([[
      --       augroup LspFormatting
      --           autocmd! * <buffer>
      --           autocmd BufWritePre <buffer> lua global_code_formatter(vim.api.nvim_get_current_buf())
      --       augroup END
      --       ]])
      --   end
      -- end,
    })
  end,
  treesitter = {
    highlight = {
      enable = true,
    },
  },
  other_configs = function()
    vim.cmd("colorscheme enfocado")
    -- Other settings here
    -- For examples for disabling line number:
    -- vim.opt.number = false
    -- vim.opt.relativenumber = false

    -- Or for changing terminal toggle mapping:
    -- first argument is mode of mapping. second argument is keymap.
    -- third argument is command. and last argument is optional argument like {expr = true}.
    -- map("n", "<C-t>", ":ToggleTerm<CR>")
    -- map("t", "<C-t>", ":ToggleTerm<CR>")

    -- This is example of how to make keymap and add it to
    -- which_keys(that pop of window on bottom of NeoVim that help you to find keymaps)
    -- This will make new group of keymaps names Something with two commands and they're describtions.
    -- with pressing `<leader> + s` you can trigger which keys to show you
    -- Something commands. with pressing e it will echo hello on command prompt at the end of NeoVim
    -- and with pressing f it will echo Goodbye on command prompt at the end of NeoVim
    -- wk_add(
    --   {
    --     s = {
    --       name = "Something",
    --       e = { ":echo 'Hello'<CR>", "Echo Hello" },
    --       f = { ":echo 'Goodbye'<CR>", "Echo Goodbye" },
    --     },
    --   },
    --   { prefix = "<leader>", mode = "v" } -- mode = "v" means it only works on visual mode.
    -- )

    -- user_lualine_style = 1 -- You can choose between predefined 1, 2, 3, 4 and 5
    -- or you can define your custome seperator like this.
    -- first item is for component seperator and second item is
    -- for section seperator.
    -- user_lualine_style = { { left = " ", right = " " }, { left = "", right = "" } }

    -- user_indent_blankline_style = 1 -- You can choose between predefined 1, 2, 3, 4,5 and 6
    -- or you can use your favorite character.
    -- user_indent_blankline_style = ""
  end,
}

return config
