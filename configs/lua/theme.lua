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
require("onedark").setup  {
    -- Main options --
    style = "deep", -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    term_colors = true,
    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none"
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
  vim.cmd
  [[
  highlight Normal guibg=NONE guifg=NONE
  highlight NormalNc guibg=NONE guifg=NONE
  highlight LineNr guibg=NONE guifg=NONE
  highlight CursorLineNr guibg=NONE guifg=NONE
  highlight SignColumn guibg=NONE guifg=NONE
  highlight EndOfBuffer guibg=NONE guifg=NONE


  highlight NvimTreeNormal guibg=NONE guifg=NONE
  highlight NvimTreeNormalNc guibg=NONE guifg=NONE
  highlight NvimTreeEndOfBuffer guibg=NONE guifg=NONE
  highlight NvimTreeFolderIcon guibg=NONE guifg=NONE
  highlight NvimTreeOpenedFolderName guibg=NONE guifg=NONE

  highlight lualine_b_normal guibg=NONE
  highlight lualine_c_normal guibg=NONE
  highlight lualine_b_command guibg=NONE
  highlight lualine_c_command guibg=NONE
  highlight lualine_b_terminal guibg=NONE
  highlight lualine_c_terminal guibg=NONE
  highlight lualine_b_visual guibg=NONE
  highlight lualine_c_visual guibg=NONE
  highlight lualine_b_insert guibg=NONE
  highlight lualine_c_insert guibg=NONE
  highlight lualine_b_replace guibg=NONE
  highlight lualine_c_replace guibg=NONE

  highlight lualine_a_inactive guibg=NONE
  highlight lualine_b_inactive guibg=NONE
  highlight lualine_c_inactive guibg=NONE
  highlight StatusLine guibg=NONE
  highlight StatusLineNc guibg=NONE

  highlight lualine_transitional_lualine_a_normal_to_lualine_b_normal guibg=NONE
  highlight lualine_transitional_lualine_b_normal_to_lualine_c_normal guibg=NONE
  highlight lualine_transitional_lualine_a_visual_to_lualine_b_visual guibg=NONE
  highlight lualine_transitional_lualine_b_visual_to_lualine_c_visual guibg=NONE
  highlight lualine_transitional_lualine_b_diagnostics_info_normal_to_lualine_c_normal guibg=NONE
  highlight lualine_transitional_lualine_a_insert_to_lualine_b_insert guibg=NONE
  highlight lualine_transitional_lualine_b_diagnostics_info_normal_to_lualine_c_insert guibg=NONE
  highlight lualine_transitional_lualine_b_insert_to_lualine_c_insert guibg=NONE
  highlight lualine_transitional_lualine_b_diagnostics_hint_normal_to_lualine_c_normal guibg=NONE
  highlight lualine_transitional_lualine_b_diagnostics_error_normal_to_lualine_c_normal guibg=NONE
  highlight lualine_transitional_lualine_b_diagnostics_error_normal_to_lualine_c_insert guibg=NONE
  highlight lualine_transitional_lualine_a_command_to_lualine_b_command guibg=NONE
  highlight lualine_transitional_lualine_b_command_to_lualine_c_command guibg=NONE
  highlight lualine_transitional_lualine_b_diff_modified_normal_to_lualine_c_normal guibg=NONE
  highlight lualine_transitional_lualine_b_diff_modified_normal_to_lualine_c_command guibg=NONE
  highlight lualine_transitional_lualine_b_diff_modified_normal_to_lualine_c_visual guibg=NONE
  highlight lualine_transitional_lualine_b_diagnostics_info_normal_to_lualine_c_visual guibg=NONE
  highlight lualine_transitional_lualine_b_diff_modified_normal_to_lualine_c_insert guibg=NONE

  highlight lualine_b_diff_added_normal guibg=NONE
  highlight lualine_b_diff_modified_normal guibg=NONE
  highlight lualine_b_diff_removed_normal guibg=NONE
  highlight lualine_b_diagnostics_error_normal guibg=NONE
  highlight lualine_b_diagnostics_warn_normal guibg=NONE
  highlight lualine_b_diagnostics_info_normal guibg=NONE
  highlight lualine_b_diagnostics_hint_normal guibg=NONE
  highlight lualine_x_DevIconLua_normal guibg=NONE


  highlight BufferLineFill guibg=NONE guifg=NONE
  highlight BufferLineDiagnostics guibg=NONE guifg=NONE
  highlight BufferLineTab guibg=NONE guifg=NONE
  highlight BufferLineTabSelected guibg=NONE guifg=NONE
  highlight BufferLineTabClose guibg=NONE guifg=NONE
  highlight BufferLineDuplicate guibg=NONE guifg=NONE
  highlight BufferLineDuplicateSelected guibg=NONE guifg=NONE
  highlight BufferLineDuplicateVisible guibg=NONE guifg=NONE

  highlight BufferLineBackground guibg=NONE guifg=NONE
  highlight BufferLineCloseButton guibg=NONE guifg=NONE
  highlight BufferLineCloseButtonSelected	 guibg=NONE guifg=NONE
  highlight BufferLineCloseButtonVisible	 guibg=NONE guifg=NONE
  highlight BufferLineBufferVisible guibg=NONE guifg=NONE
  highlight BufferLinePick guibg=NONE
  highlight BufferLinePickSelected guibg=NONE
  highlight BufferLineSeperator guibg=NONE guifg=NONE
  highlight BufferLineGroupSeperator guibg=NONE guifg=NONE
  highlight bufferlineseperatorvisible guibg=none guifg=none
  highlight BufferLineSeparatorSelected guibg=none
  highlight BufferLineSeparator guibg=NONE guifg=NONE
  highlight BufferLineIndicatorSelected	 guibg=NONE
  highlight BufferLineBufferSelected guibg=NONE guifg=NONE
  highlight BufferLineDiagnostic	 guibg=NONE guifg=NONE
  highlight BufferLineDevIconLuaSelected	 guibg=NONE
  highlight BufferLineDevIconDefaultInactive	 guibg=NONE

  highlight BufferLineError guibg=NONE guifg=NONE
  highlight BufferLineErrorVisible guibg=NONE guifg=NONE
  highlight BufferLineErrorDiagnosticVisible guibg=NONE guifg=NONE
  highlight BufferLineErrorSelected guibg=NONE
  highlight BufferLineErrorDiagnostic guibg=NONE guifg=NONE
  highlight BufferLineErrorDiagnosticSelected guibg=NONE
  highlight BufferLineErrorDiagnosticSelected guibg=NONE

  highlight BufferLineWarning guibg=NONE guifg=NONE
  highlight BufferLineWarningVisible guibg=NONE guifg=NONE
  highlight BufferLineWarningDiagnosticVisible guibg=NONE guifg=NONE
  highlight BufferLineWarningSelected guibg=NONE
  highlight BufferLineWarningDiagnostic guibg=NONE guifg=NONE
  highlight BufferLineWarningDiagnosticSelected guibg=NONE
  highlight BufferLineWarningDiagnosticSelected guibg=NONE

  highlight BufferLineInfo guibg=NONE guifg=NONE
  highlight BufferLineInfoVisible guibg=NONE guifg=NONE
  highlight BufferLineInfoDiagnosticVisible guibg=NONE guifg=NONE
  highlight BufferLineInfoSelected guibg=NONE
  highlight BufferLineInfoDiagnostic guibg=NONE guifg=NONE
  highlight BufferLineInfoDiagnosticSelected guibg=NONE
  highlight BufferLineInfoDiagnosticSelected guibg=NONE

  highlight BufferLineModified guibg=NONE
  highlight BufferLineModifiedSelected guibg=NONE
  highlight BufferLineModifiedVisible guibg=NONE guifg=NONE

  highlight NormalFloat guibg=NONE
  highlight FloatBorder guibg=#NONE
  highlight WhichKeyFloat guibg=NONE
  ]]
end
