local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
    vim.notify("nvim-tree could not be loaded")
    return
end

nvim_tree.setup({
    disable_netrw = true,
    hijack_cursor = true,
    view = {
        centralize_selection = true,
        preserve_window_proportions = true,
    },
    renderer = {
        highlight_git = true,
        root_folder_label = function(path)
            local root_folder = vim.fn.fnamemodify(path, ":t")
            return string.upper(root_folder)
        end,
        indent_markers = {
            enable = true,
            inline_arrows = false,
        },
        icons = {
            show = { folder_arrow = false },
            symlink_arrow = " 󰁔 ",
            glyphs = {
                bookmark = "󰆤",
                modified = "",
                folder = {
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "M",
                    staged = "A",
                    unmerged = "UM",
                    renamed = "R",
                    untracked = "U",
                    deleted = "D",
                    ignored = "I",
                },
            },
        },
        special_files = {},
    },
    filters = {
        custom = { "^.git$" },
        exclude = { ".gitignore" },
    },
    modified = { enable = true },
})
