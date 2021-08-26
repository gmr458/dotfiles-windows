vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache", "dist", "build", "venv", "bin", "obj", "target" }
vim.g.nvim_tree_auto_ignore_ft = { "startify", "dashboard" }
vim.g.nvim_tree_indent_markers = 0
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_root_folder_modifier = ":t"
vim.g.nvim_tree_auto_resize = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_symlink_arrow = " >> "
vim.g.nvim_tree_window_picker_exclude = {
    filetype = {
        "packer",
        "qf",
    },
    buftype = {
        "terminal",
    },
}
vim.g.nvim_tree_special_files = { "README.md", "Makefile", "MAKEFILE" }
vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
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

vim.api.nvim_set_keymap("", "<C-n>", ":NvimTreeToggle<CR>", { -- Toggle nvim-tree.lua
    noremap = true,
    silent = false,
})
vim.api.nvim_set_keymap("", "<Leader>r", ":NvimTreeRefresh<CR>", { -- Refresh nvim-tree.lua
    noremap = true,
    silent = false,
})

local tree_cb = require("nvim-tree.config").nvim_tree_callback
vim.g.nvim_tree_bindings = { { key = "s", cb = tree_cb("vsplit") } }

vim.cmd([[highlight NvimTreeFolderIcon guibg=blue]])
