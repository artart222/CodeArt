local present, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

nvim_treesitter.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  matchup = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { "python" },
  },
  autotag = {
    enable = true
  },
  context_commentstring = {
    enable = true,
    config = {
      -- Languages that have a single comment style
      typescript = "// %s",
      css = "/* %s */",
      scss = "/* %s */",
      html = "<!-- %s -->",
      svelte = "<!-- %s -->",
      vue = "<!-- %s -->",
      json = "",
    },
  }
}

vim.cmd
[[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99
]]
