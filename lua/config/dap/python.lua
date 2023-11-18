local ok, dap_python = pcall(require, 'dap-python')
if not ok then
    vim.notify 'dap-python could no be loaded'
    return
end

dap_python.setup(
    vim.fn.stdpath 'data' .. '/mason/packages/debugpy/venv/bin/python'
)
