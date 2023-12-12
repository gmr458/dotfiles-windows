local ok, vscode_modern = pcall(require, 'vscode_modern')
if not ok then
    vim.notify 'vscode_modern could not be loaded'
    return
end

vscode_modern.setup {
    cursorline = true,
    transparent_background = false,
    nvim_tree_darker = true,
    italic_keyword = true,
    custom_dark_background = '#111111',
}
