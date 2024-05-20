vim.g.editorconfig = false
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_zip = 1
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
vim.g.loaded_typecorr = 1
vim.g.loaded_spellfile_plugin = 1

local opt = vim.opt

opt.background = 'dark'
opt.backup = false
opt.cmdheight = 0
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.conceallevel = 3
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.fillchars:append { eob = ' ' }
opt.grepprg = 'rg --vimgrep'
-- opt.guifont = 'BlexMono Nerd Font Mono:h13'
opt.ignorecase = true
-- opt.inccommand = 'split'
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
opt.showcmdloc = 'statusline'
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
opt.timeoutlen = 800
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.virtualedit = 'block'
-- opt.wildoptions = ''
opt.wrap = false

if vim.g.neovide then
    opt.linespace = -1

    -- emulate alacritty font rendering
    vim.g.neovide_text_gamma = 0.8
    vim.g.neovide_text_contrast = 0.1

    -- padding
    vim.g.neovide_padding_top = 5
    vim.g.neovide_padding_left = 2

    -- disable blur
    vim.g.neovide_window_blurred = false
    vim.g.neovide_floating_blur_amount_x = 0.0
    vim.g.neovide_floating_blur_amount_y = 0.0
    vim.g.neovide_floating_shadow = false
    vim.g.neovide_floating_z_height = 0
    vim.g.neovide_light_angle_degrees = 0
    vim.g.neovide_light_radius = 0

    -- other options
    vim.g.neovide_transparency = 0.9
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_underline_stroke_scale = 0.5
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_fullscreen = false
    vim.g.neovide_remember_window_size = false

    vim.cmd [[
        " system clipboard
        nmap <c-c> "+y
        vmap <c-c> "+y
        nmap <c-v> "+p
        inoremap <c-v> <c-r>+
        cnoremap <c-v> <c-r>+
        " use <c-r> to insert original character without triggering things like auto-pairs
        inoremap <c-r> <c-v>
    ]]

    -- fzf looks weird without this
    vim.fn.setcellwidths { { 0x2002, 0x2002, 2 } }
end
