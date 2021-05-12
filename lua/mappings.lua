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

-- Plugin nvim-compe mappings
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
        return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    else
        return t "<S-Tab>"
    end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {
    expr = true
})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {
    expr = true
})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {
    expr = true
})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {
    expr = true
})

-- nohlsearch
vim.api.nvim_set_keymap("n", "<Leader>nh", ":nohlsearch<CR>", {
	noremap = true
})
