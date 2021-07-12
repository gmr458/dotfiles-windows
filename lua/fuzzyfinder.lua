require("telescope").setup {
    defaults = {
        layout_config = {horizontal = {preview_width = 0.7}},
        file_ignore_patterns = {"node_modules", "dist", "build", "venv", "bin", "obj"},
        borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
        color_devicons = true,
        set_env = {["COLORTERM"] = "truecolor"}
    }
}

vim.api.nvim_set_keymap("", "tff", "<CMD>Telescope find_files<CR>", {noremap = false, silent = true})

vim.api.nvim_set_keymap("", "tbf", "<CMD>Telescope buffers<CR>", {noremap = false, silent = true})
