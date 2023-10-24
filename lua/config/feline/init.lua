local ok, feline, dark_modern

ok, feline = pcall(require, "feline")
if not ok then
    vim.notify("feline could not be loaded")
    return
end

ok, dark_modern = pcall(require, "dark_modern.integrations.feline")
if not ok then
    vim.notify("dark_modern.integrations.feline could not be loaded")
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
    theme = dark_modern.palette(),
    components = dark_modern.components(),
})
