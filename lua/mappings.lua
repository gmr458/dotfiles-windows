-- <Leader>
vim.g.mapleader = " "

-- Plugin nvim-bufferline.lua
vim.api.nvim_set_keymap("n", "m", ":bnext<CR>", {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap("n", "n", ":bprevious<CR>", {
    noremap = true,
    silent = true
})

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

-- Plugin nvim-tree.lua mappings
vim.api.nvim_set_keymap("", "<C-n>", ":NvimTreeToggle<CR>", { -- Toggle nvim-tree.lua
    noremap = true,
    silent = false
})
vim.api.nvim_set_keymap("", "<Leader>r", ":NvimTreeRefresh<CR>", { -- Refresh nvim-tree.lua
    noremap = true,
    silent = false
})

-- Other mappings
vim.api.nvim_set_keymap("n", "<Leader>wq", ":wq!<CR>", { -- Save and force exit
    noremap = false,
    silent = false
})
vim.api.nvim_set_keymap("n", "<Leader>w", ":w<CR>", { -- Save
    noremap = false,
    silent = false
})
vim.api.nvim_set_keymap("n", "<Leader>q", ":qa!<CR>", { -- Force exit
    noremap = false,
    silent = false
})
vim.api.nvim_set_keymap("n", "<Leader>bd", ":bd!<CR>", { -- Delete current buffer
    noremap = false,
    silent = false
})
vim.api.nvim_set_keymap("n", "<Leader>ls", ":ls<CR>", { -- List buffers
    noremap = false,
    silent = false
})
vim.api.nvim_set_keymap("n", "<Leader>pi", ":PackerInstall<CR>", { -- Install plugins with Packer
    noremap = false,
    silent = false
})
vim.api.nvim_set_keymap("n", "<Leader>pc", ":PackerClean<CR>", { -- Clean plugins folder
    noremap = false,
    silent = false
})
vim.api.nvim_set_keymap("n", "<Leader>ff", [[<Cmd>lua require('telescope.builtin').file_browser()<CR>]],
    { -- Telescope file browser
        noremap = true,
        silent = false
    })

-- nohlsearch
vim.api.nvim_set_keymap("n", "<Leader>nh", ":nohlsearch<CR>", {
    noremap = true
})
