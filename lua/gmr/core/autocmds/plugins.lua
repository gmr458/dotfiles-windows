vim.api.nvim_create_autocmd('BufEnter', {
    group = vim.api.nvim_create_augroup(
        'gmr_enable_ts_context_when_necessary',
        { clear = true }
    ),
    desc = 'Enable Treesitter Context if the file has more lines than visible lines',
    pattern = { '*' },
    callback = function()
        if vim.fn.line '$' >= vim.o.lines then
            vim.cmd 'TSContextEnable'
        end
    end,
})

vim.api.nvim_create_autocmd('CursorHold', {
    group = vim.api.nvim_create_augroup('gmr_cancel_snippet', { clear = true }),
    desc = 'Cancel snippet and avoid cursor jumping to the first line of the file',
    callback = function()
        local ok, luasnip = pcall(require, 'luasnip')
        if not ok then
            return
        end

        if luasnip.expand_or_jumpable() then
            vim.cmd 'silent! lua require("luasnip").unlink_current()'
        end
    end,
})
