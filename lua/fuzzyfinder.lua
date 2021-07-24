require("telescope").setup {
    defaults = {
		layout_strategy = "center",
        layout_config = {
			center = {
				width = 0.4,
				height = 0.8
			}
		},
        file_ignore_patterns = {"node_modules", "dist", "build", "venv", "bin", "obj"},
        borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
        color_devicons = true,
        set_env = {["COLORTERM"] = "truecolor"}
    }
}

vim.api.nvim_set_keymap("", "tff", "<CMD>Telescope find_files<CR>", {noremap = false, silent = true})

