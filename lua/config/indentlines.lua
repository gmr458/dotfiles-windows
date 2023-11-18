local function set_leadmultispace()
    local lead = '│'

    if vim.o.shiftwidth == 2 then
        lead = lead .. ' '
    end

    if vim.o.shiftwidth == 4 then
        lead = lead .. '   '
    end

    vim.opt_local.listchars:append { leadmultispace = lead }
end

vim.api.nvim_create_autocmd({ 'BufRead', 'BufWritePost' }, {
    pattern = { '*' },
    callback = function()
        local ok, _ = pcall(require, 'guess-indent')
        if ok then
            vim.cmd ':silent GuessIndent'
        end
        set_leadmultispace()
    end,
})

set_leadmultispace()
