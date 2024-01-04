return {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPost',
    config = function()
        require('gitsigns').setup {
            signs = {
                add = { text = '│' },
                change = { text = '│' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
                untracked = { text = '┆' },
            },
            attach_to_untracked = false,
            trouble = false,
        }
    end,
}
