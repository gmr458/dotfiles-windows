return {
    'mfussenegger/nvim-dap-python',
    ft = 'python',
    config = function()
        local ok, mason = pcall(require, 'mason-registry')
        if not ok then
            vim.notify 'mason-registry could not be loaded'
            return
        end

        local debugpy_path = mason.get_package('debugpy'):get_install_path()
        require('dap-python').setup(debugpy_path .. '/venv/bin/python')
    end,
}
