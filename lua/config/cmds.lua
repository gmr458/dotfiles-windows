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

-- Hide error messages in JSON with comments
vim.cmd("au BufRead,BufNewFile tsconfig.json set filetype=jsonc")

-- Remove symbol ~ in NvimTree
vim.cmd("let &fcs='eob: '")
