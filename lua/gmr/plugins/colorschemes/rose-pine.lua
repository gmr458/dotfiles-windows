return {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
        require('rose-pine').setup {
            highlight_groups = {
                TelescopeBorder = { fg = 'overlay', bg = 'overlay' },
                TelescopeNormal = { fg = 'subtle', bg = 'overlay' },
                TelescopeSelection = { fg = 'text', bg = 'highlight_med' },
                TelescopeSelectionCaret = { fg = 'love', bg = 'highlight_med' },
                TelescopeMultiSelection = { fg = 'text', bg = 'highlight_high' },

                TelescopeTitle = { fg = 'base', bg = 'love' },
                TelescopePromptTitle = { fg = 'base', bg = 'pine' },
                TelescopePreviewTitle = { fg = 'base', bg = 'iris' },

                TelescopePromptNormal = { fg = 'text', bg = 'surface' },
                TelescopePromptBorder = { fg = 'surface', bg = 'surface' },

                TelescopePreviewNormal = { link = 'Normal' },
                TelescopePreviewBorder = { bg = 'base', fg = 'base' },

                NvimTreeNormal = { bg = 'highlight_low' },
                NvimTreeWinSeparator = {
                    bg = 'highlight_low',
                    fg = 'highlight_low',
                },

                WinBar = { bg = 'base', fg = 'subtle' },

                StatusLine = { bg = 'surface', fg = 'subtle' },
                StatusLineNC = { link = 'StatusLine' },
                StatusLineTerm = { link = 'StatusLine' },
                StatusLineTermNC = { link = 'StatusLine' },
                StatusLineMode = { bg = 'iris', fg = 'base' },
                StatusLineMedium = { bg = 'overlay' },
                StatusLineGitBranchIcon = { bg = 'overlay' },
                StatusLineGitDiffAdded = { bg = 'overlay', fg = 'foam' },
                StatusLineGitDiffChanged = { bg = 'overlay', fg = 'rose' },
                StatusLineGitDiffRemoved = { bg = 'overlay', fg = 'love' },

                StatusLineLspError = { bg = 'overlay', fg = 'love' },
                StatusLineLspHint = { bg = 'overlay', fg = 'iris' },
                StatusLineLspWarn = { bg = 'overlay', fg = 'gold' },

                GrappleNormal = { link = 'NormalFloat' },
                GrappleBorder = { fg = 'surface', bg = 'surface' },
            },
        }
        vim.cmd.colorscheme 'rose-pine'
    end,
}
