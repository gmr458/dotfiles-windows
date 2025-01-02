return {
    'gmr458/cold.nvim',
    lazy = false,
    priority = 1000,
    build = ':ColdCompile',
    config = function()
        require('cold').setup {
            transparent_background = false,
            cursorline = false,
            treesitter_context_bg = false,
            float_borderless = false,
        }
        vim.cmd.colorscheme 'cold'
    end,
}
