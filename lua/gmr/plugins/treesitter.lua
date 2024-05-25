return {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = require('gmr.configs.treesitter.parsers').install_automatically(),
            sync_install = false,
            auto_install = false,
            ignore_install = {},
            highlight = {
                enable = true,
                disable = function(_, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local filename = vim.api.nvim_buf_get_name(buf)
                    local ok, stats = pcall(vim.uv.fs_stat, filename)
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
                disable = { 'ocaml', 'dart' },
            },
            playground = {
                enable = true,
            },
        }
    end,
}
