local present, bufferline_setup = pcall(require, "bufferline")
if not present then
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
        filetype = "NvimTree",
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

local config = require("user_settings")
if config.bufferline then
  for k, v in pairs(config.bufferline) do
    bufferline_config[k] = v
  end
end

bufferline_setup.setup(bufferline_config)
