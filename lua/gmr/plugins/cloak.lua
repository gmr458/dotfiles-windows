return {
    'laytan/cloak.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
        require('cloak').setup()
    end,
}
