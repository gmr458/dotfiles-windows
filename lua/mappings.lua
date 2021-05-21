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

-- Other mappings
--vim.api.nvim_set_keymap("n", "<Leader>wq", ":wq!<CR>", { -- Save and force exit
--    noremap = false,
--    silent = false
--})
--vim.api.nvim_set_keymap("n", "<Leader>w", ":w<CR>", { -- Save
--    noremap = false,
--    silent = false
--})
--vim.api.nvim_set_keymap("n", "<Leader>q", ":qa!<CR>", { -- Force exit
--    noremap = false,
--    silent = false
--})
vim.api.nvim_set_keymap("n", "<Leader>bd", ":bd!<CR>", { -- Delete current buffer
    noremap = false,
    silent = false
})
vim.api.nvim_set_keymap("n", "<Leader>ls", ":ls<CR>", { -- List buffers
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

-- Formar code with Prettier
--vim.api.nvim_set_keymap("n", "<Leader>fmt", ":Prettier<CR>", {
--	noremap = false,
--	silent = false,
--	expr = false
--})
