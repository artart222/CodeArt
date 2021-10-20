local present, lual = pcall(require, "lualine")
if not present then
    return
end

lual.setup {
  options = {theme = 'auto', disabled_filetypes = {'toggleterm', 'NvimTree', 'vista'}},
  extensions = {'fugitive'}
}
