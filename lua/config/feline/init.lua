local ok, feline, vscode_dark_plus

ok, feline = pcall(require, "feline")
if not ok then
    vim.notify("feline could not be loaded")
    return
end

ok, vscode_dark_plus = pcall(require, "vscode_dark_plus.integrations.feline")
if not ok then
    vim.notify("vscode_dark_plus.integrations.feline could not be loaded")
    return
end

feline.setup({
    force_inactive = {
        filetypes = {
            "^NvimTree$",
            "^packer$",
            "^startify$",
            "^fugitive$",
            "^fugitiveblame$",
            "^qf$",
            "^help$",
            "^TelescopePrompt$",
            "^alpha$",
            "^lsp%-installer$",
            "^lspinfo$",
            "^dashboard$",
        },
        buftypes = {
            "^terminal$",
        },
        bufnames = {},
    },
    disable = { filetypes = { "^alpha$", "^dashboard$" } },
    theme = vscode_dark_plus.palette(),
    components = vscode_dark_plus.components(),
})
