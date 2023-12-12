local ok, null_ls = pcall(require, 'null-ls')
if not ok then
    vim.notify 'null-ls could not be loaded'
    return
end

null_ls.setup {
    sources = {
        ---- code actions
        -- null_ls.builtins.code_actions.gomodifytags,
        -- null_ls.builtins.code_actions.impl,

        ---- diagnostics
        null_ls.builtins.diagnostics.djlint.with {
            diagnostic_config = {
                underline = false,
                virtual_text = false,
                signs = false,
            },
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
        },
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.diagnostics.golangci_lint,
    },
}
