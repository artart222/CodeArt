local M = {}

-- Add highlight function to make Highlighting easer.
local highlight = require("utils").highlight

-- Highlighting line number for lsp diagnostics sings based on colorscheme.
vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  pattern = "*",

  callback = function()
    local fn = vim.fn

    -- Getting diagnostic signs background and foreground colors.
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

-- Removing background and/or foreground from some highlight groups.
-- TODO: Add new highlight groups to improve this function.
function M.make_codeart_transparent()
  highlight("Normal", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("NormalNc", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("LineNr", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("CursorLineNr", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("SignColumn", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("EndOfBuffer", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("NormalFloat", { bg = "NONE", ctermbg = "NONE" })
  highlight("Float", { bg = "NONE", ctermbg = "NONE" })

  highlight("AlphaCenter", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("AlphaFooter", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })

  highlight("NvimTreeNormal", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("NvimTreeNormalNc", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("NvimTreeEndOfBuffer", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("NvimTreeFolderIcon", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("NvimTreeOpenedFolderName", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })

  highlight("BufferLineFill", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineDiagnostics", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineTab", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineTabSelected", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineTabClose", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineDuplicate", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineDuplicateSelected", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineDuplicateVisible", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })

  highlight("BufferLineBackground", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineCloseButton", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineCloseButtonSelected", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineCloseButtonVisible", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineBufferVisible", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineSeperator", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineSeperatorVisible", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineGroupSeperator", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineSeparator", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineBufferSelected", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineDiagnostic", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })

  highlight("BufferLinePick", { bg = "NONE", ctermfg = "NONE" })
  highlight("BufferLinePickSelected", { bg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineSeparatorSelected", { bg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineIndicatorSelected", { bg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineDevIconLuaSelected", { bg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineDevIconDefaultInactive", { bg = "NONE", ctermfg = "NONE" })

  highlight("BufferLineError", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineErrorDiagnostic", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineErrorVisible", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineErrorDiagnosticVisible", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineErrorSelected", { bg = "NONE", ctermbg = "NONE" })
  highlight("BufferLineErrorDiagnosticSelected", { bg = "NONE", ctermbg = "NONE" })
  highlight("BufferLineErrorDiagnosticSelected", { bg = "NONE", ctermbg = "NONE" })

  highlight("BufferLineWarning", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineWarningVisible", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineWarningDiagnosticVisible", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineWarningDiagnostic", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineWarningSelected", { bg = "NONE", ctermbg = "NONE" })
  highlight("BufferLineWarningDiagnosticSelected", { bg = "NONE", ctermbg = "NONE" })
  highlight("BufferLineWarningDiagnosticSelected", { bg = "NONE", ctermbg = "NONE" })

  highlight("BufferLineInfo", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineInfoVisible", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineInfoDiagnosticVisible", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineInfoDiagnostic", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineInfoSelected", { bg = "NONE", ctermbg = "NONE" })
  highlight("BufferLineInfoDiagnosticSelected", { bg = "NONE", ctermbg = "NONE" })
  highlight("BufferLineInfoDiagnosticSelected", { bg = "NONE", ctermbg = "NONE" })

  highlight("BufferLineModifiedVisible", { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
  highlight("BufferLineModified", { bg = "NONE", ctermbg = "NONE" })
  highlight("BufferLineModifiedSelected", { bg = "NONE", ctermbg = "NONE" })

  highlight("WhichKeyFloat", { bg = "NONE", ctermbg = "NONE" })
  highlight("WhichKey", { bg = "NONE", ctermbg = "NONE" })
end

return M
