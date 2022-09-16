local present, color = pcall(require, "colorizer")
if not present then
  return
end

local colorizer_config = {
  filetypes = { "*" },
  user_default_options = {
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    names = false, -- "Name" codes like Blue
    RRGGBBAA = false, -- #RRGGBBAA hex codes
    rgb_fn = false, -- CSS rgb() and rgba() functions
    hsl_fn = false, -- CSS hsl() and hsla() functions
    css = false, -- Enable all css features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    mode = "background", -- Set the display mode
  },
}

local config = require("user_settings")
if config.colorizer then
  for k, v in pairs(config.colorizer) do
    colorizer_config[k] = v
  end
end

color.setup(colorizer_config)

vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*",
  callback = function()
    require("colorizer").attach_to_buffer(0)
  end,
})
