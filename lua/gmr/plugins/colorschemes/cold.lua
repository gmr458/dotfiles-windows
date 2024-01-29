return {
    'gmr458/cold.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('cold').setup {
            custom_dark_background = '#0e0e0e',
            custom_light_background = '#ffffff',
        }

        vim.cmd.colorscheme 'cold'
    end,
}
