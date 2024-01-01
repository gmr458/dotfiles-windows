local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then
    vim.notify 'gitsigns could not be loaded'
    return
end

gitsigns.setup {
    signs = {
        add = { text = '│' },
        change = { text = '│' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
    },
    attach_to_untracked = false,
    trouble = false,
}
