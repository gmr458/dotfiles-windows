return {
    'nvim-treesitter/nvim-treesitter-context',
    cmd = { 'TSContextEnable', 'TSContexDisable' },
    config = function()
        pcall(vim.treesitter.query.set, 'tsx', 'context', '')
    end,
}
