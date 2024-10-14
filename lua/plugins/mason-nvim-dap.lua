local present, mason_dap = pcall(require, "mason-nvim-dap")
if not present then
  return
end

local mason_dap_config = {
  -- automatic_setup = true,
  -- automatic_installation = false,
  handlers = {
    function(config)
      require("mason-nvim-dap").default_setup(config)
    end,
  },
}

local config = require("user_settings")
if config.mason_dap_config then
  for k, v in pairs(config.mason_dap_config) do
    mason_dap_config[k] = v
  end
end

mason_dap.setup(mason_dap_config)
