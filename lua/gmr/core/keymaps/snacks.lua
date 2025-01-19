vim.keymap.set('n', '<leader>ff', ':SnacksPickerFiles<cr>', {
    silent = true,
    desc = 'Snacks Picker Files',
})

vim.keymap.set('n', '<leader>gs', ':SnacksPickerGitStatus<cr>', {
    silent = true,
    desc = 'Snacks Picker Git Status',
})

vim.keymap.set('n', '<leader>lg', ':SnacksPickerGrep<cr>', {
    silent = true,
    desc = 'Snacks Picker Grep',
})

vim.keymap.set('n', '<leader>hh', ':SnacksPickerHelp<cr>', {
    silent = true,
    desc = 'Snacks Picker Help',
})

vim.keymap.set('n', '<leader>bf', ':SnacksPickerBuffers<cr>', {
    silent = true,
    desc = 'Snacks Picker Buffers',
})
