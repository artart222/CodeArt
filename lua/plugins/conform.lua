local utils = require("utils")
local conform = utils.safe_require("conform")
if not conform then
  return
end

-- Opt-in only (no default formatters / format_on_save). Configure via user_settings.config.conform.
local conform_config = {
  formatters_by_ft = {},
  formatters = {},
}

local config = require("user_settings").config
if config.conform then
  conform_config = vim.tbl_deep_extend("force", conform_config, config.conform)
end

conform.setup(conform_config)

-- Map conform formatter ids to PATH binaries; warn once per formatter when a filetype needs it.
local formatter_bins = {
  clang_format = "clang-format",
}

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("CodeArtConformDeps", { clear = true }),
  callback = function(args)
    local formatters = conform_config.formatters_by_ft[args.match]
    if not formatters then
      return
    end
    for _, formatter in ipairs(formatters) do
      local bin = formatter_bins[formatter] or formatter
      utils.warn_missing_executable(
        bin,
        string.format(
          "conform.nvim: `%s` was not found on PATH (formatter for %s).\n"
            .. "Install it via Mason or your package manager, or format will fall back to LSP when possible.",
          bin,
          args.match
        )
      )
    end
  end,
})
