local ok, guess_indent = pcall(require, "guess-indent")
if not ok then
    vim.notify("guess-indent could not be loaded")
    return
end

guess_indent.setup({})
