local M = {}

local ok, kanagawa = pcall(require, "kanagawa")
if not ok then
    vim.notify("kanagawa could not be loaded")
    return
end

local transparent = false

M.kanagawa_options = {
    compile = true, -- enable compiling the colorscheme
    undercurl = true, -- enable undercurls
    commentStyle = {},
    functionStyle = {},
    keywordStyle = {},
    statementStyle = {},
    typeStyle = {},
    transparent = transparent, -- do not set background color
    dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    colors = { -- add/modify theme and palette colors
        palette = {},
        theme = {
            wave = {},
            lotus = {},
            dragon = {},
            all = {
                ui = {
                    bg_gutter = "none",
                },
            },
        },
    },
    overrides = function(colors) -- add/modify highlights
        local theme = colors.theme

        return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            StatusLine = { fg = theme.ui.fg_dim },
            StatusLineMode = { bg = colors.palette.waveBlue2 },
            StatusLineLspError = { bg = theme.ui.bg_m3, fg = theme.diag.error },
            StatusLineLspWarn = { bg = theme.ui.bg_m3, fg = theme.diag.warning },
            StatusLineLspHint = { bg = theme.ui.bg_m3, fg = theme.diag.hint },
            StatusLineLspInfo = { bg = theme.ui.bg_m3, fg = theme.diag.info },
            StatusLineLspMessages = { bg = theme.ui.bg_m3, fg = theme.diag.info },
            StatusLineGitDiffAdded = { bg = theme.ui.bg_m3, fg = theme.vcs.added },
            StatusLineGitDiffChanged = { bg = theme.ui.bg_m3, fg = theme.vcs.changed },
            StatusLineGitDiffRemoved = { bg = theme.ui.bg_m3, fg = theme.vcs.removed },
            StatusLineGitBranchIcon = { bg = theme.ui.bg_m3, fg = colors.palette.surimiOrange },
            CursorLine = { bg = theme.ui.bg_p1 },
            CursorLineNr = { bg = theme.ui.bg_p1 },
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
            TreesitterContextLineNumber = { link = "Folded" },
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
            CmpMenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            AlphaButton = { fg = theme.ui.bg_search },
            AlphaHeader = { fg = theme.syn.special2 },
            AlphaShorcut = { fg = theme.syn.comment },
            NvimTreeNormal = { bg = theme.ui.bg_m3 },
            NvimTreeWinSeparator = { bg = theme.ui.bg, fg = theme.ui.bg },
        }
    end,
    theme = "dragon", -- Load "wave" theme when 'background' option is not set
    background = { -- map the value of 'background' option to a theme
        dark = "dragon", -- try "dragon" !
        light = "lotus",
    },
}

kanagawa.setup(M.kanagawa_options)

return M
