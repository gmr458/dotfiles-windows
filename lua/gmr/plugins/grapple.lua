return {
    'cbochs/grapple.nvim',
    config = function()
        local grapple = require 'grapple'

        vim.keymap.set('n', '<leader>m', grapple.toggle)
        vim.keymap.set('n', '<leader>gr', grapple.open_tags)

        local indexes = { 1, 2, 3, 4, 5, 6, 7, 8, 9 }

        for _, idx in pairs(indexes) do
            vim.keymap.set(
                'n',
                string.format('<leader>%s', idx),
                string.format('<cmd>Grapple select index=%s<cr>', idx)
            )
        end
    end,
}
