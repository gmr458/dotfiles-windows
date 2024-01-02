return {
    'karb94/neoscroll.nvim',
    keys = { '<C-u>', '<C-d>' },
    config = function()
        local neoscroll = require 'neoscroll'

        neoscroll.setup {
            mappings = {
                '<C-u>',
                '<C-d>',
            },
            hide_cursor = false,
            stop_eof = false,
            respect_scrolloff = true,
            cursor_scrolls_alone = false,
            easing_function = nil,
            pre_hook = nil,
            post_hook = nil,
            performance_mode = false,
        }

        local t = {}
        t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '300' } }
        t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '300' } }

        local config = require 'neoscroll.config'

        config.set_mappings(t)
    end,
}
