return {
    'nvim-tree/nvim-web-devicons',
    lazy = false,
    config = function()
        -- require('nvim-web-devicons').setup {
        --     override = {
        --         ts = {
        --             icon = '󰛦',
        --             color = '#519aba',
        --             cterm_color = '74',
        --             name = 'Ts',
        --         },
        --     },
        -- }

        require('nvim-web-devicons').set_icon {
            ts = {
                icon = '󰛦',
                color = '#519aba',
                cterm_color = '74',
                name = 'Ts',
            },
        }
    end,
}
