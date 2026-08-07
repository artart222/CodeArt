local nvim_treesitter = require("utils").safe_require("nvim-treesitter")
if not nvim_treesitter then
  return
end

require("utils").warn_missing_executable(
  "tree-sitter",
  "tree-sitter CLI not found on PATH. Install tree-sitter-cli ≥ 0.26.1 via your OS package manager (e.g. brew install tree-sitter-cli), then restart Neovim and run :TSUpdate."
)

nvim_treesitter.setup({})

-- Opt-in only (no default parsers). Configure via user_settings.config.treesitter.ensure_installed.
local ensure_installed = {}
local user_config = require("user_settings").config
if user_config.treesitter and user_config.treesitter.ensure_installed then
  ensure_installed = user_config.treesitter.ensure_installed
end

if #ensure_installed > 0 then
  local installed = nvim_treesitter.get_installed()
  local missing = vim.tbl_filter(function(lang)
    return not vim.tbl_contains(installed, lang)
  end, ensure_installed)

  if #missing > 0 then
    nvim_treesitter.install(missing)
  end
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("CodeArtTreesitter", { clear = true }),
  callback = function(args)
    local ok = pcall(vim.treesitter.start, args.buf)
    if not ok then
      return
    end

    local ft = vim.bo[args.buf].filetype
    if ft ~= "python" then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
