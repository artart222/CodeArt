local present, lualine = pcall(require, "lualine")
if not present then
    return
end

lualine.setup {
  options = {theme = 'auto', disabled_filetypes = {'toggleterm', 'NvimTree', 'vista'}},
  extensions = {'fugitive'}
}
