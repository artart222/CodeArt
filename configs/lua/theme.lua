-- Hide ~ from end of lines.
vim.opt.fillchars = { eob = " " }

-- -- Highlightign line number for lsp diagnostics sings
vim.cmd
[[
  autocmd ColorScheme * highlight DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
  autocmd ColorScheme * highlight DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
  autocmd ColorScheme * highlight DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
  autocmd ColorScheme * highlight DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

  autocmd ColorScheme * sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  autocmd ColorScheme * sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  autocmd ColorScheme * sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  autocmd ColorScheme * sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]

vim.g.tokyonight_style = "night" -- styles: storm, night and day.
vim.g.enfocado_style = "nature"    -- styles: nature and neon.

vim.g.enfocado_plugins = {
  "cmp",
  "dashboard",
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
  "vista",
  "which-key",
}
require('onedark').setup  {
    -- Main options --
    style = 'deep', -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    term_colors = true,
    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },
    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
}

vim.cmd("colorscheme enfocado")

function _G.make_codeart_transparent()
  vim.cmd("highlight Normal guibg=NONE guifg=NONE")
  vim.cmd("highlight NormalNc guibg=NONE guifg=NONE")
  vim.cmd("highlight LineNr guibg=NONE guifg=NONE")
  vim.cmd("highlight CursorLineNr guibg=NONE guifg=NONE")
  vim.cmd("highlight SignColumn guibg=NONE guifg=NONE")
  vim.cmd("highlight EndOfBuffer guibg=NONE guifg=NONE")


  vim.cmd("highlight NvimTreeNormal guibg=NONE guifg=NONE")
  vim.cmd("highlight NvimTreeNormalNc guibg=NONE guifg=NONE")
  vim.cmd("highlight NvimTreeEndOfBuffer guibg=NONE guifg=NONE")
  vim.cmd("highlight NvimTreeFolderIcon guibg=NONE guifg=NONE")
  vim.cmd("highlight NvimTreeOpenedFolderName guibg=NONE guifg=NONE")


  vim.cmd("highlight BufferLineFill guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineDiagnostics guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineTab guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineTabSelected guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineTabClose guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineDuplicate guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineDuplicateSelected guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineDuplicateVisible guibg=NONE guifg=NONE")

  vim.cmd("highlight BufferLineBackground guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineCloseButton guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineCloseButtonSelected	 guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineCloseButtonVisible	 guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineBufferVisible guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLinePick guibg=NONE")
  vim.cmd("highlight BufferLinePickSelected guibg=NONE")
  vim.cmd("highlight BufferLineSeperator guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineGroupSeperator guibg=NONE guifg=NONE")
  vim.cmd("highlight bufferlineseperatorvisible guibg=none guifg=none")
  vim.cmd("highlight BufferLineSeparatorSelected guibg=none")
  vim.cmd("highlight BufferLineSeparator guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineIndicatorSelected	 guibg=NONE")
  vim.cmd("highlight BufferLineBufferSelected guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineDiagnostic	 guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineDevIconLuaSelected	 guibg=NONE")
  vim.cmd("highlight BufferLineDevIconDefaultInactive	 guibg=NONE")

  vim.cmd("highlight BufferLineError guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineErrorVisible guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineErrorDiagnosticVisible guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineErrorSelected guibg=NONE")
  vim.cmd("highlight BufferLineErrorDiagnostic guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineErrorDiagnosticSelected guibg=NONE")
  vim.cmd("highlight BufferLineErrorDiagnosticSelected guibg=NONE")

  vim.cmd("highlight BufferLineWarning guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineWarningVisible guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineWarningDiagnosticVisible guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineWarningSelected guibg=NONE")
  vim.cmd("highlight BufferLineWarningDiagnostic guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineWarningDiagnosticSelected guibg=NONE")
  vim.cmd("highlight BufferLineWarningDiagnosticSelected guibg=NONE")

  vim.cmd("highlight BufferLineInfo guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineInfoVisible guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineInfoDiagnosticVisible guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineInfoSelected guibg=NONE")
  vim.cmd("highlight BufferLineInfoDiagnostic guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineInfoDiagnosticSelected guibg=NONE")
  vim.cmd("highlight BufferLineInfoDiagnosticSelected guibg=NONE")

  vim.cmd("highlight BufferLineModified guibg=NONE")
  vim.cmd("highlight BufferLineModifiedSelected guibg=NONE")
  vim.cmd("highlight BufferLineModifiedVisible guibg=NONE guifg=NONE")

  vim.cmd("highlight NormalFloat guibg=NONE")
  vim.cmd("highlight FloatBorder guibg=#NONE")
  vim.cmd("highlight WhichKeyFloat guibg=NONE")
end
