return {
    'gmr458/vscode_modern_theme.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        local vscode_modern = require 'vscode_modern'

        vscode_modern.setup {
            cursorline = true,
            transparent_background = false,
            nvim_tree_darker = true,
            italic_keyword = false,
            custom_dark_background = '#111111',
            custom_statusline_dark_background = '#080808',
        }

        vim.cmd.colorscheme 'vscode_modern'
    end,
}
