return {
    'nvim-treesitter/nvim-treesitter-context',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
        pcall(vim.treesitter.query.set, 'tsx', 'context', '')
    end,
}
