return {
    'ThePrimeagen/harpoon',
    event = 'VeryLazy',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local harpoon = require 'harpoon'
        harpoon:setup {
            -- default = {
            --     VimLeavePre = function(_, list)
            --         list:clear()
            --     end,
            -- },
            settings = {
                save_on_toggle = true,
            },
        }

        vim.keymap.set('n', '<leader>m', function()
            harpoon:list():append()
        end)
        vim.keymap.set('n', '<leader>hr', function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        vim.keymap.set('n', '<c-p>', function()
            harpoon:list():next { ui_nav_wrap = true }
        end)
    end,
}
