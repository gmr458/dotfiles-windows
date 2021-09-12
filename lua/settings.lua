local set = vim.opt

vim.cmd([[autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc]])
vim.cmd([[autocmd BufRead,BufNewFile settings.json set filetype=jsonc]])
vim.cmd([[autocmd BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif]])
vim.cmd([[filetype plugin indent on]])
set.background = "dark"
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.omnifunc = "syntaxcomplete#Complete"
set.ignorecase = true
set.scrolloff = 8
set.hidden = true
set.errorbells = false
set.number = true
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
set.ruler = false
vim.cmd([[language en_US]])
vim.g.mapleader = " "
vim.g.vim_json_conceal = false
vim.g.vim_json_warnings = false
vim.g.better_escape_interval = 300
vim.g.better_escape_shortcut = "jk"

vim.cmd([[let neovide_remember_window_size = v:true]])
vim.cmd([[let neovide_cursor_animation_length=0.1]])
vim.cmd([[let neovide_cursor_trail_length=0.1]])
vim.cmd([[set guifont=FiraCode\ NF:h10.5]])
vim.cmd([[let g:neovide_refresh_rate=60]])
vim.cmd([[let g:neovide_cursor_antialiasing=v:true]])

vim.g.gruvbox_bold = false
vim.g.gruvbox_italic = false
vim.g.gruvbox_italicize_comments = false
vim.g.gruvbox_italicize_strings = false
vim.g.gruvbox_contrast_dark = "hard"
vim.cmd([[colorscheme gruvbox]])
