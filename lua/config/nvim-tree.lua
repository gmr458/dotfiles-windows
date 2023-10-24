local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
    vim.notify("nvim-tree could not be loaded")
    return
end

nvim_tree.setup({
    hijack_cursor = true,
    disable_netrw = true,
    view = {
        cursorline = true,
        width = {},
    },
    renderer = {
        root_folder_label = function(path)
            return vim.fn.fnamemodify(path, ":t")
        end,
        indent_width = 3,
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        highlight_git = false,
        highlight_diagnostics = false,
        highlight_opened_files = "none",
        highlight_modified = "none",
        indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },
        },
        icons = {
            web_devicons = {
                file = {
                    enable = true,
                    color = true,
                },
                folder = {
                    enable = false,
                    color = true,
                },
            },
            git_placement = "before",
            modified_placement = "before",
            padding = " ",
            symlink_arrow = " 󰁔 ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
                modified = true,
                diagnostics = true,
                bookmarks = true,
            },
            glyphs = {
                git = {
                    unstaged = "M",
                    staged = "A",
                    unmerged = "UM",
                    renamed = "R",
                    untracked = "U",
                    deleted = "D",
                    ignored = "",
                },
            },
        },
    },
    git = {
        enable = true,
        timeout = 1000,
    },
    modified = {
        enable = true,
    },
    filters = {
        git_ignored = false,
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = { "^\\.git$", "node_modules" },
        exclude = {},
    },
})
