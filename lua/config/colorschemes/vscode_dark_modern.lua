local ok, vscode_dark_modern = pcall(require, "vscode_dark_modern")
if not ok then
    vim.notify("vscode_dark_modern could not be loaded")
    return
end

vscode_dark_modern.setup({
    cursorline = true,
    transparent_background = false,
})
