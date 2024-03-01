return {
    'nvim-treesitter/nvim-treesitter-context',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
        require('treesitter-context').setup {
            multiline_threshold = 4,
        }

        pcall(vim.treesitter.query.set, 'tsx', 'context', '')
    end,
}
