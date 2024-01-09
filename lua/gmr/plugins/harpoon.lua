return {
    'ThePrimeagen/harpoon',
    event = 'VeryLazy',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local harpoon = require 'harpoon'
        harpoon:setup()

        vim.keymap.set('n', '<leader>mk', function()
            harpoon:list():append()
        end)
        vim.keymap.set('n', '<leader>e', function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set('n', 'z', function()
            harpoon:list():prev()
        end)
        vim.keymap.set('n', 'm', function()
            harpoon:list():next()
        end)
    end,
}
