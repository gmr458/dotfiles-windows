return {
    'gmr458/cold.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('cold').setup {}

        vim.cmd.colorscheme 'cold'
    end,
}
