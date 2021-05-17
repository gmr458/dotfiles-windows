require("telescope").setup {
	defaults = {
		layout_strategy = "vertical",
		borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"}
	}
}

vim.api.nvim_set_keymap("n", "tff", [[<Cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({borderchars = {{ '─', '│', '─', '│', '┌', '┐', '┘', '└'},prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},},previewer = false,prompt_title = false}))<CR>]], { -- Telescope file browser
	noremap = false,
	silent = true
})

