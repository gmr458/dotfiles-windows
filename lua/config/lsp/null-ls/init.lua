local null_ls_loaded, null_ls = pcall(require, "null-ls")

if not null_ls_loaded then
    print("null-ls not loaded")
    return
end

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.djlint.with({
            extra_args = { "--preserve-leading-space", "--preserve-blank-lines", "--indent", "2" },
        }),
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.taplo,
        null_ls.builtins.diagnostics.buf,
        null_ls.builtins.diagnostics.djlint.with({
            diagnostic_config = { underline = false, virtual_text = false, signs = false },
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
        }),
        null_ls.builtins.diagnostics.pylint.with({
            diagnostic_config = { underline = false, virtual_text = false, signs = false },
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
        }),
        null_ls.builtins.diagnostics.golangci_lint,
    },
})
