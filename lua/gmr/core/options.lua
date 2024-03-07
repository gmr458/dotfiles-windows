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
opt.cursorline = false
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

-- vim.filetype.add {
--     extension = {
--         templ = 'templ',
--     },
--     pattern = {
--         ['.env.*'] = 'sh',
--     },
-- }

-- if vim.g.neovide then
--     -- padding
--     vim.g.neovide_padding_top = 0
--     vim.g.neovide_padding_bottom = 0
--     vim.g.neovide_padding_right = 0
--     vim.g.neovide_padding_left = 0
--
--     -- floating blur amount
--     vim.g.neovide_floating_blur_amount_x = 0.0
--     vim.g.neovide_floating_blur_amount_y = 0.0
--
--     -- floating shadow
--     vim.g.neovide_floating_shadow = false
--     vim.g.neovide_floating_z_height = 10
--     vim.g.neovide_light_angle_degrees = 45
--     vim.g.neovide_light_radius = 5
--
--     vim.g.neovide_underline_stroke_scale = 1.0
--
--     vim.g.neovide_transparency = 1.0
--
--     -- animations
--     -- vim.g.neovide_scroll_animation_length = 0.3
--     -- vim.g.neovide_scroll_animation_far_lines = 1
--     -- vim.g.neovide_cursor_animation_length = 0.15
--     -- vim.g.neovide_cursor_trail_size = 0.1
--     -- vim.g.neovide_cursor_animate_in_insert_mode = true
--     -- vim.g.neovide_cursor_animate_command_line = true
--
--     vim.g.neovide_hide_mouse_when_typing = true
--
--     vim.g.neovide_underline_stroke_scale = 0.5
--
--     vim.g.neovide_unlink_border_highlights = true
--
--     vim.g.neovide_refresh_rate = 60
--
--     vim.g.neovide_fullscreen = false
--
--     vim.g.neovide_remember_window_size = false
--
--     vim.g.neovide_profiler = false
--
--     vim.g.neovide_cursor_antialiasing = true
--
--     vim.g.neovide_cursor_unfocused_outline_width = 0.125
--
--     vim.cmd [[
--         " system clipboard
--         nmap <c-c> "+y
--         vmap <c-c> "+y
--         nmap <c-v> "+p
--         inoremap <c-v> <c-r>+
--         cnoremap <c-v> <c-r>+
--         " use <c-r> to insert original character without triggering things like auto-pairs
--         inoremap <c-r> <c-v>
--     ]]
--
--     vim.fn.setcellwidths { { 0x2002, 0x2002, 2 } }
--
--     opt.linespace = -3
-- end
