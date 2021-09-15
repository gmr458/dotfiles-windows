require("telescope").setup({
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        layout_strategy = "center",
        previewer = false,
        prompt_title = false,
        layout_config = {
            center = {
                width = 0.4,
                height = 0.6,
            },
        },
        file_ignore_patterns = {
            "node_modules",
            "dist",
            "build",
            "venv",
            "/bin/",
            "obj",
            "target",
            ".png",
            ".jpg",
            ".jpeg",
            ".exe",
        },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        color_devicons = false,
        set_env = { ["COLORTERM"] = "truecolor" },
        path_display = { "shorten" },
    },
})

vim.cmd([[nnoremap tff <cmd>lua require('telescope.builtin').find_files()<cr>]])
vim.cmd([[nnoremap tfg <cmd>lua require('telescope.builtin').live_grep()<cr>]])
