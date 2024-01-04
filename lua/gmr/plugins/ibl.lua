return {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'BufReadPost',
    config = function()
        require('ibl').setup {
            indent = { char = '│' },
            scope = { enabled = false },
        }
    end,
}
