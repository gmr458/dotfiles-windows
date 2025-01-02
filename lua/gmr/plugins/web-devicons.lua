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
                ['tsx'] = {
                    icon = '',
                    color = '#58C4DC',
                    cterm_color = '26',
                    name = 'Tsx',
                },
                ['jsx'] = {
                    icon = '',
                    color = '#58C4DC',
                    cterm_color = '31',
                    name = 'Jsx',
                },
            },
        }
    end,
}
