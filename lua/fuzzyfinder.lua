require("telescope").setup({
	defaults = {
		prompt_prefix = "❯ ",
		selection_caret = "❯ ",
		layout_strategy = "center",
		layout_config = {
			center = {
				width = 0.4,
				height = 0.5,
			},
		},
		file_ignore_patterns = { ".git", "node_modules", "dist", "build", "venv", "bin", "obj", "target" },
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" },
	},
})

vim.api.nvim_set_keymap("", "tff", "<CMD>Telescope find_files<CR>", { noremap = false, silent = true })
