-- Hide ~ from end of lines.
vim.opt.fillchars = { eob = " " }

local highlight = require("utils").highlight

-- -- Highlightign line number for lsp diagnostics sings
vim.api.nvim_create_autocmd({ "Colorscheme", "VimEnter" }, {
  pattern = "*",

  callback = function()
    local fn = vim.fn
    local error_bcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignError")), "fg")
    local info_bcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignInfo")), "fg")
    local warn_bcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignWarn")), "fg")
    local hint_bcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignHint")), "fg")

    local error_fcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignError")), "bg")
    local info_fcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignInfo")), "bg")
    local warn_fcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignWarn")), "bg")
    local hint_fcolor = fn.synIDattr(fn.synIDtrans(fn.hlID("DiagnosticSignHint")), "bg")

    highlight("DiagnosticLineNrError", { bg = error_bcolor, fg = error_fcolor }, { bold = true })
    highlight("DiagnosticLineNrWarn", { bg = warn_bcolor, fg = warn_fcolor }, { bold = true })
    highlight("DiagnosticLineNrInfo", { bg = info_bcolor, fg = info_fcolor }, { bold = true })
    highlight("DiagnosticLineNrHint", { bg = hint_bcolor, fg = hint_fcolor }, { bold = true })

    fn.sign_define("DiagnosticSignError", { text = "", texthl = "", numhl = "DiagnosticLineNrError" })
    fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "", numhl = "DiagnosticLineNrWarn" })
    fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "", numhl = "DiagnosticLineNrInfo" })
    fn.sign_define("DiagnosticSignHint", { text = "", texthl = "", numhl = "DiagnosticLineNrHint" })
  end,
})

vim.g.tokyonight_style = "night" -- styles: storm, night and day.
vim.g.enfocado_style = "nature" -- styles: nature and neon.

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

function _G.make_codeart_transparent()
  highlight("Normal", { bg = nil, fg = nil })
  highlight("NormalNc", { bg = nil, fg = nil })
  highlight("LineNr", { bg = nil, fg = nil })
  highlight("CursorLineNr", { bg = nil, fg = nil })
  highlight("SignColumn", { bg = nil, fg = nil })
  highlight("EndOfBuffer", { bg = nil, fg = nil })

  highlight("NvimTreeNormal", { bg = nil, fg = nil })
  highlight("NvimTreeNormalNc", { bg = nil, fg = nil })
  highlight("NvimTreeEndOfBuffer", { bg = nil, fg = nil })
  highlight("NvimTreeFolderIcon", { bg = nil, fg = nil })
  highlight("NvimTreeOpenedFolderName", { bg = nil, fg = nil })

  highlight("BufferLineFill", { bg = nil, fg = nil })
  highlight("BufferLineDiagnostics", { bg = nil, fg = nil })
  highlight("BufferLineTab", { bg = nil, fg = nil })
  highlight("BufferLineTabSelected", { bg = nil, fg = nil })
  highlight("BufferLineTabClose", { bg = nil, fg = nil })
  highlight("BufferLineDuplicate", { bg = nil, fg = nil })
  highlight("BufferLineDuplicateSelected", { bg = nil, fg = nil })
  highlight("BufferLineDuplicateVisible", { bg = nil, fg = nil })

  highlight("BufferLineBackground", { bg = nil, fg = nil })
  highlight("BufferLineCloseButton", { bg = nil, fg = nil })
  highlight("BufferLineCloseButtonSelected", { bg = nil, fg = nil })
  highlight("BufferLineCloseButtonVisible", { bg = nil, fg = nil })
  highlight("BufferLineBufferVisible", { bg = nil, fg = nil })
  highlight("BufferLineSeperator", { bg = nil, fg = nil })
  highlight("BufferLineSeperatorVisible", { bg = nil, fg = nil })
  highlight("BufferLineGroupSeperator", { bg = nil, fg = nil })
  highlight("BufferLineSeparator", { bg = nil, fg = nil })
  highlight("BufferLineBufferSelected", { bg = nil, fg = nil })
  highlight("BufferLineDiagnostic", { bg = nil, fg = nil })

  highlight("BufferLinePick", { bg = nil })
  highlight("BufferLinePickSelected", { bg = nil })
  highlight("BufferLineSeparatorSelected", { bg = nil })
  highlight("BufferLineIndicatorSelected", { bg = nil })
  highlight("BufferLineDevIconLuaSelected", { bg = nil })
  highlight("BufferLineDevIconDefaultInactive", { bg = nil })

  highlight("BufferLineError", { bg = nil, fg = nil })
  highlight("BufferLineErrorDiagnostic", { bg = nil, fg = nil })
  highlight("BufferLineErrorVisible", { bg = nil, fg = nil })
  highlight("BufferLineErrorDiagnosticVisible", { bg = nil, fg = nil })
  highlight("BufferLineErrorSelected", { bg = nil })
  highlight("BufferLineErrorDiagnosticSelected", { bg = nil })
  highlight("BufferLineErrorDiagnosticSelected", { bg = nil })

  highlight("BufferLineWarning", { bg = nil, fg = nil })
  highlight("BufferLineWarningVisible", { bg = nil, fg = nil })
  highlight("BufferLineWarningDiagnosticVisible", { bg = nil, fg = nil })
  highlight("BufferLineWarningDiagnostic", { bg = nil, fg = nil })
  highlight("BufferLineWarningSelected", { bg = nil })
  highlight("BufferLineWarningDiagnosticSelected", { bg = nil })
  highlight("BufferLineWarningDiagnosticSelected", { bg = nil })

  highlight("BufferLineInfo", { bg = nil, fg = nil })
  highlight("BufferLineInfoVisible", { bg = nil, fg = nil })
  highlight("BufferLineInfoDiagnosticVisible", { bg = nil, fg = nil })
  highlight("BufferLineInfoDiagnostic", { bg = nil, fg = nil })
  highlight("BufferLineInfoSelected", { bg = nil })
  highlight("BufferLineInfoDiagnosticSelected", { bg = nil })
  highlight("BufferLineInfoDiagnosticSelected", { bg = nil })

  highlight("BufferLineModifiedVisible", { bg = nil, fg = nil })
  highlight("BufferLineModified", { bg = nil })
  highlight("BufferLineModifiedSelected", { bg = nil })

  highlight("NormalFloat", { bg = nil })
  highlight("FloatBorder", { bg = nil })
  highlight("WhichKeyFloat", { bg = nil })
end
