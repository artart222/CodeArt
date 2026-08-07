local npairs = require("utils").safe_require("nvim-autopairs")
if not npairs then
  return
end

npairs.setup({
  check_ts = true,
  disable_filetype = { "TelescopePrompt" },
})
