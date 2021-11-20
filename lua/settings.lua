local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit",
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

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

if vim.fn.has("win32") == 1 then
    vim.cmd([[language en_US]])
end

vim.g.mapleader = " "
vim.g.vim_json_conceal = false
vim.g.vim_json_warnings = false

vim.cmd([[let neovide_remember_window_size = v:true]])
vim.cmd([[let neovide_cursor_animation_length=0.1]])
vim.cmd([[let neovide_cursor_trail_length=0.01]])
if vim.fn.has("unix") == 1 then
    vim.cmd([[set guifont=MesloLGS\ NF:h10]])
elseif vim.fn.has("win32") == 1 then
    vim.cmd([[set guifont=DroidSansMono\ Nerd\ Font:h10.5]])
end
vim.cmd([[let g:neovide_refresh_rate=60]])
vim.cmd([[let g:neovide_cursor_antialiasing=v:true]])

--[[ vim.g.gruvbox_bold = false
vim.g.gruvbox_italic = false
vim.g.gruvbox_italicize_comments = true
vim.g.gruvbox_italicize_strings = true
vim.g.gruvbox_contrast_dark = "hard" ]]
vim.cmd([[colorscheme enfocado]])

vim.cmd([[hi Normal ctermbg=NONE guibg=NONE]])
vim.cmd([[hi TabLineSel ctermbg=NONE guibg=NONE]])
