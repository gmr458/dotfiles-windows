local status_ok, nvim_tree = pcall(require, "nvim-tree")

if not status_ok then
    return
end

-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`).
nvim_tree.setup({
    hijack_cursor = true,
    view = { hide_root_folder = true },
    renderer = {
        group_empty = true,
        highlight_git = true,
        highlight_opened_files = "name",
        indent_markers = {
            enable = true,
            inline_arrows = false,
        },
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = false,
                git = true,
            },
            glyphs = {
                git = {
                    unstaged = "M",
                    staged = "A",
                    unmerged = "U",
                    renamed = "R",
                    untracked = "?",
                    deleted = "D",
                    ignored = "◌",
                },
            },
        },
        special_files = {},
    },
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    filters = {
        dotfiles = false,
        custom = { "^\\.git", "node_modules" },
        exclude = { ".gitignore" },
    },
    git = {
        enable = true,
        ignore = false,
    },
})
