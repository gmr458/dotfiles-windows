local plugin_specs = {}

local function add(plugin)
    table.insert(plugin_specs, { import = plugin })
end

-- add 'gmr.plugins.alpha'
add 'gmr.plugins.autopairs'
add 'gmr.plugins.autotag'
add 'gmr.plugins.cloak'
add 'gmr.plugins.cmp'
add 'gmr.plugins.colorizer'
add 'gmr.plugins.colorschemes.cold'
-- add 'gmr.plugins.colorschemes.kanagawa'
-- add 'gmr.plugins.colorschemes.vscode_modern_theme'
add 'gmr.plugins.comment'
-- add 'gmr.plugins.dap.python'
-- add 'gmr.plugins.dap.ui'
add 'gmr.plugins.formatter'
add 'gmr.plugins.fzf'
add 'gmr.plugins.gitsigns'
add 'gmr.plugins.guess-indent'
add 'gmr.plugins.harpoon'
-- add 'gmr.plugins.ibl'
add 'gmr.plugins.jdtls'
-- add 'gmr.plugins.kommentary'
add 'gmr.plugins.lsp'
add 'gmr.plugins.mason'
add 'gmr.plugins.neodev'
-- add 'gmr.plugins.neoscroll'
-- add 'gmr.plugins.neotab'
-- add 'gmr.plugins.neotest'
add 'gmr.plugins.nvim-tree'
add 'gmr.plugins.scriptease'
add 'gmr.plugins.scrollbar'
add 'gmr.plugins.treesitter'
-- add 'gmr.plugins.treesitter-context'
add 'gmr.plugins.treesitter-playground'
-- add 'gmr.plugins.ufo'
add 'gmr.plugins.web-devicons'
add 'gmr.plugins.zen-mode'

-- if vim.uv.os_uname().sysname == 'Windows_NT' then
--     Add 'gmr.plugins.telescope'
-- else
--     Add 'gmr.plugins.fzf'
-- end

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
    },
    change_detection = {
        enabled = false,
        notify = false,
    },
})
