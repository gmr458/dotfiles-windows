-- vim.cmd("set whichwrap+=<,>,[,],h,l")
-- vim.cmd([[set iskeyword+=-]])
-- vim.cmd([[set formatoptions-=cro]])

-- For Alacritty terminal
vim.cmd([[
    augroup RestoreCursorShapeOnExit
        autocmd!
        autocmd VimLeave * set guicursor=a:hor1
        "autocmd VimLeave * set guicursor=a:ver
    augroup END
]])

-- Remove symbol ~
vim.o.fillchars = [[eob: ]]
