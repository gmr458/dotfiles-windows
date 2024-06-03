vim.keymap.set(
    'n',
    '<leader>ts',
    ':Neotest summary<cr>',
    { silent = true, desc = 'Show side buffer with summary of tests' }
)

vim.keymap.set(
    'n',
    '<leader>tn',
    ':NeotestNearest<cr>',
    { silent = true, desc = 'Execute the nearest test' }
)

vim.keymap.set(
    'n',
    '<leader>tc',
    ':NeotestCurrentFile<cr>',
    { silent = true, desc = 'Execute all tests in current file' }
)

vim.keymap.set(
    'n',
    '<leader>ta',
    ':NeotestAll<cr>',
    { silent = true, desc = 'Execute all tests in the project' }
)
