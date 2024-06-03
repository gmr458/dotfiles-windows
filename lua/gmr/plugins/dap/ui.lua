return {
    'rcarriga/nvim-dap-ui',
    cmd = 'DapToggleBreakpoint',
    dependencies = {
        { 'mfussenegger/nvim-dap' },
        { 'nvim-neotest/nvim-nio' },
    },
    config = function()
        local dap = require 'dap'

        -- C#
        dap.adapters.coreclr = {
            type = 'executable',
            command = vim.fn.stdpath 'data' .. '/mason/bin/netcoredbg',
            args = { '--interpreter=vscode' },
        }
        dap.configurations.cs = {
            {
                type = 'coreclr',
                name = 'launch - netcoredbg',
                request = 'launch',
                program = function()
                    return vim.fn.input(
                        'Path to dll: ',
                        vim.fn.getcwd() .. '/bin/Debug/',
                        'file'
                    )
                end,
            },
        }

        local dapui = require 'dapui'

        dapui.setup()

        dap.listeners.after.launch.dapui_config = function()
            require('dapui').open()
        end

        vim.keymap.set('n', '<leader>do', function()
            require('dapui').open()
        end)

        vim.keymap.set('n', '<leader>dc', function()
            require('dapui').open()
            require('dapui').close()
        end)

        vim.fn.sign_define(
            'DapBreakpoint',
            { text = '', texthl = 'ErrorMsg', linehl = '', numhl = '' }
        )
    end,
}
