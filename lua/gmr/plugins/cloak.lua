return {
    'laytan/cloak.nvim',
    ft = { 'sh' },
    config = function()
        require('cloak').setup()
    end,
}
