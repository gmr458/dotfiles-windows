local ok, trouble = pcall(require, 'trouble')
if not ok then
    vim.notify 'trouble could not be loaded'
    return
end

trouble.setup()
