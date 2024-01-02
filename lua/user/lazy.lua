Add 'user.plugins.alpha'
Add 'user.plugins.autopairs'
Add 'user.plugins.autotag'
Add 'user.plugins.cmp'
Add 'user.plugins.colorizer'
-- Add 'user.plugins.colorschemes.vscode_modern_theme'
Add 'user.plugins.colorschemes.kanagawa'
-- Add 'user.plugins.dap'
Add 'user.plugins.formatter'
Add 'user.plugins.fzf'
Add 'user.plugins.gitsigns'
Add 'user.plugins.guess-indent'
Add 'user.plugins.ibl'
Add 'user.plugins.jdtls'
Add 'user.plugins.kommentary'
Add 'user.plugins.lsp'
Add 'user.plugins.mason'
-- Add 'user.plugins.navic'
Add 'user.plugins.neodev'
Add 'user.plugins.neoscroll'
-- Add 'user.plugins.neotest'
Add 'user.plugins.nvim-tree'
Add 'user.plugins.scrollbar'
-- Add 'user.plugins.telescope'
Add 'user.plugins.treesitter'
-- Add 'user.plugins.ufo'
Add 'user.plugins.web-devicons'
Add 'user.plugins.zen-mode'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.uv.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    }
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup(PLUGIN_SPECS, {
    ui = {
        border = 'single',
    },
    change_detection = {
        enabled = false,
        notify = false,
    },
})
