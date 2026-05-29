local present, npairs = pcall(require, "nvim-autopairs")
if not present then
  return
end

npairs.setup({
  check_ts = true,
  disable_filetype = { "TelescopePrompt" },
})
