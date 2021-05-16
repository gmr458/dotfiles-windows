require("bufferline").setup {
    highlights = {
        buffer_selected = {
            gui = "NONE"
        }
    },
    options = {
        offsets = {{
            filetype = "NvimTree",
            text = "Explorer",
            highlight = "Directory"
        }}
    }
}

vim.api.nvim_set_keymap("n", "m", ":bnext<CR>", {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap("n", "z", ":bprevious<CR>", {
    noremap = true,
    silent = true
})

