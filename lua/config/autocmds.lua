-- For Alacritty terminal
vim.cmd([[
    augroup RestoreCursorShapeOnExit
        autocmd!
        autocmd VimLeave * set guicursor=a:hor1
        "autocmd VimLeave * set guicursor=a:ver
    augroup END
]])

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = { "*" },
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "json", "jsonc" },
    callback = function()
        vim.opt_local.spell = false
        vim.opt_local.conceallevel = 0
    end,
})
