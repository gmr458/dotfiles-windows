local ok, vscode_dark_plus = pcall(require, "vscode_dark_plus")
if not ok then
    vim.notify("vscode_dark_plus could not be loaded")
    return
end

vscode_dark_plus.setup({ v2 = true, cursorline = true })
