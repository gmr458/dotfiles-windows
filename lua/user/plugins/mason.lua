return {
    'williamboman/mason.nvim',
    event = 'BufReadPost',
    config = function()
        local mason = require 'mason'

        mason.setup {
            ui = { border = 'single', height = 0.8 },
        }

        vim.api.nvim_create_user_command('MasonInstallAll', function()
            local packages = require 'user.configs.mason.packages'
            vim.cmd('MasonInstall ' .. table.concat(packages, ' '))
        end, {})
    end,
}
