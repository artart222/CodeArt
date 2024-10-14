local present, lspsaga = pcall(require, "lspsaga")
if not present then
  return
end

local lspsaga_config = {
  debug = false,
  use_saga_diagnostic_sign = false,
  code_action_icon = "󰌵 ",
  code_action_prompt = {
    enable = false,
    sign = true,
    sign_priority = 40,
    virtual_text = false,
  },
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
}

local config = require("user_settings")
if config.lspsaga then
  for k, v in pairs(config.lspsaga) do
    lspsaga_config[k] = v
  end
end

lspsaga.setup(lspsaga_config)
