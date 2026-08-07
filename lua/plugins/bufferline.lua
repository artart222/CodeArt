local bufferline = require("utils").safe_require("bufferline")
if not bufferline then
  return
end

local bufferline_config = {
  options = {
    numbers = function(opts)
      return string.format("%s", opts.id)
    end,
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
      {
        filetype = "vista_kind",
        text = "Lsp Tags",
        text_align = "center",
      },
      {
        filetype = "Outline",
        text = " Lsp Tags",
        text_align = "center",
      },
    },
  },
}

local config = require("user_settings").config
if config.bufferline then
  bufferline_config = vim.tbl_deep_extend("force", bufferline_config, config.bufferline)
end

bufferline.setup(bufferline_config)
