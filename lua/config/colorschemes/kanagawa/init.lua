local ok, kanagawa = pcall(require, 'kanagawa')
if not ok then
    vim.notify 'kanagawa could not be loaded'
    return
end

local transparent = false

kanagawa.setup {
    compile = true,
    undercurl = true,
    commentStyle = { bold = false, italic = true },
    functionStyle = { bold = false, italic = false },
    keywordStyle = { bold = false, italic = true },
    statementStyle = { bold = false, italic = false },
    typeStyle = { bold = false, italic = false },
    transparent = transparent,
    dimInactive = false,
    terminalColors = true,
    colors = {
        palette = {},
        theme = {
            wave = {},
            lotus = {},
            dragon = {},
            all = {
                ui = {
                    bg_gutter = 'none',
                },
            },
        },
    },
    overrides = function(colors)
        local theme = colors.theme

        return {
            NormalFloat = { bg = 'none' },
            FloatBorder = { bg = 'none' },
            StatusLine = { fg = theme.ui.special },
            StatusLineMode = { bg = theme.ui.bg_search },
            StatusLineLspError = { bg = theme.ui.bg_m3, fg = theme.diag.error },
            StatusLineLspWarn = { bg = theme.ui.bg_m3, fg = theme.diag.warning },
            StatusLineLspHint = { bg = theme.ui.bg_m3, fg = theme.diag.hint },
            StatusLineLspInfo = { bg = theme.ui.bg_m3, fg = theme.diag.info },
            StatusLineLspMessages = {
                bg = theme.ui.bg_m3,
                fg = theme.diag.info,
            },
            StatusLineGitDiffAdded = {
                bg = theme.ui.bg_m3,
                fg = theme.vcs.added,
            },
            StatusLineGitDiffChanged = {
                bg = theme.ui.bg_m3,
                fg = theme.vcs.changed,
            },
            StatusLineGitDiffRemoved = {
                bg = theme.ui.bg_m3,
                fg = theme.vcs.removed,
            },
            StatusLineGitBranchIcon = {
                bg = theme.ui.bg_m3,
                fg = colors.palette.surimiOrange,
            },
            CursorLine = { bg = theme.ui.bg_p1 },
            CursorLineNr = { bg = theme.ui.bg_p1 },
            TelescopeTitle = { fg = theme.ui.special },
            TelescopePromptNormal = {
                bg = transparent and 'none' or theme.ui.bg_p1,
            },
            TelescopePromptBorder = {
                fg = transparent and theme.ui.float.fg_border or theme.ui.bg_p1,
                bg = transparent and 'none' or theme.ui.bg_p1,
            },
            TelescopeResultsNormal = {
                fg = theme.ui.fg_dim,
                bg = transparent and 'none' or theme.ui.bg_m1,
            },
            TelescopeResultsBorder = {
                fg = transparent and theme.ui.float.fg_border or theme.ui.bg_m1,
                bg = transparent and 'none' or theme.ui.bg_m1,
            },
            TelescopePreviewNormal = {
                bg = transparent and 'none' or theme.ui.bg_dim,
            },
            TelescopePreviewBorder = {
                bg = transparent and 'none' or theme.ui.bg_dim,
                fg = transparent and theme.ui.float.fg_border
                    or theme.ui.bg_dim,
            },
            TreesitterContextLineNumber = { link = 'Folded' },
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
            PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
            CmpMenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
            AlphaButton = { fg = theme.ui.bg_search },
            AlphaHeader = { fg = theme.syn.special2 },
            AlphaShorcut = { fg = theme.syn.comment },
            NvimTreeNormal = { bg = transparent and 'none' or theme.ui.bg_m3 },
            NvimTreeWinSeparator = {
                bg = transparent and 'none' or theme.ui.bg,
                fg = transparent and 'none' or theme.ui.bg,
            },
        }
    end,
    theme = 'dragon',
    background = {
        dark = 'dragon',
        light = 'lotus',
    },
}
