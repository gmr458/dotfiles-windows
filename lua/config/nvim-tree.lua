local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
    vim.notify("nvim-tree could not be loaded")
    return
end

-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`).
nvim_tree.setup({
    disable_netrw = true,
    hijack_cursor = true,
    view = {
        mappings = {
            list = {
                { key = "br", action = "rename_basename" },
                { key = "e", action = "" },
            },
        },
    },
    renderer = {
        root_folder_label = false,
        group_empty = false,
        highlight_git = true,
        highlight_opened_files = "name",
        root_folder_modifier = ":t",
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
                    untracked = "U",
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
        custom = {
            "^.git$",
            -- "^bin$",
            -- "^obj$",
            -- "^.pytest_cache$",
            -- "^__pycache__$",
            -- "^node_modules$",
            -- "^target$",
            -- "^vendor$",
            -- "^venv$",
        },
        -- exclude = { ".gitignore" },
    },
    git = {
        enable = true,
        ignore = false,
    },
})
