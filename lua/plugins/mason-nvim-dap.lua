local mason_dap = require("utils").safe_require("mason-nvim-dap")
if not mason_dap then
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

local config = require("user_settings").config
if config.mason_dap_config then
  mason_dap_config = vim.tbl_deep_extend("force", mason_dap_config, config.mason_dap_config)
end

mason_dap.setup(mason_dap_config)
