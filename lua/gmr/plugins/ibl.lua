return {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'BufReadPost',
    config = function()
        require('ibl').setup {
            indent = { char = '│' },
            scope = { enabled = false },
            exclude = {
                filetypes = {
                    'lspinfo',
                    'packer',
                    'checkhealth',
                    'help',
                    'man',
                    'gitcommit',
                    'TelescopePrompt',
                    'TelescopeResults',
                    'diff',
                    '',
                },
            },
        }
    end,
}
