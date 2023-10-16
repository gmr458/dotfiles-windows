-- For Alacritty terminal
vim.cmd([[
    augroup RestoreCursorShapeOnExit
        autocmd!
        autocmd VimLeave * set guicursor=a:hor1
        "autocmd VimLeave * set guicursor=a:ver
    augroup END
]])
