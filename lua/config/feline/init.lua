local ok, feline, kanagawa

ok, feline = pcall(require, "feline")
if not ok then
    vim.notify("feline could not be loaded")
    return
end

ok, kanagawa = pcall(require, "config.colorschemes.kanagawa.feline")
if not ok then
    vim.notify("config.colorschemes.kanagawa.feline could not be loaded")
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
    theme = kanagawa.palette(),
    components = kanagawa.components(),
})
