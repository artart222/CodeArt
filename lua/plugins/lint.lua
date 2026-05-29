local present, lint = pcall(require, "lint")
if not present then
  return
end

local config = require("user_settings").config
if config.lint then
  if config.lint.linters_by_ft and next(config.lint.linters_by_ft) then
    lint.linters_by_ft = vim.tbl_deep_extend("force", lint.linters_by_ft or {}, config.lint.linters_by_ft)
  end
  if config.lint.linters then
    for name, def in pairs(config.lint.linters) do
      lint.linters[name] = def
    end
  end
end

local lint_augroup = vim.api.nvim_create_augroup("CodeArtLint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})
