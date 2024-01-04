return {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'BufReadPost',
    config = function()
        local ibl = require 'ibl'

        ibl.setup {
            indent = { char = '│' },
            scope = { enabled = false },
        }
    end,
}
