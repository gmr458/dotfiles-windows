local ok, telescope, actions_layout

ok, telescope = pcall(require, "telescope")
if not ok then
    vim.notify("telescope could not be loaded")
    return
end

ok, actions_layout = pcall(require, "telescope.actions.layout")
if not ok then
    vim.notify("telescope could not be loaded")
    return
end

telescope.setup({
    defaults = {
        mappings = {
            n = {
                ["<C-y>"] = actions_layout.toggle_preview,
            },
            i = {
                ["<C-y>"] = actions_layout.toggle_preview,
            },
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        multi_icon = "",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            prompt_position = "top",
            scroll_speed = 4,
            height = 0.9,
            width = 0.9,
            preview_width = 0.7,
        },
        borderchars = {
            "─",
            "│",
            "─",
            "│",
            "┌",
            "┐",
            "┘",
            "└",
        },
        file_ignore_patterns = {
            "%-lock.json$",
            "%.dll",
            "%.exe",
            "%.jpeg",
            "%.jpg",
            "%.mp3",
            "%.mp4",
            "%.pdb",
            "%.png",
            "%.pyc",
            "../bin/..",
            "../obj/..",
            "..\\bin\\..",
            "..\\obj\\..",
            "^.git/",
            "../.git/..",
            "^.git\\",
            "..\\.git\\..",
            "^.pytest_cache/",
            "../.pytest_cache/..",
            "^.pytest_cache\\",
            "..\\.pytest_cache\\..",
            "^__pycache__/",
            "../__pycache__/..",
            "^__pycache__\\",
            "..\\__pycache__\\..",
            "^node_modules/",
            "../node_modules/..",
            "^node_modules\\",
            "..\\node_modules\\..",
            "^obj/",
            "^obj\\",
            "^target/",
            "../target/..",
            "^target\\",
            "..\\target\\..",
            -- "^vendor/",
            -- "../vendor/..",
            -- "^vendor\\",
            -- "..\\vendor\\..",
            "^venv/",
            "../venv/..",
            "^venv\\",
            "..\\venv\\..",
        },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
            },
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
        },
    },
    pickers = {
        buffers = {
            previewer = false,
        },
        find_files = {
            previewer = false,
        },
        oldfiles = {
            previewer = false,
        },
    },
})

telescope.load_extension("fzf")
