return {
    'nvim-neotest/neotest',
    cmd = {
        'Neotest',
        'NeotestNearest',
        'NeotestCurrentFile',
    },
    dependencies = {
        'nvim-neotest/nvim-nio',
        'nvim-lua/plenary.nvim',
        'antoinemadec/FixCursorHold.nvim',
        'nvim-treesitter/nvim-treesitter',
        'nvim-neotest/neotest-python',
        'nvim-neotest/neotest-go',
        'nvim-neotest/neotest-jest',
        'marilari88/neotest-vitest',
        'rouge8/neotest-rust',
        'Issafalcon/neotest-dotnet',
    },
    config = function()
        require('neotest').setup {
            adapters = {
                require 'neotest-python',
                require 'neotest-go' {
                    recursive_run = true,
                    args = { '-count=1' },
                },
                require 'neotest-jest',
                require 'neotest-vitest',
                require 'neotest-rust',
                require 'neotest-dotnet',
            },
            icons = {
                expanded = '┐',
                failed = '',
                final_child_prefix = '└',
                notify = '',
                passed = '',
                running = '',
                skipped = '󰜺',
                unknown = '',
                watching = '󰈈',
            },
        }

        vim.api.nvim_create_user_command('NeotestNearest', function()
            require('neotest').run.run()
        end, {})

        vim.api.nvim_create_user_command('NeotestCurrentFile', function()
            require('neotest').run.run(vim.fn.expand '%')
        end, {})

        vim.api.nvim_create_user_command('NeotestAll', function()
            require('neotest').run.run(vim.fn.getcwd())
        end, {})
    end,
}
