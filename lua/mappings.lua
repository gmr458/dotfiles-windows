-- Plugin Navigator mappings
vim.api.nvim_set_keymap("n", "<C-h>", "<CMD>lua require('Navigator').left()<CR>", { -- Navigate left
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap("n", "<C-k>", "<CMD>lua require('Navigator').up()<CR>", { -- Navigate up
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap("n", "<C-l>", "<CMD>lua require('Navigator').right()<CR>", { -- Navigate right
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap("n", "<C-j>", "<CMD>lua require('Navigator').down()<CR>", { -- Navigate down
    noremap = true,
    silent = true
})

-- Buffers
vim.api.nvim_set_keymap("n", "<Leader>bd", ":bd!<CR>", { -- Delete current buffer
    noremap = false,
    silent = false
})

-- Packer
vim.api.nvim_set_keymap("n", "<Leader>pi", ":PackerInstall<CR>", { -- Install plugins with Packer
    noremap = false,
    silent = false
})
vim.api.nvim_set_keymap("n", "<Leader>pc", ":PackerClean<CR>", { -- Clean plugins folder
    noremap = false,
    silent = false
})
vim.api.nvim_set_keymap("n", "<Leader>pu", ":PackerUpdate<CR>", { -- Clean plugins folder
    noremap = false,
    silent = false
})

-- nohlsearch
vim.api.nvim_set_keymap("n", "<Leader>nh", ":nohlsearch<CR>", {
    noremap = true
})

-- Plugin Trouble
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", {
    silent = true,
    noremap = true
})
vim.api.nvim_set_keymap("n", "<leader>xxc", "<cmd>TroubleClose<cr>", {
    silent = true,
    noremap = true
})
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", {
    silent = true,
    noremap = true
})
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", {
    silent = true,
    noremap = true
})
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {
    silent = true,
    noremap = true
})
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {
    silent = true,
    noremap = true
})
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", {
    silent = true,
    noremap = true
})
