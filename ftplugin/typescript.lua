vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup(
        'gmr_go_to_source_definition_ts',
        { clear = true }
    ),
    callback = function()
        vim.keymap.set(
            'n',
            'gD',
            require('gmr.configs.lsp.ts_ls').go_to_source_definition
        )
    end,
})
