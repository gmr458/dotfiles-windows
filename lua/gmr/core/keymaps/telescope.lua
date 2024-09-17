vim.keymap.set('n', '<leader>ff', ':Telescope find_files<cr>', {
    silent = true,
    desc = 'Telescope Find Files',
})

vim.keymap.set('n', '<leader>gs', ':Telescope git_status<cr>', {
    silent = true,
    desc = 'Telescope Git Status',
})

vim.keymap.set('n', '<leader>lg', ':Telescope live_grep<cr>', {
    silent = true,
    desc = 'Telescope Live Grep',
})

vim.keymap.set('n', '<leader>hh', ':Telescope help_tags<cr>', {
    silent = true,
    desc = 'Telescope Help Tags',
})

vim.keymap.set('n', '<leader>of', ':Telescope oldfiles<cr>', {
    silent = true,
    desc = 'Telescope History Files',
})

vim.keymap.set('n', '<leader>bf', ':Telescope buffers<cr>', {
    silent = true,
    desc = 'Telescope Buffers Opened',
})
