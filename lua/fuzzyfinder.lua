require("telescope").setup {
    defaults = {
        file_ignore_patterns = {"node_modules", "dist", "build", "venv", "bin", "obj"},
        borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
        set_env = {
            ['COLORTERM'] = 'truecolor'
        },
        layout_strategy = "vertical",
        layout_defaults = {
            horizontal = {
                mirror = false
            },
            vertical = {
                mirror = true
            }
        }
    }
}

vim.api.nvim_set_keymap("", "tff", "<CMD>Telescope find_files<CR>", {
    noremap = false,
    silent = true
})

vim.api.nvim_set_keymap("", "tbf", "<CMD>Telescope buffers<CR>", {
    noremap = false,
    silent = true
})
