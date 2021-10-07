vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache", "dist", "build", "venv", "bin", "obj", "target" }
vim.g.nvim_tree_indent_markers = 0
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_root_folder_modifier = ":t"
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_symlink_arrow = " >> "
vim.g.nvim_tree_window_picker_exclude = {
    filetype = {
        "notify",
        "packer",
        "qf",
    },
    buftype = {
        "terminal",
    },
}
vim.g.nvim_tree_special_files = {
    ["Cargo.toml"] = false,
    Makefile = false,
    ["README.md"] = false,
    ["readme.md"] = false,
}
vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 0,
}
vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌",
    },
    folder = {
        arrow_open = "",
        arrow_closed = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = "",
    },
    lsp = {
        hint = "",
        info = "",
        warning = "",
        error = "",
    },
}

require("nvim-tree").setup({
    lsp_diagnostics = true,
    view = {
        auto_resize = true,
        mappings = {
            list = {
                { key = "s", cb = require("nvim-tree.config").nvim_tree_callback("vsplit") },
            },
        },
    },
})

vim.cmd([[nnoremap <C-n> :NvimTreeToggle<CR>]])
vim.cmd([[nnoremap <leader>r :NvimTreeRefresh<CR>]])
vim.cmd([[nnoremap <leader>n :NvimTreeFindFile<CR>]])
