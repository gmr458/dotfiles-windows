local ok, scrollbar = pcall(require, 'scrollbar')
if not ok then
    vim.notify 'scrollbar could not be loaded'
    return
end

scrollbar.setup {
    marks = {
        Cursor = { text = '-' },
        GitAdd = { text = '│' },
        GitChange = { text = '│' },
        GitDelete = { text = '_' },
    },
    excluded_filetypes = {
        'prompt',
        'TelescopePrompt',
        'noice',
        'NvimTree',
        'lspsagafinder',
        'alpha',
        'cmp_docs',
        'cmp_menu',
    },
    handlers = {
        cursor = true,
        diagnostic = false,
        gitsigns = true,
        handle = true,
        search = false, -- Requires hlslens
    },
}
