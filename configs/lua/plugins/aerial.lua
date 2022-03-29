local present, aerial_setup = pcall(require, "aerial")
if not present then
  return
end

local aerial_config = {
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
}

local config = require("user_settings")
if config.aerial then
  for k, v in pairs(config.aerial) do
    aerial_config[k] = v
  end
end

aerial_setup.setup(aerial_config)
