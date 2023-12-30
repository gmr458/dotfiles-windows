vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_matchit = 1
-- vim.g.loaded_matchparen = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

local opt = vim.opt

opt.background = 'dark'
opt.cmdheight = 0
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.conceallevel = 3
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.fillchars:append { eob = ' ' }
opt.grepprg = 'rg --vimgrep'
-- opt.guifont = require 'config.guifont'
opt.ignorecase = true
opt.laststatus = 3
opt.list = false
-- opt.listchars:append {
--     eol = '↲',
--     tab = '│ ',
--     trail = ' ',
-- }
opt.mouse = 'a'
opt.number = true
opt.numberwidth = 1
opt.pumheight = 10
opt.relativenumber = true
opt.scrolloff = 8
opt.shiftwidth = 4
opt.showcmd = true
opt.showmode = false
opt.showtabline = 1
opt.sidescroll = 3
opt.sidescrolloff = 3
opt.signcolumn = 'yes'
opt.smartcase = false
opt.smartindent = true
opt.spell = false
opt.spelllang = 'en_us'
opt.spelloptions = 'camel'
opt.splitbelow = true
opt.splitkeep = 'screen'
opt.splitright = true
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.timeoutlen = 800
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.virtualedit = 'block'
-- opt.wildoptions = ''
opt.wrap = false

vim.filetype.add {
    extension = {
        templ = 'templ',
    },
}
