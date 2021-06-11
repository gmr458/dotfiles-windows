require("telescope").setup {
	defaults = {
		layout_strategy = "vertical",
		file_ignore_patterns = {"node_modules", "dist", "build"},
		borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"}
	}
}

vim.api.nvim_set_keymap("", "tff", "<CMD>lua require('telescope.builtin').find_files()<CR>", {
	noremap = false,
	silent = true
})

