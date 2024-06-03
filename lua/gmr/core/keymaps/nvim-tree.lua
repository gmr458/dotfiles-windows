vim.keymap.set(
    'n',
    '<C-n>',
    ':NvimTreeFindFileToggle<cr>',
    { silent = true, desc = 'Tooggle NvimTree' }
)

vim.keymap.set(
    'n',
    '<leader>r',
    ':NvimTreeRefresh<cr>',
    { silent = true, desc = 'Refresh NvimTree' }
)
