return {
    'cbochs/grapple.nvim',
    cmd = 'Grapple',
    config = function()
        require('grapple').setup {
            win_opts = {
                width = 50,
                height = 12,
                row = 0.3,
            },
        }
    end,
}
