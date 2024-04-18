return {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPost',
    config = function()
        require('gitsigns').setup {}
    end,
}
