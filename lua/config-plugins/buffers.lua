require("bufferline").setup({
    highlights = {
        buffer_selected = { gui = "NONE" },
        diagnostic_selected = { gui = "bold" },
        info_selected = { gui = "bold" },
        info_diagnostic_selected = { gui = "bold" },
        warning_selected = { gui = "bold" },
        warning_diagnostic_selected = { gui = "bold" },
        error_selected = { gui = "bold" },
        error_diagnostic_selected = { gui = "bold" },
        duplicate_selected = { gui = "bold" },
        duplicate_visible = { gui = "bold" },
        duplicate = { gui = "bold" },
        pick_selected = { gui = "bold" },
        pick_visible = { gui = "bold" },
        pick = { gui = "bold" },
    },
    options = {
        offsets = {
            {
                filetype = "NvimTree",
            },
        },
        show_tab_indicators = true,
        separator_style = { "", "" },
    },
})

vim.api.nvim_set_keymap("n", "m", ":bnext<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "z", ":bprevious<CR>", { noremap = true, silent = true })
