local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then
    vim.notify 'gitsigns could not be loaded'
    return
end

gitsigns.setup {
    attach_to_untracked = false,
    trouble = false,
}
