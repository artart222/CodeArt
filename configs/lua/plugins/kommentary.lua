local present, kommentary_config = pcall(require, "kommentary.config")
if not present then
  return
end

local langs = require("kommentary.config").config -- all default supported langs
for lang, _ in pairs(langs) do
  kommentary_config.configure_language(lang, {
    single_line_comment_string = "auto",
    multi_line_comment_strings = "auto",
    prefer_multi_line_comments = true,
    use_consistent_indentation = true,
    ignore_whitespace = true,
    hook_function = function()
      if require("utils").is_plugin_installed("kommentary") then
        require("ts_context_commentstring.internal").update_commentstring()
      end
    end,
  })
end

vim.g.kommentary_create_default_mappings = false
