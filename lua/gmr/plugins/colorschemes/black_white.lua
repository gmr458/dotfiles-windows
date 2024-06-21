return {
    'gmr458/black_white.nvim',
    lazy = false,
    priority = 1000,
    build = ':BlackWhiteCompile',
    config = function()
        require('black_white').setup {
            transparent_background = false,
        }
        vim.cmd.colorscheme 'black_white'
    end,
}
