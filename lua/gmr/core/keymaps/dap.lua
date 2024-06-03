vim.keymap.set(
    'n',
    '<leader>bk',
    ':DapToggleBreakpoint<cr>',
    { silent = true, desc = 'Toggle a debug break point in the current line' }
)
