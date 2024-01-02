return {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    config = function()
        local configs = require 'nvim-treesitter.configs'

        configs.setup {
            ensure_installed = require('user.configs.treesitter.parsers').install_automatically(),
            sync_install = false,
            auto_install = false,
            ignore_install = {},
            highlight = {
                enable = true,
                disable = function(_, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok_stats, stats =
                        pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok_stats and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
                disable = { 'ocaml' },
            },
            playground = {
                enable = true,
            },
            autotag = {
                enable = true,
            },
        }
    end,
}
