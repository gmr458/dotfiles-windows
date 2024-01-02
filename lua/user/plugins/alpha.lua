return {
    'goolord/alpha-nvim',
    config = function()
        local alpha = require 'alpha'
        local dashboard = require 'alpha.themes.dashboard'

        -- require 'alpha.term'

        -- dashboard.section.terminal.command = vim.fn.stdpath 'config' .. '/logo.sh'
        -- dashboard.section.terminal.width = 30
        -- dashboard.section.terminal.height = 18
        -- dashboard.section.terminal.opts.position = 'center'
        -- dashboard.section.terminal.opts.redraw = true

        dashboard.section.header.val =
            require('user.configs.alpha.headers').Bloody
        dashboard.section.header.opts = {
            position = 'center',
            hl = 'AlphaHeader',
        }

        dashboard.section.buttons.val = {
            dashboard.button('Space ff', '  Find file', '<leader>ff'),
            dashboard.button('Space lg', '󰈞  Live grep', '<leader>lg'),
            dashboard.button('Space of', '󰈙  Recent File', '<leader>of'),
            dashboard.button('Space hh', '?  Help', '<leader>hh'),
            dashboard.button('q', '  Quit NVIM', ':qa<CR>'),
        }

        for _, value in pairs(dashboard.section.buttons.val) do
            value.opts.hl_shortcut = 'AlphaShorcut'
            value.opts.hl = 'AlphaButton'
        end

        -- dashboard.opts.layout = {
        --     { type = 'padding', val = 2 },
        --     vim.o.lines > 30 and dashboard.section.terminal or nil,
        --     { type = 'padding', val = 4 },
        --     dashboard.section.buttons,
        -- }

        alpha.setup(dashboard.config)
    end,
}
