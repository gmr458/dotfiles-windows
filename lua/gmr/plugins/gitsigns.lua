return {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPost',
    config = function()
        require('gitsigns').setup {
            attach_to_untracked = false,
            trouble = false,
        }
    end,
}
