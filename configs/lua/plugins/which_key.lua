local present, which_key = pcall(require, "which-key")
if not present then
    return
end

which_key.setup {
  key_labels = {
    ["<space>"] = "SPC",
    ["<leader>"] = "SPC",
    ["<cr>"] = "ENT",
    ["<tab>"] = "TAB",
    ["<a>"] = "ALT",
    ["<s>"] = "SHI",
    ["<c>"] = "CTR",
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  ignore_missing = false,
}
