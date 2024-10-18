return {
    'folke/lazydev.nvim',
    ft = 'lua',
    config = function()
        require('lazydev').setup {
            library = {
                { path = 'luvit-meta/library', words = { 'vim%.uv' } },
            },
        }
    end,
}
