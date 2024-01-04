return function()
    if not vim.uv.fs_stat 'biome.json' then
        return {
            exe = 'biome',
            args = {
                'format',
                '--indent-width',
                vim.bo.tabstop,
                '--stdin-file-path',
                vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
            },
            stdin = true,
        }
    end

    return {
        exe = 'biome',
        args = {
            'format',
            '--stdin-file-path',
            vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
        },
        stdin = true,
    }
end
