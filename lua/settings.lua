local set = vim.opt

vim.cmd([[autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc]])
vim.cmd([[filetype plugin indent on]])
set.background = "dark"
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.cursorline = true
set.omnifunc = "syntaxcomplete#Complete"
set.ignorecase = true
set.scrolloff = 8
set.hidden = true
set.errorbells = false
set.number = true
set.relativenumber = true
set.wrap = false
set.smartcase = true
set.swapfile = false
set.backup = false
set.backspace = "indent,eol,start"
set.encoding = "UTF-8"
set.fileencoding = "UTF-8"
set.mouse = "a"
set.incsearch = true
set.showmode = false
set.termguicolors = true
vim.cmd([[language en_US]])
vim.g.mapleader = " "
vim.g.vim_json_conceal = false
vim.g.vim_json_warnings = false

require("github-theme").setup({
	themeStyle = "dark",
	commentStyle = "italic",
	keywordStyle = "italic",
	functionStyle = "italic",
	transparent = true,
})
