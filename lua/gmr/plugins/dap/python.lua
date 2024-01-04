return {
    'mfussenegger/nvim-dap-python',
    config = function()
        local dap_python = require 'dap-python'

        dap_python.setup(
            vim.fn.stdpath 'data' .. '/mason/packages/debugpy/venv/bin/python'
        )
    end,
}
