--- @param name string
--- @param val vim.api.keyset.highlight
local function set_hl(name, val)
    vim.api.nvim_set_hl(0, name, val)
end

--- @param opts vim.api.keyset.get_highlight
--- @return table<string, any>
local function get_hl(opts)
    return vim.api.nvim_get_hl(0, opts)
end

local function bg_is_dark()
    return vim.o.background == 'dark'
end

local normal_bg = get_hl({ name = 'Normal' }).bg
local normal_float_bg = get_hl({ name = 'NormalFloat' }).bg
local statusline_bg = get_hl({ name = 'StatusLine' }).bg
local diagnostic_ok_fg = get_hl({ name = 'DiagnosticOk' }).fg
local diagnostic_error_fg = get_hl({ name = 'DiagnosticError' }).fg
local diagnostic_hint_fg = get_hl({ name = 'DiagnosticHint' }).fg
local diagnostic_info_fg = get_hl({ name = 'DiagnosticInfo' }).fg
local diagnostic_info_ok = get_hl({ name = 'DiagnosticOk' }).fg
local diagnostic_warn_fg = get_hl({ name = 'DiagnosticWarn' }).fg
local diff_add_fg = 'NvimDarkGreen'
local diff_change_fg = get_hl({ name = 'DiffChange' }).bg
local diff_delete_fg = get_hl({ name = 'DiffDelete' }).fg
local comment_fg = get_hl({ name = 'Comment' }).fg
local nvim_tree_bg = bg_is_dark() and 'NvimDarkGrey1' or 'NvimLightGrey1'
local directory_fg = bg_is_dark() and 'NvimLightBlue' or 'NvimDarkBlue'
local statement_fg = bg_is_dark() and 'NvimLightGrey3' or 'NvimDarkGrey3'

set_hl('Statement', { fg = statement_fg })
set_hl('PreProc', { fg = statement_fg })
set_hl('@storageclass', { fg = statement_fg })
set_hl('@type.qualifier', { fg = statement_fg })

set_hl('FloatBorder', { bg = normal_float_bg, fg = normal_float_bg })

set_hl('Directory', { fg = directory_fg })

set_hl('FzfLuaNormal', { link = 'NormalFloat' })
set_hl('FzfLuaBorder', { link = 'FloatBorder' })

set_hl('WinBar', { link = 'Comment' })
set_hl('WinBarNC', { link = 'Comment' })
set_hl('WinBarUnsavedSymbol', { link = 'WarningMsg' })

set_hl('StatusLine', { fg = comment_fg, bg = statusline_bg })
set_hl('StatusLineLighter', { link = 'StatusLine' })
set_hl('StatusLineMedium', { link = 'StatusLine' })
set_hl('StatusLineMode', { link = 'StatusLine' })
set_hl('StatusLineNeovimLogo', { link = 'StatusLine' })

set_hl('StatusLineLspError', { fg = diagnostic_error_fg, bg = statusline_bg })
set_hl('StatusLineLspWarn', { fg = diagnostic_warn_fg, bg = statusline_bg })
set_hl('StatusLineLspHint', { fg = diagnostic_hint_fg, bg = statusline_bg })
set_hl('StatusLineLspInfo', { fg = diagnostic_info_fg, bg = statusline_bg })

set_hl('StatusLineLspMessages', { link = 'StatusLine' })

set_hl('StatusLineGitDiffAdded', { fg = diff_add_fg, bg = statusline_bg })
set_hl('StatusLineGitDiffChanged', { fg = diff_change_fg, bg = statusline_bg })
set_hl('StatusLineGitDiffRemoved', { fg = diff_delete_fg, bg = statusline_bg })

set_hl('StatusLineGitBranchIcon', { link = 'StatusLine' })
set_hl('StatusLineUnsavedFileIcon', { link = 'WarningMsg' })

set_hl('StatusLineLspActive', { fg = diagnostic_ok_fg, bg = statusline_bg })
set_hl('StatusLineLspInactive', { link = 'StatusLine' })

set_hl('GitSignsAdd', { fg = diff_add_fg })
set_hl('GitSignsChange', { fg = diff_change_fg })
set_hl('GitSignsDelete', { link = 'DiffDelete' })

set_hl('NvimTreeNormal', { bg = nvim_tree_bg })
set_hl('NvimTreeWinSeparator', { bg = normal_bg, fg = normal_bg })
set_hl('NvimTreeGitDirty', { link = 'ErrorMsg' })
set_hl('NvimTreeGitNew', { link = 'WarningMsg' })
set_hl('NvimTreeExecFile', { link = 'ModeMsg' })
set_hl('NvimTreeRootFolder', { link = 'Comment' })
set_hl('NvimTreeModifiedFile', { link = 'WarningMsg' })
set_hl('NvimTreeFolderIcon', { link = 'Directory' })

set_hl('TreesitterContext', { link = 'CursorLine' })
set_hl('TreesitterContextLineNumber', { link = 'CursorLine' })

set_hl(
    'DiagnosticUnderlineError',
    { undercurl = true, special = diagnostic_error_fg }
)
set_hl(
    'DiagnosticUnderlineHint',
    { undercurl = true, special = diagnostic_hint_fg }
)
set_hl(
    'DiagnosticUnderlineInfo',
    { undercurl = true, special = diagnostic_info_fg }
)
set_hl(
    'DiagnosticUnderlineOk',
    { undercurl = true, special = diagnostic_ok_fg }
)
set_hl(
    'DiagnosticUnderlineWarn',
    { undercurl = true, special = diagnostic_warn_fg }
)
