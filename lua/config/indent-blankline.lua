local indent_blankline_loaded, indent_blankline = pcall(require, "indent_blankline")

if not indent_blankline_loaded then
    print("indent_blankline not loaded")
    return
end

indent_blankline.setup({
    show_current_context = true,
    show_current_context_start = false,
    filetype_exclude = {
        "alpha",
        "help",
        "lsp-installer",
        "lspinfo",
        "NvimTree",
        "packer",
        "toggleterm",
        "diff",
        "dashboard",
        "markdown",
    },
})

vim.cmd([[let g:indent_blankline_show_trailing_blankline_indent = v:false]])
