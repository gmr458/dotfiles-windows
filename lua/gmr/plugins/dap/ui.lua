return {
    'rcarriga/nvim-dap-ui',
    cmd = { 'DapLoadLaunchJSON', 'DapContinue', 'DapToggleBreakpoint' },
    dependencies = {
        { 'mfussenegger/nvim-dap' },
    },
    config = function()
        local dap = require 'dap'
        local home = os.getenv 'HOME'

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

        -- Go
        dap.adapters.go = {
            type = 'executable',
            command = 'node',
            args = {
                vim.fn.stdpath 'data'
                    .. '/mason/packages/go-debug-adapter/extension/dist/debugAdapter.js',
            },
        }
        dap.configurations.go = {
            {
                type = 'go',
                name = 'Debug',
                request = 'launch',
                showLog = false,
                program = '${file}',
                dlvToolPath = vim.fn.exepath 'dlv',
            },
        }

        local dapui = require 'dapui'

        dapui.setup()

        dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
        end

        vim.api.nvim_create_user_command('DapUiClose', function()
            require('dapui').close()
        end, {})
    end,
}
