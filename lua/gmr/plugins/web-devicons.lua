return {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
    config = function()
        require('nvim-web-devicons').setup {
            override = {
                ts = {
                    icon = '󰛦',
                    color = '#519aba',
                    cterm_color = '74',
                    name = 'Ts',
                },
            },
        }
    end,
}
