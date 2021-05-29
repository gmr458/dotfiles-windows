vim.o.termguicolors = true

vim.g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
vim.g.nvim_tree_root_folder_modifier = ":t"
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_special_files = {"README.md", "Makefile", "MAKEFILE"}
vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1
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
        ignored = "◌"
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = ""
    },
    lsp = {
        hint = "",
        info = "",
        warning = "",
        error = ""
    }
}

vim.api.nvim_set_keymap("", "<C-n>", ":NvimTreeToggle<CR>", { -- Toggle nvim-tree.lua
    noremap = true,
    silent = false
})
vim.api.nvim_set_keymap("", "<Leader>r", ":NvimTreeRefresh<CR>", { -- Refresh nvim-tree.lua
    noremap = true,
    silent = false
})

local tree_cb = require("nvim-tree.config").nvim_tree_callback
vim.g.nvim_tree_bindings = {
	["s"] = tree_cb("vsplit")
}
