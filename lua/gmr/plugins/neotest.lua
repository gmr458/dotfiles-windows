return {
    'nvim-neotest/neotest',
    cmd = { 'Neotest' },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        'antoinemadec/FixCursorHold.nvim',
        'nvim-neotest/neotest-python',
        'nvim-neotest/neotest-go',
        'nvim-neotest/neotest-jest',
        'marilari88/neotest-vitest',
        'rouge8/neotest-rust',
        'Issafalcon/neotest-dotnet',
    },
    config = function()
        local neotest = require 'neotest'

        neotest.setup {
            adapters = {
                require 'neotest-python',
                require 'neotest-go',
                require 'neotest-jest',
                require 'neotest-vitest',
                require 'neotest-rust',
                require 'neotest-dotnet',
            },
        }
    end,
}
