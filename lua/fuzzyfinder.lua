require("telescope").setup {
	defaults = {
		layout_strategy = "vertical",
		borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"}
	}
}

vim.api.nvim_set_keymap("", "tff", "<CMD>lua require('telescope.builtin').find_files()<CR>", {
	noremap = false,
	silent = true
})

