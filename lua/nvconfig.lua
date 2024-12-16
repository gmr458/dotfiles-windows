local options = {
    base46 = {
        theme = 'radium',
        hl_add = {
            StatusLine = { bg = 'statusline_bg', fg = 'base07' },
            StatusLineMode = { bg = 'green', fg = 'darker_black' },
            StatusLineMedium = { bg = 'one_bg', fg = '#B0B3B8' },
            StatusLineGitBranchIcon = { bg = 'one_bg', fg = 'orange' },
            StatusLineGitDiffAdded = { bg = 'one_bg', fg = 'green' },
            StatusLineGitDiffChanged = { bg = 'one_bg', fg = 'yellow' },
            StatusLineGitDiffRemoved = { bg = 'one_bg', fg = 'red' },
            StatusLineLspError = { bg = 'one_bg', fg = 'red' },
            StatusLineLspWarn = { bg = 'one_bg', fg = 'yellow' },
            StatusLineLspHint = { bg = 'one_bg', fg = 'purple' },
            StatusLineLspInfo = { bg = 'one_bg', fg = 'green' },
            StatusLineLspMessages = { bg = 'statusline_bg', fg = 'light_grey' },
            DiagnosticUnderlineError = {
                undercurl = true,
                special = '#f87070',
            },
            DiagnosticUnderlineWarn = {
                undercurl = true,
                special = '#ffe59e',
            },
            DiagnosticUnderlineHint = {
                undercurl = true,
                special = '#c397d8',
            },
            DiagnosticUnderlineInfo = {
                undercurl = true,
                special = '#37d99e',
            },
            GitSignsDeleteInline = { bg = '#701414' },
            GitSignsDelete = { fg = '#ab4642' },
            GitSignsChangeInline = { bg = '#4C5B2B' },
            GitSignsAddInline = { bg = '#4C5B2B' },
            GitSignsChange = { fg = '#f7ca88' },
            GitSignsAdd = { fg = '#9EBC9F' },
            FzfLuaNormal = { link = 'NormalFloat' },
            FzfLuaBorder = { link = 'FloatBorder' },
            TelescopePreviewNormal = { link = 'Normal' },
            TelescopePreviewBorder = { bg = 'black', fg = 'black' },
        },
        hl_override = {
            FloatBorder = { bg = 'darker_black', fg = 'darker_black' },
            DiffDelete = { bg = '#4C1919' },
            DiffAdd = { bg = '#383E2A' },
            DiffChange = { bg = '#7e4e08' },
            DiffText = { bg = '#383E2A' },
        },
        integrations = {},
        changed_themes = {},
        transparency = false,
        theme_toggle = { 'radium', 'one_light' },
    },
    ui = {
        cmp = {
            icons = true,
            lspkind_text = true,
            style = 'default', -- default/flat_light/flat_dark/atom/atom_colored
        },
        telescope = { style = 'borderless' }, -- borderless / bordered
        statusline = {
            theme = 'default', -- default/vscode/vscode_colored/minimal
            -- default/round/block/arrow separators work only for default statusline theme
            -- round and block will work for minimal theme only
            separator_style = 'default',
            order = nil,
            modules = nil,
        },
    },
    cheatsheet = {
        theme = 'grid', -- simple/grid
        excluded_groups = { 'terminal (t)', 'autopairs', 'Nvim', 'Opens' }, -- can add group name or with mode
    },
}

local status, chadrc = pcall(require, 'chadrc')
return vim.tbl_deep_extend('force', options, status and chadrc or {})
