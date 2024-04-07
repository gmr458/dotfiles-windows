local plugin_specs = {}

local function add(plugin)
    table.insert(plugin_specs, { import = plugin })
end

add 'gmr.plugins.autopairs'
add 'gmr.plugins.autotag'
add 'gmr.plugins.cloak'
add 'gmr.plugins.cmp'
add 'gmr.plugins.colorizer'
add 'gmr.plugins.colorschemes.cold'
-- add 'gmr.plugins.comment'
-- add 'gmr.plugins.dap.python'
-- add 'gmr.plugins.dap.ui'
add 'gmr.plugins.formatter'
add 'gmr.plugins.fzf'
add 'gmr.plugins.gitsigns'
add 'gmr.plugins.guess-indent'
add 'gmr.plugins.jdtls'
add 'gmr.plugins.lsp'
add 'gmr.plugins.mason'
add 'gmr.plugins.mini-comment'
-- add 'gmr.plugins.neotest'
add 'gmr.plugins.nvim-tree'
add 'gmr.plugins.scriptease'
add 'gmr.plugins.scrollbar'
add 'gmr.plugins.treesitter'
add 'gmr.plugins.treesitter-context'
add 'gmr.plugins.ts-context-commentstring'
add 'gmr.plugins.web-devicons'
add 'gmr.plugins.zen-mode'

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

require('lazy').setup(plugin_specs, {
    ui = {
        border = 'single',
        backdrop = 100,
    },
    change_detection = {
        enabled = false,
        notify = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                'gzip',
                'matchit',
                -- 'matchparen',
                'netrwPlugin',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
            },
        },
    },
})
