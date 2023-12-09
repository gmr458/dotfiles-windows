local ok, ibl = pcall(require, 'ibl')
if not ok then
    vim.notify 'ibl could not be loaded'
    return
end

ibl.setup {
    indent = { char = '│' },
    scope = { enabled = false },
}
