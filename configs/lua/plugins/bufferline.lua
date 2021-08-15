require("bufferline").setup {
  options = {
    numbers = "buffer_id",
    number_style = "",
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"
      }
    }
  }
}
