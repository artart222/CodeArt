local present, aerial = pcall(require, "aerial")
if not present then
  return
end

aerial.setup({
  backends = { "lsp", "treesitter", "markdown" },
  show_guides = true,
  highlight_closest = true,
  filter_kind = {
    "Class",
    "Constructor",
    "Enum",
    "Event",
    "Function",
    "Interface",
    "Method",
    "Module",
    "Namespace",
    "Object",
    "Package",
    "Struct",
  },
  lsp = {
    diagnostics_trigger_update = false,
  },
})
