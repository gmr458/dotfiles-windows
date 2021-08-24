require("telescope").setup({
    defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                preview_width = 0.7,
            },
        },
        file_ignore_patterns = {
            "node_modules",
            "dist",
            "build",
            "venv",
            "bin",
            "obj",
            "target",
            ".png",
            ".jpg",
            ".jpeg",
            ".exe",
        },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
    },
})

vim.api.nvim_set_keymap("", "tff", "<CMD>Telescope find_files<CR>", { noremap = false, silent = true })
