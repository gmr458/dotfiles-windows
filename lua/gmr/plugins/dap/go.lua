return {
    'leoluz/nvim-dap-go',
    ft = 'go',
    config = function()
        require('dap-go').setup {
            dap_configurations = {
                {
                    type = 'go',
                    name = 'Attach remote',
                    mode = 'remote',
                    request = 'attach',
                },
            },
            delve = {
                port = 38697,
            },
        }

        vim.api.nvim_create_user_command('GoDebugTest', function()
            require('dap-go').debug_test()
        end, {})
    end,
}
