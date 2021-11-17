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
            "__pycache__",
        },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        path_display = { "shorten" },
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
        },
    },
})

require("telescope").load_extension("fzf")

vim.cmd([[nnoremap tff <cmd>lua require('telescope.builtin').find_files()<cr>]])
vim.cmd([[nnoremap tfg <cmd>lua require('telescope.builtin').live_grep()<cr>]])
