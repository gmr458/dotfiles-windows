return {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
    config = function()
        require('github-theme').setup {
            styles = {
                comments = 'NONE',
                functions = 'NONE',
                keywords = 'NONE',
                variables = 'NONE',
                conditionals = 'NONE',
                constants = 'NONE',
                numbers = 'NONE',
                operators = 'NONE',
                strings = 'NONE',
                types = 'NONE',
            },
            groups = {
                all = {
                    SnacksPickerInput = { bg = 'bg0' },
                    SnacksPickerInputBorder = { bg = 'bg0' },
                    SnacksPickerList = { bg = 'bg3' },
                    SnacksPickerListBorder = { bg = 'bg3' },
                    SnacksPickerPreviewBorder = { bg = 'bg0' },
                    SnacksPickerDir = { link = 'Comment' },
                    SnacksPickerRow = { link = 'Comment' },
                    NvimTreeWinSeparator = { bg = 'bg1', fg = 'bg1' },
                    TreesitterContextLineNumber = {
                        bg = 'palette.accent.subtle',
                    },

                    StatusLine = { bg = 'bg0', fg = 'palette.fg.muted' },
                    StatusLineMode = { bg = 'palette.black.bright', fg = 'fg' },
                    StatusLineMedium = { bg = 'bg2', fg = 'palette.fg.muted' },
                    StatusLineGitBranchIcon = { bg = 'bg2', fg = 'orange' },
                    StatusLineGitDiffAdded = {
                        bg = 'bg2',
                        fg = 'palette.green.base',
                    },
                    StatusLineGitDiffChanged = {
                        bg = 'bg2',
                        fg = 'palette.attention.fg',
                    },
                    StatusLineGitDiffRemoved = {
                        bg = 'bg2',
                        fg = 'palette.danger.fg',
                    },
                    StatusLineLspError = {
                        bg = 'bg2',
                        fg = 'palette.danger.fg',
                    },
                    StatusLineLspWarn = {
                        bg = 'bg2',
                        fg = 'palette.attention.fg',
                    },
                    StatusLineLspHint = { bg = 'bg2', fg = 'palette.fg.muted' },
                    StatusLineLspInfo = { bg = 'bg2', fg = 'palette.accent.fg' },
                    StatusLineLspMessages = {
                        bg = 'bg0',
                    },
                },
            },
        }

        vim.cmd.colorscheme 'github_dark_dimmed'
    end,
}
