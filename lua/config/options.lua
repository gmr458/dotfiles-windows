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
vim.g.loaded_matchparen = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

local font_names = {
    caskaydia_cove = "CaskaydiaCove Nerd Font Mono",
    comic_mono = "ComicMono Nerd Font Mono",
    fira_code = "FiraCode Nerd Font Mono",
    iosevka_fixed = "Iosevka Fixed",
    roboto_mono = "RobotoMono Nerd Font Mono",
    consolas = "Consolas Nerd Font Mono",
}
local font_name = font_names.consolas
local font_height = "h10"
local guifont = font_name .. ":" .. font_height

vim.opt.background = "dark" -- "dark" or "light", used for highlight colors
vim.opt.clipboard = "unnamedplus" -- use the clipboard as the unnamed register
vim.opt.cmdheight = 1 -- number of lines to use for the command-line
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- options for Insert mode completion
vim.opt.confirm = true -- ask what to do about unsaved/read-only files
vim.opt.cursorline = true -- highlight the screen line of the cursor
vim.opt.expandtab = true -- use spaces when <Tab> is inserted
vim.opt.guifont = guifont -- GUI: Name(s) of font(s) to be used
vim.opt.ignorecase = true
vim.opt.laststatus = 3 -- tells when last window has status lines
vim.opt.mouse = "a" -- enable the use of mouse clicks
vim.opt.number = true -- print the line number in front of each line
vim.opt.numberwidth = 1 -- number of columns used for the line number
-- vim.opt.omnifunc = "syntaxcomplete#Complete" -- function for filetype-specific completion -- temporal
vim.opt.pumheight = 10 -- maximum height of the popup menu
vim.opt.relativenumber = true -- show relative line number in front of each line
-- vim.opt.scroll = 10 -- lines to scroll with CTRL-U and CTRL-D
vim.opt.scrolloff = 10 -- minimum nr. of lines above and below cursor
vim.opt.shiftwidth = 4 -- number of spaces to use for (auto)indent step
vim.opt.showcmd = true --
vim.opt.showmode = false -- message on status line to show current mode
-- vim.opt.showtabline = 0 -- tells when the tab pages line is displayed
vim.opt.sidescroll = 5 -- minimum number of columns to scroll horizontal
vim.opt.sidescrolloff = 5 -- min. nr. of columns to left and right of cursor
vim.opt.signcolumn = "yes" -- when and how to display the sign column
vim.opt.smartcase = false -- no ignore case when pattern has uppercase
vim.opt.smartindent = true -- smart autoindenting for C programs
vim.opt.spell = false -- enable spell checking
vim.opt.spelllang = "en_us" -- language(s) to do spell checking for
vim.opt.spelloptions = "camel" -- options for spell checking
vim.opt.splitbelow = true -- new window from split is below the current one
vim.opt.splitright = true -- new window is put right of the current one
vim.opt.swapfile = false -- whether to use a swapfile for a buffer
-- vim.opt.tabline = "default" -- custom format for the console tab pages line
vim.opt.tabstop = 4 -- number of spaces that <Tab> in file uses
vim.opt.termguicolors = true -- enables 24-bit RGB color in the TUI
vim.opt.updatetime = 50
-- vim.opt.verbose = 16 -- give informative messages -- for debug
-- vim.opt.verbosefile = "default" -- file to write messages in -- for debug
-- vim.opt.winbar = "%f"
vim.opt.wrap = false -- long lines wrap and continue on the next line

if vim.loop.os_uname().sysname == "Windows_NT" then
    vim.cmd([[language en_US]])
end
