-- Hide ~ from end of lines.
vim.opt.fillchars = { eob = " " }

local highlight = require("utils").highlight

-- -- Highlightign line number for lsp diagnostics sings based on colorscheme
vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  pattern = "*",

  callback = function()
    local fn = vim.fn

    -- Getting diagnostic signs color.
    local error_bcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignError")), "fg")
    local info_bcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignInfo")), "fg")
    local warn_bcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignWarn")), "fg")
    local hint_bcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignHint")), "fg")

    local error_fcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignError")), "bg")
    local info_fcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignInfo")), "bg")
    local warn_fcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignWarn")), "bg")
    local hint_fcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignHint")), "bg")

    -- Applying thoes colors to diagnostic line number.
    highlight("DiagnosticLineNrError", { bg = error_bcolor, fg = error_fcolor }, { bold = true })
    highlight("DiagnosticLineNrWarn", { bg = warn_bcolor, fg = warn_fcolor }, { bold = true })
    highlight("DiagnosticLineNrInfo", { bg = info_bcolor, fg = info_fcolor }, { bold = true })
    highlight("DiagnosticLineNrHint", { bg = hint_bcolor, fg = hint_fcolor }, { bold = true })

    -- Applying diagnostic line number and remove diagnostic signs
    fn.sign_define("DiagnosticSignError", { text = "", texthl = "", numhl = "DiagnosticLineNrError" })
    fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "", numhl = "DiagnosticLineNrWarn" })
    fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "", numhl = "DiagnosticLineNrInfo" })
    fn.sign_define("DiagnosticSignHint", { text = "", texthl = "", numhl = "DiagnosticLineNrHint" })
  end,
})

vim.g.tokyonight_style = "night" -- styles: storm, night and day.
vim.g.enfocado_style = "nature" -- styles: nature and neon.

-- In enfocado colorscheme you can enable highlight some plugins.
-- You can set enabled plugins like this(This is CodeArt supported plugins).
vim.g.enfocado_plugins = {
  "cmp",
  "alpha",
  "gitsigns",
  "lsp",
  "lsp-installer",
  "matchup",
  "packer",
  "scrollview",
  "telescope",
  "todo-comments",
  "tree",
  "treesitter",
  "which-key",
}

-- Removing background and/or foreground from some highlight groups
function _G.make_codeart_transparent()
  highlight("Normal", { bg = "NONE", fg = "NONE" })
  highlight("NormalNc", { bg = "NONE", fg = "NONE" })
  highlight("LineNr", { bg = "NONE", fg = "NONE" })
  highlight("CursorLineNr", { bg = "NONE", fg = "NONE" })
  highlight("SignColumn", { bg = "NONE", fg = "NONE" })
  highlight("EndOfBuffer", { bg = "NONE", fg = "NONE" })
  highlight("NormalFloat", { bg = "NONE" })
  highlight("Float", { bg = "NONE" })

  highlight("AlphaCenter", { bg = "NONE", fg = "NONE" })
  highlight("AlphaFooter", { bg = "NONE", fg = "NONE" })

  highlight("NvimTreeNormal", { bg = "NONE", fg = "NONE" })
  highlight("NvimTreeNormalNc", { bg = "NONE", fg = "NONE" })
  highlight("NvimTreeEndOfBuffer", { bg = "NONE", fg = "NONE" })
  highlight("NvimTreeFolderIcon", { bg = "NONE", fg = "NONE" })
  highlight("NvimTreeOpenedFolderName", { bg = "NONE", fg = "NONE" })

  highlight("BufferLineFill", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineDiagnostics", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineTab", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineTabSelected", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineTabClose", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineDuplicate", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineDuplicateSelected", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineDuplicateVisible", { bg = "NONE", fg = "NONE" })

  highlight("BufferLineBackground", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineCloseButton", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineCloseButtonSelected", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineCloseButtonVisible", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineBufferVisible", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineSeperator", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineSeperatorVisible", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineGroupSeperator", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineSeparator", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineBufferSelected", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineDiagnostic", { bg = "NONE", fg = "NONE" })

  highlight("BufferLinePick", { bg = "NONE" })
  highlight("BufferLinePickSelected", { bg = "NONE" })
  highlight("BufferLineSeparatorSelected", { bg = "NONE" })
  highlight("BufferLineIndicatorSelected", { bg = "NONE" })
  highlight("BufferLineDevIconLuaSelected", { bg = "NONE" })
  highlight("BufferLineDevIconDefaultInactive", { bg = "NONE" })

  highlight("BufferLineError", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineErrorDiagnostic", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineErrorVisible", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineErrorDiagnosticVisible", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineErrorSelected", { bg = "NONE" })
  highlight("BufferLineErrorDiagnosticSelected", { bg = "NONE" })
  highlight("BufferLineErrorDiagnosticSelected", { bg = "NONE" })

  highlight("BufferLineWarning", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineWarningVisible", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineWarningDiagnosticVisible", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineWarningDiagnostic", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineWarningSelected", { bg = "NONE" })
  highlight("BufferLineWarningDiagnosticSelected", { bg = "NONE" })
  highlight("BufferLineWarningDiagnosticSelected", { bg = "NONE" })

  highlight("BufferLineInfo", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineInfoVisible", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineInfoDiagnosticVisible", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineInfoDiagnostic", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineInfoSelected", { bg = "NONE" })
  highlight("BufferLineInfoDiagnosticSelected", { bg = "NONE" })
  highlight("BufferLineInfoDiagnosticSelected", { bg = "NONE" })

  highlight("BufferLineModifiedVisible", { bg = "NONE", fg = "NONE" })
  highlight("BufferLineModified", { bg = "NONE" })
  highlight("BufferLineModifiedSelected", { bg = "NONE" })

  highlight("WhichKeyFloat", { bg = "NONE" })
  highlight("WhichKey", { bg = "NONE" })
end
