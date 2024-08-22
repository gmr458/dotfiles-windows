return {
    'folke/ts-comments.nvim',
    event = 'BufReadPost',
    config = function()
        require('ts-comments').setup()
    end,
}
