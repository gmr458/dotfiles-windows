require("nvim-treesitter.configs").setup({
    ensure_installed = "maintained",
    ignore_install = { "html" },
    highlight = { enable = true },
    rainbow = { enable = true, extended_mode = true, max_file_lines = 1000 },
})
