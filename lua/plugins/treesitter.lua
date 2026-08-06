local present, nvim_treesitter = pcall(require, "nvim-treesitter")
if not present then
  return
end

if vim.fn.executable("tree-sitter") == 0 then
  vim.notify(
    "tree-sitter CLI not found on PATH. Install tree-sitter-cli ≥ 0.26.1 via your OS package manager (e.g. brew install tree-sitter-cli), then restart Neovim and run :TSUpdate.",
    vim.log.levels.WARN,
    { title = "CodeArt" }
  )
end

nvim_treesitter.setup({})

local default_ensure_installed = {
  "lua",
  "vim",
  "vimdoc",
  "query",
  "bash",
  "python",
  "javascript",
  "typescript",
  "json",
  "markdown",
  "markdown_inline",
  "rust",
  "c",
  "cpp",
}

local ensure_installed = default_ensure_installed
local user_config = require("user_settings").config
if user_config.treesitter and user_config.treesitter.ensure_installed then
  ensure_installed = user_config.treesitter.ensure_installed
end

local installed = nvim_treesitter.get_installed()
local missing = vim.tbl_filter(function(lang)
  return not vim.tbl_contains(installed, lang)
end, ensure_installed)

if #missing > 0 then
  nvim_treesitter.install(missing)
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
