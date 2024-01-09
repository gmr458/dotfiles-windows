return {
    'folke/neodev.nvim',
    lazy = true,
    config = function()
        require('neodev').setup {
            library = {
                plugins = { 'nvim-dap-ui' },
                types = true,
            },
        }
    end,
}
