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
vim.g.markdown_fenced_languages = {
    "ts=typescript",
}

vim.g.gruvbox_bold = false
vim.g.gruvbox_italic = false
vim.g.gruvbox_transparent_bg = true
vim.g.gruvbox_underline = false
vim.g.gruvbox_undercurl = false
vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_contrast_light = "hard"
vim.g.gruvbox_italicize_comments = false
vim.g.gruvbox_italicize_strings = false

vim.cmd([[colorscheme gruvbox]])
