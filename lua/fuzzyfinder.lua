require("telescope").setup {}

vim.api.nvim_set_keymap("n", "ff", [[<Cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({borderchars = {{ '─', '│', '─', '│', '┌', '┐', '┘', '└'},prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},},previewer = false,prompt_title = false}))<CR>]], { -- Telescope file browser
	noremap = false,
	silent = true
})

