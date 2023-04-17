local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
    vim.notify("toggleterm could not be loaded")
    return
end

toggleterm.setup({
    direction = "float",
    start_in_insert = true,
    highlights = {
        Normal = { link = "ToggleTerm1NormalFloat" },
        NormalFloat = { link = "ToggleTerm1NormalFloat" },
        FloatBorder = { link = "ToggleTerm1FloatBorder" },
    },
})

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
