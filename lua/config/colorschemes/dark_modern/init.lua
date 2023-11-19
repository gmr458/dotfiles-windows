local ok, dark_modern = pcall(require, 'dark_modern')
if not ok then
    vim.notify 'dark_modern could not be loaded'
    return
end

dark_modern.setup {
    cursorline = true,
    transparent_background = false,
    nvim_tree_darker = true,
    italic_keyword = false,
    -- custom_background = '#181616',
    custom_background = '#000000',
}
