local ok, dap, dapui

ok, dap = pcall(require, 'dap')
if not ok then
    vim.notify 'dap could not be loaded'
    return
end

local home = os.getenv 'HOME'

-- C#
dap.adapters.coreclr = {
    type = 'executable',
    command = home .. '/.local/share/nvim/mason/bin/netcoredbg',
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
        home
            .. '/.local/share/nvim/mason/packages/go-debug-adapter/extension/dist/debugAdapter.js',
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

ok, dapui = pcall(require, 'dapui')
if not ok then
    vim.notify 'dapui could not be loaded'
    return
end

dapui.setup()

dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end

vim.api.nvim_create_user_command('DapUiClose', function()
    require('dapui').close()
end, {})

vim.fn.sign_define(
    'DapBreakpoint',
    { text = '', texthl = 'DapBreakpoint', linehl = '', numhl = '' }
)
vim.fn.sign_define(
    'DapStopped',
    { text = '', texthl = 'DapStopped', linehl = '', numhl = '' }
)
vim.fn.sign_define(
    'DapBreakpointRejected',
    { text = '', texthl = 'DapBreakpointRejected', linehl = '', numhl = '' }
)
