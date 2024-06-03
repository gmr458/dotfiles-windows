vim.keymap.set(
    'n',
    '<leader>m',
    '<cmd>Grapple toggle<cr>',
    { desc = 'Tag the curent buffer with grapple.nvim' }
)

vim.keymap.set(
    'n',
    '<leader>gr',
    '<cmd>Grapple open_tags<cr>',
    { desc = 'Open grapple.nvim window to see buffers tagged' }
)

local indexes = { 1, 2, 3, 4, 5, 6, 7, 8, 9 }

for _, idx in pairs(indexes) do
    vim.keymap.set(
        'n',
        string.format('<leader>%s', idx),
        string.format('<cmd>Grapple select index=%s<cr>', idx),
        { desc = 'Select tagged buffer with grapple.nvim by index' }
    )
end
