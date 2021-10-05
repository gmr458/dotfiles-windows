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
        layout_config = {
            preview_width = 0.7,
            width = 0.9,
            height = 0.9,
        },
        prompt_title = false,
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
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        path_display = { "shorten" },
    },
})

vim.cmd([[nnoremap tff <cmd>lua require('telescope.builtin').find_files()<cr>]])
vim.cmd([[nnoremap tfg <cmd>lua require('telescope.builtin').live_grep()<cr>]])
