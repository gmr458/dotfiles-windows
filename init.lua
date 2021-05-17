-- Text editor settings
vim.cmd([[set omnifunc=syntaxcomplete#Complete]])
vim.cmd([[set guicursor=]])
vim.cmd([[set ignorecase]])
vim.cmd([[set scrolloff=8]])
vim.cmd([[set hidden]])
vim.cmd([[set noerrorbells]])
vim.cmd([[set tabstop=4 softtabstop=4]])
vim.cmd([[set shiftwidth=4]])
vim.cmd([[set smartindent]])
vim.cmd([[set nu]])
vim.cmd([[set relativenumber]])
vim.cmd([[set nowrap]])
vim.cmd([[set smartcase]])
vim.cmd([[set noswapfile]])
vim.cmd([[set nobackup]])
vim.cmd([[set backspace=indent,eol,start]])
vim.cmd([[set encoding=UTF-8]])
vim.cmd([[set autoindent]])
vim.cmd([[set mouse=a]])
vim.cmd([[set incsearch]])
vim.cmd([[set noshowmode]])
vim.cmd([[set termguicolors]])
vim.cmd([[language en_US]])
vim.g.mapleader = " "

-- Load plugins and their settings
require("plugins")
require("fileicons")
require("highlighting")
require("lsp")
require("statusbar")
require("fuzzyfinder")
require("tree")
require("autopairs")
require("autotag")
require("indentline")
require("buffers")
require("autocompletion")
require("lspicons")
require("color")
require("mappings")

-- Colorscheme
vim.o.background = "dark"
vim.g.gruvbox_italic = false
vim.g.gruvbox_italicize_comments = false
vim.cmd([[colorscheme gruvbox]])

vim.loop.spawn = (function()
    local spawn = vim.loop.spawn
    return function(path, options, on_exit)
        local full_path = vim.fn.exepath(path)
        return spawn(full_path, options, on_exit)
    end
end)()
