vim.api.nvim_create_autocmd('BufEnter', {
    group = vim.api.nvim_create_augroup(
        'TSContextIfNecessary',
        { clear = true }
    ),
    desc = 'Enable Treesitter Context if the file has more lines than visible lines',
    pattern = { '*' },
    callback = function()
        local filetype = vim.bo.filetype

        if vim.fn.line '$' >= vim.o.lines then
            vim.api.nvim_command 'TSContextEnable'
        end
    end,
})
