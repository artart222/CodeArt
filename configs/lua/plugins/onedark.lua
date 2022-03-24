local present, onedark = pcall(require, "onedark")
if not present then
  return
end

onedark.setup({
  -- Main options --
  style = "deep", -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
  toggle_style_key = "<leader>co", -- Default keybinding to toggle
  term_colors = true,
  code_style = {
    comments = "italic",
    keywords = "none",
    functions = "none",
    strings = "none",
    variables = "none",
  },
  -- Plugins Config --
  diagnostics = {
    darker = true, -- darker colors for diagnostic
    undercurl = true, -- use undercurl instead of underline for diagnostics
    background = true, -- use background color for virtual text
  },
})
